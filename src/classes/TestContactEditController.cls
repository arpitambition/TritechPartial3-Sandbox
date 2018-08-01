// ==================================================================================
//   Object: TestContactEditController
//  Company: Tritech
//   Author: Mohan Kumar (Sales Optimizer)
// Comments: Test of ContactEditController class
// ==================================================================================
//  Changes: 2012-12-05 Initial version.
// ==================================================================================

@isTest
private class TestContactEditController {

    static testMethod void myUnitTest1() {
        // TO DO: implement unit test
        Account a = new Account();
        a.Name = 'Test Account';
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
    	
    	ContactEditController ce = new ContactEditController(new Apexpages.Standardcontroller(c));
    	ce.autoRun();
    	ce.doSave();
    	ce.saveAndNew();
    }
    
    static testMethod void myUnitTest2() {
        // TO DO: implement unit test
        Account a = new Account();
        a.Name = 'Test Account';
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
    	
    	Contact newCont = new Contact();
    	Apexpages.currentPage().getParameters().put('clone', '1');
    	Apexpages.currentPage().getParameters().put('id', c.Id);
    	ContactEditController ce = new ContactEditController(new Apexpages.Standardcontroller(newCont));
    	ce.autoRun();
    	ce.doSave();
    	ce.saveAndNew();
    }
}