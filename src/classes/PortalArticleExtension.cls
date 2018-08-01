/************************************************************
*  Rev 2 (12/23/2015) 
- Add pagination to prevent view state error
*/
public with sharing class PortalArticleExtension {

    private KnowledgeArticleVersion articleController {get; set;}

    public List<KnowledgeArticleVersion> articles {get; set;}

    public List<ArticleWrapper> foundArticles {get;set;}

    public boolean productFamilyIMC {get;set;}

    public boolean productFamilyEMS {get;set;}

    public boolean productFamilyVisiNet {get;set;}

    public boolean productFamilyVisionAIR {get;set;}
    
    public boolean productFamily911 {get;set;}
    
    //12-11-2015 - add the Tiburon data category and subcategory filters
    public Boolean productFamilyTiburon {get;set;}
    
    public Boolean productFamilyZuercher {get;set;}
    public Boolean productFamilyLETG {get;set;}
    
    public Boolean productFamilyETI {get;set;}
    public Boolean productFamilyETI911 {get;set;}
    
    public boolean initialized {get;set;}

    public String searchCriteria {get; set;}

    public String imcFilter {get; set;}

    public String emsFilter {get; set;}

    public String visiNetFilter {get; set;}

    public String visionAIRFilter {get; set;}
    
    public String x911Filter {get; set;}
    
    public String tiburonFilter {get;set;}
    
    public String zuercherFilter {get;set;}
    
    public TabPermissions TabPermission {get; set;}

    public boolean defectSearch {get;set;}
    public boolean faqSearch {get;set;}
    public boolean howtoSearch {get;set;}
    public boolean releaseNotesSearch {get;set;}
    public boolean techAdvisorySearch {get;set;}
    public boolean techTipsSearch {get;set;}
    public boolean ticketSolutionsSearch {get;set;}
    public boolean userManualsSearch {get;set;}
    public boolean videoSearch {get;set;}
    
    public String redirectArticleId {get;set;}
    private String kbSearchTrackingId;
    private String sortExp = '';
    public String sortDir = 'asc';
    
    //PAGINATION
    public boolean nextPage {get;set;}  //USED FOR DISABLING THE PAGINATION BUTTON
    public boolean previousPage {get;set;}   //USED FOR DISABLING THE PAGINATION BUTTON
    public integer startRowNumber {get;set;}    //STORES THE CURRENT PAGE START INDEX
    public integer endRowNumber {get;set;}  //STORES THE CURRENT PAGE END INDEX
    public Boolean showPageLabel {get;set;} //
    public String recordShowing {get;set;} //display the current set of records number shown to the user
    public String pageShowing {get;set;} //display the current page number shown to the user out of total pages found
    public transient List<ArticleWrapper> foundArticlesTemp = new List<ArticleWrapper>();     //THIS CONTAINS THE WHOLE DATA RETRIEVED FROM THE OBJECT
    public transient Map<Id, ArticleWrapper> foundArticlesTempMap = new Map<Id, ArticleWrapper>();
    public transient Map<Id, Id> foundArticlesTempIdMap = new Map<Id, Id>();
    public transient List<ArticleWrapper> foundArticlesTempWSort = new List<ArticleWrapper>();
    public integer currentPage = 0;        //INDICATED WHICH PAGE THE USER IS CURRENTLY VIEWING
    public Integer totalRecordsFound = 0;  //STORES THE TOTAL RECORD FOUND
    public Integer pageSize;
    private Long totalPages = 0;
    private String searchMode = '';
    
    public PortalArticleExtension() {
      system.debug('PortalArticleExtension: init');
      setTabPermission();
      /*
      try {
        init();
      }catch(Exception e){
        system.debug('PortalArticleExtension: Caught exception [' + e.getMessage() + ']');
        ApexPages.addMessage(new ApexPages.Message(ApexPages.SEVERITY.ERROR,e.getMessage()));
      }
      */
    }

    public PortalArticleExtension(ApexPages.StandardController std) {
      system.debug('PortalArticleExtension: init from standard controller');
      /*
      articleController = (KnowledgeArticleVersion)std.getRecord();

      //PortalUserUtil.ProductFamilies prodFamilies = PortalUserUtil.getProductFamilies(UserInfo.getUserId());
      PortalUserUtil.ProductFamilies prodFamilies = PortalUserUtil.getProductFamiliesByContract(UserInfo.getUserId());
      
      productFamilyIMC = prodFamilies.productFamilyIMC;
      productFamilyEMS = prodFamilies.productFamilyEMS;
      productFamilyVisiNet = prodFamilies.productFamilyVisiNet;
      productFamilyVisionAIR = prodFamilies.productFamilyVisionAIR;

      init();

      //get the initial 30 days of articles
      articles = getDefaultArticleList();
      */
      
    }

    public void init() {
      foundArticles = new List<ArticleWrapper>();
      foundArticlesTemp = new List<ArticleWrapper>();
      foundArticlesTempMap = new Map<Id, ArticleWrapper>();
      foundArticlesTempIdMap = new Map<Id, Id>();
      foundArticlesTempWSort = new List<ArticleWrapper>();
      defectSearch = true;
      faqSearch = true;
      howtoSearch = true;
      releaseNotesSearch = true;
      techAdvisorySearch = true;
      techTipsSearch = true;
      ticketSolutionsSearch = true;
      videoSearch = true;
      userManualsSearch = true;
      String pageSizeStr = Label.KB_Page_Size;
      pageSize = String.isBlank(pageSizeStr) ? 20 : Integer.valueOf(pageSizeStr);
      
      PortalUserUtil.ProductFamilies prodFamilies = PortalUserUtil.getProductFamiliesByContract(UserInfo.getUserId());
      
      productFamilyIMC = prodFamilies.productFamilyIMC;
      productFamilyEMS = prodFamilies.productFamilyEMS;
      productFamilyVisiNet = prodFamilies.productFamilyVisiNet;
      productFamilyVisionAIR = prodFamilies.productFamilyVisionAIR;
      productFamily911 = prodFamilies.productFamily911;
      productFamilyTiburon = prodFamilies.productFamilyTiburon;
      productFamilyZuercher = prodFamilies.productFamilyZuercher;
      productFamilyLETG = prodFamilies.productFamilyLETG;
      productFamilyETI = prodFamilies.productFamilyETI;
      productFamilyETI911 = prodFamilies.productFamilyETI911;

      
      //get the initial 30 days of articles
      articles = getDefaultArticleList();
      
      initialized = true;
      
      //8/28/2014 - Madan Get serachkeword from querystring
      //------------------------------------------------------------------------------
      searchCriteria = ApexPages.currentPage().getParameters().get('searchKeyword');
      if(searchCriteria != '' && searchCriteria != null) performArticleSearch();
      //------------------------------------------------------------------------------
    }
    
    public PageReference viewArticles() {
      articles = getDefaultArticleList();

      return null;
    }

    private List<KnowledgeArticleVersion> getDefaultArticleList() {
      List<KnowledgeArticleVersion> defaultArticles = null;

      defaultArticles = [SELECT Id, Title, LastPublishedDate FROM KnowledgeArticleVersion WHERE PublishStatus = 'Online' AND Language = 'en_US'];

      Set<Id> articleIds = new Set<Id>();

      for (KnowledgeArticleVersion article : defaultArticles) {
        articleIds.add(article.Id);
      }

      return defaultArticles;
    }
        
    public void performArticleSearch() {
        resetPaginationVariables();
        sortField = '';
        sortDir = 'asc';
        searchArticles();
        calculatePaginationVariables();        
    }

    public void searchArticles() {
        try {
            System.debug('search begin');
            if (initialized == false) {
                System.debug('search start with initialization');
                init();
            }
            
            foundArticles = new List<ArticleWrapper>();
            foundArticlesTemp = new List<ArticleWrapper>();
            foundArticlesTempMap = new Map<Id, ArticleWrapper>();
            foundArticlesTempIdMap = new Map<Id, Id>();
            foundArticlesTempWSort = new List<ArticleWrapper>();
            //system.debug('searchArticles: Entered');
            
            searchCriteria = searchCriteria.trim();
            System.debug('searchCriteria: ' + searchCriteria);
            String newSearchKey = '';
            if(String.isNotBlank(searchCriteria) && searchCriteria.contains(' ')) {
                for(String s: searchCriteria.split(' ')) {
                    if(newSearchKey == '') {
                        newSearchKey = '"' + s + '*"';
                    } else {
                        newSearchKey += ' OR "' + s + '*"';
                    }
                }
            } else {
                newSearchKey = '"' + searchCriteria + '*"';
            }
            System.debug('newSearchKey: ' + newSearchKey);
            String searchquery = 'FIND\'' + newSearchKey + '\' IN ALL FIELDS RETURNING ';
            //System.debug('searchArticles: searchquery [' + searchquery1 + ']');
    
            //String searchquery = 'FIND\'"' + searchCriteria + '"\' IN ALL FIELDS RETURNING ';
            System.debug('searchArticles: searchquery [' + searchquery + ']');
            //return;
            
            String fieldsAndWhereClause = '(id, title, KnowledgeArticleId, UrlName, LastPublishedDate, LastModifiedDate, CreatedById WHERE PublishStatus=\'Online\' AND Language=\'en_US\' ) ';
    
            String queryDelimiter = '';

            system.debug('searchArticles: defectSearch [' + defectSearch + '], faqSearch [' + faqSearch + '], howtoSearch [' + howtoSearch + ']');
            Integer searchCriteriaCounter = 0;
            List<Defect__kav> defectArticles = null;
            List<FAQ__kav> faqArticles = null;
            List<How_To__kav> howtoArticles = null;
            List<Release_Notes__kav> releaseNotesArticles = null;
            List<Tech_Advisory__kav> techAdvisoryArticles = null;
            List<Tech_Tips__kav> techTipsArticles = null;
            List<Ticket_Solutions__kav> ticketSolutionsArticles = null;
            List<Video__kav> videoArticles = null;
            List<User_Manuals__kav> userManualsArticles = null;
            
            if(defectSearch == true) {
                String defectSearchQuery = searchQuery + ' Defect__kav' + fieldsAndWhereClause;
                System.debug('defectsearchQuery: '+ defectSearchQuery);
                List<List<SObject>> searchList = search.query(defectSearchQuery);
                defectArticles = searchList[0];
                //queryDelimiter = ',';
            }
            if(faqSearch == true) {
              String faqSearchQuery = searchQuery + ' FAQ__kav' + fieldsAndWhereClause;
              System.debug('faqSearchQuery: '+ faqSearchQuery);
              List<List<SObject>> searchList = search.query(faqSearchQuery);
              faqArticles = searchList[0];
            }
            if(howtoSearch == true) {
              String howToSearchQuery = searchQuery + ' How_To__kav' + fieldsAndWhereClause;
              List<List<SObject>> searchList = search.query(howToSearchQuery);
              howtoArticles = searchList[0];
            }
            if(releaseNotesSearch == true) {
              String releaseNotesSearchQuery = searchQuery + ' Release_Notes__kav' + fieldsAndWhereClause;
              List<List<SObject>> searchList = search.query(releaseNotesSearchQuery);
              releaseNotesArticles = searchList[0];
            }
            if(techAdvisorySearch == true) {
              String techAdvisorySearchQuery = searchQuery + queryDelimiter + ' Tech_Advisory__kav' + fieldsAndWhereClause;
              List<List<SObject>> searchList = search.query(techAdvisorySearchQuery);
              techAdvisoryArticles = searchList[0];
            }
            if(techTipsSearch == true) {
              String techTipsSearchQuery = searchQuery + queryDelimiter + ' Tech_Tips__kav' + fieldsAndWhereClause;
              List<List<SObject>> searchList = search.query(techTipsSearchquery);
              techTipsArticles = searchList[0];
            }
            if(ticketSolutionsSearch == true) {
              String ticketSolutionsSearchQuery = searchQuery + queryDelimiter + ' Ticket_Solutions__kav' + fieldsAndWhereClause;
              List<List<SObject>> searchList = search.query(ticketSolutionsSearchquery);
              ticketSolutionsArticles = searchList[0];
            }
            if(videoSearch == true){
                String videoSearchQuery = searchQuery + queryDelimiter + ' Video__kav ' + fieldsAndWhereClause;
                List<List<SObject>> searchList = search.query(videoSearchQuery);
                videoArticles = searchList[0];
            }
            if(userManualsSearch == true) {
              String userManualsSearchQuery = searchQuery + queryDelimiter + ' User_Manuals__kav' + fieldsAndWhereClause;
              List<List<SObject>> searchList = search.query(userManualsSearchquery);
              userManualsArticles = searchList[0];
            }

            //searchquery='FIND\'"Test"\' IN ALL FIELDS RETURNING Defect__kav(id, title WHERE PublishStatus=\'Online\' AND Language=\'en_US\' )';
            //System.debug('searchArticles: searchquery [' + searchquery + ']');
    
    
            //List<List<SObject>> searchList = search.query(searchquery);
    
            //System.debug('searchArticles: searchList size [' + searchList.size() + ']');
    
            
    
            boolean filterResults = false;
            Set<Id> filteredIds = null;

            system.debug('searchArticles: imcFilter [' + imcFilter + '], emsFilter [' + emsFilter + '], visiNetFilter [' + visiNetFilter + '], visionAIRFilter [' + visionAIRFilter + '], x911Filter [' + x911Filter + ']');
            if ((imcFilter != null) || (emsFilter != null) || (visiNetFilter != null) || (visionAIRFilter != null) || (x911Filter != null)) {
              //filterResults = true;
            }
    
            filteredIds = new Set<Id>();
            
            MAP<Id,Set<String>> mapCategoryGroups;
            Set<String> setTemp;
            
            System.debug('defectSearch: '+defectSearch);
            if(defectSearch == true) {
                system.debug('searchArticles: defectArticles size [' + defectArticles.size() + ']');
                mapCategoryGroups = new Map<id,Set<String>>();
                if (defectArticles.size() > 0) { /*get the valid IDs based on the filter*/ List<Defect__DataCategorySelection> categoryIds = [SELECT ParentId, DataCategoryName, DataCategoryGroupName FROM Defect__DataCategorySelection]; for (Defect__DataCategorySelection c : categoryIds) { if (AddIdToFilterResults(c.dataCategoryGroupName, c.dataCategoryName) == true) { /*add the parent ID (which is the document ID) to the filtered results - only return these documents*/ filteredIds.add(c.ParentId); setTemp = mapCategoryGroups.get(c.ParentId); if(setTemp == null) {setTemp = new Set<String>();} setTemp.add(c.DataCategoryGroupName); mapCategoryGroups.put(c.ParentId, setTemp); } } } 
                for(Defect__kav article : defectArticles) { String s = ''; if(filteredIds.contains(article.Id)) { ArticleWrapper wrapper = new ArticleWrapper(); wrapper.articleId = article.Id; wrapper.articleKnowledgeId = article.KnowledgeArticleId; wrapper.articleTitle = article.Title; wrapper.articleType = 'Defect'; wrapper.articlePublishDate = article.LastPublishedDate; wrapper.articleLastModifiedDate = article.LastModifiedDate; for(String str : mapCategoryGroups.get(article.Id)){ if(s == '' || s == null) {s += str;} else {s += ';' + str;} } wrapper.categoryGroups = s; wrapper.createdById = article.CreatedById; wrapper.matchedKeyCount = KBUtility.keywordMatched(searchCriteria, article.Title); foundArticlesTemp.add(wrapper); foundArticlesTempMap.put(article.Id, wrapper); foundArticlesTempIdMap.put(article.KnowledgeArticleId, article.Id); } }
            }
            System.debug('defectSearch - foundArticlesTemp: '+foundArticlesTemp);
            System.debug('faqSearch: '+faqSearch);
            if(faqSearch == true) {
                system.debug('searchArticles: faqArticles size [' + faqArticles.size() + ']');
                mapCategoryGroups = new Map<id,Set<String>>();
                if (faqArticles.size() > 0) { /*get the valid IDs based on the filter*/ List<FAQ__DataCategorySelection> categoryIds = [SELECT ParentId, DataCategoryName, DataCategoryGroupName FROM FAQ__DataCategorySelection]; for (FAQ__DataCategorySelection c : categoryIds) { if (AddIdToFilterResults(c.dataCategoryGroupName, c.dataCategoryName) == true) { /*add the parent ID (which is the document ID) to the filtered results - only return these documents*/ filteredIds.add(c.ParentId); /* Below code for creating data for categoryGroups*/ setTemp = mapCategoryGroups.get(c.ParentId); if(setTemp == null) {setTemp = new Set<String>();} setTemp.add(c.DataCategoryGroupName); mapCategoryGroups.put(c.ParentId, setTemp);} } }

                for(FAQ__kav article : faqArticles) { String s = ''; if(filteredIds.contains(article.Id)) { ArticleWrapper wrapper = new ArticleWrapper(); wrapper.articleId = article.Id; wrapper.articleKnowledgeId = article.KnowledgeArticleId; wrapper.articleTitle = article.Title; wrapper.articleType = 'FAQ'; wrapper.articlePublishDate = article.LastPublishedDate; wrapper.articleLastModifiedDate = article.LastModifiedDate; for(String str : mapCategoryGroups.get(article.Id)){ if(s == '' || s == null) {s += str;} else {s += ';' + str;} } wrapper.categoryGroups = s; wrapper.createdById = article.CreatedById; wrapper.matchedKeyCount = KBUtility.keywordMatched(searchCriteria, article.Title); foundArticlesTemp.add(wrapper); foundArticlesTempMap.put(article.Id, wrapper); foundArticlesTempIdMap.put(article.KnowledgeArticleId, article.Id); } }
            }
            System.debug('faqSearch - foundArticlesTemp: '+foundArticlesTemp);
            System.debug('howtoSearch: '+howtoSearch);
            if(howtoSearch == true) {
                system.debug('searchArticles: howtoArticles size [' + howtoArticles.size() + ']');
                mapCategoryGroups = new Map<id,Set<String>>();
                if (howtoArticles.size() > 0) { /*get the valid IDs based on the filter*/ List<How_To__DataCategorySelection> categoryIds = [SELECT ParentId, DataCategoryName, DataCategoryGroupName FROM How_To__DataCategorySelection]; for (How_To__DataCategorySelection c : categoryIds) { if (AddIdToFilterResults(c.dataCategoryGroupName, c.dataCategoryName) == true) { filteredIds.add(c.ParentId); /*Below code for creating data for categoryGroups*/ setTemp = mapCategoryGroups.get(c.ParentId); if(setTemp == null) {setTemp = new Set<String>();} setTemp.add(c.DataCategoryGroupName); mapCategoryGroups.put(c.ParentId, setTemp); } } }

                for(How_To__kav article : howtoArticles) { String s = ''; if(filteredIds.contains(article.Id)) { ArticleWrapper wrapper = new ArticleWrapper(); wrapper.articleId = article.Id; wrapper.articleKnowledgeId = article.KnowledgeArticleId; wrapper.articleTitle = article.Title; wrapper.articleType = 'How To'; wrapper.articlePublishDate = article.LastPublishedDate; wrapper.articleLastModifiedDate = article.LastModifiedDate; for(String str : mapCategoryGroups.get(article.Id)){ if(s == '' || s == null) { s += str;} else { s += ';' + str ;} } wrapper.categoryGroups = s; wrapper.createdById = article.CreatedById;foundArticlesTemp.add(wrapper); wrapper.matchedKeyCount = KBUtility.keywordMatched(searchCriteria, article.Title); foundArticlesTempMap.put(article.Id, wrapper); foundArticlesTempIdMap.put(article.KnowledgeArticleId, article.Id); } }
            }
            System.debug('howtoSearch - foundArticlesTemp: '+foundArticlesTemp);
            System.debug('releaseNotesSearch: '+releaseNotesSearch);
            if(releaseNotesSearch == true) {
                system.debug('searchArticles: releaseNotesArticles size [' + releaseNotesArticles.size() + ']');
                mapCategoryGroups = new Map<id,Set<String>>();
                if (releaseNotesArticles.size() > 0) { /*get the valid IDs based on the filter*/ List<Release_Notes__DataCategorySelection> categoryIds = [SELECT ParentId, DataCategoryName, DataCategoryGroupName FROM Release_Notes__DataCategorySelection]; for (Release_Notes__DataCategorySelection c : categoryIds) { if (AddIdToFilterResults(c.dataCategoryGroupName, c.dataCategoryName) == true) { filteredIds.add(c.ParentId); /*Below code for creating data for categoryGroups*/ setTemp = mapCategoryGroups.get(c.ParentId); if(setTemp == null) {setTemp = new Set<String>();} setTemp.add(c.DataCategoryGroupName); mapCategoryGroups.put(c.ParentId, setTemp); } } }

                for(Release_Notes__kav article : releaseNotesArticles) { String s = ''; if(filteredIds.contains(article.Id)) { ArticleWrapper wrapper = new ArticleWrapper(); wrapper.articleId = article.Id; wrapper.articleKnowledgeId = article.KnowledgeArticleId; wrapper.articleTitle = article.Title; wrapper.articleType = 'Release Notes'; wrapper.articlePublishDate = article.LastPublishedDate; wrapper.articleLastModifiedDate = article.LastModifiedDate; for(String str : mapCategoryGroups.get(article.Id)){if(s == '' || s == null) {s += str;} else {s += ';' + str;}} wrapper.categoryGroups = s; wrapper.createdById = article.CreatedById; wrapper.matchedKeyCount = KBUtility.keywordMatched(searchCriteria, article.Title); foundArticlesTemp.add(wrapper); foundArticlesTempMap.put(article.Id, wrapper); foundArticlesTempIdMap.put(article.KnowledgeArticleId, article.Id); } }
            }
            System.debug('releaseNotesSearch - foundArticlesTemp: '+foundArticlesTemp);
            System.debug('techAdvisorySearch: '+techAdvisorySearch);
            if(techAdvisorySearch == true) {
                system.debug('searchArticles: techAdvisoryArticles size [' + techAdvisoryArticles.size() + ']');
                mapCategoryGroups = new Map<id,Set<String>>();
                if (techAdvisoryArticles.size() > 0) { /*get the valid IDs based on the filter*/ List<Tech_Advisory__DataCategorySelection> categoryIds = [SELECT ParentId, DataCategoryName, DataCategoryGroupName FROM Tech_Advisory__DataCategorySelection]; for (Tech_Advisory__DataCategorySelection c : categoryIds) { if (AddIdToFilterResults(c.dataCategoryGroupName, c.dataCategoryName) == true) { /*add the parent ID (which is the document ID) to the filtered results - only return these documents*/ filteredIds.add(c.ParentId); /*Below code for creating data for categoryGroups*/ setTemp = mapCategoryGroups.get(c.ParentId); if(setTemp == null) {setTemp = new Set<String>();} setTemp.add(c.DataCategoryGroupName); mapCategoryGroups.put(c.ParentId, setTemp); } } }
    
                for(Tech_Advisory__kav article : techAdvisoryArticles) { String s = ''; if(filteredIds.contains(article.Id)) { ArticleWrapper wrapper = new ArticleWrapper(); wrapper.articleId = article.Id; wrapper.articleKnowledgeId = article.KnowledgeArticleId; wrapper.articleTitle = article.Title; wrapper.articleType = 'Tech Advisory'; wrapper.articlePublishDate = article.LastPublishedDate; wrapper.articleLastModifiedDate = article.LastModifiedDate; for(String str : mapCategoryGroups.get(article.Id)){ if(s == '' || s == null) {s += str;} else {s += ';' + str;} } wrapper.categoryGroups = s; wrapper.createdById = article.CreatedById; wrapper.matchedKeyCount = KBUtility.keywordMatched(searchCriteria, article.Title); foundArticlesTemp.add(wrapper); foundArticlesTempMap.put(article.Id, wrapper); foundArticlesTempIdMap.put(article.KnowledgeArticleId, article.Id); } }
            }
            System.debug('techAdvisorySearch - foundArticlesTemp: '+foundArticlesTemp);
            System.debug('techTipsSearch: '+techTipsSearch);
            if(techTipsSearch == true) {
                system.debug('searchArticles: techTipsArticles size [' + techTipsArticles.size() + ']');
                mapCategoryGroups = new Map<id,Set<String>>();
                if (techTipsArticles.size() > 0) { /*get the valid IDs based on the filter*/ List<Tech_Tips__DataCategorySelection> categoryIds = [SELECT ParentId, DataCategoryName, DataCategoryGroupName FROM Tech_Tips__DataCategorySelection]; mapCategoryGroups = new Map<id,Set<String>>(); for (Tech_Tips__DataCategorySelection c : categoryIds) { if (AddIdToFilterResults(c.dataCategoryGroupName, c.dataCategoryName) == true) { /*add the parent ID (which is the document ID) to the filtered results - only return these documents*/ filteredIds.add(c.ParentId); /*Below code for creating data for categoryGroups*/ setTemp = mapCategoryGroups.get(c.ParentId); if(setTemp == null) {setTemp = new Set<String>();} setTemp.add(c.DataCategoryGroupName); mapCategoryGroups.put(c.ParentId, setTemp); } } }
    
                for(Tech_Tips__kav article : techTipsArticles) { String s = ''; if(filteredIds.contains(article.Id)) { ArticleWrapper wrapper = new ArticleWrapper(); wrapper.articleId = article.Id; wrapper.articleKnowledgeId = article.KnowledgeArticleId; wrapper.articleTitle = article.Title; wrapper.articleType = 'Tech Tip'; wrapper.articlePublishDate = article.LastPublishedDate; wrapper.articleLastModifiedDate = article.LastModifiedDate; for(String str : mapCategoryGroups.get(article.Id)){ if(s == '' || s == null) {s += str;} else {s += ';' + str;} } wrapper.categoryGroups = s; wrapper.createdById = article.CreatedById; wrapper.matchedKeyCount = KBUtility.keywordMatched(searchCriteria, article.Title); foundArticlesTemp.add(wrapper); foundArticlesTempMap.put(article.Id, wrapper); foundArticlesTempIdMap.put(article.KnowledgeArticleId, article.Id); } }
            }
            System.debug('techTipsSearch - foundArticlesTemp: '+foundArticlesTemp);
            System.debug('videoSearch: '+videoSearch);
            if(videoSearch == true) {
                system.debug('searchArticles: videoArticles size [' + videoArticles.size() + ']');
                mapCategoryGroups = new Map<id,Set<String>>();
                if (videoArticles.size() > 0) { /*get the valid IDs based on the filter*/ List<Video__DataCategorySelection> categoryIds = [SELECT ParentId, DataCategoryName, DataCategoryGroupName FROM Video__DataCategorySelection]; mapCategoryGroups = new Map<id,Set<String>>(); for (Video__DataCategorySelection c : categoryIds) { if (AddIdToFilterResults(c.dataCategoryGroupName, c.dataCategoryName) == true) { /*add the parent ID (which is the document ID) to the filtered results - only return these documents*/ filteredIds.add(c.ParentId); /*Below code for creating data for categoryGroups*/ setTemp = mapCategoryGroups.get(c.ParentId); if(setTemp == null) {setTemp = new Set<String>();} setTemp.add(c.DataCategoryGroupName); mapCategoryGroups.put(c.ParentId, setTemp); } } }
    
                for(Video__kav article : videoArticles) { String s = ''; if(filteredIds.contains(article.Id)) { ArticleWrapper wrapper = new ArticleWrapper(); wrapper.articleId = article.Id; wrapper.articleKnowledgeId = article.KnowledgeArticleId; wrapper.articleTitle = article.Title; wrapper.articleType = 'Video'; wrapper.articlePublishDate = article.LastPublishedDate; wrapper.articleLastModifiedDate = article.LastModifiedDate; for(String str : mapCategoryGroups.get(article.Id)){ if(s == '' || s == null) {s += str;} else {s += ';' + str;} } wrapper.categoryGroups = s; wrapper.createdById = article.CreatedById; wrapper.matchedKeyCount = KBUtility.keywordMatched(searchCriteria, article.Title); foundArticlesTemp.add(wrapper); foundArticlesTempMap.put(article.Id, wrapper); foundArticlesTempIdMap.put(article.KnowledgeArticleId, article.Id); } }
            }
            System.debug('videoSearch - foundArticlesTemp: '+foundArticlesTemp);
            System.debug('ticketSolutionsSearch: '+ticketSolutionsSearch);
            System.debug('ticketSolutionsSearch - foundArticlesTempMap: '+foundArticlesTempMap);
            if(ticketSolutionsSearch == true) {
                system.debug('searchArticles: ticketSolutionsArticles size [' + ticketSolutionsArticles.size() + ']');
                mapCategoryGroups = new Map<id,Set<String>>();
                if (ticketSolutionsArticles.size() > 0) {
                    //get the valid IDs based on the filter
                    List<Ticket_Solutions__DataCategorySelection> categoryIds = [SELECT ParentId, DataCategoryName, DataCategoryGroupName FROM Ticket_Solutions__DataCategorySelection];
    
                    mapCategoryGroups = new Map<id,Set<String>>();
                    for (Ticket_Solutions__DataCategorySelection c : categoryIds) {
                        if (AddIdToFilterResults(c.dataCategoryGroupName, c.dataCategoryName) == true) {
                            //add the parent ID (which is the document ID) to the filtered results - only return these documents
                            filteredIds.add(c.ParentId);
                            //(8/27/2014) - Madan - Below code for creating data for categoryGroups
                            //-------------------------------------------------------------------
                            setTemp = mapCategoryGroups.get(c.ParentId);
                            if(setTemp == null) setTemp = new Set<String>();
                            setTemp.add(c.DataCategoryGroupName);
                            mapCategoryGroups.put(c.ParentId, setTemp);
                            //-----------------------------------------------------
                        }
                    }
                }
    
                for(Ticket_Solutions__kav article : ticketSolutionsArticles) {
                    //if (AddArticleToList(filteredIds, article.Id, filterResults) == true) 
                    String s = '';
                    if(filteredIds.contains(article.Id)) {
                        ArticleWrapper wrapper = new ArticleWrapper();
                        wrapper.articleId = article.Id;
                        wrapper.articleKnowledgeId = article.KnowledgeArticleId;
                        wrapper.articleTitle = article.Title;
                        wrapper.articleType = 'Ticket Solution';
                        wrapper.articlePublishDate = article.LastPublishedDate;
                        wrapper.articleLastModifiedDate = article.LastModifiedDate;
                        //(8/27/2014) - Madan
                        //-------------------------------------------------------------------
                        for(String str : mapCategoryGroups.get(article.Id)){
                            if(s == '' || s == null) s += str;
                            else s += ';' + str;
                        }
                        wrapper.categoryGroups = s;
                        wrapper.createdById = article.CreatedById;
                        //----------------------------------------------------------
                        //-----------------
                        //set the number of keyword matched in article title
                        wrapper.matchedKeyCount = KBUtility.keywordMatched(searchCriteria, article.Title);
                        //-----------------
                        foundArticlesTemp.add(wrapper);
                         foundArticlesTempMap.put(article.Id, wrapper);
                         foundArticlesTempIdMap.put(article.KnowledgeArticleId, article.Id); 
                    }
                }
            }
            System.debug('ticketSolutionsSearch - foundArticlesTemp: '+foundArticlesTemp);
            System.debug('ticketSolutionsSearch - foundArticlesTempMap: '+foundArticlesTempMap.keySet());
            System.debug('userManualsSearch: '+userManualsSearch);
            if(userManualsSearch == true) {
                system.debug('searchArticles: userManualsArticles size [' + userManualsArticles.size() + ']');
                mapCategoryGroups = new Map<id,Set<String>>();
                if (userManualsArticles.size() > 0) {
                    //get the valid IDs based on the filter
                    List<User_Manuals__DataCategorySelection> categoryIds = [SELECT ParentId, DataCategoryName, DataCategoryGroupName FROM User_Manuals__DataCategorySelection];
    
                    mapCategoryGroups = new Map<id,Set<String>>();
                    for (User_Manuals__DataCategorySelection c : categoryIds) {
                        if (AddIdToFilterResults(c.dataCategoryGroupName, c.dataCategoryName) == true) {
                            //add the parent ID (which is the document ID) to the filtered results - only return these documents
                            filteredIds.add(c.ParentId);
                            //(8/27/2014) - Madan - Below code for creating data for categoryGroups
                            //-------------------------------------------------------------------
                            setTemp = mapCategoryGroups.get(c.ParentId);
                            if(setTemp == null) setTemp = new Set<String>();
                            setTemp.add(c.DataCategoryGroupName);
                            mapCategoryGroups.put(c.ParentId, setTemp);
                            //-----------------------------------------------------
                        }
                    }
                }
    
                for(User_Manuals__kav article : userManualsArticles) {
                    //if (AddArticleToList(filteredIds, article.Id, filterResults) == true) 
                    String s = '';
                    if(filteredIds.contains(article.Id)) {
                        ArticleWrapper wrapper = new ArticleWrapper();
                        wrapper.articleId = article.Id;
                        wrapper.articleKnowledgeId = article.KnowledgeArticleId;
                        wrapper.articleTitle = article.Title;
                        wrapper.articleType = 'User Manual';
                        wrapper.articlePublishDate = article.LastPublishedDate;
                        wrapper.articleLastModifiedDate = article.LastModifiedDate; 
                        //(8/27/2014) - Madan
                        //-------------------------------------------------------------------
                        for(String str : mapCategoryGroups.get(article.Id)){
                            if(s == '' || s == null) s += str;
                            else s += ';' + str;
                        }
                        wrapper.categoryGroups = s;
                        wrapper.createdById = article.CreatedById;
                        //----------------------------------------------------------
                        wrapper.matchedKeyCount = KBUtility.keywordMatched(searchCriteria, article.Title); 
                        foundArticlesTemp.add(wrapper);
                        foundArticlesTempMap.put(article.Id, wrapper);
                        foundArticlesTempIdMap.put(article.KnowledgeArticleId, article.Id);
                    }
                }
            }
            System.debug('userManualsSearch - foundArticlesTemp: '+foundArticlesTemp);
            System.debug('userManualsSearch - foundArticlesTempMap: '+foundArticlesTempIdMap.keySet());
            
            //Sort the records wrt to most viewed article score
            List<KnowledgeArticleViewStat> ariticleViewStatList = [SELECT Channel,Id,NormalizedScore,ViewCount,ParentId 
                                                                    FROM KnowledgeArticleViewStat 
                                                                    WHERE ParentId IN :foundArticlesTempIdMap.keySet() and Channel = 'AllChannels' 
                                                                    order by ViewCount desc];
            
            //foundArticlesTempWSort
            for(KnowledgeArticleViewStat artVC: ariticleViewStatList) {
                Id artId = foundArticlesTempIdMap.get(artVC.ParentId);
                if(artId != null) {
                    ArticleWrapper wrapper = foundArticlesTempMap.get(artId);
                    wrapper.viewedCount = artVC.ViewCount;
                    foundArticlesTempWSort.add(wrapper);
                }
            }
            foundArticlesTemp = foundArticlesTempWSort;
            foundArticlesTemp.sort();
            
            for (ArticleWrapper article : foundArticlesTemp) {
                article.articleId = article.articleKnowledgeId.substring(0, 15);
            }
            
            //Madan - (8/26/2014) - Below codes are used to save search details
            //--------------------------------------------------------------------------------------
            if(searchMode != 'Sorting' && searchMode != 'Paging') {
                kbSearchTrackingId = KBUtility.saveSearchTracking(searchCriteria, (foundArticlesTemp.size() > 0)?true:false, emsFilter, imcFilter, visiNetFilter, visionAIRFilter, defectSearch, howtoSearch, techAdvisorySearch, ticketSolutionsSearch, faqSearch, releaseNotesSearch, techTipsSearch, userManualsSearch, videoSearch);
                KBUtility.saveSearchResult(kbSearchTrackingId, foundArticlesTemp);
            }
            //--------------------------------------------------------------------------------------
            
        } catch(Exception e) {
            ApexPages.addMessage(new ApexPages.Message(ApexPages.SEVERITY.ERROR,e.getMessage()));
        }
    
    }
    
    //Madan - 8/26/2014 - Below method created to redirect to perticle Article and also perform some oprations
    //----------------------------------------------------------------------------------------------------------
    public Pagereference redirectToArticle(){
        
        if(redirectArticleId != null && redirectArticleId != ''){
            //Set Article Viewed filed of KB_Search_Result__c record
            KBUtility.updateArticleViewed(redirectArticleId, kbSearchTrackingId);
            
            Pagereference pr;
            pr = new PageReference('/' + redirectArticleId);
            pr.setRedirect(true);
            return pr;  
        }
        else return null;
    }

    public boolean AddArticleToList(List<Id> filteredIds, Id articleId, boolean filterResults) {
      //system.debug('AddArticleToList: articleId [' + articleId + '], filterResults [' + filterResults + ']');
      boolean addArticleToList = false;

      if (filterResults == false) {
        //don't have to filter - always return true
        //return true;
      }

      if (filteredIds != null) {
        for(Id i : filteredIds) {
          if (i == articleId) {
            //found the article in the filtered list - add to the returned articles
            addArticleToList = true;
            break;
          }
        }
      }

      system.debug('searchArticles: addArticleToList [' + addArticleToList + '] for articleId [' + articleId + '], filterResults [' + filterResults + ']');
      return addArticleToList;
    }

    //check if the data category matches based on the filter criteria to add to the filter list or not
    public boolean AddIdToFilterResults(String dataCategoryGroupName, String dataCategoryName) {
      system.debug('AddIdToFilterResults: dataCategoryGroupName [' + dataCategoryGroupName + '], dataCategoryName [' + dataCategoryName + ']');
      dataCategoryGroupName = dataCategoryGroupName == 'Perform' ? 'Zuercher' : dataCategoryGroupName;
      dataCategoryGroupName = dataCategoryGroupName == 'IMC' ? 'Zuercher' : dataCategoryGroupName;
      dataCategoryGroupName = dataCategoryGroupName == 'LETG' ? 'Zuercher' : dataCategoryGroupName;
      dataCategoryGroupName = dataCategoryGroupName == 'ETI' ? 'Zuercher' : dataCategoryGroupName;
      //check if they have access to the data category family
      if (/*(productFamilyIMC == false && dataCategoryGroupName == PortalUserUtil.PERFORM_PRODUCT_FAMILY)
         ||*/ (productFamilyEMS == false && dataCategoryGroupName == PortalUserUtil.RESPOND_PRODUCT_FAMILY)
         || (productFamilyVisiNet == false && dataCategoryGroupName == PortalUserUtil.INFORM_PRODUCT_FAMILY)
         || (productFamilyVisionAir == false && dataCategoryGroupName == PortalUserUtil.VISIONAIR_PRODUCT_FAMILY)
         || (productFamily911 == false && dataCategoryGroupName == 'X' + PortalUserUtil.PRODUCT_FAMILY_911 + '_Inc')
         || (productFamilyTiburon == false && dataCategoryGroupName == PortalUserUtil.PRODUCT_FAMILY_Tiburon)
         || (productFamilyZuercher == false && productFamilyIMC == false && productFamilyLETG == false && productFamilyETI == false && dataCategoryGroupName == PortalUserUtil.PRODUCT_FAMILY_Zuercher)) {

           //the data category is a group they don't have access to
           system.debug('AddIdToFilterResults: The data category is a group they do not have access to');
           return false;
      }

      //check if they have access to the data category family but the filter is null - return all articles
      if (/*((productFamilyIMC == true) && (imcFilter == null) && (dataCategoryGroupName == PortalUserUtil.PERFORM_PRODUCT_FAMILY))
         ||*/ ((productFamilyEMS == true) && (emsFilter == null) && (dataCategoryGroupName == PortalUserUtil.RESPOND_PRODUCT_FAMILY))
         || ((productFamilyVisiNET == true) && (visiNetFilter == null) && (dataCategoryGroupName == PortalUserUtil.INFORM_PRODUCT_FAMILY))
         || ((productFamilyVisionAIR == true) && (visionAIRFilter == null) && (dataCategoryGroupName == PortalUserUtil.VISIONAIR_PRODUCT_FAMILY))
         || ((productFamily911 == true) && (x911Filter == null) && (dataCategoryGroupName == 'X' + PortalUserUtil.PRODUCT_FAMILY_911 + '_Inc'))
         || ((productFamilyTiburon == true) && (tiburonFilter == null) && (dataCategoryGroupName == PortalUserUtil.PRODUCT_FAMILY_Tiburon))
         || ((productFamilyZuercher == true) && (zuercherFilter == null) && (dataCategoryGroupName == PortalUserUtil.PRODUCT_FAMILY_Zuercher))
         || ((productFamilyIMC == true) && (zuercherFilter == null) && (dataCategoryGroupName == PortalUserUtil.PRODUCT_FAMILY_Zuercher))
         || ((productFamilyETI == true) && (zuercherFilter == null) && (dataCategoryGroupName == PortalUserUtil.PRODUCT_FAMILY_Zuercher))
         || ((productFamilyLETG == true) && (zuercherFilter == null) && (dataCategoryGroupName == PortalUserUtil.PRODUCT_FAMILY_Zuercher))
         || ((productFamilyETI == true) && (zuercherFilter == null) && (dataCategoryGroupName == PortalUserUtil.PRODUCT_FAMILY_Zuercher))
         || ((productFamilyETI911 == true) && (x911Filter == null) && (dataCategoryGroupName == 'X' + PortalUserUtil.PRODUCT_FAMILY_911 + '_Inc'))) {

          //the filter for this product family is null - include this result
          system.debug('AddIdToFilterResults: The filter for this product family is null - include this result');
          return true;
      }

      boolean categoryMatchesFamily = (/*((productFamilyIMC == true) && (imcFilter != null) && (dataCategoryGroupName == PortalUserUtil.PERFORM_PRODUCT_FAMILY) && (dataCategoryName == imcFilter))
             ||*/ ((productFamilyEMS == true) && (emsFilter != null) && (dataCategoryGroupName == PortalUserUtil.RESPOND_PRODUCT_FAMILY) && (dataCategoryName == emsFilter))
             || ((productFamilyVisiNet == true) && (visiNetFilter != null) && (dataCategoryGroupName == PortalUserUtil.INFORM_PRODUCT_FAMILY) && (dataCategoryName == visiNetFilter))
             || ((productFamilyVisionAir == true) && (visionAirFilter != null) && (dataCategoryGroupName == PortalUserUtil.VISIONAIR_PRODUCT_FAMILY) && (dataCategoryName == visionAirFilter))
             || ((productFamily911 == true) && (x911Filter != null) && (dataCategoryGroupName == 'X' + PortalUserUtil.PRODUCT_FAMILY_911 + '_Inc') && (dataCategoryName == x911Filter))
             || ((productFamilyTiburon == true) && (tiburonFilter != null) && (dataCategoryGroupName == PortalUserUtil.PRODUCT_FAMILY_Tiburon) && (dataCategoryName == tiburonFilter))
             || ((productFamilyZuercher == true) && (zuercherFilter != null) && (dataCategoryGroupName == PortalUserUtil.PRODUCT_FAMILY_Zuercher) && (dataCategoryName == zuercherFilter))
             || ((productFamilyIMC == true) && (zuercherFilter != null) && (dataCategoryGroupName == PortalUserUtil.PRODUCT_FAMILY_Zuercher) && (dataCategoryName == zuercherFilter))
             || ((productFamilyLETG == true) && (zuercherFilter != null) && (dataCategoryGroupName == PortalUserUtil.PRODUCT_FAMILY_Zuercher) && (dataCategoryName == zuercherFilter))
             || ((productFamilyETI == true) && (zuercherFilter != null) && (dataCategoryGroupName == PortalUserUtil.PRODUCT_FAMILY_Zuercher) && (dataCategoryName == zuercherFilter))
             || ((productFamilyETI911 == true) && (x911Filter != null) && (dataCategoryGroupName == 'X' + PortalUserUtil.PRODUCT_FAMILY_911 + '_Inc') && (dataCategoryName == x911Filter)));
             
      system.debug('AddIdToFilterResults: categoryMatchesFamily [' + categoryMatchesFamily + ']');
      return categoryMatchesFamily;

    }

    public class ArticleWrapperVO {
      public String articleId {get;set;}
      public String articleKnowledgeId {get;set;}
      public String articleTitle {get;set;}
      public String articleSummary {get;set;}
      public String articleType {get;set;}
      public String articleURL {get;set;}
      public DateTime articlePublishDate {get;set;}
      // (8/27/2014) - Madan - storing Article Data categories
      public String categoryGroups {get;set;}
      public String createdById {get;set;}
      //-------------------------------------------
      public ArticleWrapperVO() {

      }

    }

    public List<SelectOption> getIMCFilterValues() {
      return getDescribeDataCategoryGroupStructureResults(PortalUserUtil.PERFORM_PRODUCT_FAMILY);
    }

    public List<SelectOption> getEMSFilterValues() {
      return getDescribeDataCategoryGroupStructureResults(PortalUserUtil.RESPOND_PRODUCT_FAMILY);
    }

    public List<SelectOption> getVisiNetFilterValues() {
      return getDescribeDataCategoryGroupStructureResults(PortalUserUtil.INFORM_PRODUCT_FAMILY);
    }

    public List<SelectOption> getVisionAIRFilterValues() {
      return getDescribeDataCategoryGroupStructureResults(PortalUserUtil.VISIONAIR_PRODUCT_FAMILY);
    }
    
    public List<SelectOption> getX911FilterValues() {
      return getDescribeDataCategoryGroupStructureResults(PortalUserUtil.PRODUCT_FAMILY_911);
    }
    
    public List<SelectOption> getTiburonFilterValues() {
      return getDescribeDataCategoryGroupStructureResults(PortalUserUtil.PRODUCT_FAMILY_Tiburon);
    }
    
    public List<SelectOption> getZuercherFilterValues() {
      return getDescribeDataCategoryGroupStructureResults(PortalUserUtil.PRODUCT_FAMILY_Zuercher);
    }

    private List<SelectOption> getDescribeDataCategoryGroupStructureResults(String categoryName){
      system.debug('getDescribeDataCategoryGroupStructureResults: categoryName [' + categoryName + ']');

      if(categoryName == PortalUserUtil.PRODUCT_FAMILY_911) categoryName = 'X911_Inc';
            //ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.ERROR, '-' + categoryName)); 
      
      List<DescribeDataCategoryGroupResult> describeCategoryResult;
      List<DescribeDataCategoryGroupStructureResult> describeCategoryStructureResult;

      List<SelectOption> options = new List<SelectOption>();
      options.add(new SelectOption('','--None--'));

     //Making the call to the describeDataCategoryGroups to

     //get the list of category groups associated

     List<String> objType = new List<String>();
     objType.add('KnowledgeArticleVersion');
     describeCategoryResult = Schema.describeDataCategoryGroups(objType);

     //Creating a list of pair objects to use as a parameter

     //for the describe call

     List<DataCategoryGroupSobjectTypePair> pairs = new List<DataCategoryGroupSobjectTypePair>();

     //Looping throught the first describe result to create

     //the list of pairs for the second describe call

     for(DescribeDataCategoryGroupResult singleResult : describeCategoryResult){
        DataCategoryGroupSobjectTypePair p = new DataCategoryGroupSobjectTypePair();
        p.setSobject(singleResult.getSobject());
        p.setDataCategoryGroupName(singleResult.getName());
        pairs.add(p);
     }

     //describeDataCategoryGroupStructures()

     describeCategoryStructureResult = Schema.describeDataCategoryGroupStructures(pairs, false);
     //Getting data from the result

     for(DescribeDataCategoryGroupStructureResult singleResult : describeCategoryStructureResult){
        //Get name of the associated Sobject

        singleResult.getSobject();
        //system.debug('getDescribeDataCategoryGroupStructureResults: singleResult.getSobject() [' + singleResult.getSobject() + ']');

        //Get the name of the data category group

        singleResult.getName();
        //system.debug('getDescribeDataCategoryGroupStructureResults: singleResult.getName() [' + singleResult.getName() + ']');

        //Get the name of the data category group

        singleResult.getLabel();
        system.debug('getDescribeDataCategoryGroupStructureResults: singleResult.getLabel() [' + singleResult.getLabel() + ']');

        //Get the description of the data category group

        singleResult.getDescription();
        //system.debug('getDescribeDataCategoryGroupStructureResults: singleResult.getDescription() [' + singleResult.getDescription() + ']');

        //add the options for this particular category
        
        String categoryNameLabel = categoryName;
        if(categoryName == 'X911_Inc') categoryNameLabel = '911-Inc';
        if (singleResult.getLabel() == categoryNameLabel) {
            //Get the top level categories

            DataCategory [] toplevelCategories = singleResult.getTopCategories();

            //Recursively get all the categories

            List<DataCategory> allCategories = getAllCategories(toplevelCategories);

            for(DataCategory category : allCategories) {
              //Get the name of the category

              category.getName();
              //system.debug('getDescribeDataCategoryGroupStructureResults: category.getName() [' + category.getName() + ']');

              //Get the label of the category

              category.getLabel();
              //system.debug('getDescribeDataCategoryGroupStructureResults: category.getLabel() [' + category.getLabel() + ']');

              options.add(new SelectOption(category.getName(), category.getLabel()));

              //Get the list of sub categories in the category

              DataCategory [] childCategories = category.getChildCategories();
            }
         }
      }

      return options;
    }

     private static DataCategory[] getAllCategories(DataCategory [] categories){
        if(categories.isEmpty()){
           return new DataCategory[]{};
        } else {
           DataCategory [] categoriesClone = categories.clone();
           DataCategory category = categoriesClone[0];
           DataCategory[] allCategories = new DataCategory[]{category};
           categoriesClone.remove(0);
           categoriesClone.addAll(category.getChildCategories());
           allCategories.addAll(getAllCategories(categoriesClone));
           return allCategories;
        }
     }
    
    
    public String getSortDir(){
        //if not column is selected 
        if (sortField == null || sortField == '')
            return 'ASC';
        else
            return sortDir;
    }
    
    public String sortField {
        get  { if (sortExp == null || sortExp == '') {sortExp = ''; } return sortExp;  }
        set {
            //if the column is clicked on then switch between Ascending and Descending modes
            if (value == sortExp)
                sortDir = sortDir.equals('asc') ? 'desc' : 'asc';
            else
                sortDir = 'asc';
                sortExp = value;
        }
    }
    
    public void toggleSort() {
        System.Debug(LoggingLevel.INFO, '    #### toggleSort sortField:'+sortField);
        // simply toggle the direction
        //sortDir = sortDir.equals('asc') ? 'desc' : 'asc';
        resetPaginationVariables();
        searchArticles();
        foundArticlesTemp = sortResultList(foundArticlesTemp, sortField, sortDir);
        calculatePaginationVariables();
    }
    
    public static List<ArticleWrapper> sortResultList(List<ArticleWrapper> rowList, String sortColumn, String sortOrder) {
        List<ArticleWrapper> newList = new List<ArticleWrapper>();
        Map<String, List<ArticleWrapper>> stringResultMap = new Map<String, List<ArticleWrapper>>();
        Map<DateTime, List<ArticleWrapper>> dateResultMap = new Map<DateTime, List<ArticleWrapper>>();
        List<ArticleWrapper> blankValueList = new List<ArticleWrapper>();
        List<DateTime> dateValues = new List<DateTime>();
        List<String> stringValues = new List<String>();
        
        for(ArticleWrapper cr : rowList) {
            if(sortColumn == 'Article Title' || sortColumn == 'Type') {
                String key;
                if(sortColumn == 'Article Title') {
                    key = cr.articleTitle;
                }
                if(sortColumn == 'Type') {
                    key = cr.articleType;
                }
                if(key != null) {
                    List<ArticleWrapper> crTemp = stringResultMap.get(key);
                    if(crTemp == null) crTemp = new List<ArticleWrapper>();
                    crTemp.add(cr);
                    stringResultMap.put(key, crTemp);
                } else {
                    blankValueList.add(cr);
                }
            } else if(sortColumn == 'Published Date') {
                if(cr.articlePublishDate != null) {
                    List<ArticleWrapper> crTemp = dateResultMap.get(cr.articlePublishDate);
                    if(crTemp == null) crTemp = new List<ArticleWrapper>();
                    crTemp.add(cr);
                    dateResultMap.put(cr.articlePublishDate, crTemp);
                } else {
                    blankValueList.add(cr);
                }
            }
        }
        
        if(sortColumn == 'Article Title' || sortColumn == 'Type') {
            for(String s : stringResultMap.keySet()){
                stringValues.add(s);       
            }
            stringValues.sort();
            for(String s : stringValues) {
                if(stringResultMap.containsKey(s)) {
                    List<ArticleWrapper> temp = stringResultMap.get(s);
                    newList.addAll(temp);
                }
            }
        } else if(sortColumn == 'Published Date') {
            for(DateTime d : dateResultMap.keySet()){
                dateValues.add(d);       
            }
            dateValues.sort();
            for(Datetime d : dateValues) {
                if(dateResultMap.containsKey(d)) {
                    List<ArticleWrapper> temp = dateResultMap.get(d);
                    newList.addAll(temp);
                }
            }
        }
        newList.addAll(blankValueList);
        
        if(sortOrder == 'desc') {
            List<ArticleWrapper> descTemp = new List<ArticleWrapper>();
            descTemp.addAll(newList);
            newList = new List<ArticleWrapper>();
            for(Integer i = descTemp.size()-1; i>=0;i--) {
                newList.add(descTemp.get(i)); 
            }
        }
        
        if(newList.size() == 0 && rowList.size() > 0) {
            return rowList;
        }
        
        return newList;
    }
    
    /**
     * prepareArticleList Method
     * - METHOD THAT PREPARES THE CURRENT SET OF RECORDS THAT NEEDS TO BE SHOWN BASED ON THE CURRENTPAGE NUMBER
     */
    public List<ArticleWrapper> prepareArticleList(integer startCount, integer size) {
        List<ArticleWrapper> currentList = new List<ArticleWrapper>();
        integer endCount = startCount + size;
        System.debug('msg: '+startCount + '::' + size + '::' +endCount + '::' + currentPage);
        System.debug('msg1: '+foundArticlesTemp.size());
        if(endCount > foundArticlesTemp.size()) {
            endCount = foundArticlesTemp.size();
        }
        Integer rIndex = 0;
        ArticleWrapper ant;
        for(integer index=startCount; index < endCount; index++) {
            ant = new ArticleWrapper();
            ant = foundArticlesTemp.get(index);
            currentList.add(ant);
            rIndex++;
        }
        if(startCount == 0) {
            nextPage = false;
        } else {
            nextPage = true;
        }
        if(endCount < foundArticlesTemp.size() || foundArticlesTemp.size() < size) {
            previousPage = true;
        } else {
            previousPage = false;
        }
        
        if(startCount == 0) {
            startRowNumber = 1;
            endRowNumber = endCount;
            if(foundArticlesTemp.size() <= pageSize) {
                previousPage = false;
            }
        }
        System.debug('previousPage'+previousPage);
        System.debug('nextPage'+nextPage);
        return currentList;
    }
    
    /**
     * goToPreviousPage Method
     * - INVOKED WHEN PREVIOUS BUTTON IS ENTERED
     */
    public void goToPreviousPage() {
        foundArticles = new List<ArticleWrapper>();
        searchArticles();
        this.currentPage--;
        //this.claimProcedureList = allSubList.get(this.currentPage);
        System.debug('startRowNumber: '+startRowNumber);
        System.debug('pageSize: '+pageSize);
        Integer startIndex = (startRowNumber - pageSize) - 1;
        if(startIndex < 0) startIndex = 0;
        this.foundArticles = prepareArticleList(startIndex, pageSize);
        if(this.currentPage == 0) {
            nextPage = false;
            previousPage = true;
            startRowNumber = 1;
            endRowNumber = pageSize;
        } else {
            previousPage = false;
            nextPage = false;
            startRowNumber -= pageSize;
            endRowNumber = (startRowNumber + pageSize) - 1;
        }
        System.debug('startRowNumber: '+startRowNumber);
        System.debug('endRowNumber: '+endRowNumber);
        setCurrentRecordsShowing();
    }
    
    /**
     * goToNextPage Method
     * - INVOKED WHEN NEXT BUTTON IS ENTERED
     */
    public void goToNextPage() {
        foundArticles = new List<ArticleWrapper>();
        searchArticles();
        if(!nextPage) {
            nextPage = true;
        }
        previousPage = true;
        this.currentPage++;
        this.foundArticles = prepareArticleList(endRowNumber, pageSize);
        //String.valueOf(currentPage+1) + ' of ' + String.valueOf(totalPages);
        System.debug('count: '+currentPage + '::' + totalPages);
        if(currentPage+1 == totalPages) {
          nextPage = true;
          previousPage = false;
        } else {
          previousPage = false;
          nextPage = false;
        }
        startRowNumber = endRowNumber+1;
        endRowNumber = endRowNumber + pageSize;
        if(endRowNumber > foundArticlesTemp.size()) {
            endRowNumber = foundArticlesTemp.size();
        }
        System.debug('startRowNumber: '+startRowNumber);
        System.debug('endRowNumber: '+endRowNumber);
        setCurrentRecordsShowing();
    }
    
    /**
     * setCurrentRecordsShowing Method
     * - SHOWS THE COUNT OF THE RECORDS SHOWN ON THE PAGE
     */
    private void setCurrentRecordsShowing() {
        recordShowing = 'Showing: ' + String.valueOf(startRowNumber) + '-' + String.valueOf(endRowNumber) + ' of ' + String.valueOf(totalRecordsFound);
        pageShowing = String.valueOf(currentPage+1) + ' of ' + String.valueOf(totalPages);
    }
    
    /**
     * calculateTotalPages Method
     * - calculates the total number of pages from search result and page size
     */
    private void calculateTotalPages() {
    
        Decimal rowSize = totalRecordsFound;
        Decimal ttlPages = rowSize.divide(pageSize, 2, System.RoundingMode.UP);
        //System.debug('ttlPages '+ttlPages);
        totalPages = ttlPages.round();
        if(ttlPages > totalPages) {
            totalPages += 1;
        }
        system.debug('Total Pages'+totalPages);
            
    }
    
    /**
     * clearData Method
     * - initialize the pagination related varibles
     */
    private void clearData() {
        recordShowing = '0 Records';
        pageShowing = '0 of 0';
        totalRecordsFound = 0;
        showPageLabel = true;
        nextPage = true;
        previousPage = true;
    }
    
    public void resetPaginationVariables() {
        currentPage = 0;
        recordShowing = '0 Records';
        pageShowing = '0 of 0';
        totalRecordsFound = 0;
        showPageLabel = true;
        nextPage = true;
        previousPage = true;
    }
    
    public void calculatePaginationVariables() {
        if(foundArticlesTemp != null && foundArticlesTemp.size() > 0) {
            totalRecordsFound = foundArticlesTemp.size();
            foundArticles = prepareArticleList(0, pageSize);
            calculateTotalPages();
            setCurrentRecordsShowing();
            showPageLabel = false;
            if(totalRecordsFound <= pageSize) {
                previousPage = true;
                nextPage = true;
                showPageLabel = true;
            }
            
        } else {
            clearData();
            previousPage = true;
        }
    }
    
    
    
    private void setTabPermission(){
        TabPermission = new TabPermissions();
    }
}