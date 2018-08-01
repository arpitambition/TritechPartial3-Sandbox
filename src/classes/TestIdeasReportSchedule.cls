//author: Mohan (Navivo)
//created date: 24-09-2013
@isTest(seealldata=true)
private class TestIdeasReportSchedule {

    static testMethod void myUnitTest1() {
        // TO DO: implement unit test
        Community cmmt = [Select Id From Community limit 1];
        Idea idea1 = new Idea();
        idea1.Title = 'test idea1';
        idea1.Body = 'adfdkj';
        idea1.CommunityId = cmmt.Id;
        idea1.Categories = 'Inform';
        idea1.Status = 'Public';
        insert idea1;
        
        IdeaComment ic = new IdeaComment();
        ic.CommentBody = 'dkafjd';
        ic.IdeaId = idea1.Id;
        insert ic;
        
        
        Idea idea2 = new Idea();
        idea2.Title = 'test idea1';
        idea2.Body = 'adfdkj';
        idea2.CommunityId = cmmt.Id;
        idea2.Categories = 'Inform';
        idea2.Status = 'Public';
        Idea2.CreatedDate = Date.today().addDays(-7);
        idea2.LastModifiedDate = Date.today();
        insert idea2;
        
        IdeaComment ic2 = new IdeaComment();
        ic2.CommentBody = 'dkafjd';
        ic2.IdeaId = idea1.Id;
        insert ic2;
        
        Test.StartTest();
		IdeasReportSchedule schedule = new IdeasReportSchedule();
		SchedulableContext context; 
        schedule.execute(context);
		Test.StopTest();
    }
}