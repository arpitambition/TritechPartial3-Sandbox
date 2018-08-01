@isTest
private class IdeaVoteControllerTest {

    static Idea setupAndCreateIdeaWithOtherUser() {
        IdeaTestUtil.setupTest();
        User testUser = IdeaTestUtil.getUser2();
        String communityId = IdeaTestUtil.getCommunityId();
        String ideaId = IdeaTestUtil.makeIdea(testUser, communityId, 'IdeaVoteControllerTest', '', '', 0).id;
        return [select id, voteTotal, createdBy.Name, createdBy.communityNickname, createdBy.id, createdDate from idea where id = :ideaId];
    }

    static testMethod void testGetVoteTotal() {
        Idea idea = setupAndCreateIdeaWithOtherUser();
        IdeaVoteController controller = new IdeaVoteController(idea);
        System.assertEquals(10, controller.getVoteTotal());
    }

    static testMethod void testGetUserHasNotVoted() {
        Idea idea = setupAndCreateIdeaWithOtherUser();
        IdeaVoteController controller = new IdeaVoteController(idea);
        controller.currentUserVoteType = 'None';
        System.assert(controller.getUserHasNotVoted());
        controller.currentUserVoteType = 'Up';
        System.assert(!controller.getUserHasNotVoted());
    }

    static testMethod void testCreateVote() {
    	PageReference pageRef = Page.ideaList;
        Test.setCurrentPage(pageRef);
        Idea idea = setupAndCreateIdeaWithOtherUser();
        IdeaVoteController controller = new IdeaVoteController(idea);
        System.assert(!controller.getNewVote());

        Integer originalVoteTotal = controller.getVoteTotal();

        System.assert(controller.createVote() == null); // fail because newVoteType not specified
        System.assertEquals(originalVoteTotal, controller.getVoteTotal());

        controller.newVoteType = 'Up';
        System.assertEquals('Up', controller.currentUserVoteType);
        
    }
    
    static testMethod void IdeaVoteControllerTest1() {
        IdeaTestUtil.setupTest();
        User testUser = IdeaTestUtil.getCurrentUser();
        Idea newIdea = IdeaTestUtil.makeIdea(testUser, IdeaTestUtil.getCommunityId(), 'ideatitle', 'IdeaBody', 'Inform', 'Public', 0);
        IdeaVoteController ivc = new IdeaVoteController();
        ivc.setconIdea(newIdea);
        ivc.getconIdea();
        ivc.getIsVotedUp();
        ivc.getIsVotedDown();
    }
    
    static testMethod void IdeaVoteControllerTest2() {
        IdeaTestUtil.setupTest();
        User testUser = IdeaTestUtil.getCurrentUser();
        User testUser1 = IdeaTestUtil.makeUser();
        Idea newIdea = IdeaTestUtil.makeIdea(testUser, IdeaTestUtil.getCommunityId(), 'ideatitle', 'IdeaBody', 'Inform', 'Public', 0);
        IdeaVoteController ivc = new IdeaVoteController();
        ivc.setconIdea(newIdea);
        system.runAs(testUser1) {
        	ivc.createVote();
        	List<Vote> votes = [Select Id, parentId From Vote Where ParentId =: newIdea.Id];
        	IdeaWithVote.getIdeasWithVotes(votes);
        }
    }
	
	static testMethod void IdeaWithVote1() {
        IdeaTestUtil.setupTest();
        User testUser = IdeaTestUtil.getCurrentUser();
        Idea newIdea = IdeaTestUtil.makeIdea(testUser, IdeaTestUtil.getCommunityId(), 'ideatitle', 'IdeaBody', 'Inform', 'Public', 0);
        IdeaWithVote iwv = new IdeaWithVote(newIdea, new Vote(), true);
        iwv.getHowUserVoted();
        
	}
	
}