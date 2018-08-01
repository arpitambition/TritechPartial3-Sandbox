/**
 * This class contains unit tests for validating the behavior of Apex classes
 * and triggers.
 *
 * Unit tests are class methods that verify whether a particular piece
 * of code is working properly. Unit test methods take no arguments,
 * commit no data to the database, and are flagged with the testMethod
 * keyword in the method definition.
 *
 * All test methods in an organization are executed whenever Apex code is deployed
 * to a production organization to confirm correctness, ensure code
 * coverage, and prevent regressions. All Apex classes are
 * required to have at least 75% code coverage in order to be deployed
 * to a production organization. In addition, all triggers must have some code coverage.
 * 
 * The @isTest class annotation indicates this class only contains test
 * methods. Classes defined with the @isTest annotation do not count against
 * the organization size limit for all Apex scripts.
 *
 * See the Apex Language Reference for more information about Testing and Code Coverage.
 */
@isTest (seealldata=true)
private class PortalArticleExtensionTest {

    static testmethod void testPortalArticleController() {
      KnowledgeArticleVersion article = [SELECT Id FROM KnowledgeArticleVersion WHERE PublishStatus = 'Online' AND Language = 'en_US' LIMIT 1];

      ApexPages.StandardController stdController = new ApexPages.StandardController(article);

      test.startTest();
      //Test the custom article functionality
      PortalArticleExtension testController = new PortalArticleExtension(stdController);
      testController.init();

      test.stopTest();
    }

