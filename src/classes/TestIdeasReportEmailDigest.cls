@isTest
private class TestIdeasReportEmailDigest {
     
    static testMethod void Dotest(){
    	
        IdeaTestUtil.setupTest();
        
        User testUser = IdeaTestUtil.getUser2();
         
    	try{
    		string str = IdeasReportEmailDigest.getInformEmailBody('');
    	}
    	catch(Exception ex){
    		system.debug(ex.getMessage());
    	}
    	
    	try{
    		string str = IdeasReportEmailDigest.getRespondEmailBody('');
    	}
    	catch(Exception ex){
    		system.debug(ex.getMessage());
    	}
    	
    	try{
    		string str = IdeasReportEmailDigest.getPerformEmailBody('');
    	}
    	catch(Exception ex){
    		system.debug(ex.getMessage());
    	}
        
    }
     
}