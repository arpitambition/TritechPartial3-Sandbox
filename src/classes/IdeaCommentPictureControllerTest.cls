@isTest
private class IdeaCommentPictureControllerTest {

    static testMethod void myUnitTest() {
        IdeaTestUtil.setupTest();
        IdeaCommentPictureController cp = new IdeaCommentPictureController();
        cp.setuserId(userInfo.getUserId());
        cp.getuserId();
    }
}