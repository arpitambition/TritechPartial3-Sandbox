public without sharing class IdeaVoteController extends IdeaController {

    public Idea conIdea;// { get; set; }
    public Idea afterVoteIdea { get; set; }
    public String voteIdeaId { get; set; }
    public Boolean foundProfilePicture {get;set;}
    public String curRowStart {get;set;}
    public Boolean showVoteLink {get;set;}
    public String profilePictureLink {get;set;}
    public transient String newVoteType { get; set; }
    public transient Boolean newVote = false;
    public transient Integer voteTotal;
    
    private Integer permissionSetSize = 0;

    public IdeaVoteController() {
    	//String ideaId = Apexpages.currentPage().getParameters().get('id');
    	//if(ideaId != null && ideaId != '') conIdea = [select Id, CommunityId, VoteTotal, createdById from Idea where Id =: ideaId];
    	init();
    	System.debug('profilePictureLink1: '+profilePictureLink + '--' + voteIdeaId + '-- ' + conIdea);
    }
    
    // used in tests
    public IdeaVoteController(Idea conIdea) {
    	this.conIdea = conIdea;
    	voteIdeaId = conIdea.id;
    	foundProfilePicture = false;
    	profilePictureLink = '';
    	//if(voteIdeaId != null) 
    	conIdea = [select Id, CommunityId, VoteTotal, createdById, Status from Idea where Id = :voteIdeaId];
    	init();
    }
    
    private void init() {    	
    	showVoteLink = true;
    	User userRec = [Select Id, Name, Profile.Name, ProfileId, IsPortalEnabled From User Where Id =: Userinfo.getUserId()];
        //if(userRec.IsPortalEnabled && userRec.ProfileId != null && (userRec.Profile.Name.contains('Read Only') || userRec.Profile.Name.contains('Read-Only'))) showVoteLink = false;
        List<PermissionSetAssignment> permissionSet = [Select p.PermissionSetId, p.Id, p.AssigneeId From PermissionSetAssignment p 
        												where p.PermissionSet.Name = 'RoundTable_Administration' and p.AssigneeId =: Userinfo.getUserId()];
        
        if(permissionSet.size() == 0 && !userRec.IsPortalEnabled && userRec.Profile.Name != 'Partner User') {
    		showVoteLink = false;
    	}
    	permissionSetSize = permissionSet.size();
    }

    public String currentUserVoteType {
        get {
        	System.debug('profilePictureLink2: '+profilePictureLink + '--' + voteIdeaId + '-- ' + conIdea);
	        if (newVoteType != null) {
	            return newVoteType;
	        }
	        // ideally passing this value in would be optional, and we'd just query here if null; but, even when it's
	        // passed in, it comes up null here sometimes, causing the query to happen anyways.  we want to make sure
	        // that the query does not happen for the list pages
	        return currentUserVoteType;
        }
        set;
    }
    
    public Idea getconIdea(){return conIdea;}
   
    public void setconIdea(Idea value)
    {
        this.conIdea = value;
        System.debug('conIdea.CreatedById: '+conIdea.CreatedById);
        System.debug('onload curRowStart: '+curRowStart);
        if(this.conIdea != null) {
        	profilePictureLink = null;
        	User ideaCreator = [Select Id, ContactId, Contact.PictId__c, UserType, SmallPhotoUrl From User where Id =: conIdea.CreatedById];
	    	if(ideaCreator.ContactId != null && ideaCreator.Contact.PictId__c != null) {
	    		profilePictureLink = '/servlet/servlet.FileDownload?file=' + ideaCreator.Contact.PictId__c;
	    	} else if(ideaCreator.UserType ==  'Standard' && ideaCreator.SmallPhotoUrl != null) {
	    		profilePictureLink = ideaCreator.SmallPhotoUrl;
        	}
        	//if(profilePictureLink == null) profilePictureLink ='https://cs1.salesforce.com/profilephoto/005/T';
        	if(profilePictureLink == null) profilePictureLink = ideaCreator.SmallPhotoUrl;
	    	System.debug('profilePictureLink: '+profilePictureLink);
	    	
	    	if(conIdea.Status == 'Archive' && permissionSetSize == 0) showVoteLink = false;
        }
    }

    public Boolean getIsVotedUp() {
	return currentUserVotetype == 'Up';
    }

    public Boolean getIsVotedDown() {
	return currentUserVotetype == 'Down';
    }

    public Integer getVoteTotal() {
        return Math.Round(afterVoteIdea == null ? conIdea.voteTotal : afterVoteIdea.voteTotal);
    }

    public PageReference createVote() {
        Vote v = new Vote(ParentId = voteIdeaId, Type = newVoteType);
        try {
            insert v;
            newVote = true;
            afterVoteIdea = [select Id, CommunityId, VoteTotal, createdById from Idea where Id = :conIdea.id];	
            System.debug('curRowStart: '+curRowStart);
            /*if(curRowStart != null) {
            	Pagereference pr = new Pagereference('/apex/ideaList?c='+ getCommunityId() + '&rstart='+curRowStart);
            	pr.setRedirect(true);
            	System.debug('redirecting');
            	return pr;
            	
            }*/
            System.debug('getUrl: '+Apexpages.currentPage().getUrl());
            String curUrl = Apexpages.currentPage().getUrl();
            System.debug('returnUrlParam ' + returnUrlParam);
            if(curUrl.contains('/apex/ideaView')) {
            	
            	PageReference ideaPage = getIdeaViewPage(Apexpages.currentPage().getParameters().get('id'));
	            //ideaPage.getParameters().put(PARAM_PAGE, String.valueOf(this.numPages));
	            System.debug('returnUrlParam ' + returnUrlParam);
	            if( returnUrlParam != null ) {
	                ideaPage.getParameters().put(PARAM_RETURN_URL,escapeUrl(returnUrlParam));
	            }                        
	            System.debug('URL is ' + ideaPage.getUrl());
	            ideaPage.setRedirect(true);
            	return ideaPage;
            	
            	/*Map<String, String> paramMap = Apexpages.currentPage().getParameters();
	            String paramValues = '';
	            for(String s : paramMap.keyset()) {
	            	if(s == 'AJAXREQUEST' || s == 'com.salesforce.visualforce.ViewStateCSRF' || s == 'subStatusHidden' || s == 'com.salesforce.visualforce.ViewStateVersion' 
	            		|| s == 'subCatHidden' || s.contains('formId') || s == 'firstParam' || s == 'secondParam' || s == 'mc') continue;
	            	if(paramValues ==  '') paramValues += s + '=' + paramMap.get(s);
	            	else paramValues += '&' + s + '=' + paramMap.get(s);
	            }
	            System.debug('paramValues: '+paramValues);
	            paramValues = IdeaController.escapeUrl(paramValues);
	            System.debug('paramValues2: '+paramValues);
	            //String redirectUrl = '/apex/ideaView?id=' + Apexpages.currentPage().getParameters().get('id') + '&returnUrl=' + Apexpages.currentPage().getParameters().get('returnUrl');
	            String redirectUrl = '/apex/ideaView?' + paramValues;
            	Pagereference pr = new Pagereference(redirectUrl);
            	pr.setRedirect(true);
            	System.debug('redirecting');
            	return pr;*/
            }
            
            //conIdea = afterVoteIdea;
        } catch (System.DmlException e) {
            // <!--Good for debugging <apex:pageMessages id="errorMsgs" />-->
            // ApexPages.addMessages(e);
            // ApexPages.addMessage(new ApexPages.message(ApexPages.Severity.INFO, 'parentId ' + voteIdeaId + 'voteType ' + newVoteType));
            ApexPages.addMessage(new ApexPages.message(ApexPages.Severity.WARNING, 'Voting disabled'));
            // ignore - most likely they tried to vote twice in 2 browser windows
            return null;
        }
        System.debug('getUrl ::: '+Apexpages.currentPage().getUrl());
        Map<String, String> paramMap = Apexpages.currentPage().getParameters();
        String paramValues = '';
        for(String s : paramMap.keyset()) {
        	if(s == 'AJAXREQUEST' || s == 'com.salesforce.visualforce.ViewStateCSRF' || s == 'subStatusHidden' || s == 'com.salesforce.visualforce.ViewStateVersion' 
        		|| s == 'subCatHidden' || s.contains('formId') || s == 'firstParam' || s == 'secondParam' || s == 'mc') continue;
        	if(paramValues ==  '') paramValues += s + '=' + paramMap.get(s);
        	else paramValues += '&' + s + '=' + paramMap.get(s);
        }
        //pr = new Pagereference('/apex/ideaList?' + paramValues);
        Pagereference pr = new Pagereference('/apex/ideaList?' + paramValues);
        pr.setRedirect(true);
        return pr;
    }

    public Boolean getNewVote() {
        return this.newVote;
    }

    public Boolean getUserHasNotVoted() {
        return 'None'.equals(currentUserVoteType);
    }

}