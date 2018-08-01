@istest
private class TestTritechHome {
    
    public static testmethod void getEncryptedString(){
        try{
            
            Portal_Notices__c pn = new Portal_Notices__c();
            
            pn.Body__c = 'test';
            
            insert pn;
            
            TritechHome cls = new TritechHome();
            
            
            List<SelectOption> lst = cls.getTicketViews();
            cls.newTicket();
            cls.DoLoad();
        }
        catch(Exception ex){
            system.debug(ex.getMessage());
        }
    }
    
    static testMethod void myUnitTest1() {
        // TO DO: implement unit test
        
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
        u1.CompanyName = 'test.com';
        insert u1;
        
        System.runAs(u1) {
            Account a = new Account();
            a.Name = 'Test Account';
            a.Client__c = true;
            insert a;
            
            Document doc = new Document();
            doc.Name = 'docu1';
            doc.FolderId = [Select f.Name, f.Id, f.DeveloperName From Folder f Where DeveloperName = 'TriTech_Protal_User_Photos'].Id;
            doc.Body = Blob.valueOf('kdaj');
            insert doc;
            
            Contact c = new Contact();
            c.AccountId = a.Id;
            c.LastName = 'Test cont';
            c.MailingStreet = 'street';
            c.MailingCity = 'city';
            c.MailingState = 'state';
            c.MailingPostalCode = '12345';
            c.MailingCountry = 'us';
            c.PictId__c = doc.Id;
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
            System.RunAs(u2){
                TritechHome cls = new TritechHome();
            }
        }
    }
     
}