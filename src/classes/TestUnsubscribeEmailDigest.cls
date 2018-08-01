@isTest
private class TestUnsubscribeEmailDigest {
     
    static testMethod void Dotest(){
    	
        IdeaTestUtil.setupTest();
        
        User testUser = IdeaTestUtil.getUser2();
        
        Account a = new Account();
        a.Name = 'Test Account';
        a.Client__c = true;
        insert a;
	    
	    Contact c = new Contact();
        c.AccountId = a.Id;
        c.LastName = 'Test cont';
        c.MailingStreet = 'street';
        c.MailingCity = 'city';
        c.MailingState = 'state';
        c.MailingPostalCode = '12345';
        c.MailingCountry = 'us';
        insert c;
        
        System.currentPageReference().getParameters().put('ContactId', c.Id);
	        
    	UnsubscribeEmailDigest cls = new UnsubscribeEmailDigest();
    	
    	try{
    		PageReference pr = cls.DoLoad();
    	}
    	catch(Exception ex){
    		system.debug(ex.getMessage());
    	}
        
    }
     
}