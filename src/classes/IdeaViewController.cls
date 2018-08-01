public class IdeaViewController extends IdeaController {
    
    private Integer numPages;
    public IdeaComment[] comments {get;set;}
    private IdeaComment newComment;
    private transient Vote[] votesUp;
    private transient Vote[] votesDown;
    private Idea[] childIdeas;
    //public Idea idea {get;set;}
    
    public Boolean showError {get;set;}
    public Boolean isAdminUser {get;set;}
    public Boolean showNewPostLink {get;set;}
    public Boolean showCommentLink {get;set;}
    public Idea idea {get;set;}
    public String commentSorting {get;set;}
    public String returnURL {get;set;}
    public Integer rowStart {get;set;}
    public Boolean nextButton {get;set;}
    public Boolean previousButton {get;set;} 
    public String pageShowing {get;set;} //display the current page number shown to the user out of total pages found
    public Long totalPages = 0;
    ApexPages.IdeaStandardController controller;
    Apexpages.Standardsetcontroller controller1;
    Apexpages.Standardcontroller controller2;
    
    public Integer MAX_NUMBER_OF_COMMENTS_PER_PAGE {get;set;}    
    
    public IdeaViewController(ApexPages.StandardSetController controller) {
        this.controller1 = controller;
        System.debug('controller1: ' + controller);
        categorySelected = categoryParam;
        init();
    }
    
    public IdeaViewController(ApexPages.StandardController controller) {
        this.controller2 = controller;
        System.debug('controller2: ' + controller);
        categorySelected = categoryParam;
        init();
    }
        //For tests
    public IdeaViewController(String ideaId) {
        this.ideaId = ideaId;
        System.debug('ideaId1: ' + ideaId);
        categorySelected = categoryParam;
        init();
    }

    public String ideaId {
        get {
            if (ideaId == null) {
                if(controller != null) {
                	ideaId = controller.getId();
	                System.debug('ideaId2: ' + ideaId);
	                
                }
            }
            return ideaId; 
        }
        set;
    }
    

    // Constructor called by Apex.
    public IdeaViewController(ApexPages.IdeaStandardController controller) {
        this.controller = controller;
        idea = [Select CreatedBy.CompanyName, CreatedBy.Contact.Account.Name, createdBy.Name, i.CreatedBy.CommunityNickname, i.VoteTotal, i.Title, i.Status, i.NumComments, i.LastCommentId, 
							i.LastCommentDate, i.Id, i.CreatedDate, i.CreatedById, i.CommunityId, i.Categories, i.Body, i.Category__c, i.Sub_Category__c From Idea i Where Id =: controller.getId()];
        init();
    }
    
    private void init() {
    	showError = false;
    	isAdminUser = false;
    	showNewPostLink = true;
    	showCommentLink = true;
        commentSorting = 'new';
        pageShowing = '';
        returnURL = Apexpages.currentPage().getParameters().get('returnUrl');
        System.debug('returnURL1: '+returnURL);
        if(returnURL == null || returnURL == '') returnURL = '/apex/' + PAGE_LIST;
        System.debug('returnURL2: '+returnURL);
        returnURL = IdeaController.unEscapeUrl(returnURL);
        System.debug('returnURL: '+returnURL);
        if(returnURL != null) {
        	returnURL = returnURL.replace('/apex//', '/');
        	if(returnURL.contains('rstart')) {
        		List<String> returnURLTemp = returnURL.split('&');
        		returnURL = '';
        		for(String s : returnURLTemp) {
        			//if(s.contains('rstart')) continue;
        			if(returnURL == '') returnURL = s;
        			else returnURL += '&' + s;
        		}
        	}
        }
        /*
        Map<String, String> paramMap = Apexpages.currentPage().getParameters();
        String paramValues = '';
        for(String s : paramMap.keyset()) {
	    	if(s == 'id' || s == 'returnUrl' || s == 'com.salesforce.visualforce.ViewStateCSRF' || s == 'subStatusHidden' || s == 'com.salesforce.visualforce.ViewStateVersion' 
	    		|| s == 'subCatHidden' || s.contains('formId') || s == 'categorySelected') continue;
	    	if(!returnURL.contains(s)) returnURL += '&' + s + '=' + paramMap.get(s);
	    }*/
        
        User userRec = [Select Id, Name, IsPortalEnabled, ProfileId, Profile.Name From User Where Id =: Userinfo.getUserId()];
        //if(userRec.ProfileId != null && userRec.Profile.Name ==  'System Administrator') isAdminUser = true;
        //if(userRec.IsPortalEnabled && userRec.ProfileId != null && (userRec.Profile.Name.contains('Read Only') || userRec.Profile.Name.contains('Read-Only'))) showNewPostLink = false;
        List<PermissionSetAssignment> permissionSet = [Select p.PermissionSetId, p.Id, p.AssigneeId From PermissionSetAssignment p 
        												where p.PermissionSet.Name = 'RoundTable_Administration' and p.AssigneeId =: Userinfo.getUserId()];
        
        if(permissionSet.size() > 0) {
    		isAdminUser = true;
    	} else if(permissionSet.size() == 0 && !userRec.IsPortalEnabled && userRec.Profile.Name != 'Partner User') {
    		showNewPostLink = false;
    	}
    	
    	//Mohan - 07/09/2014: enable comment button to archive posts
    	//if(idea != null && idea.Status == 'Archive' && permissionSet.size() == 0) showCommentLink = false;
    	//Mohan - 05/01/2015: below line commented to disable comment button to archive posts for portal users
    	if(idea != null && idea.Status == 'Archive' && userRec.IsPortalEnabled && permissionSet.size() == 0) showCommentLink = false;
    	
    	if(userRec.IsPortalEnabled) {
    		String accessibleCategories = '';
    		for (SelectOption value : getCategories()) {
	        	if(value.getLabel() == 'Categories') continue;
	        	accessibleCategories += value.getLabel() + ',';
	        }
	        
	        if(!accessibleCategories.contains(idea.Category__c + ',')) {
	        	showError = true;
	        	ApexPages.addMessage(new ApexPages.message(ApexPages.Severity.WARNING, 'The product you have requested does not fall under your agency\'s support agreement.'));
	        	ApexPages.addMessage(new ApexPages.message(ApexPages.Severity.WARNING, 'Please select RoundTable ideas within your agency\'s product category.'));
	        }
    	}
        
        rowStart = 0;
        MAX_NUMBER_OF_COMMENTS_PER_PAGE = 10;
        fetchComments();
        Decimal ttlPages = Decimal.valueOf(comments.size()).divide(MAX_NUMBER_OF_COMMENTS_PER_PAGE, 2, System.RoundingMode.UP);
        System.debug('ttlPages: '+ttlPages);
        totalPages = ttlPages.round(System.RoundingMode.UP);
        if(comments.size() > MAX_NUMBER_OF_COMMENTS_PER_PAGE) {
			previousButton = false;
        	nextButton = true;
		}
		if(comments.size() > 0) pageShowing = '1 of ' + String.valueOf(totalPages);
    }

    public void markIdeaRead() {
        if(getIsLoggedIn())
            Ideas.markRead(ideaId);
    }

	
    public void fetchComments() {
        if(commentSorting == null || commentSorting == '' || commentSorting == 'new') {
        	if(commentSorting == null) commentSorting = 'new';
        	comments = [Select CreatedBy.CompanyName, CreatedBy.Contact.Account.Name, i.SystemModstamp, i.IsHtml, i.IsDeleted, i.IdeaId, i.Id, i.CreatedDate, i.CreatedBy.Name, i.CreatedById, i.CommentBody 
        				From IdeaComment i Where IdeaId =: ideaId order by CreatedDate desc];
        } else if(commentSorting != null && commentSorting == 'old') {
        	comments = [Select CreatedBy.CompanyName, CreatedBy.Contact.Account.Name, i.SystemModstamp, i.IsHtml, i.IsDeleted, i.IdeaId, i.Id, i.CreatedDate, i.CreatedBy.Name, i.CreatedById, i.CommentBody 
        				From IdeaComment i Where IdeaId =: ideaId order by CreatedDate];
        }
        //return comments;
    }

    
    public String getPageName() {
        return PAGE_VIEW; 
    }
    
    public IdeaComment getNewComment() {
        if (this.newComment == null) {
            this.newComment = new IdeaComment(IdeaId = ideaId);
        }
        return this.newComment;
    }

    public PageReference saveComment() {
        
        if (!Schema.SObjectType.Idea.isCreateable()) {
            ApexPages.addMessage(new ApexPages.message(ApexPages.Severity.ERROR, 'You do not have privileges to post a comment.'));
            return null;
        }
        
        if (newComment.commentBody == null || newComment.commentBody.trim().length() == 0) {
            ApexPages.addMessage(new ApexPages.message(ApexPages.Severity.ERROR, ' You cannot post a zero-length comment'));
            return null;
        } 
                try {
            insert newComment;
            PageReference ideaPage = getIdeaViewPage(ideaId, MESSAGE_CODE_COMMENT_POSTED);
            ideaPage.getParameters().put(PARAM_PAGE, String.valueOf(this.numPages));
            System.debug('returnUrlParam ' + returnUrlParam);
            if( returnUrlParam != null ) {
                ideaPage.getParameters().put(PARAM_RETURN_URL,escapeUrl(returnUrlParam));
            }                        
            System.debug('URL is ' + ideaPage.getUrl());
            ideaPage.setRedirect(true);
            return ideaPage;
        } catch (System.DmlException e) {
            for (Integer i = 0; i < e.getNumDml(); i++) {
                ApexPages.addMessage(new ApexPages.message(ApexPages.Severity.ERROR, ' ' + e.getDmlMessage(i)));
            }
            return null;
        }
    }    

    private void last50Votes() {
        if (votesUp == null) {
        votesUp = new Vote[]{};
        votesDown = new Vote[]{};
            Vote[] last50Votes = [select createdById, createdBy.Name, createdBy.communityNickname, type from vote where parentId = :ideaId order by createdDate desc limit 50];
        for (Vote v: last50Votes) {
        if (v.type == 'Up') {
            votesUp.add(v);
        } else if (v.type == 'Down') {
            votesDown.add(v);
        } else {
            //throw new IdeaException('Unknown vote type '+v.type);
        }
        }
        }
        return;
    }

    public Vote[] getVotesUp() {
        if (votesUp == null) {
        last50Votes();
    }
        return votesUp;
    }

    public Integer getNumVotesUp() {
        return getVotesUp().size();
    }

    public Vote[] getVotesDown() {
        if (votesDown == null) {
        last50Votes();
    }
        return votesDown;
    }

    public Integer getNumVotesDown() {
        return getVotesDown().size();
    }
	
	/*
    public Integer getNumChildIdeas() {
        return getChildIdeas().size();
    }
    
    public Idea[] getChildIdeas() {
        if (childIdeas == null) {
            //childIdeas = [select IsLocked, VoteTotal, Status, LastCommentId, LastCommentDate, CommunityId, Categories, 
				//			id, title, body, createdById, createdBy.Name, createdBy.communityNickname, createdDate, numComments from idea where parentIdeaId = :ideaId order by createdDate];
        }
        return childIdeas;
    }
    */

    public String howUserVoted {
        get {
            if (howUserVoted == null) {
                List<Vote> v = [select Type from Vote where ParentId = :ideaId and CreatedById = :UserInfo.getUserId()];
                if (v.size()> 0) {
                    howUserVoted = v[0].Type;
                } else {
                    howUserVoted = 'None';
                }
            }
            return howUserVoted;
        }
        set;
    }

    public Boolean getHasCommentsPreviousPage() {
        return getPageParamInt() > 1;
    }

    public Boolean getHasCommentsNextPage() {
        if (comments != null) {
            return comments.size() == MAX_NUMBER_OF_COMMENTS_PER_PAGE;
        }
        return false;
    }   
    
    public Pagereference editIdea() {
    	System.debug('editIdea: '+Apexpages.currentPage().getUrl());
    	System.debug('returnURL: '+returnURL);
    	//Pagereference pr = new Pagereference('/apex/IdeaPost?id=' + idea.Id + '&returnUrl=/apex/ideaView?id=' + idea.Id + '&pUrl=' + returnURL);
    	Pagereference pr = new Pagereference('/apex/IdeaPost?id=' + idea.Id + '&returnUrl=' + returnURL);
    	pr.setRedirect(true);
    	return pr;
    	
    	//use this if the url is not generated properly
    	/*PageReference pageRef = new PageReference(URL_VIEW);
        pageRef.getParameters().put(PARAM_IDEA_ID, ideaId);
        pageRef.getParameters().put('returnUrl',escapeUrl(returnURL));
        pageRef.setRedirect(true);
        return pageRef;*/
    }
    
    public Pagereference sortIdeaComments() {
    	//Pagereference pr = new Pagereference(Apexpages.currentPage().getUrl());
    	if(commentSorting == null || commentSorting == '' || commentSorting == 'new') {
        	if(commentSorting == null) commentSorting = 'new';
        	comments = [Select CreatedBy.CompanyName, CreatedBy.Contact.Account.Name, i.SystemModstamp, i.IsHtml, i.IsDeleted, i.IdeaId, i.Id, i.CreatedDate, i.CreatedBy.Name, i.CreatedById, i.CommentBody 
        				From IdeaComment i Where IdeaId =: ideaId order by CreatedDate desc];
        } else if(commentSorting != null && commentSorting == 'old') {
        	comments = [Select CreatedBy.CompanyName, CreatedBy.Contact.Account.Name, i.SystemModstamp, i.IsHtml, i.IsDeleted, i.IdeaId, i.Id, i.CreatedDate, i.CreatedBy.Name, i.CreatedById, i.CommentBody 
        				From IdeaComment i Where IdeaId =: ideaId order by CreatedDate];
        }
    	return null;
    }
    
    public void gotoNextPage() {
        try {
            rowStart = pagingVisibility(rowStart, '+');
            previousButton = true;
            System.debug('totalPages: '+totalPages);
            if(((rowStart / MAX_NUMBER_OF_COMMENTS_PER_PAGE) + 1) == totalPages) nextButton = false;
            else nextButton = true;
            perparePageNumbers();
        } catch(Exception ex) { ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.ERROR, ex.getMessage())); }
    }
    
    public void gotoPreviousPage() {
        try {
            rowStart = pagingVisibility(rowStart, '-');
            nextButton = true;
            if((rowStart / MAX_NUMBER_OF_COMMENTS_PER_PAGE) == 0) previousButton = false;
            else previousButton = true;
            perparePageNumbers();
        } catch(Exception ex) { ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.ERROR, ex.getMessage())); }
    }
    
    private void perparePageNumbers() {
    	pageShowing = String.valueOf((rowStart/MAX_NUMBER_OF_COMMENTS_PER_PAGE) + 1) + ' of ' + String.valueOf(totalPages);
    }
    
    private Integer pagingVisibility(Integer rs, String operator) {
        Integer oldPageIndex = rs / MAX_NUMBER_OF_COMMENTS_PER_PAGE;
        if(operator == '+') rs = rowStart + MAX_NUMBER_OF_COMMENTS_PER_PAGE;
        if(operator == '-') rs = rowStart - MAX_NUMBER_OF_COMMENTS_PER_PAGE;
        return rs;
    }
}