    static testmethod void testSearch() {
      KnowledgeArticleVersion article = [SELECT Id FROM KnowledgeArticleVersion WHERE PublishStatus = 'Online' AND Language = 'en_US' LIMIT 1];

      ApexPages.StandardController stdController = new ApexPages.StandardController(article);

      test.startTest();
      //Test the custom article functionality
      PortalArticleExtension testController = new PortalArticleExtension();
      testController = new PortalArticleExtension(stdController);
      testController.init();

      testController.searchCriteria = 'Internal';

      testController.defectSearch = true;
      testController.faqSearch = true;
      testController.howtoSearch = true;
      testController.releaseNotesSearch = true;
      testController.techAdvisorySearch = true;
      testController.techTipsSearch = true;
      testController.ticketSolutionsSearch = true;
      testController.videoSearch = true;
      testController.userManualsSearch = true;

      testController.imcFilter = 'All';
      testController.emsFilter = 'Internal';

      testController.AddIdToFilterResults('','');
      testController.AddArticleToList(null, article.Id, false);

      testController.productFamilyIMC = true;
      testController.productFamilyEMS = true;
      testController.productFamilyVisiNet = true;
      testController.productFamilyVisionAIR = true;
      testController.productFamily911 = true;
      testController.productFamilyTiburon = true;
      testController.productFamilyZuercher = true;
      
      Defect__kav kav = new Defect__kav();
      //kav.PublishStatus = 'Online';
      kav.Language = 'en_US';
      kav.Title = 'Internal';
      kav.UrlName = 'tempkav';
      insert kav;
      
      Defect__DataCategorySelection defect_dcs = new Defect__DataCategorySelection();
      defect_dcs.ParentId = kav.Id;
      defect_dcs.DataCategoryName = 'All';
      defect_dcs.DataCategoryGroupName = PortalUserUtil.PERFORM_PRODUCT_FAMILY;
      insert defect_dcs;

      
      Tech_Advisory__kav tech = new Tech_Advisory__kav();
      //tech.PublishStatus = 'Online';
      tech.Language = 'en_US';
      tech.Title = 'Internal';
      tech.UrlName = 'temptech';
      insert tech;
      
      Tech_Advisory__DataCategorySelection ta_dcs = new Tech_Advisory__DataCategorySelection();
      ta_dcs.ParentId = tech.Id;
      ta_dcs.DataCategoryName = 'All';
      ta_dcs.DataCategoryGroupName = PortalUserUtil.PERFORM_PRODUCT_FAMILY;
      insert ta_dcs;
      
      How_To__kav how = new How_To__kav();
      //how.PublishStatus = 'Online';
      how.Language = 'en_US';
      how.Title = 'Internal';
      how.UrlName = 'temphow';
      insert how;
      
      How_To__DataCategorySelection hw = new How_To__DataCategorySelection();
      hw.ParentId = how.Id;
      hw.DataCategoryName = 'All';
      hw.DataCategoryGroupName = PortalUserUtil.PERFORM_PRODUCT_FAMILY;
      insert hw;
      
      Ticket_Solutions__kav ticket = new Ticket_Solutions__kav();
      //ticket.PublishStatus = 'Online';
      ticket.Language = 'en_US';
      ticket.Title = 'Internal';
      ticket.UrlName = 'tempticket';
      insert ticket;
      
      Ticket_Solutions__DataCategorySelection ts = new Ticket_Solutions__DataCategorySelection();
      ts.ParentId = ticket.Id;
      ts.DataCategoryName = 'All';
      ts.DataCategoryGroupName = PortalUserUtil.PERFORM_PRODUCT_FAMILY;
      insert ts;
      
      FAQ__kav faq = new FAQ__kav();
      //ticket.PublishStatus = 'Online';
      faq.Language = 'en_US';
      faq.Title = 'Internal';
      faq.UrlName = 'tempfaq';
      insert faq;
      
      FAQ__DataCategorySelection fq = new FAQ__DataCategorySelection();
      fq.ParentId = faq.Id;
      fq.DataCategoryName = 'All';
      fq.DataCategoryGroupName = PortalUserUtil.PERFORM_PRODUCT_FAMILY;
      insert fq;
      
      Release_Notes__kav releaseNotes = new Release_Notes__kav();
      //ticket.PublishStatus = 'Online';
      releaseNotes.Language = 'en_US';
      releaseNotes.Title = 'Internal';
      releaseNotes.UrlName = 'temprelease';
      insert releaseNotes;
      
      Release_Notes__DataCategorySelection rls = new Release_Notes__DataCategorySelection();
      rls.ParentId = releaseNotes.Id;
      rls.DataCategoryName = 'All';
      rls.DataCategoryGroupName = PortalUserUtil.PERFORM_PRODUCT_FAMILY;
      insert rls;
      
      Tech_Tips__kav techTips = new Tech_Tips__kav();
      //ticket.PublishStatus = 'Online';
      techTips.Language = 'en_US';
      techTips.Title = 'Internal';
      techTips.UrlName = 'temptechTips';
      insert techTips;
      
      Tech_Tips__DataCategorySelection tt = new Tech_Tips__DataCategorySelection();
      tt.ParentId = techTips.Id;
      tt.DataCategoryName = 'All';
      tt.DataCategoryGroupName = PortalUserUtil.PERFORM_PRODUCT_FAMILY;
      insert tt;
      
      User_Manuals__kav userManuals = new User_Manuals__kav();
      //ticket.PublishStatus = 'Online';
      userManuals.Language = 'en_US';
      userManuals.Title = 'Internal';
      userManuals.UrlName = 'tempuser';
      insert userManuals;
      
      User_Manuals__DataCategorySelection um = new User_Manuals__DataCategorySelection();
      um.ParentId = userManuals.Id;
      um.DataCategoryName = 'All';
      um.DataCategoryGroupName = PortalUserUtil.PERFORM_PRODUCT_FAMILY;
      insert um;
      
      Defect__kav defect = [SELECT ID FROM Defect__kav Where Id =: kav.Id AND Language = 'en_US' AND Title LIKE 'Internal%' LIMIT 1];
      Tech_Advisory__kav techAdvisory = [SELECT ID FROM Tech_Advisory__kav Where Id =: tech.Id AND Language = 'en_US' AND Title LIKE 'Internal%' LIMIT 1];
      How_To__kav howto = [SELECT ID FROM How_To__kav Where Id =: how.Id AND Language = 'en_US' AND Title LIKE 'Internal%' LIMIT 1];
      Ticket_Solutions__kav ticketSolution = [SELECT ID FROM Ticket_Solutions__kav Where Id =: ticket.Id AND Language = 'en_US' LIMIT 1];

      Id[] fixedSearchResults = new Id[4];
      fixedSearchResults[0] = defect.Id;
      fixedSearchResults[1] = techAdvisory.Id;
      fixedSearchResults[2] = howto.Id;
      fixedSearchResults[3] = ticketSolution.Id;

      test.setFixedSearchResults(fixedSearchResults);

      testController.performArticleSearch();
      
      testController.sortField = 'Type';
      testController.toggleSort();

      testController.viewArticles();

      testController.getIMCFilterValues();
      testController.getEMSFilterValues();
      testController.getVisiNetFilterValues();
      testController.getVisionAIRFilterValues();

      ArticleWrapper wrapper = new ArticleWrapper();
      wrapper.articleId = 'Test';
      wrapper.articleTitle = 'Article Title';
      wrapper.articleSummary = 'Summary';
      wrapper.articleType = 'Defect';
      wrapper.articleURL = 'http://salesforce.com';
      wrapper.articlePublishDate = System.Today();
      
      
      
      test.stopTest();
    }
    
