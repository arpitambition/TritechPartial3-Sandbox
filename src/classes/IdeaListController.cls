public class IdeaListController extends IdeaController {
    private transient Idea[] ideas;
    public Boolean showNewPostLink {get;set;}
    public Integer rowStart {get;set;}
    public Boolean nextButton {get;set;}
    public Boolean previousButton {get;set;} 
    public String pageShowing {get;set;} //display the current page number shown to the user out of total pages found
    public Long totalPages = 0;
    public Integer MAX_NUMBER_OF_IDEAS_PER_PAGE {get;set;}
    public IdeaWithVote[] ideasWithVotes {get;set;}
    public String subStatus {get;set;}
    ApexPages.IdeaStandardSetController controller;
    Apexpages.Standardsetcontroller controller1;
    public Integer totalRowsFound {get;set;}
    public TabPermissions TabPermission {get; set;}
    
    public IdeaListController() {
    	setTabPermission();
        ideas = new List<Idea>();
        System.debug('IdeaListController-categoryParam1: '+categoryParam);
        categorySelected = categoryParam;
        subCategorySelected = subCategoryParam;
        ideasWithVotes = new List<IdeaWithVote>();
        init();
        //MAX_NUMBER_OF_IDEAS_PER_PAGE = 4;
    }

    public IdeaListController(ApexPages.IdeaStandardSetController controller) {
    	setTabPermission();
        this.controller = controller;
        ideas = new List<Idea>();
        init();
    }
    
    private void init() {
        System.debug('IdeaListController-categoryParam2: '+categoryParam);
        pageShowing = '';
        showNewPostLink = true;
        categorySelected = categoryParam;
        subCategorySelected = subCategoryParam;
        subStatus = '';
        
        if(Apexpages.currentPage().getParameters().get('sort') == null) Apexpages.currentPage().getParameters().put('sort', '');
        if(Apexpages.currentPage().getParameters().get('status') != null) subStatus = Apexpages.currentPage().getParameters().get('status');
        
        User userRec = [Select Id, Name, Profile.Name, ProfileId, IsPortalEnabled From User Where Id =: Userinfo.getUserId()];
        //if(userRec.IsPortalEnabled && userRec.ProfileId != null && (userRec.Profile.Name.contains('Read Only') || userRec.Profile.Name.contains('Read-Only'))) showNewPostLink = false;
        List<PermissionSetAssignment> permissionSet = [Select p.PermissionSetId, p.Id, p.AssigneeId From PermissionSetAssignment p 
                                                        where p.PermissionSet.Name = 'RoundTable_Administration' and p.AssigneeId =: Userinfo.getUserId()];
        if(permissionSet.size() == 0 && !userRec.IsPortalEnabled && userRec.Profile.Name != 'Partner User') {
            showNewPostLink = false;
        }
        
        rowStart = 0;
        MAX_NUMBER_OF_IDEAS_PER_PAGE = 10;
        totalRowsFound = 0;
        ideasWithVotes = prepareIdeasWithVotes();
        Decimal ttlPages = Decimal.valueOf(totalRowsFound).divide(MAX_NUMBER_OF_IDEAS_PER_PAGE, 2, System.RoundingMode.UP);
        System.debug('ttlPages: '+ttlPages);
        totalPages = ttlPages.round(System.RoundingMode.UP);
        System.debug('init-totalPages: '+totalPages);
        String rStart = Apexpages.currentPage().getParameters().get('rstart');
        if(rStart != null & rStart != '') {
            Integer rStartTemp = Integer.valueOf(rStart);
            if(((rStartTemp / MAX_NUMBER_OF_IDEAS_PER_PAGE) + 1) == totalPages) nextButton = false;
            else nextButton = true;
            if((rStartTemp / MAX_NUMBER_OF_IDEAS_PER_PAGE) == 0) previousButton = false;
            else previousButton = true;
            rowStart = rStartTemp;
        }
        perparePageNumbers();
        //if(totalRowsFound > 0) pageShowing = '1 of ' + String.valueOf(totalPages);
    }
    
    public IdeaListController(ApexPages.StandardSetController controller) {
        /*this.controller1 = controller;
        ideas = new List<Idea>();
        //String catSelected = Apexpages.currentPage().getParameters().get('category');
        System.debug('IdeaListController-categoryParam3: '+categoryParam);
        categorySelected = categoryParam; init();
        //MAX_NUMBER_OF_IDEAS_PER_PAGE = 4;*/
    }
    
    /*public String feedName {
        get {
            if (feedName == null) {
                if (IdeaController.SORT_POPULAR.equals(sortParam)) {
                    feedName = IdeaFeedController.TYPE_POPULAR;
                } else if (IdeaController.SORT_RECENT.equals(sortParam)) {
                    feedName = IdeaFeedController.TYPE_RECENT;
                } else if (IdeaController.SORT_TOP.equals(sortParam)) {
                    feedName = IdeaFeedController.TYPE_TOP;
                } else if (IdeaController.SORT_COMMENTS.equals(sortParam)) {
                    feedName = IdeaFeedController.TYPE_RECENT_COMMENTS;
                } else {
                    feedName = IdeaFeedController.TYPE_POPULAR;
                }               
            }
            return feedName;
        }
        set;
    }*/

    public IdeaWithVote[] prepareIdeasWithVotes() {
        String rStart = Apexpages.currentPage().getParameters().get('rstart');
        if(rStart != null && rStart != '') rowStart = Integer.valueOf(rStart);
        ideasWithVotes = new List<IdeaWithVote>();
        List<IdeaWithVote> ideasWithVotesTemp = IdeaWithVote.getIdeasWithVotes(getIdeas());
        totalRowsFound = ideasWithVotesTemp.size();
        //ideasWithVotes = IdeaWithVote.getIdeasWithVotes(getIdeas());
        for(Integer i=rowStart; i < (rowStart + MAX_NUMBER_OF_IDEAS_PER_PAGE); i++) {
            if(i >= totalRowsFound) break;
            ideasWithVotes.add(ideasWithVotesTemp[i]);
        }
        System.debug('ideasWithVotesTemp.size(): '+ideasWithVotesTemp.size());
        System.debug('ideasWithVotes.size(): '+ideasWithVotes.size());
        System.debug('MAX_NUMBER_OF_IDEAS_PER_PAGE: '+MAX_NUMBER_OF_IDEAS_PER_PAGE);
        if(ideasWithVotesTemp.size() > MAX_NUMBER_OF_IDEAS_PER_PAGE) {
            previousButton = false;
            nextButton = true;
        }
        return ideasWithVotes;
    }
    /*
    public Pagereference changeStatusView() {
        Pagereference pr;
        String iSorting = System.currentPageReference().getParameters().get('sorting');
        String newURL = '/apex/ideaList?c=' + IdeaController.siteSetup.CommunityId__c;
        if(iSorting != null && iSorting != '') newURL += '&sort=' + iSorting;
        if(categorySelected != null) newURL += '&category=' + categorySelected;
        if(subCategorySelected != null) newURL += '&subcategory=' + subCategorySelected;
        String sStatus = System.currentPageReference().getParameters().get('substatus');
        if(sStatus != null) newURL += '&substatus=' + sStatus;
        pr = new Pagereference(newURL);
        return pr;
    }
    */
    public Idea[] getIdeas() {
        String queryConditions = ' Where CommunityId = \'' + IdeaController.siteSetup.CommunityId__c + '\' and Status = \'Public\'';
        String iSort = Apexpages.currentPage().getParameters().get('sort');
        //if iSort value is "comments" it is assumed to be Archive sorting
        //System.debug(':subStatus1: ' + System.currentPageReference().getParameters().get('subStatusEle'));
        System.debug(':subStatus2: ' + subStatus);
        if(iSort == 'comments') {
            queryConditions = ' Where CommunityId = \'' + IdeaController.siteSetup.CommunityId__c + '\' and Status = \'Archive\'';
            if(subStatus != null && subStatus != '') {
                queryConditions += ' and Sub_Status__c = \'' + subStatus + '\'';
            }
        }
        String cat = Apexpages.currentPage().getParameters().get('category');
        String subCat = Apexpages.currentPage().getParameters().get('subcategory');
        if(cat == null || cat == '') {
            String catTemp = '';
            for (SelectOption value : getCategories()) {
                if(value.getLabel() == 'Categories') continue;
                if(catTemp == '') catTemp = '\'' + value.getLabel() + '\'';
                else catTemp += ',\'' + value.getLabel() + '\'';
            }
            if(catTemp != '') queryConditions += ' and Category__c IN (' + catTemp + ')';
        }
        if(cat != null && cat != '') {
            queryConditions += ' and Category__c = \'' + cat + '\'';
        }
        if(subCat != null && subCat != '') {
            queryConditions += ' and Sub_Category__c = \'' + subCat + '\'';
        }
        String ideaQuery = 'Select CreatedBy.CompanyName, CreatedBy.Contact.Account.Name, CreatedBy.Name, CreatedBy.CommunityNickname, VoteTotal, Title, Status, NumComments, LastCommentId, ' + 
                            'LastCommentDate, Id, CreatedDate, CreatedById, CommunityId, Categories, Body, Category__c, Sub_Category__c From Idea ' + queryConditions;
        if(iSort != null && iSort != '') {
            if(iSort == 'popular') ideaQuery += ' order by VoteTotal desc';
            else if(iSort == 'recent') ideaQuery += ' order by CreatedDate desc';
            else if(iSort == 'top') ideaQuery += ' and CreatedDate = LAST_90_DAYS order by VoteTotal desc, NumComments desc';
            //else if(iSort == 'comments') ideaQuery += ' and CreatedDate = LAST_90_DAYS order by VoteTotal desc, NumComments desc';
        }
        if(iSort == null || iSort == '') {
            ideaQuery += ' order by CreatedDate desc';
        }
        System.debug('ideaQuery: '+ ideaQuery);
        ideas = Database.query(ideaQuery);
        return ideas;
    }
    
    public Pagereference createNewPost() {
        Pagereference pr = new Pagereference('/apex/' + PAGE_POST); 
        return pr;
    }

    public String getPageName() {
        return PAGE_LIST;
    }

    public Boolean getHasPreviousPage() {
        return getPageParamInt() > 1;
    }

    /*public Boolean getHasNextPage() {
        Boolean nextPage = ideasWithVotes.size() == MAX_NUMBER_OF_IDEAS_PER_PAGE;
        System.debug('getHasNextPage: '+ nextPage);
        return ideasWithVotes.size() == MAX_NUMBER_OF_IDEAS_PER_PAGE;
    }   */ 
    
    public Pagereference gotoNextPage() {
    	Pagereference pr;
        try {
            rowStart = pagingVisibility(rowStart, '+');
            Map<String, String> paramMap = Apexpages.currentPage().getParameters();
            String paramValues = '';
            for(String s : paramMap.keyset()) {
            	if(s == 'rstart' || s == 'com.salesforce.visualforce.ViewStateCSRF' || s == 'subStatusHidden' || s == 'com.salesforce.visualforce.ViewStateVersion' 
            		|| s == 'subCatHidden' || s.contains('formId')) continue;
            	if(paramValues ==  '') paramValues += s + '=' + paramMap.get(s);
            	else paramValues += '&' + s + '=' + paramMap.get(s);
            }
            if(paramValues != '') paramValues += '&rstart=' + String.valueOf(rowStart);
            pr = new Pagereference('/apex/ideaList?' + paramValues);
            pr.setRedirect(true);
            /*ideasWithVotes = prepareIdeasWithVotes();
            Decimal ttlPages = Decimal.valueOf(totalRowsFound).divide(MAX_NUMBER_OF_IDEAS_PER_PAGE, 2, System.RoundingMode.UP);
            System.debug('ttlPages: '+ttlPages);
            totalPages = ttlPages.round(System.RoundingMode.UP);
            previousButton = true;
            System.debug('totalPages: '+totalPages);
            System.debug('((rowStart / MAX_NUMBER_OF_IDEAS_PER_PAGE) + 1): '+((rowStart / MAX_NUMBER_OF_IDEAS_PER_PAGE) + 1));
            if(((rowStart / MAX_NUMBER_OF_IDEAS_PER_PAGE) + 1) == totalPages) nextButton = false;
            else nextButton = true;
            perparePageNumbers();*/
        } catch(Exception ex) { ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.ERROR, ex.getMessage())); }
        return pr;
    }
    
    public Pagereference gotoPreviousPage() {
    	Pagereference pr;
        try {
            rowStart = pagingVisibility(rowStart, '-');
            Map<String, String> paramMap = Apexpages.currentPage().getParameters();
            String paramValues = '';
            for(String s : paramMap.keyset()) {
            	if(s == 'rstart' || s == 'com.salesforce.visualforce.ViewStateCSRF' || s == 'subStatusHidden' || s == 'com.salesforce.visualforce.ViewStateVersion' 
            		|| s == 'subCatHidden' || s.contains('formId')) continue;
            	if(paramValues ==  '') paramValues += s + '=' + paramMap.get(s);
            	else paramValues += '&' + s + '=' + paramMap.get(s);
            }
            if(paramValues != '') paramValues += '&rstart=' + String.valueOf(rowStart);
            pr = new Pagereference('/apex/ideaList?' + paramValues);
            pr.setRedirect(true);
            /*ideasWithVotes = prepareIdeasWithVotes();
            Decimal ttlPages = Decimal.valueOf(totalRowsFound).divide(MAX_NUMBER_OF_IDEAS_PER_PAGE, 2, System.RoundingMode.UP);
            System.debug('ttlPages: '+ttlPages);
            totalPages = ttlPages.round(System.RoundingMode.UP);
            nextButton = true;
            if((rowStart / MAX_NUMBER_OF_IDEAS_PER_PAGE) == 0) previousButton = false;
            else previousButton = true;
            perparePageNumbers();*/
        } catch(Exception ex) { ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.ERROR, ex.getMessage())); }
        return pr;
    }
    
    private void perparePageNumbers() {
        System.debug('rowStart: '+rowStart);
        System.debug('MAX_NUMBER_OF_IDEAS_PER_PAGE: '+MAX_NUMBER_OF_IDEAS_PER_PAGE);
        pageShowing = String.valueOf((rowStart/MAX_NUMBER_OF_IDEAS_PER_PAGE) + 1) + ' of ' + String.valueOf(totalPages);
        System.debug('pageShowing: '+pageShowing);
    }
    
    private Integer pagingVisibility(Integer rs, String operator) {
        Integer oldPageIndex = rs / MAX_NUMBER_OF_IDEAS_PER_PAGE;
        if(operator == '+') rs = rowStart + MAX_NUMBER_OF_IDEAS_PER_PAGE;
        if(operator == '-') rs = rowStart - MAX_NUMBER_OF_IDEAS_PER_PAGE;
        return rs;
    }
    
    private void setTabPermission(){
    	TabPermission = new TabPermissions();
    }
}