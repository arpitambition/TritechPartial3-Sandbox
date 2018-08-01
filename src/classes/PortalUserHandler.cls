public with sharing class PortalUserHandler {
  
  @future
  public static void setPortalUserSetEnabledStatus(Set<Id> portalUserIds, boolean activationStatus) {
    system.debug('setPortalUserSetEnabledStatus: Setting portalUserIds ['+portalUserIds+'] activation status to: ['+activationStatus+']');
    List<User> users = [SELECT Id, IsActive FROM User WHERE Id in :portalUserIds];
    
    for (User usr : users) {
      system.debug('setPortalUserSetEnabledStatus: Setting user ['+usr.Id+'] activation status to ['+usr.IsActive+']');
      usr.IsActive = activationStatus;
      //usr.IsPortalEnabled = activationStatus;
    }
    
    update users;
  }

  public static void setPortalUserEnabledStatus(List<User> portalUsers, boolean activationStatus) {
    
    for (User usr : portalUsers) {
      usr.IsActive = activationStatus;
      //usr.IsPortalEnabled = activationStatus;
    }
    
    update portalUsers;
  }
  
  private static void updatePortalUser(User usr, boolean activationStatus) {
    usr.IsActive = activationStatus;
    //usr.IsPortalEnabled = activationStatus;
    
    update usr;
  }
  
  static testmethod void testUserActivation() {
    test.startTest();
    
    Account acct = new Account();
    acct.Name = 'Test Account';
    
    insert acct;
    
    //deactiate the account to set off the trigger
    acct.Client__c = false;
    
    update acct;
    
    List<Contact> contacts = [SELECT Id FROM Contact WHERE AccountId = :acct.Id];
    
    Set<Id> contactKeySet = new Set<Id>();
    for (Contact cnct : contacts) {
      contactKeySet.add(cnct.Id);
    }
    
    List<User> users = [SELECT Id FROM User WHERE Id IN :contactKeySet AND IsPortalEnabled = true];
    
    //ensure all users are deactivated
    System.assertEquals(users.size(), 0);
    
    setPortalUserEnabledStatus(users, true);
    
    Set<Id> userIdSet = new Set<Id>();
    for (User u : users) {
      userIdSet.add(u.Id);
    }
    
    setPortalUserSetEnabledStatus(userIdSet, true);
    
    //activate the account to set off the trigger
    acct.Client__c = true;
    
    update acct;
    
    //get the list of users - all should now be enabled
    users = [SELECT Id FROM User WHERE Id IN :contactKeySet AND IsPortalEnabled = true];
    
    Integer userCount = [SELECT count() FROM User WHERE Id IN :contactKeySet];
    
    //ensure all users are activated - the number of activated users should equal the total number of users
    System.assertEquals(users.size(), userCount);

    test.stopTest();
  }
  
  
  /*static testmethod void testUserActivation2() {
        Profile portalProfile = [ select Id from Profile where Name = 'TriTech Portal Manager' Limit 1];
        List<Profile> profileList = [Select Id From Profile Where Name = 'System Administrator'];
        List<UserRole> uRoleList = [Select Id From UserRole Where Name = 'TriTech Sales Manager' limit 1];
        String str = System.now().getTime().intValue().format();
        str = str.replaceAll(',', '');
        User u1 = new User();
        u1.Email = 'portalTestUser' + str + '@test.com';
        u1.Alias = 'prts';
        u1.TimeZoneSidKey = 'America/New_York';
        u1.LocaleSidKey = 'ca';
        u1.EmailEncodingKey = 'UTF-8';
        u1.ProfileId = profileList[0].Id;
        u1.LanguageLocaleKey = 'en_US';
        u1.FirstName = 'testFN';
        u1.LastName = 'testLN';
        u1.username= 'portalTestUser' + str + '@test.com';
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
            u2.Email = 'portalTestUserSample' + str + '@test.com';
            u2.Alias = 'prts';
            u2.TimeZoneSidKey = 'America/New_York';
            u2.LocaleSidKey = 'ca';
            u2.EmailEncodingKey = 'UTF-8';
            u2.ProfileId = portalProfile.Id;
            u2.LanguageLocaleKey = 'en_US';
            u2.FirstName = 'testFN';
            u2.LastName = 'testLN';
            u2.username= 'portalTestUserSample' + str + '@test.com';
            u2.ContactId = c.Id;
            u2.CompanyName = 'Test Company';
            insert u2;
            
            Set<Id> portalUserIds = new Set<Id>();
            portalUserIds.add(u2.Id);
            List<User> portalUsers = new List<User>();
            portalUsers.add(u2);
            PortalUserHandler.setPortalUserSetEnabledStatus(portalUserIds, false);
            PortalUserHandler.setPortalUserEnabledStatus(portalUsers, false);
            PortalUserHandler.updatePortalUser(u2, false);
        }
  }*/
}