    static testmethod void testSearch_1() {
      KnowledgeArticleVersion article = [SELECT Id FROM KnowledgeArticleVersion WHERE PublishStatus = 'Online' AND Language = 'en_US' LIMIT 1];

      ApexPages.StandardController stdController = new ApexPages.StandardController(article);

      test.startTest();
      //Test the custom article functionality
      PortalArticleExtension testController = new PortalArticleExtension();
      testController = new PortalArticleExtension(stdController);
      testController.init();

      testController.searchCriteria = 'Internal';

      testController.defectSearch = true;
      testController.faqSearch = true;
      testController.howtoSearch = true;
      testController.releaseNotesSearch = true;
      testController.techAdvisorySearch = true;
      testController.techTipsSearch = true;
      testController.ticketSolutionsSearch = true;
      testController.videoSearch = true;
      testController.userManualsSearch = true;

      testController.imcFilter = 'All';
      testController.emsFilter = 'Internal';

      testController.AddIdToFilterResults('','');
      testController.AddArticleToList(null, article.Id, false);

      testController.productFamilyIMC = true;
      testController.productFamilyEMS = true;
      testController.productFamilyVisiNet = true;
      testController.productFamilyVisionAIR = true;
      testController.productFamily911 = true;
      testController.productFamilyTiburon = true;
      testController.productFamilyZuercher = true;
      
      Defect__kav kav = new Defect__kav();
      //kav.PublishStatus = 'Online';
      kav.Language = 'en_US';
      kav.Title = 'Internal';
      kav.UrlName = 'tempkav';
      insert kav;
      
      Defect__DataCategorySelection defect_dcs = new Defect__DataCategorySelection();
      defect_dcs.ParentId = kav.Id;
      defect_dcs.DataCategoryName = 'All';
      defect_dcs.DataCategoryGroupName = PortalUserUtil.PERFORM_PRODUCT_FAMILY;
      insert defect_dcs;

      
      Tech_Advisory__kav tech = new Tech_Advisory__kav();
      //tech.PublishStatus = 'Online';
      tech.Language = 'en_US';
      tech.Title = 'Internal';
      tech.UrlName = 'temptech';
      insert tech;
      
      Tech_Advisory__DataCategorySelection ta_dcs = new Tech_Advisory__DataCategorySelection();
      ta_dcs.ParentId = tech.Id;
      ta_dcs.DataCategoryName = 'All';
      ta_dcs.DataCategoryGroupName = PortalUserUtil.PERFORM_PRODUCT_FAMILY;
      insert ta_dcs;
      
      How_To__kav how = new How_To__kav();
      //how.PublishStatus = 'Online';
      how.Language = 'en_US';
      how.Title = 'Internal';
      how.UrlName = 'temphow';
      insert how;
      
      How_To__DataCategorySelection hw = new How_To__DataCategorySelection();
      hw.ParentId = how.Id;
      hw.DataCategoryName = 'All';
      hw.DataCategoryGroupName = PortalUserUtil.PERFORM_PRODUCT_FAMILY;
      insert hw;
      
      Ticket_Solutions__kav ticket = new Ticket_Solutions__kav();
      //ticket.PublishStatus = 'Online';
      ticket.Language = 'en_US';
      ticket.Title = 'Internal';
      ticket.UrlName = 'tempticket';
      insert ticket;
      
      Ticket_Solutions__DataCategorySelection ts = new Ticket_Solutions__DataCategorySelection();
      ts.ParentId = ticket.Id;
      ts.DataCategoryName = 'All';
      ts.DataCategoryGroupName = PortalUserUtil.PERFORM_PRODUCT_FAMILY;
      insert ts;
      
      FAQ__kav faq = new FAQ__kav();
      //ticket.PublishStatus = 'Online';
      faq.Language = 'en_US';
      faq.Title = 'Internal';
      faq.UrlName = 'tempfaq';
      insert faq;
      
      FAQ__DataCategorySelection fq = new FAQ__DataCategorySelection();
      fq.ParentId = faq.Id;
      fq.DataCategoryName = 'All';
      fq.DataCategoryGroupName = PortalUserUtil.PERFORM_PRODUCT_FAMILY;
      insert fq;
      
      Release_Notes__kav releaseNotes = new Release_Notes__kav();
      //ticket.PublishStatus = 'Online';
      releaseNotes.Language = 'en_US';
      releaseNotes.Title = 'Internal';
      releaseNotes.UrlName = 'temprelease';
      insert releaseNotes;
      
      Release_Notes__DataCategorySelection rls = new Release_Notes__DataCategorySelection();
      rls.ParentId = releaseNotes.Id;
      rls.DataCategoryName = 'All';
      rls.DataCategoryGroupName = PortalUserUtil.PERFORM_PRODUCT_FAMILY;
      insert rls;
      
      Tech_Tips__kav techTips = new Tech_Tips__kav();
      //ticket.PublishStatus = 'Online';
      techTips.Language = 'en_US';
      techTips.Title = 'Internal';
      techTips.UrlName = 'temptechTips';
      insert techTips;
      
      Tech_Tips__DataCategorySelection tt = new Tech_Tips__DataCategorySelection();
      tt.ParentId = techTips.Id;
      tt.DataCategoryName = 'All';
      tt.DataCategoryGroupName = PortalUserUtil.PERFORM_PRODUCT_FAMILY;
      insert tt;
      
      User_Manuals__kav userManuals = new User_Manuals__kav();
      //ticket.PublishStatus = 'Online';
      userManuals.Language = 'en_US';
      userManuals.Title = 'Internal';
      userManuals.UrlName = 'tempuser';
      insert userManuals;
      
      User_Manuals__DataCategorySelection um = new User_Manuals__DataCategorySelection();
      um.ParentId = userManuals.Id;
      um.DataCategoryName = 'All';
      um.DataCategoryGroupName = PortalUserUtil.PERFORM_PRODUCT_FAMILY;
      insert um;
      
      Defect__kav defect = [SELECT ID FROM Defect__kav Where Id =: kav.Id AND Language = 'en_US' AND Title LIKE 'Internal%' LIMIT 1];
      Tech_Advisory__kav techAdvisory = [SELECT ID FROM Tech_Advisory__kav Where Id =: tech.Id AND Language = 'en_US' AND Title LIKE 'Internal%' LIMIT 1];
      How_To__kav howto = [SELECT ID FROM How_To__kav Where Id =: how.Id AND Language = 'en_US' AND Title LIKE 'Internal%' LIMIT 1];
      Ticket_Solutions__kav ticketSolution = [SELECT ID FROM Ticket_Solutions__kav Where Id =: ticket.Id AND Language = 'en_US' LIMIT 1];

      Id[] fixedSearchResults = new Id[4];
      fixedSearchResults[0] = defect.Id;
      fixedSearchResults[1] = techAdvisory.Id;
      fixedSearchResults[2] = howto.Id;
      fixedSearchResults[3] = ticketSolution.Id;

      test.setFixedSearchResults(fixedSearchResults);

      testController.performArticleSearch();
      testController.sortDir = 'desc';
      testController.sortField = 'Article Title';
      testController.sortDir = 'asc';
      testController.toggleSort();

      testController.viewArticles();

      testController.getIMCFilterValues();
      testController.getEMSFilterValues();
      testController.getVisiNetFilterValues();
      testController.getVisionAIRFilterValues();
      testController.getZuercherFilterValues();

      ArticleWrapper wrapper = new ArticleWrapper();
      wrapper.articleId = 'Test';
      wrapper.articleTitle = 'Article Title';
      wrapper.articleSummary = 'Summary';
      wrapper.articleType = 'Defect';
      wrapper.articleURL = 'http://salesforce.com';
      wrapper.articlePublishDate = System.Today();
      
      
      
      test.stopTest();
    }
    
