@isTest
private class IdeaControllerTest {

    static testMethod void testSortParamDefaultsToPopular() {
        IdeaTestUtil.setupTest();
        TestIdeaController controller = new TestIdeaController();
        //System.assertEquals(IdeaController.SORT_POPULAR, controller.sortParam);    
    }
}