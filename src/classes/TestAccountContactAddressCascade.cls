// ==================================================================================
//   Object: TestAccountContactAddressCascade
//  Company: Tritech
//   Author: Mohan Kumar
// Comments: Testing of CopyMailingAddressToShipping and CopyMailingAddressToContactAddress triggers
// ==================================================================================
//  Changes: 2013-03-04 Initial version.
// ==================================================================================

@isTest
private class TestAccountContactAddressCascade {

    static testMethod void myUnitTest() {
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
    }
}