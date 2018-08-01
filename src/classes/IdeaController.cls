public abstract class IdeaController {
    private static final String PAGE_PREFIX = '/apex';

    public static final String DEFAULT_HOME = 'ideaHome';
    public static final String DEFAULT_ABOUT = 'ideaAbout';
    public static final String DEFAULT_LIST = 'ideaList';
    public static final String DEFAULT_VIEW = 'ideaView';
    public static final String DEFAULT_POST = 'ideaPost';
    public static final String DEFAULT_PROFILE_LIST = 'ideaProfileList';
    public static final String DEFAULT_PROFILE_ACTIVITY = 'ideaProfileActivity';
    public static final String DEFAULT_SEARCH_RESULTS = 'ideaSearchResults'; 
    public static final String DEFAULT_FORGOT_PASSWORD = 'ideaForgotPassword';
    public static final String DEFAULT_FORGOT_PASSWORD_CONFIRM = 'ideaForgotPasswordConfirm';
    public static final String DEFAULT_ACCOUNT_DETAILS = 'ideaAccountDetails';
    public static final String DEFAULT_REGISTER = 'ideaSiteRegister';
    public static final String DEFAULT_LOGIN = 'ideaSiteLogin';
        
    public static final String PAGE_HOME = getPageOverrideOrDefault(DEFAULT_HOME, IdeaController.siteSetup.overrideIdeaHome__c);
    public static final String PAGE_ABOUT = getPageOverrideOrDefault(DEFAULT_ABOUT, IdeaController.siteSetup.overrideIdeaAbout__c);
    public static final String PAGE_LIST = getPageOverrideOrDefault(DEFAULT_LIST, IdeaController.siteSetup.overrideIdeaList__c);
    public static final String PAGE_VIEW = getPageOverrideOrDefault(DEFAULT_VIEW, IdeaController.siteSetup.overrideIdeaView__c);
    public static final String PAGE_POST = getPageOverrideOrDefault(DEFAULT_POST, IdeaController.siteSetup.overrideIdeaPost__c);
    public static final String PAGE_PROFILE_LIST = getPageOverrideOrDefault(DEFAULT_PROFILE_LIST, IdeaController.siteSetup.overrideIdeaProfileList__c);
    public static final String PAGE_PROFILE_ACTIVITY = getPageOverrideOrDefault(DEFAULT_PROFILE_ACTIVITY, IdeaController.siteSetup.overrideIdeaProfileActivity__c);
    public static final String PAGE_SEARCH_RESULTS = getPageOverrideOrDefault(DEFAULT_SEARCH_RESULTS, IdeaController.siteSetup.overrideIdeaSearchResults__c); 
    public static final String PAGE_FORGOT_PASSWORD = getPageOverrideOrDefault(DEFAULT_FORGOT_PASSWORD, IdeaController.siteSetup.overrideIdeaForgotPassword__c);
    public static final String PAGE_FORGOT_PASSWORD_CONFIRM = getPageOverrideOrDefault(DEFAULT_FORGOT_PASSWORD_CONFIRM, IdeaController.siteSetup.overrideIdeaForgotPasswordConfirm__c);
    public static final String PAGE_ACCOUNT_DETAILS = getPageOverrideOrDefault(DEFAULT_ACCOUNT_DETAILS, IdeaController.siteSetup.overrideIdeaAccountDetails__c);
    public static final String PAGE_REGISTER = getPageOverrideOrDefault(DEFAULT_REGISTER, IdeaController.siteSetup.overrideIdeaSiteRegister__c);
    public static final String PAGE_LOGIN = getPageOverrideOrDefault(DEFAULT_LOGIN, IdeaController.siteSetup.overrideIdeaSiteLogin__c);
    
    public static final String URL_HOME = PAGE_PREFIX + '/' + PAGE_HOME;
    public static final String URL_ABOUT = PAGE_PREFIX + '/' + PAGE_ABOUT;
    public static final String URL_LIST = PAGE_PREFIX + '/' + PAGE_LIST;
    public static final String URL_VIEW = PAGE_PREFIX + '/' + PAGE_VIEW;
    public static final String URL_POST = PAGE_PREFIX + '/' + PAGE_POST;
    public static final String URL_PROFILE_LIST = PAGE_PREFIX + '/' + PAGE_PROFILE_LIST;       
    public static final String URL_PROFILE_ACTIVITY = PAGE_PREFIX + '/' + PAGE_PROFILE_ACTIVITY;
    public static final String URL_SEARCH_RESULTS = PAGE_PREFIX + '/' + PAGE_SEARCH_RESULTS;
    public static final String URL_FORGOT_PASSWORD = PAGE_PREFIX + '/' + PAGE_FORGOT_PASSWORD;
    public static final String URL_FORGOT_PASSWORD_CONFIRM = PAGE_PREFIX + '/' + PAGE_FORGOT_PASSWORD_CONFIRM;
    public static final String URL_ACCOUNT_DETAILS = PAGE_PREFIX + '/' + PAGE_ACCOUNT_DETAILS;
    public static final String URL_REGISTER = PAGE_PREFIX + '/' + PAGE_REGISTER;
    public static final String URL_LOGIN = PAGE_PREFIX + '/' + PAGE_LOGIN;
    public static final String URL_LOGOUT = '/secur/logout.jsp';
   
    public static final String PARAM_COMMUNITY_ID = 'c';
    public static final String PARAM_SORT = 'sort';
    public static final String PARAM_CATEGORY = 'category';
    public static final String PARAM_SUB_CATEGORY = 'subcategory';
    public static final String PARAM_STATUS = 'status';
    public static final String PARAM_IDEA_ID = 'id';
    public static final String PARAM_USER_ID = 'u';
    public static final String PARAM_PAGE = 'p';
    public static final String PARAM_SEARCH_TERM = 's';
    public static final String PARAM_USER_COMMUNITY_NICKNAME = 'cn';
    public static final String PARAM_START_URL = 'startURL';
    public static final String PARAM_MESSAGE_CODE = 'mc';
    public static final String PARAM_RETURN_URL = 'returnUrl';
    public static final String PARAM_SUB_STATUS = 'status';

    public static final String SORT_POPULAR = 'popular';
    public static final String SORT_RECENT = 'recent';
    public static final String SORT_COMMENTS = 'comments';
    public static final String SORT_TOP = 'top';
    public static final String SORT_ARCH = 'archive';
    
    public static final String SORT_PROFILE_IDEAS = 'ideas';
    public static final String SORT_PROFILE_VOTES = 'votes';
    public static final String SORT_PROFILE_RECENT_REPLIES = 'recentReplies';
    
    public static final String PROFILE_LIST_TYPE_IDEAS_SUBMITTED ='Ideas Submitted'; 
    public static final String PROFILE_LIST_TYPE_IDEAS_VOTED_ON ='Ideas Voted On';
    public static final String PROFILE_LIST_TYPE_RECENT_REPLIES ='Recent Replies';    

    public static final String MESSAGE_CODE_COMMENT_POSTED = '0';

    public static final Integer SOQL_ROW_LIMIT = 10000;
    
    public String categorySelected {get;set;}
    public String subCategorySelected {get;set;}
    public String subCategoryHidden {get;set;}
    
    protected String paramByParamId(String paramId, String defaultValue) {
        if (ApexPages.currentPage().getParameters() == null) {
            return defaultValue;
        } else {
            String value = ApexPages.currentPage().getParameters().get(paramId);
            return (value == null) ? defaultValue : value; 
        }
    }

    public String communityIdParam { get { if (communityIdParam == null) { communityIdParam = paramByParamId(PARAM_COMMUNITY_ID, null); } return communityIdParam; } set; }
    public String sortParam { get { if (sortParam == null) { sortParam = paramByParamId(PARAM_SORT, ''); } return sortParam; } set; }
    public String categoryParam { get { if (categoryParam == null) { categoryParam = paramByParamId(PARAM_CATEGORY, null); } return categoryParam; } set; }
    public String subCategoryParam { get { if (subCategoryParam == null) { subCategoryParam = paramByParamId(PARAM_SUB_CATEGORY, null); } return subCategoryParam; } set; }
    public String statusParam { get { if (statusParam == null) { statusParam = paramByParamId(PARAM_STATUS, null); } return statusParam; } set; }
    public String pageParam { get { if (pageParam == null) { pageParam = paramByParamId(PARAM_PAGE, '1'); } return pageParam; } set; }    
    public String userParam { get { if (userParam == null) { userParam = paramByParamId(PARAM_USER_ID, UserInfo.getUserId()); } return userParam; } set; }    
    public String searchTermParam { get { if (searchTermParam == null) { searchTermParam = unEscapeUrl(paramByParamId(PARAM_SEARCH_TERM, null)); } return searchTermParam; } set; }
    public String returnUrlParam { get { if (returnUrlParam == null) { returnUrlParam = paramByParamId(PARAM_RETURN_URL, null); } return returnUrlParam; } set; }
    public String subStatusParam { get { if (subStatusParam == null) { subStatusParam = paramByParamId(PARAM_SUB_STATUS, ''); } return subStatusParam; } set; }

    private Integer numIdeas;
    private Integer numVotes;
    private Integer numComments;
    private String communityNicknameOfCurrentUser;

    public String getCommunityId() {
        if (siteSetup.CommunityId__c != null) return siteSetup.CommunityId__c;
        //throw new IdeaException('Please create an Ideas Site Setup with all required fields.');
        return null;
    }

    public static IdeasSiteSetup__c siteSetup {
        get {
            if (siteSetup == null) {
                try {
                    siteSetup = [ 
                       SELECT communityId__c, portalAccount__r.Id, cacheMaxAge__c,
                         homeHeading1__c, homeHeading2__c, homeHeading3__c, homeHeading4__c, homeHeading5__c, homeRecentIdeasHeading__c,
                         homeBody1__c, homeBody2__c, homeBody3__c, homeBody4__c, homeBody5__c,
                         homeBannerImageUrl__c, aboutBannerImageUrl__c,
                         aboutHeading__c, aboutBody__c, 
                         loginHeading__c, loginBody__c, 
                         registerHeading__c, registerBody__c, 
                         forgotPasswordHeading__c, forgotPasswordBody__c,
                         categories__c, statuses__c,
                         overrideIdeaView__c, overrideIdeaLayout__c, overrideIdeaList__c, overrideIdeaPost__c, 
                         overrideIdeaAccountDetails__c, overrideIdeaForgotPasswordConfirm__c, overrideIdeaForgotPassword__c, 
                         overrideIdeaSearchResults__c, overrideIdeaSiteLogin__c, overrideIdeaSiteRegister__c,
                         overrideIdeaProfileList__c, overrideIdeaProfileActivity__c, overrideIdeaHome__c, overrideIdeaAbout__c, 
                         footerText__c,
                         customCssUrl__c,
                         expertsGroupId__c
                       FROM IdeasSiteSetup__c ];
                } catch (QueryException  e) {
                    // can't throw an exception here in order to prevent tests from failing before creating an Ideas Site Setup
                    siteSetup = new IdeasSiteSetup__c();
                }
            }
            return siteSetup;
        }
        set;
    }
       
    public IdeasSiteSetup__c getSiteSetup() {
        return siteSetup;
    }
    
    // TODO: doesn't show up on the page with siteSetup.homeHeader1__c; look into some object setting
    public String homeHeading1 { get { return siteSetup.homeHeading1__c; }}
    public String homeHeading2 { get { return siteSetup.homeHeading2__c; }}
    public String homeHeading3 { get { return siteSetup.homeHeading3__c; }}
    public String homeHeading4 { get { return siteSetup.homeHeading4__c; }}
    public String homeHeading5 { get { return siteSetup.homeHeading5__c; }}
    public String homeRecentIdeasHeading { get { return siteSetup.homeRecentIdeasHeading__c; }}
    public String homeBody1 { get { return siteSetup.homeBody1__c; }}
    public String homeBody2 { get { return siteSetup.homeBody2__c; }}
    public String homeBody3 { get { return siteSetup.homeBody3__c; }}
    public String homeBody4 { get { return siteSetup.homeBody4__c; }}
    public String homeBody5 { get { return siteSetup.homeBody5__c; }}
    public String aboutHeading { get { return siteSetup.aboutHeading__c; }}
    public String aboutBody { get { return siteSetup.aboutBody__c; }}
    public String loginHeading { get { return siteSetup.loginHeading__c; }}
    public String loginBody { get { return siteSetup.loginBody__c; }}
    public String registerHeading { get { return siteSetup.registerHeading__c; }}
    public String registerBody { get { return siteSetup.registerBody__c; }}
    public String forgotPasswordHeading { get { return siteSetup.forgotPasswordHeading__c; }}
    public String forgotPasswordBody { get { return siteSetup.forgotPasswordBody__c; }}
    public String homeBannerImageUrl { get { return siteSetup.homeBannerImageUrl__c; }}
    public String aboutBannerImageUrl { get { return siteSetup.aboutBannerImageUrl__c; }}
    public String footerText { get { return siteSetup.footerText__c; }}
    public String customCssUrl { get { return siteSetup.customCssUrl__c; }}

    public Boolean getIsLayoutOverridden() {
        return siteSetup.overrideIdeaLayout__c != null; 
    }
        
    public String getLayoutOverride() {
        return siteSetup.overrideIdeaLayout__c != null ? '/apex/' + siteSetup.overrideIdeaLayout__c : 'ideaEmpty';
    }
    
    public PageReference redirectToOverridePage {
        get {
            if (redirectToOverridePage == null) {
                String url = null;
                if (isPage(DEFAULT_HOME)) url = PAGE_HOME != DEFAULT_HOME ? URL_HOME : null;
                else if (isPage(DEFAULT_ABOUT)) url = PAGE_ABOUT != DEFAULT_ABOUT ? URL_ABOUT : null;
                else if (isPage(DEFAULT_LIST)) url = PAGE_LIST != DEFAULT_LIST ? URL_LIST : null;
                else if (isPage(DEFAULT_VIEW)) url = PAGE_VIEW != DEFAULT_VIEW ? URL_VIEW : null;
                else if (isPage(DEFAULT_POST)) url = PAGE_POST != DEFAULT_POST ? URL_POST : null;
                else if (isPage(DEFAULT_PROFILE_LIST)) url = PAGE_PROFILE_LIST != DEFAULT_PROFILE_LIST ? URL_PROFILE_LIST : null;
                else if (isPage(DEFAULT_PROFILE_ACTIVITY)) url = PAGE_PROFILE_ACTIVITY != DEFAULT_PROFILE_ACTIVITY ? URL_PROFILE_ACTIVITY : null;
                else if (isPage(DEFAULT_SEARCH_RESULTS)) url = PAGE_SEARCH_RESULTS != DEFAULT_SEARCH_RESULTS ? URL_SEARCH_RESULTS : null;
                else if (isPage(DEFAULT_FORGOT_PASSWORD)) url = PAGE_FORGOT_PASSWORD != DEFAULT_FORGOT_PASSWORD ? URL_FORGOT_PASSWORD : null;
                else if (isPage(DEFAULT_FORGOT_PASSWORD_CONFIRM)) url = PAGE_FORGOT_PASSWORD_CONFIRM != DEFAULT_FORGOT_PASSWORD_CONFIRM ? URL_FORGOT_PASSWORD_CONFIRM : null;
                else if (isPage(DEFAULT_ACCOUNT_DETAILS)) url = PAGE_ACCOUNT_DETAILS != DEFAULT_ACCOUNT_DETAILS ? URL_ACCOUNT_DETAILS : null;
                else if (isPage(DEFAULT_REGISTER)) url = PAGE_REGISTER != DEFAULT_REGISTER ? URL_REGISTER : null;
                else if (isPage(DEFAULT_LOGIN)) url = PAGE_LOGIN != DEFAULT_LOGIN ? URL_LOGIN : null;
                
                if (url == null) {
                    redirectToOverridePage = null;
                } else {
                    redirectToOverridePage = new PageReference(url);
                    redirectToOverridePage.getParameters().putAll(currentPageReference.getParameters());
                }
            }
            return redirectToOverridePage;
        }
        set;
    }
    
    private static String getPageOverrideOrDefault(String defaultPage, String pageOverride) {
        return pageOverride != null ? pageOverride : defaultPage;
    } 
    
    public static String toShortId(String id) {
        return id.substring(0, 15);
    }


    public PageReference redirectToOverride() {
        PageReference pr = redirectToOverridePage;
        if (pr != null) {
            pr.setRedirect(true);
            return pr;
        } else {
            return null;    
        }
    }
    
    public PageReference redirectWithCommunityId() {
        if (!getIsCommunityIdInRequest()) {
            PageReference pageRef = ApexPages.currentPage();
            pageRef.getParameters().put(PARAM_COMMUNITY_ID, getCommunityId());
            pageRef.setRedirect(true);
            return pageRef;
        } else {
            return null;
        }
    }
    
    public Boolean getIsCommunityIdInRequest() {
        return communityIdParam != null && communityIdParam == getCommunityId();
    }
        
    public static String escapeUrl(String url) {
        if (url == null) {
            return null;
        }
        String s = url;
        s = s.replaceAll(' ', '+');
        s = s.replaceAll('=', '%3D');
        s = s.replaceAll('/', '%2F');
        s = s.replaceAll('&', '%26');
        s = s.replace('?', '%3F');
        System.debug('s value: '+s);
        return s;
    }
    
    public static String unEscapeUrl(String url) {
        if (url == null) {
            return null;
        }
        String s = url;
        s = s.replace('+', ' ');
        s = s.replace('%2B', '+');        
        s = s.replace('%3D', '=');
        s = s.replace('%2F', '/');
        s = s.replace('%26', '&');
        s = s.replace('%3F', '?');
        return s;
    }
    
    public String getViewUrl() {
        return URL_VIEW;
    }

    public String getListUrl() {
        return URL_LIST + '?'+PARAM_SORT+'=' + sortParam;
    }

    public String getUserUrl() {
        return URL_PROFILE_ACTIVITY;
    }

    public String getSearchResultsUrl() {
        return URL_SEARCH_RESULTS;
    }
    
    public String getRegisterUrl() {
      return URL_REGISTER;
    } 
    
    public String getProfileListUrl() {
        return URL_PROFILE_LIST;
    }

    public String getAccountDetailsUrl() {
        return URL_ACCOUNT_DETAILS;
    }

    public String getHomeUrl() {
        return URL_HOME;
    }

    public PageReference getListPage(String listSort, String category, String subcategory, String status) {
        PageReference pageRef = new PageReference(getListUrl());
        pageRef.getParameters().put(PARAM_COMMUNITY_ID, getCommunityId());
        addStandardParameters(pageRef, listSort, category, subcategory, status);
        return pageRef;
    }
    
    private void addStandardParameters(PageReference pageRef, String listSort, String category, String subcategory, String status) {
        pageRef.getParameters().put(PARAM_SORT, listSort != null ? listSort : SORT_POPULAR);
        if (category != null) pageRef.getParameters().put(PARAM_CATEGORY, category);
        if (subcategory != null) pageRef.getParameters().put(PARAM_SUB_CATEGORY, subcategory);
        if (status != null) pageRef.getParameters().put(PARAM_STATUS, status);
    }

    public PageReference getIdeaListPage() {
        PageReference pageRef = new PageReference(URL_LIST);
        return pageRef;
    }
    
    public PageReference getIdeaProfileListPage() {
        PageReference pageRef = new PageReference(URL_PROFILE_LIST);        
        return pageRef;
    }
    
    public PageReference getIdeaViewPageComments() {
        PageReference pageRef = getIdeaViewPage();
        pageRef.setAnchor('comments');
        return pageRef;
    }
    
    public PageReference getIdeaViewPage() {
        PageReference pageRef = new PageReference(URL_VIEW);        
        if (returnUrlParam != null) {
            pageRef.getParameters().put(PARAM_RETURN_URL, returnUrlParam);
        } 
        return pageRef;
    }
    
    public static PageReference getIdeaViewPage(String ideaId) {
        PageReference pageRef = new PageReference(URL_VIEW);
        pageRef.getParameters().put(PARAM_IDEA_ID, ideaId);
        return pageRef;
    }

    public PageReference getIdeaViewPage(String ideaId, String messageCode) {
        PageReference pageRef = IdeaController.getIdeaViewPage(ideaId);
        pageRef.getParameters().put(PARAM_MESSAGE_CODE, messageCode);
        return pageRef;
    }

    public PageReference redirectIfNotLoggedIn() {
        PageReference p;
        if (!getIsLoggedIn()) {
            /*PageReference p = getLoginPage();
            p.getParameters().put(PARAM_START_URL, currentPageReference.getUrl());
            p.setRedirect(true);*/
            return p;
        } else {
            return null;
        }
    }
    
    public PageReference getIdeaPostPage() {
        PageReference p = new PageReference(URL_POST);
        addStandardParameters(p, getSortForFilters(), categoryParam, subCategoryParam, statusParam);
        return p;
    }
    
    public PageReference getAboutPage() {
        return new PageReference(URL_ABOUT);
    }

    public PageReference getLoginPage() {
        return new PageReference(URL_LOGIN);
    }

    public PageReference getLogoutPage() {
        return new PageReference(URL_LOGOUT);
    }

    public PageReference getRegisterPage() {
        return new PageReference(URL_REGISTER);
    }

    public PageReference getForgotPasswordPage() {
        return new PageReference(URL_FORGOT_PASSWORD);
    }

    public static PageReference getUserPage(String userId) {
        return getProfilePage(URL_PROFILE_ACTIVITY, userId);
    }

    public PageReference getUserProfilePage() {
        return getUserPage(UserInfo.getUserId());
    }    

    public static PageReference getProfileListPage(String userId, String listSort) {
        PageReference pageRef = new PageReference(URL_PROFILE_LIST);
        pageRef.getParameters().put(PARAM_USER_ID, userId);
        pageRef.getParameters().put(PARAM_SORT, listSort);
        return pageRef;
    }

    public static PageReference getIdeaAccountDetailsPage(String userId) {
        return getProfilePage(URL_ACCOUNT_DETAILS, userId);
    }
    
    private static PageReference getProfilePage(String pageUrl, String userId) {
        PageReference pageRef = new PageReference(pageUrl);
        pageRef.getParameters().put(PARAM_USER_ID, userId);
        return pageRef;
    }     
    
    public Boolean getIsStandardUser() {
        return UserInfo.getUserType().equals('Standard');
    }
        
    public PageReference currentPageReference { 
        get { 
            if (currentPageReference == null) { 
                currentPageReference = ApexPages.currentPage();
            }
            return currentPageReference;
        }
        set;
    }

    public String getCurrentPageUrl() {
        return currentPageReference.getUrl();
    }
    
    public String getCommunityNicknameOfCurrentUser() {
        if (communityNicknameOfCurrentUser == null) {
            Id idOfCurrentUser = UserInfo.getUserId();
            communityNicknameOfCurrentUser = [select communityNickname from User where id = :idOfCurrentUser].communityNickname;
        }
        return communityNicknameOfCurrentUser;
    }   

    public String getCategoryParam() {
        if (categoryParam == null || categoryParam == '') {
            return null;
        } else {
            return EncodingUtil.urlDecode(categoryParam, 'UTF-8');
        }
    }

    public String getCategoryParamName() {
        return PARAM_CATEGORY;
    }
    
    public String getSubCategoryParam() {
        if (subCategoryParam == null || subCategoryParam == '') {
            return null;
        } else {
            return EncodingUtil.urlDecode(subCategoryParam, 'UTF-8');
        }
    }

    public String getSubCategoryParamName() {
        return PARAM_SUB_CATEGORY;
    }

    public String getStatusParam() {
        if (statusParam == null || statusParam == '') {
            return null;
        } else {
            return EncodingUtil.urlDecode(statusParam, 'UTF-8');
        }
    }

    public String getStatusParamName() {
        return PARAM_STATUS;
    }

    public String getSearchTermParamName() {
        return PARAM_SEARCH_TERM;
    }

    public String getCommunityNicknameParam() {
        return PARAM_USER_COMMUNITY_NICKNAME;
    }

    public String getUserParamName() {
         return PARAM_USER_ID;
    }    

    public Boolean getIsLoggedIn() {
        return UserInfo.getUserType() != 'Guest';
    }

    public Integer getPageParamInt() {
        return Integer.valueOf(pageParam);
    }
    
    public Selectoption[] getSubCategories() {
        List<Selectoption> subCatsOptions = new List<Selectoption>();
        subCatsOptions.add(new Selectoption('', 'Sub-Categories'));
        getSubCategoryItems(categorySelected, subCatsOptions);
        return subCatsOptions;
    }    

    public Selectoption[] getCategories() {
        /*
        User userRec = [Select Id, AccountId, IsPortalEnabled From User Where Id =: Userinfo.getUserId()];
        List<Boolean> contracts = hideTabController_CP.hideTabMethod_CP();
        
        List<Selectoption> catsOptions = new List<Selectoption>();
        catsOptions.add(new Selectoption('', 'Categories'));
        if(!userRec.IsPortalEnabled || contracts[1]) {
            catsOptions.add(new Selectoption('Inform', 'Inform'));
        }
        if(!userRec.IsPortalEnabled || contracts[2]) {
            //catsOptions.add(new Selectoption('Perform', 'Perform'));
        }
        if(!userRec.IsPortalEnabled || contracts[0]) {
            catsOptions.add(new Selectoption('Respond (EMS)', 'Respond (EMS)'));
        }*/
        
        String userContactFamilies = '';
        String activeTiburonContractTypes = '';     //2016-04-27 : Add new subcategories for Tiburon category
        User userRec = [Select Id, AccountId, IsPortalEnabled From User Where Id =: Userinfo.getUserId()];
        
        Set<String> activeContractValues = new Set<String>();
            activeContractValues.add('Active');
            activeContractValues.add('Installed Not Live');     //Mohan 10-04-2014: Installed Not Live is considered as Active status
            activeContractValues.add('Renewal Due');
            activeContractValues.add('No HW Support, Software Only');

        List<ServiceContract> userContracts = [Select s.Product_Family_WMP__c, s.Id, s.AccountId, s.Contract_Type__c, s.Contract_Status_WMP__c 
                                                    From ServiceContract s Where AccountId =: userRec.AccountId and s.Contract_Status_WMP__c IN :activeContractValues];
        for(ServiceContract uc : userContracts) {
            if(uc.Product_Family_WMP__c != null && uc.Product_Family_WMP__c != '' && !userContactFamilies.contains(uc.Product_Family_WMP__c + ',')) {
                userContactFamilies += uc.Product_Family_WMP__c + ',';
            }
            if((uc.Contract_Status_WMP__c == 'Active' || uc.Contract_Status_WMP__c == 'Installed Not Live' || uc.Contract_Status_WMP__c == 'Renewal Due' || uc.Contract_Status_WMP__c == 'No HW Support, Software Only') && !activeTiburonContractTypes.contains(uc.Contract_Type__c + ',')) {
                activeTiburonContractTypes += uc.Contract_Type__c + ',';
            }
        }
        List<String> cats = new List<String>();
        List<Selectoption> catsOptions = new List<Selectoption>();
        
        catsOptions.add(new Selectoption('', 'Categories'));
        if(!userRec.IsPortalEnabled || (userRec.IsPortalEnabled && (userContactFamilies.contains('Inform') || userContactFamilies.contains('VisiNet') || userContactFamilies.contains('VisionAIR') || userContactFamilies.contains('911')))) catsOptions.add(new Selectoption('Inform', 'Inform'));
        if(!userRec.IsPortalEnabled || (userRec.IsPortalEnabled && (userContactFamilies.contains('IMC') || userContactFamilies.contains('Perform')))) catsOptions.add(new Selectoption('Perform', 'Perform'));
        if(!userRec.IsPortalEnabled || (userRec.IsPortalEnabled && (userContactFamilies.contains('EMS') || userContactFamilies.contains('Respond')))) catsOptions.add(new Selectoption('Respond (EMS)', 'Respond (EMS)'));
        //2016-04-27 : Add new subcategories for Tiburon category
        if(!userRec.IsPortalEnabled || (userRec.IsPortalEnabled && (activeTiburonContractTypes.contains('TC CAD/Mobile') 
                    || activeTiburonContractTypes.contains('TC RMS') || activeTiburonContractTypes.contains('DN CAD/Mobile') 
                    || activeTiburonContractTypes.contains('TE RMS') || activeTiburonContractTypes.contains('FACTS') 
                    || activeTiburonContractTypes.contains('IMS') || activeTiburonContractTypes.contains('Copperfire') 
                    || activeTiburonContractTypes.contains('CAD 2000')))) catsOptions.add(new Selectoption('Tiburon', 'Tiburon'));
        //if(catsOptions.size() == 4) catsOptions.add(new Selectoption('Tritech.com', 'Tritech.com'));      //excluded from the option on 18 Oct 2013
        
        return catsOptions;
    }

    public String[] getStatuses() {
        List<String> statuses = new List<String>();
        /*if (siteSetup.statuses__c != null) {
            List<String> statusesFromSite = siteSetup.statuses__c.split('\n');
            for (String entry : statusesFromSite) {
                statuses.add(entry.trim());
            }
            statuses.sort();
        }*/
        return statuses;
    }

    public PageReference selectStatus() {
        PageReference pr = getListPage(getSortForFilters(), categoryParam, subCategoryParam, statusParam);
        pr.setRedirect(true);
        return pr;
    }

    public List<SelectOption> getStatusSelectOptions() {
        List<SelectOption> options = new List<SelectOption>();
        options.add(new SelectOption(' ', 'All'));
        for (String s : getStatuses()) {
            options.add(new SelectOption(s, s));
        }
        return options;
    }

    public String getSortForFilters() {
        return getIsIdeaListPage() ? sortParam : SORT_POPULAR;
    }

    public static String getPage(String url) {
        if (url.contains('?')) {
            Integer i = url.indexOf('?');
            url = url.substring(0, i);
        }
        while (url.endsWith('/')) {
            url = url.substring(0, url.length()-1);
        }
        if (url.contains('/')) {
            Integer i = url.lastIndexOf('/');
            url = url.substring(i+1);
        }
        return url;
    }

    public String currentPage {
        get {
            if (currentPage == null) currentPage = getPage(currentPageReference.getUrl());
            return currentPage;
        }
        set;
    }

    public Boolean isPage(String pageName) {
        return currentPage.toLowerCase() == (pageName.toLowerCase());
    }

    public Boolean getIsHomePage() {
        return isPage(PAGE_HOME);
    }

    public Boolean getIsViewPage() {
        return isPage(PAGE_VIEW);
    }

    public Boolean getIsAboutPage() {
        return isPage(PAGE_ABOUT);
    }

    public Boolean getIsIdeaListPage() {
        return isPage(PAGE_LIST);
    }

    public Boolean getIsPostPage() {
        return isPage(PAGE_POST);
    }

    public Boolean getIsProfileListPage() {
        return isPage(PAGE_PROFILE_LIST);
    }

    public Boolean getIsRecentActivityPage() {
        return isPage(PAGE_PROFILE_ACTIVITY);
    }

    public Boolean getIsSubmittedIdeasPage() {
        return getIsProfileListPage() && SORT_PROFILE_IDEAS.equals(sortParam);
    }

    public Boolean getIsVotedIdeasPage() {
        return getIsProfileListPage() && SORT_PROFILE_VOTES.equals(sortParam);
    }

    public Boolean getIsRecentRepliesPage() {
        return getIsProfileListPage() && SORT_PROFILE_RECENT_REPLIES.equals(sortParam);
    }

    public Boolean getIsAccountDetailsPage() {
        return isPage(PAGE_ACCOUNT_DETAILS);
    }
    
    public String getCurrentProfileListType()
    {
        if(getIsSubmittedIdeasPage())
            return PROFILE_LIST_TYPE_IDEAS_SUBMITTED;
        if(getIsVotedIdeasPage())
            return PROFILE_LIST_TYPE_IDEAS_VOTED_ON;
        if(getIsRecentRepliesPage())
            return PROFILE_LIST_TYPE_RECENT_REPLIES;
        else
            return '';
            
    }    
    
    public List<Selectoption> getSubCategoryItems(String categoryValue, List<Selectoption> subCatOptions) {
        if(categoryValue != null && categoryValue != '') {
            if(categoryValue == 'Inform') {
                subCatOptions.add(new Selectoption('CAD', 'CAD'));
                subCatOptions.add(new Selectoption('Browser', 'Browser'));
                subCatOptions.add(new Selectoption('Mobile', 'Mobile'));
                subCatOptions.add(new Selectoption('RMS', 'RMS'));
                subCatOptions.add(new Selectoption('Fire RMS', 'Fire RMS'));
                subCatOptions.add(new Selectoption('Jail', 'Jail'));
                subCatOptions.add(new Selectoption('FBR', 'FBR'));
                subCatOptions.add(new Selectoption('911', '911'));
                subCatOptions.add(new Selectoption('IQ and Analytics', 'IQ and Analytics'));
                subCatOptions.add(new Selectoption('VisionCAD', 'VisionCAD'));
                subCatOptions.add(new Selectoption('VisionMobile', 'VisionMobile'));
                subCatOptions.add(new Selectoption('RoundTable', 'RoundTable'));
            }
            if(categoryValue == 'Perform') {
                subCatOptions.add(new Selectoption('Administrative', 'Administrative'));
                subCatOptions.add(new Selectoption('Attendance/Scheduling', 'Attendance/Scheduling'));
                subCatOptions.add(new Selectoption('CAD', 'CAD'));
                subCatOptions.add(new Selectoption('Civil', 'Civil'));
                subCatOptions.add(new Selectoption('DDF Queries', 'DDF Queries'));
                subCatOptions.add(new Selectoption('Detective', 'Detective'));
                subCatOptions.add(new Selectoption('Fire RMS', 'Fire RMS'));        
                subCatOptions.add(new Selectoption('Interface', 'Interface'));
                subCatOptions.add(new Selectoption('IQ and Analytics', 'IQ and Analytics'));
                subCatOptions.add(new Selectoption('Jail', 'Jail'));
                subCatOptions.add(new Selectoption('Law RMS', 'Law RMS'));
                subCatOptions.add(new Selectoption('Mapping', 'Mapping'));
                subCatOptions.add(new Selectoption('Mobile', 'Mobile'));
                subCatOptions.add(new Selectoption('MultiAgency', 'MultiAgency'));
                subCatOptions.add(new Selectoption('RoundTable', 'RoundTable'));
                
                //subCatOptions.add(new Selectoption('FBR', 'FBR'));
            }
            if(categoryValue == 'Respond (EMS)') {
                subCatOptions.add(new Selectoption('CAD', 'CAD'));
                subCatOptions.add(new Selectoption('Billing', 'Billing'));
                subCatOptions.add(new Selectoption('ePCR', 'ePCR'));
                subCatOptions.add(new Selectoption('RoundTable', 'RoundTable'));
            }
            //2016-04-27 : Add new subcategories for Tiburon category 
            if(categoryValue == 'Tiburon') {
                subCatOptions.add(new Selectoption('TC CAD/Mobile', 'TC CAD/Mobile'));
                subCatOptions.add(new Selectoption('TC RMS', 'TC RMS'));
                subCatOptions.add(new Selectoption('DN CAD/Mobile', 'DN CAD/Mobile'));
                subCatOptions.add(new Selectoption('TE RMS', 'TE RMS'));
            }
        }
        return subCatOptions;
    }
    
    public Pagereference filterByCategory() {
        if(categorySelected == null) categorySelected = '';
        subCategorySelected = '';
        Pagereference pr = new Pagereference('/apex/ideaList?c='+communityIdParam+'&sort='+sortParam+'&category='+categorySelected+'&subcategory='+subCategorySelected+'&status='+subStatusParam);
        pr.setRedirect(true);
        return pr;
    }
    
    public Pagereference filterBySubCategory() {
        if(categorySelected == null) categorySelected = '';
        if(subCategorySelected == null) subCategorySelected = '';
        Pagereference pr = new Pagereference('/apex/ideaList?c='+communityIdParam+'&sort='+sortParam+'&category='+categorySelected+'&subcategory='+subCategorySelected);
        pr.setRedirect(true);
        return pr;
    }
}