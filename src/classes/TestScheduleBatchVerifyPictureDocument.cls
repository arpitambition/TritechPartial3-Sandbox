/*********************************************************************************
* Test Class: {TestScheduleBatchVerifyPictureDocument}
* Created by {Madan Vishwakarma}, Navivo, {DateCreated 03/31/2014}
----------------------------------------------------------------------------------
* Purpose/Methods:
* - {ScheduleBatchVerifyPictureDocument/BatchVerifyPictureDocument Unit Tested by this Test Class.}
----------------------------------------------------------------------------------
* Utility Test Data: {}
----------------------------------------------------------------------------------
* History:
* - VERSION DEVELOPER NAME DATE DETAIL FEATURES
1.0 Madan Vishwakarma 03/31/2014 INITIAL DEVELOPMENT
2.0 Name MM/DD/YYYY UDAC WIRE FRAME CHANGES
*********************************************************************************/

@isTest
private class TestScheduleBatchVerifyPictureDocument {

    static testMethod void myUnitTest() {
    	Account a = new Account();
    	a.Name = 'test';
    	a.Product_Family_WMP__c = 'EMS';
    	a.Master_Account_Type__c = 'Agency';
    	a.Phone = '1234567890';
    	a.Mailing_Billing_Street_WMP__c = 'test';
    	a.Mailing_Billing_City_WMP__c = 'test';
    	a.Mailing_Billing_State_WMP__c = 'test';
    	a.Mailing_Billing_Zip_Postal_Code_WMP__c = '123456';
    	a.Mailing_Billing_Country_WMP__c = 'USA';
    	insert a;
    	
    	Folder f = [Select f.Id From Folder f Where DeveloperName = 'TriTech_Protal_User_Photos' Limit 1];

    	Document d = new Document();
    	d.ContentType = 'testContent';
    	d.Name = 'test';
    	d.Type = 'testPicture';
    	d.FolderId = f.Id;
    	insert d;
    	
    	Contact c = new Contact();
    	c.LastName = 'test';
    	c.PictId__c = d.Id;
    	c.AccountId = a.Id;
    	insert c;
    	
    	BatchVerifyPictureDocument batchObj = new BatchVerifyPictureDocument();
		Test.StartTest();
		database.executebatch(batchObj, 10);
		
		ScheduleBatchVerifyPictureDocument schedule = new ScheduleBatchVerifyPictureDocument();
		SchedulableContext context; 
        schedule.execute(context);
		Test.StopTest();
    }
}