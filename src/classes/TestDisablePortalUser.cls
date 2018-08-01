/**
 * This class contains unit tests for validating the behavior of Apex classes
 * and triggers.
 */
@isTest
private class TestDisablePortalUser {
   static user testUser;
    static testMethod void myUnitTest() {
       
        // TO DO: implement unit test
        Account acc = new Account(Name='test account',Client__c=true);
        insert acc;
        
        Contact con = new Contact(AccountId=acc.Id,Email='test@test.com',FirstName='first name', LastName='test last');
        insert con;
        
        Test.startTest();
        createTestUser();
        List<Profile> listProfiles = [select Id from Profile where Name = 'TriTech Portal Standard User'];
        for(Profile profile : listProfiles) {
            system.debug('***** Profile : ' + profile);
        }
        /*User u = new User();
        u.LastName = 'TestPortal';
        u.Alias = 'TstP';
        u.Email = 'poertaluser@testorg.com';
        u.ProfileId = listProfiles.get(0).Id;
        u.contactId = con.Id;
        u.EmailEncodingKey = 'UTF-8';
        u.LanguageLocaleKey = 'en_US';
        u.LocaleSidKey = 'en_US'; 
        u.TimeZoneSidKey = 'America/Los_Angeles';
        u.Username = 'puser1@test.com'; 
        insert u;*/
        system.runAs(testUser){
        
          con.Inactive_Contact__c = true;
           update con;
        }
        Test.stopTest();
    }
    
    static void createTestUser(){
      List<Profile> listProfiles = [select Id from Profile where Name = 'System Administrator'];
        
      testUser = new User();
      testUser.LastName = 'TestStatndard';
      testUser.Alias = 'TstS';
      testUser.Email = 'standarduser@testorg1.com';
      testUser.ProfileId = listProfiles.get(0).Id;
      testUser.EmailEncodingKey = 'UTF-8';
      testUser.LanguageLocaleKey = 'en_US';
      testUser.LocaleSidKey = 'en_US'; 
      testUser.TimeZoneSidKey = 'America/Los_Angeles';
      testUser.Username = 'testUsr1' + system.now().format('yyyyMMddhhmmss') + '@test1.com';
      testUser.CompanyName = 'Test Company';
        
      insert testUser;
    }
    
    static testMethod void unitTest1() {
        Profile portalProfile = [ select Id from Profile where Name = 'TriTech Portal Manager' Limit 1];
        List<Profile> profileList = [Select Id From Profile Where Name = 'System Administrator'];
        List<UserRole> uRoleList = [Select Id From UserRole Where Name = 'TriTech Sales Manager' limit 1];
        String str = System.now().getTime().intValue().format();
        str = str.replaceAll(',', '');
        User u1 = new User();
        u1.Email = 'portalTestUser' + str + '@test1.com';
        u1.Alias = 'prts';
        u1.TimeZoneSidKey = 'America/New_York';
        u1.LocaleSidKey = 'ca';
        u1.EmailEncodingKey = 'UTF-8';
        u1.ProfileId = profileList[0].Id;
        u1.LanguageLocaleKey = 'en_US';
        u1.FirstName = 'testFN';
        u1.LastName = 'testLN';
        u1.username= 'portalTestUser' + str + '@test1.com';
        u1.UserRoleId = uRoleList[0].Id;
        u1.CompanyName = 'Test Company';
        insert u1;
        
        System.runAs(u1) {
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
            str = System.now().getTime().intValue().format();
            str = str.replaceAll(',', '');
            User u2 = new User();
            u2.Email = 'portalTestUserSample' + str + '@test1.com';
            u2.Alias = 'prts';
            u2.TimeZoneSidKey = 'America/New_York';
            u2.LocaleSidKey = 'ca';
            u2.EmailEncodingKey = 'UTF-8';
            u2.ProfileId = portalProfile.Id;
            u2.LanguageLocaleKey = 'en_US';
            u2.FirstName = 'testFN';
            u2.LastName = 'testLN';
            u2.username= 'portalTestUserSample' + str + '@test1.com';
            u2.ContactId = c.Id;
            u2.CompanyName = 'Test Company';
            insert u2;
            
            Set<Id> usersTobeDisabled = new Set<Id>();
            usersTobeDisabled.add(u2.Id);
            DisablePortaUserHelper.disablePortalUsers(usersTobeDisabled);
        }
    }
}