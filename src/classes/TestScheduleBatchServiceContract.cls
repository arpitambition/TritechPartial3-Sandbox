@isTest
private class TestScheduleBatchServiceContract {
     
    static testMethod void Dotest(){
        
        Test.startTest();
         
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
            u2.Email = 'testBatchIdeasReport' + str + '@test.com';
            u2.Alias = 'prts';
            u2.TimeZoneSidKey = 'America/New_York';
            u2.LocaleSidKey = 'ca';
            u2.EmailEncodingKey = 'UTF-8';
            u2.ProfileId = portalProfile.Id;
            u2.LanguageLocaleKey = 'en_US';
            u2.FirstName = 'testFN';
            u2.LastName = 'testLN';
            u2.username= 'testBatchIdeasReport' + str + '@test.com';
            u2.ContactId = c.Id;
            u2.CompanyName = 'Test Company';
            insert u2;
            
            List<ServiceContract> scList = new List<ServiceContract>();
            ServiceContract sc1 = new ServiceContract(Name = 'SC1',Contract_Type__c = 'EMS', Contract_Status_WMP__c = 'Active', AccountId = a.Id, EndDate = system.today().addDays(-1), StartDate = system.today().addDays(-1));
            scList.add(sc1);
            ServiceContract sc2 = new ServiceContract(Name = 'SC2',Product_Family_WMP__c = 'VisiNet',Contract_Status_WMP__c = 'Active', AccountId = a.Id, EndDate = system.today().addDays(-1), StartDate = system.today().addDays(-1));
            scList.add(sc2);
            ServiceContract sc3 = new ServiceContract(Name = 'SC3',Product_Family_WMP__c = 'IMC',Contract_Status_WMP__c = 'Active', AccountId = a.Id, EndDate = system.today().addDays(-1), StartDate = system.today().addDays(-1));
            scList.add(sc3);
            
            insert scList;
              
            try{
                ScheduleBatchServiceContract cls = new ScheduleBatchServiceContract();
        
                SchedulableContext context;
                
                cls.execute(context);
            }
            catch(Exception ex){
                system.debug(ex.getMessage());
            }
        }
        Test.stopTest();
    }
    /************************************************************************************
    /Covering HelloWord.cls class code
    /**************************************************************************************/
    //static testMethod void testHelloWord(){
    //  HelloWorld hWord = new HelloWorld();
    //}
}