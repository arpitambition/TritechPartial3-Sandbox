@isTest	
private class TestCLDY_GISHoursCalculation {


    static testMethod void myUnitTest1() { 
    	
        Product2 p = new Product2();
        p.Name = 'Test Product';
        p.Family = 'Findit';
        p.IsActive = true;
        p.Supportable__c = true;
        p.ProductCode = 'TestCode';
        insert p;
        
        Account a = new Account();
        a.Name = 'Test Account';
        a.Mailing_Billing_Street_WMP__c = 'street';
        a.Mailing_Billing_City_WMP__c = 'city';
        a.Mailing_Billing_State_WMP__c = 'state';
        a.Mailing_Billing_Zip_Postal_Code_WMP__c = '12345';
        a.Mailing_Billing_Country_WMP__c = 'us';
        
        a.Shipping_Street_WMP__c = null;
        a.Shipping_City_WMP__c = null;
        a.Shipping_State_WMP__c = null;
        a.Shipping_Zip_Postal_Code__c = null;
        a.Shipping_Country_WMP__c = null;
        
        insert a;
        
        Contact c = new Contact();
        c.AccountId = a.Id;
        c.LastName = 'Test cont';
        insert c;
        
        Test.startTest();
        try{
	        ServiceContract sc = new ServiceContract();
	        sc.Name ='Test ServiceContract';
	    	sc.Z_Contracted_GIS_Maintenance_Hours__c = 100;
	    	sc.StartDate = Date.today();
	    	sc.EndDate = Date.today() + 2;   	
	    	sc.Contact = c;
	    	insert sc;
	        
	        //TO DO: implement unit test
	        Case cse = new Case();
	        cse.ProductId = p.Id;
	        cse.Short_Issue_Summary_WMP__c = 'Error when creating new product';
	        cse.Priority = 'P2';
	        cse.Subject = 'Issue with new product';
	        cse.Occured_After_Upgrade_WMP__c = true;
	        cse.Reported_Major_Version_WMP__c = '5.9';
	        cse.Status = 'Open';
	        cse.RecordTypeId = Schema.SObjectType.Case.getRecordTypeInfosByName().get('Zuercher Customer Support Ticket').getRecordTypeId();
	        cse.Service_Contract_WMP__c = sc.Id;
	        cse.Customer_Contact_Date_Time_WMP__c = System.now();
	        
	        insert cse;        
	       	
	       	
	       	cse.Z_GIS_Maintenance_Hours__c = 10;
	       	cse.Status = 'Answered' ;
	       	upsert cse;
	       	
	       	sc.Z_Contracted_GIS_Maintenance_Hours__c = 200;
	       	update sc;
        }catch(Exception e){
        	
        }
       	Test.stopTest();
    }

}