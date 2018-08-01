public class IdeaPostController extends IdeaController {
    private Integer numPages;
    public Idea ideaObj {get;set;}
    private transient Idea[] searchResult;
    
    public string validCategories {get;set;}
    public String defaultTitle { get { if (defaultTitle == null) { defaultTitle = 'Give your idea a title'; } return defaultTitle; } set; }
    public List<Selectoption> categoryOptions {get;set;}
    public Boolean isEdit {get;set;}
    public Boolean isPortalUser {get;set;}

    public IdeaPostController(ApexPages.StandardController controller) {
        System.debug('IdeaPostController1');
        ideaObj = (Idea)controller.getRecord();
        validCategories = '';
        categoryOptions = new List<Selectoption>();
        isEdit = false;
        isPortalUser = false;
        categoryOptions.add(new Selectoption('', '--None--'));
        
        User curUser = [Select Id, IsPortalEnabled From User Where Id =: Userinfo.getUserId()];
        if(curUser.IsPortalEnabled) isPortalUser = true;
        List<PermissionSetAssignment> permissionSet = [Select p.PermissionSetId, p.Id, p.AssigneeId From PermissionSetAssignment p 
                                                        where p.PermissionSet.Name = 'RoundTable_Administration' and p.AssigneeId =: Userinfo.getUserId()];
        
        if(permissionSet.size() > 0) {
            isEdit = true;
        }
        /*List<PermissionSetAssignment> permissionSet = [Select p.PermissionSetId, p.Id, p.AssigneeId From PermissionSetAssignment p where p.PermissionSet.Name = 'RoundTable_Administration'];
        String userId = Userinfo.getUserId();
        for(PermissionSetAssignment ps : permissionSet) {
            if(userId == ps.AssigneeId) {
                isEdit = true;
                break;
            }
        }*/
        
        for (SelectOption value : getCategories()) {
            if(value.getLabel() == 'Categories') continue;
            validCategories += value.getLabel() + ',';
            categoryOptions.add(new Selectoption(value.getLabel(), value.getLabel()));
        }
        System.debug('ideaObj: '+ideaObj);
        if (ideaObj == null) {
            ideaObj = new Idea();
            ideaObj.communityId = getCommunityId();
        } else if(ideaObj.Id != null) {
            ideaObj = [Select CreatedBy.Name, CreatedBy.CommunityNickname, VoteTotal, Title, Status, NumComments, LastCommentId, 
                            LastCommentDate, Id, CreatedDate, CreatedById, CommunityId, Categories, Body, Category__c, Sub_Category__c,Sub_Status__c From Idea Where Id =: ideaObj.Id];
        }
        
        /*
        if(ideaObj.Category__c != null && ideaObj.Category__c != '') {
            if(ideaObj.Category__c == 'Inform') {
                subCategoryOptions.add(new Selectoption('CAD', 'CAD'));
                subCategoryOptions.add(new Selectoption('Mobile', 'Mobile'));
                subCategoryOptions.add(new Selectoption('RMS', 'RMS'));
                subCategoryOptions.add(new Selectoption('Jail', 'Jail'));
                subCategoryOptions.add(new Selectoption('FBR', 'FBR'));
                subCategoryOptions.add(new Selectoption('911', '911'));
                subCategoryOptions.add(new Selectoption('IQ and Analytics', 'IQ and Analytics'));
            }
            if(ideaObj.Category__c == 'Perform') {
                subCategoryOptions.add(new Selectoption('CAD', 'CAD'));
                subCategoryOptions.add(new Selectoption('Billing', 'Billing'));
                subCategoryOptions.add(new Selectoption('ePCR', 'ePCR'));
            }
            if(ideaObj.Category__c == 'Respond (EMS)') {
                subCategoryOptions.add(new Selectoption('CAD', 'CAD'));
                subCategoryOptions.add(new Selectoption('Mobile', 'Mobile'));
                subCategoryOptions.add(new Selectoption('RMS', 'RMS'));
                subCategoryOptions.add(new Selectoption('Fire RMS', 'Fire RMS'));
                subCategoryOptions.add(new Selectoption('Jail', 'Jail'));
                subCategoryOptions.add(new Selectoption('FBR', 'FBR'));
                subCategoryOptions.add(new Selectoption('Civil', 'Civil'));
                subCategoryOptions.add(new Selectoption('Detective', 'Detective'));
                subCategoryOptions.add(new Selectoption('Administrative', 'Administrative'));
                subCategoryOptions.add(new Selectoption('IQ and Analytics', 'IQ and Analytics'));
                subCategoryOptions.add(new Selectoption('IQ and Analytics', 'Mapping'));
                subCategoryOptions.add(new Selectoption('IQ and Analytics', 'Attendance/Scheduling'));
                subCategoryOptions.add(new Selectoption('IQ and Analytics', 'Interface'));
                subCategoryOptions.add(new Selectoption('IQ and Analytics', 'MultiAgency'));
            }
        }*/
        
        if(ideaObj != null && ideaObj.Id != null) isEdit = true;
        if(isEdit && ideaObj.Status == null) ideaObj.Status = 'Public';
    }
    
    public void fetchSBOptons() {
        System.debug('fetchSBOptons: '+ideaObj.Category__c);
        ideaObj.Sub_Category__c = '';
    }
    
    public Selectoption[] getSubCategoryOptions() {
        System.debug('categorySelected value: '+categorySelected);
        System.debug('cat value: '+ideaObj.Category__c);
        List<Selectoption> subCatsOptions = new List<Selectoption>();
        subCatsOptions.add(new Selectoption('', '--None--'));
        getSubCategoryItems(ideaObj.Category__c, subCatsOptions);
        return subCatsOptions;
    }
    
    public IdeaPostController()
    {
        System.debug('IdeaPostController2');
    }

    private void validateCategories() {
        if(ideaObj.Category__c == null || ideaObj.Category__c == '') ApexPages.addMessage(new ApexPages.message(ApexPages.Severity.ERROR, 'Please select category'));
        if(ideaObj.Sub_Category__c == null || ideaObj.Sub_Category__c == '') ApexPages.addMessage(new ApexPages.message(ApexPages.Severity.ERROR, 'Please select sub category'));
    }
    
    public void validateTitle() {
        if( (ideaObj.title == null) || (ideaObj.title == defaultTitle) ) {
           ApexPages.addMessage(new ApexPages.message(ApexPages.Severity.ERROR, 'Please enter a valid Title'));
        }
    }

    public PageReference save() {
        try {
            //String catSelected = Apexpages.currentPage().getParameters().get('categorySelected');
            //System.debug('catSelected: '+catSelected);
            //subCategoryOptions = getSubCategoryItems(ideaObj.Category__c, subCategoryOptions);
            validateTitle();
            validateCategories();
            //ideaObj.Categories = catSelected;
            if (ApexPages.hasMessages()) {
                return null;
            }
            if(ideaObj.communityId == null) ideaObj.communityId = getCommunityId();
            upsert ideaObj;
            PageReference ideaPage;
            if(isEdit) {
                Map<String, String> paramMap = Apexpages.currentPage().getParameters();
                String paramValues = '';
                for(String s : paramMap.keyset()) {
                    if(s == 'returnUrl') paramValues += s + '=' + paramMap.get(s);
                }
                for(String s : paramMap.keyset()) {
                    if(s == 'id' || s == 'returnUrl' || s == 'com.salesforce.visualforce.ViewStateCSRF' || s == 'subStatusHidden' || s == 'com.salesforce.visualforce.ViewStateVersion' 
                        || s == 'subCatHidden' || s.contains('formId') || s == 'categorySelected') continue;
                    paramValues += '&' + s + '=' + paramMap.get(s);
                }
                ideaPage = getIdeaViewPage(ideaObj.Id, MESSAGE_CODE_COMMENT_POSTED);
                ideaPage.getParameters().put('returnUrl',escapeUrl(paramValues));
                
                //ideaPage = new Pagereference('/apex/ideaView?id=' + ideaObj.Id + ((paramValues != '') ? paramValues : ''));
                
                /*
                ideaPage = getIdeaViewPage(ideaObj.Id, MESSAGE_CODE_COMMENT_POSTED);
                ideaPage.getParameters().put(PARAM_PAGE, String.valueOf(this.numPages));
                System.debug('returnUrlParam ' + returnUrlParam);
                if( returnUrlParam != null ) {
                    ideaPage.getParameters().put(PARAM_RETURN_URL,escapeUrl(returnUrlParam));
                } */                       
                System.debug('URL is ' + ideaPage.getUrl());
            } else {
                ideaPage = getListPage(IdeaController.SORT_RECENT, null, null, null);
            }
            ideaPage.setRedirect(true);
            return ideaPage;
        } catch (System.DmlException e) {
            for (Integer i = 0; i < e.getNumDml(); i++) {
                ApexPages.addMessage(new ApexPages.message(ApexPages.Severity.ERROR, ' ' + e.getDmlMessage(i)));
            }
            return null;
        }
    }

    public PageReference cancel() {
        /*PageReference ideaPage = getListPage(sortParam, categoryParam, subCategoryParam, statusParam);
        ideaPage.setRedirect(true);
        return ideaPage;*/
        Map<String, String> paramMap = Apexpages.currentPage().getParameters();
        String paramValues = '';
        for(String s : paramMap.keyset()) {
            if(s == 'returnUrl' || s == 'com.salesforce.visualforce.ViewStateCSRF' || s == 'subStatusHidden' || s == 'com.salesforce.visualforce.ViewStateVersion' 
                || s == 'subCatHidden' || s.contains('formId') || s == 'categorySelected') continue;
            paramValues += '%26' + (s == 'pUrl' ? 'returnUrl' : s) + '=' + paramMap.get(s);
        }
        // Pagereference ideaPage = new Pagereference('/apex/ideaView?id=' + ideaObj.Id + ((paramValues != '') ? paramValues : ''));    
        Pagereference ideaPage = new Pagereference('/apex/ideaList');
        ideaPage.setRedirect(true);
        return ideaPage;
    }

    public Idea[] getSimilarIdeas() {
        return searchResult;
    }

    public PageReference loadSimilar() {
        //getIdea();
        Id[] similarIds = Ideas.findSimilar(ideaObj);
        if (similarIds == null || similarIds.size() == 0) {
            return null;
        } else {
            searchResult = [select title from idea where id in :similarIds];
        }
        return null;
    }

    public Boolean getHasSimilarIdeas() {
        return searchResult != null && searchResult.size() > 0;
    }
    
    public  List<SelectOption> getCategoryOptions() {
        List<SelectOption> valueOptions = new List<SelectOption>();
        for (SelectOption value : getCategories()) {
            if(value.getLabel() == 'Categories') continue;
            valueOptions.add(value);
        }
        return valueOptions;
    }
     
    /*public String[] getCategoriesForIdea() {
        String categories = getIdea().categories;
        if (categories == null) {
          return new List<String>();
        } else {
          return categories.split(';');
        }
    }*/

    public void setCategoriesForIdea(String[] categories) {
        /*String categoryString = '';

        for (String category : categories) {
            if (categoryString.length() > 0) {
                categoryString += ';';
            }
            categoryString += category;
        }*/

        //Idea idea = getIdea();
        /*if (idea.categories == null || idea.categories.length() == 0) {
            idea.categories = categoryString;
        } else if (categoryString.length() > 0) {
            idea.categories += ';';
            idea.categories += categoryString;
        }*/
    }
}