    static testmethod void testSearch_2() {
      KnowledgeArticleVersion article = [SELECT Id FROM KnowledgeArticleVersion WHERE PublishStatus = 'Online' AND Language = 'en_US' LIMIT 1];

      ApexPages.StandardController stdController = new ApexPages.StandardController(article);

      test.startTest();
      //Test the custom article functionality
      PortalArticleExtension testController = new PortalArticleExtension();
      testController = new PortalArticleExtension(stdController);
      testController.init();

      testController.searchCriteria = 'Internal';

      testController.defectSearch = true;
      testController.faqSearch = true;
      testController.howtoSearch = true;
      testController.releaseNotesSearch = true;
      testController.techAdvisorySearch = true;
      testController.techTipsSearch = true;
      testController.ticketSolutionsSearch = true;
      testController.videoSearch = true;
      testController.userManualsSearch = true;

      testController.imcFilter = 'All';
      testController.emsFilter = 'Internal';

      testController.AddIdToFilterResults('','');
      testController.AddArticleToList(null, article.Id, false);

      testController.productFamilyIMC = true;
      testController.productFamilyEMS = true;
      testController.productFamilyVisiNet = true;
      testController.productFamilyVisionAIR = true;
      testController.productFamily911 = true;
      testController.productFamilyTiburon = true;
      testController.productFamilyZuercher = true;
      
      Defect__kav kav = new Defect__kav();
      //kav.PublishStatus = 'Online';
      kav.Language = 'en_US';
      kav.Title = 'Internal';
      kav.UrlName = 'tempkav';
      insert kav;
      
      Defect__DataCategorySelection defect_dcs = new Defect__DataCategorySelection();
      defect_dcs.ParentId = kav.Id;
      defect_dcs.DataCategoryName = 'All';
      defect_dcs.DataCategoryGroupName = PortalUserUtil.PERFORM_PRODUCT_FAMILY;
      insert defect_dcs;

      
      Tech_Advisory__kav tech = new Tech_Advisory__kav();
      //tech.PublishStatus = 'Online';
      tech.Language = 'en_US';
      tech.Title = 'Internal';
      tech.UrlName = 'temptech';
      insert tech;
      
      Tech_Advisory__DataCategorySelection ta_dcs = new Tech_Advisory__DataCategorySelection();
      ta_dcs.ParentId = tech.Id;
      ta_dcs.DataCategoryName = 'All';
      ta_dcs.DataCategoryGroupName = PortalUserUtil.PERFORM_PRODUCT_FAMILY;
      insert ta_dcs;
      
      How_To__kav how = new How_To__kav();
      //how.PublishStatus = 'Online';
      how.Language = 'en_US';
      how.Title = 'Internal';
      how.UrlName = 'temphow';
      insert how;
      
      How_To__DataCategorySelection hw = new How_To__DataCategorySelection();
      hw.ParentId = how.Id;
      hw.DataCategoryName = 'All';
      hw.DataCategoryGroupName = PortalUserUtil.PERFORM_PRODUCT_FAMILY;
      insert hw;
      
      Ticket_Solutions__kav ticket = new Ticket_Solutions__kav();
      //ticket.PublishStatus = 'Online';
      ticket.Language = 'en_US';
      ticket.Title = 'Internal';
      ticket.UrlName = 'tempticket';
      insert ticket;
      
      Ticket_Solutions__DataCategorySelection ts = new Ticket_Solutions__DataCategorySelection();
      ts.ParentId = ticket.Id;
      ts.DataCategoryName = 'All';
      ts.DataCategoryGroupName = PortalUserUtil.PERFORM_PRODUCT_FAMILY;
      insert ts;
      
      FAQ__kav faq = new FAQ__kav();
      //ticket.PublishStatus = 'Online';
      faq.Language = 'en_US';
      faq.Title = 'Internal';
      faq.UrlName = 'tempfaq';
      insert faq;
      
      FAQ__DataCategorySelection fq = new FAQ__DataCategorySelection();
      fq.ParentId = faq.Id;
      fq.DataCategoryName = 'All';
      fq.DataCategoryGroupName = PortalUserUtil.PERFORM_PRODUCT_FAMILY;
      insert fq;
      
      Release_Notes__kav releaseNotes = new Release_Notes__kav();
      //ticket.PublishStatus = 'Online';
      releaseNotes.Language = 'en_US';
      releaseNotes.Title = 'Internal';
      releaseNotes.UrlName = 'temprelease';
      insert releaseNotes;
      
      Release_Notes__DataCategorySelection rls = new Release_Notes__DataCategorySelection();
      rls.ParentId = releaseNotes.Id;
      rls.DataCategoryName = 'All';
      rls.DataCategoryGroupName = PortalUserUtil.PERFORM_PRODUCT_FAMILY;
      insert rls;
      
      Tech_Tips__kav techTips = new Tech_Tips__kav();
      //ticket.PublishStatus = 'Online';
      techTips.Language = 'en_US';
      techTips.Title = 'Internal';
      techTips.UrlName = 'temptechTips';
      insert techTips;
      
      Tech_Tips__DataCategorySelection tt = new Tech_Tips__DataCategorySelection();
      tt.ParentId = techTips.Id;
      tt.DataCategoryName = 'All';
      tt.DataCategoryGroupName = PortalUserUtil.PERFORM_PRODUCT_FAMILY;
      insert tt;
      
      User_Manuals__kav userManuals = new User_Manuals__kav();
      //ticket.PublishStatus = 'Online';
      userManuals.Language = 'en_US';
      userManuals.Title = 'Internal';
      userManuals.UrlName = 'tempuser';
      insert userManuals;
      
      User_Manuals__DataCategorySelection um = new User_Manuals__DataCategorySelection();
      um.ParentId = userManuals.Id;
      um.DataCategoryName = 'All';
      um.DataCategoryGroupName = PortalUserUtil.PERFORM_PRODUCT_FAMILY;
      insert um;
      
      Defect__kav defect = [SELECT ID FROM Defect__kav Where Id =: kav.Id AND Language = 'en_US' AND Title LIKE 'Internal%' LIMIT 1];
      Tech_Advisory__kav techAdvisory = [SELECT ID FROM Tech_Advisory__kav Where Id =: tech.Id AND Language = 'en_US' AND Title LIKE 'Internal%' LIMIT 1];
      How_To__kav howto = [SELECT ID FROM How_To__kav Where Id =: how.Id AND Language = 'en_US' AND Title LIKE 'Internal%' LIMIT 1];
      Ticket_Solutions__kav ticketSolution = [SELECT ID FROM Ticket_Solutions__kav Where Id =: ticket.Id AND Language = 'en_US' LIMIT 1];

      Id[] fixedSearchResults = new Id[4];
      fixedSearchResults[0] = defect.Id;
      fixedSearchResults[1] = techAdvisory.Id;
      fixedSearchResults[2] = howto.Id;
      fixedSearchResults[3] = ticketSolution.Id;

      test.setFixedSearchResults(fixedSearchResults);
      testController.pageSize = 2;
      testController.resetPaginationVariables();
      
      ArticleWrapper wrapper = new ArticleWrapper();
      wrapper.articleId = 'Test1';
      wrapper.articleTitle = 'Article Title1';
      wrapper.articleSummary = 'Summary1';
      wrapper.articleType = 'Defect';
      wrapper.articleURL = 'http://salesforce.com';
      wrapper.articlePublishDate = System.Today();
      testController.foundArticlesTemp.add(wrapper);
      
      wrapper = new ArticleWrapper();
      wrapper.articleId = 'Test2';
      wrapper.articleTitle = 'Article Title12';
      wrapper.articleSummary = 'Summary2';
      wrapper.articleType = 'Defect';
      wrapper.articleURL = 'http://salesforce.com';
      wrapper.articlePublishDate = System.Today();
      testController.foundArticlesTemp.add(wrapper);
      
      wrapper = new ArticleWrapper();
      wrapper.articleId = 'Test3';
      wrapper.articleTitle = 'Article Title13';
      wrapper.articleSummary = 'Summary3';
      wrapper.articleType = 'Defect';
      wrapper.articleURL = 'http://salesforce.com';
      wrapper.articlePublishDate = System.Today();
      testController.foundArticlesTemp.add(wrapper);
      
      wrapper = new ArticleWrapper();
      wrapper.articleId = 'Test4';
      wrapper.articleTitle = 'Article Title14';
      wrapper.articleSummary = 'Summary4';
      wrapper.articleType = 'Defect';
      wrapper.articleURL = 'http://salesforce.com';
      wrapper.articlePublishDate = System.Today();
      testController.foundArticlesTemp.add(wrapper);
      
      wrapper = new ArticleWrapper();
      wrapper.articleId = 'Test5';
      wrapper.articleTitle = 'Article Title15';
      wrapper.articleSummary = 'Summary5';
      wrapper.articleType = 'Defect';
      wrapper.articleURL = 'http://salesforce.com';
      wrapper.articlePublishDate = System.Today();
      testController.foundArticlesTemp.add(wrapper);
      
      testController.calculatePaginationVariables();
      testController.goToNextPage();
      testController.goToPreviousPage();
      test.stopTest();
    }
    
