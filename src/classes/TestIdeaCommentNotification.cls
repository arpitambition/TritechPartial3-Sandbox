@isTest
private class TestIdeaCommentNotification {
     
    static testMethod void Dotest(){
    	
        IdeaTestUtil.setupTest();
        
        User testUser = IdeaTestUtil.getUser2();
        
    	Idea testGetPageNameIdea = IdeaTestUtil.makeIdea(testUser, IdeaTestUtil.getCommunityId(), 'Test Idea', 'IdeaBody', '', 0);
        
        IdeaComment ic = IdeaTestUtil.makeIdeaComment(testGetPageNameIdea.Id, 'commentBody', testUser, 0);
        
    }
     
}