// ==================================================================================
//   Object: TestContactViewController
//  Company: Tritech
//   Author: Mohan Kumar (Sales Optimizer)
// Comments: Testing of ContactViewController class.
// ==================================================================================
//  Changes: 2012-12-01 Initial version.
// ==================================================================================

@isTest
private class TestContactViewController {

    static testMethod void contactViewController_Test1() {
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
        
        ContactViewController cv = new ContactViewController(new Apexpages.Standardcontroller(c));
        cv.autoRun();
        cv.cloneContact();
    }
}