    static testmethod void testPortalArticleSorting() {
      KnowledgeArticleVersion article = [SELECT Id FROM KnowledgeArticleVersion WHERE PublishStatus = 'Online' AND Language = 'en_US' LIMIT 1];

      ApexPages.StandardController stdController = new ApexPages.StandardController(article);

      test.startTest();
      //Test the custom article functionality
      PortalArticleExtension testController = new PortalArticleExtension(stdController);
      testController.init();
      
      ArticleWrapper wrapper = new ArticleWrapper();
      wrapper.articleId = 'Test1';
      wrapper.articleTitle = 'Article Title1';
      wrapper.articleSummary = 'Summary1';
      wrapper.articleType = 'Defect';
      wrapper.articleURL = 'http://salesforce.com';
      wrapper.articlePublishDate = System.Today();
      testController.foundArticlesTemp.add(wrapper);
      
      wrapper = new ArticleWrapper();
      wrapper.articleId = 'Test2';
      wrapper.articleTitle = 'Article Title12';
      wrapper.articleSummary = 'Summary2';
      wrapper.articleType = 'Defect';
      wrapper.articleURL = 'http://salesforce.com';
      wrapper.articlePublishDate = System.Today();
      testController.foundArticlesTemp.add(wrapper);
      
      testController.getSortDir();
      
      PortalArticleExtension.sortResultList(testController.foundArticlesTemp, 'Article Title', 'asc');
      PortalArticleExtension.sortResultList(testController.foundArticlesTemp, 'Article Title', 'desc');
      PortalArticleExtension.sortResultList(testController.foundArticlesTemp, 'Type', 'asc');
      PortalArticleExtension.sortResultList(testController.foundArticlesTemp, 'Published Date', 'asc');

      test.stopTest();
    }
}