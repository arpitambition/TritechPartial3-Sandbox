@isTest
private class IdeaUserLinkControllerTest {
	

    static testMethod void testSetGetConCommunityNickname() {
        IdeaTestUtil.setupTest();
        IdeaUserLinkController controller = new IdeaUserLinkController();
        
        //test setConCommunityNickname and getConCommunityNickname    
        String communityNickName = IdeaTestUtil.createRandomString(40);
        controller.setConCommunityNickname(communityNickName);
        System.assertEquals(communityNickName, controller.getConCommunityNickname(), 'getConCommunityNickname should return what has been set');                    
    }

    static testMethod void testGetConCommunityNicknameWithUserId() {
        IdeaTestUtil.setupTest();
        IdeaUserLinkController controller = new IdeaUserLinkController();
        User testUser = IdeaTestUtil.getCurrentUser();
	
		controller.userId =  testUser.id;
		System.assertEquals(testUser.name, controller.getConCommunityNickname(), 'if communityNickname is null, return user communityNickname'); 
    }
    
    static testMethod void testSimple() {
		IdeaTestUtil.setupTest();
        IdeaUserLinkController controller = new IdeaUserLinkController();
        User testUser = IdeaTestUtil.getCurrentUser();
		controller.userId =  testUser.id;
		controller.setConAccountName('newContName');
		controller.getConAccountName();
		controller.getUserPage();
		System.assert(controller.getUserStyleClass()!= null);
    }
}