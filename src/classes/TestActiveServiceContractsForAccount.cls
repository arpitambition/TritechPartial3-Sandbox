@isTest (seeAllData=true)
private class TestActiveServiceContractsForAccount {      
    static testMethod void TestUpdateServiceContracts() 
    {
	        // TO DO: implement unit test
	    for(ServiceContract svcContract : [Select Id, AccountId,Contract_Type__c From ServiceContract 
		Where (Contract_Status_WMP__c = 'Active' OR Contract_Status_WMP__c = 'Installed Not Live' 
	    OR Contract_Status_WMP__c = 'Renewal Due' 
	    OR Contract_Status_WMP__c = 'No HW Support, Software Only') Limit 1])
	    {
	       svcContract.BillingCity ='Dallas';
	       
	       update svcContract;
	        
	    }
    }        
    
    static testMethod void TestDeleteServiceContracts() 
    {
	        // TO DO: implement unit test
	    for(ServiceContract svcContract : [Select Id, AccountId,Contract_Type__c From ServiceContract 
		Where (Contract_Status_WMP__c = 'Active' OR Contract_Status_WMP__c = 'Installed Not Live' 
	    OR Contract_Status_WMP__c = 'Renewal Due' 
	    OR Contract_Status_WMP__c = 'No HW Support, Software Only') AND id='810n00000004DHc' limit 1])
	    {
	        
	       delete svcContract;
	       
	    }
    }    
    static testMethod void TestInsertServiceContracts() 
    {
	    Account a = new Account();
        a.Name = 'Test Account';
        a.Mailing_Billing_Street_WMP__c = 'street';
        a.Mailing_Billing_City_WMP__c = 'city';
        a.Mailing_Billing_State_WMP__c = 'state';
        a.Mailing_Billing_Zip_Postal_Code_WMP__c = '12345';
        a.Mailing_Billing_Country_WMP__c = 'us';
        insert a;
        
        Contact c = new Contact();
        c.AccountId = a.Id;
        c.LastName = 'Test cont';
        insert c;
        
	    ServiceContract svcContract = new ServiceContract();
	    svcContract.Name = 'Test';
		svcContract.AccountId= a.Id;
		svcContract.Contract_Type__c='IMC';
		svcContract.Contract_Status_WMP__c='Active';
		svcContract.Account_Support_Team_WMP__c='IMC';
		svcContract.StartDate =System.now().date();
		svcContract.EndDate = System.now().date() +1;
		svcContract.ActivationDate =System.now().date()+20;
		svcContract.Type_of_Support_WMP__c='24/7';
		svcContract.Support_Owner__c= UserInfo.getuserId();
		svcContract.Product_Family_WMP__c='IMC';
		 
		insert svcContract;    
		 
    }
}