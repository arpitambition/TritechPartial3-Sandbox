@isTest
private class IdeaListControllerTest {
    
    static testMethod void testGetPageName() {
    	User testUser = IdeaTestUtil.getCurrentUser();
    	IdeaTestUtil.setupTest();
    	IdeaTestUtil.makeIdea(testUser, IdeaTestUtil.getCommunityId(), 'ideatitle', 'IdeaBody', 'Inform', 'Public', 0);
        System.assertEquals(IdeaController.PAGE_LIST, (new IdeaListController()).getPageName());            	
    }

    
    static testMethod void testGetHasPreviousPage() {
    	User testUser = IdeaTestUtil.getCurrentUser();
    	IdeaTestUtil.setupTest();
    	IdeaTestUtil.makeIdea(testUser, IdeaTestUtil.getCommunityId(), 'ideatitle', 'IdeaBody', 'Inform', 'Public', 0);
        ApexPages.currentPage().getParameters().put(IdeaController.PARAM_PAGE, '-1');
        System.assertEquals(false, (new IdeaListController()).getHasPreviousPage());
        ApexPages.currentPage().getParameters().put(IdeaController.PARAM_PAGE, '0');
        System.assertEquals(false, (new IdeaListController()).getHasPreviousPage());
        ApexPages.currentPage().getParameters().put(IdeaController.PARAM_PAGE, '1');
        System.assertEquals(false, (new IdeaListController()).getHasPreviousPage());
        ApexPages.currentPage().getParameters().put(IdeaController.PARAM_PAGE, '2');
        System.assertEquals(true, (new IdeaListController()).getHasPreviousPage());
    }
    
    static testMethod void unitTest1() {
    	User testUser = IdeaTestUtil.getCurrentUser();
    	IdeaTestUtil.setupTest();
    	IdeaTestUtil.makeIdea(testUser, IdeaTestUtil.getCommunityId(), 'ideatitle', 'IdeaBody', 'Inform', 'Public', 0);
    	IdeaTestUtil.makeIdea(testUser, IdeaTestUtil.getCommunityId(), 'ideatitle', 'IdeaBody', 'Inform', 'Public', 0);
    	IdeaTestUtil.makeIdea(testUser, IdeaTestUtil.getCommunityId(), 'ideatitle', 'IdeaBody', 'Inform', 'Public', 0);
    	IdeaTestUtil.makeIdea(testUser, IdeaTestUtil.getCommunityId(), 'ideatitle', 'IdeaBody', 'Inform', 'Public', 0);
    	IdeaTestUtil.makeIdea(testUser, IdeaTestUtil.getCommunityId(), 'ideatitle', 'IdeaBody', 'Inform', 'Public', 0);
    	IdeaTestUtil.makeIdea(testUser, IdeaTestUtil.getCommunityId(), 'ideatitle', 'IdeaBody', 'Inform', 'Public', 0);
    	//IdeaTestUtil.makeIdea(testUser, IdeaTestUtil.getCommunityId(), 'ideatitle', 'IdeaBody', 'Inform', 'Public', 0);
    	//IdeaTestUtil.makeIdea(testUser, IdeaTestUtil.getCommunityId(), 'ideatitle', 'IdeaBody', 'Inform', 'Public', 0);
    	//IdeaTestUtil.makeIdea(testUser, IdeaTestUtil.getCommunityId(), 'ideatitle', 'IdeaBody', 'Inform', 'Public', 0);
    	//IdeaTestUtil.makeIdea(testUser, IdeaTestUtil.getCommunityId(), 'ideatitle', 'IdeaBody', 'Inform', 'Public', 0);
    	//IdeaTestUtil.makeIdea(testUser, IdeaTestUtil.getCommunityId(), 'ideatitle', 'IdeaBody', 'Inform', 'Public', 0);
    	/*String ideaId = IdeaTestUtil.makeIdea(testUser, IdeaTestUtil.getCommunityId(), 'ideatitle', 'IdeaBody', 'Inform', 'Public', 0).id;
        Idea newIdea = [select id, createdBy.Name, createdBy.communityNickname, createdBy.id, createdDate, categories, voteTotal from idea where id = :ideaId];
        List<Idea> ideaList = new List<Idea>();
        ideaList.add(newIdea);
        
        PageReference pageRef = Page.ideaList;
        Test.setCurrentPage(pageRef);
        ApexPages.StandardsetController sc = new ApexPages.StandardsetController(ideaList);*/
        IdeaListController ilc = new IdeaListController();
        ilc.MAX_NUMBER_OF_IDEAS_PER_PAGE = 4;
        Decimal ttlPages = Decimal.valueOf(ilc.ideasWithVotes.size()).divide(4, 2, System.RoundingMode.UP);
        System.debug('ttlPages: '+ttlPages);
        ilc.totalPages = ttlPages.round(System.RoundingMode.UP);
        ilc.gotoNextPage();
        ilc.gotoPreviousPage();
        
        Apexpages.currentPage().getParameters().put('rstart', '0');
        IdeaListController ilc1 = new IdeaListController();
        ilc1.createNewPost();
        
        /*
        Apexpages.Ideastandardsetcontroller con = new Apexpages.Ideastandardsetcontroller();
        
		IdeaListController ilc = new IdeaListController(new Apexpages.Ideastandardsetcontroller(ideaList));
		*/
    }
}