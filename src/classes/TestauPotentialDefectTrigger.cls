//author: Mohan (Navivo)
//Date: 10-10-2013
@isTest(seeAllData=true)
private class TestauPotentialDefectTrigger {

    static testMethod void myUnitTest1() {
        Id pdRecordTypeId = [Select r.SobjectType, r.Name, r.Id From RecordType r Where Name = 'Potential Defect' and SobjectType = 'Potential_Defect__c'].Id;
        
        Product2 prod = new Product2();
        prod.Name = 'test prod';
        prod.IsActive = true;
        prod.Supportable__c = true;
        insert prod;
        
        Potential_Defect__c pd = new Potential_Defect__c();
        pd.Name = 'test';
        pd.RecordTypeId = pdRecordTypeId;
        pd.Priority__c = '3';
        insert pd;
        
        Potential_Defect__c pd1 = new Potential_Defect__c();
        pd1.Name = 'test';
        pd1.RecordTypeId = pdRecordTypeId;
        pd1.Priority__c = '3';
        insert pd1;
        
        RecordType rType = [Select r.SobjectType, r.Name, r.Id From RecordType r Where r.SobjectType='Case' and r.Name = 'Customer Support Ticket' limit 1];
        Case cse = new Case();
        cse.ProductId = prod.Id;
        cse.Short_Issue_Summary_WMP__c = 'Error when creating new product';
        cse.Priority = 'P2';
        cse.Subject = 'Issue with new product';
        cse.Occured_After_Upgrade_WMP__c = true;
        cse.Reported_Major_Version_WMP__c = '5.9';
        cse.Status = 'Closed';
        cse.RecordTypeId = rType.Id;
        cse.Customer_Contact_Date_Time_WMP__c = System.now();
        cse.Potential_Defect__c = pd.Id;
        insert cse;
        
        cse.Potential_Defect__c = null;
        update cse;
        
        cse.Potential_Defect__c = pd1.Id;
        update cse;
    }
    
    static testMethod void myUnitTest2() {
        Id pdRecordTypeId = [Select r.SobjectType, r.Name, r.Id From RecordType r Where Name = 'Potential Defect' and SobjectType = 'Potential_Defect__c'].Id;
        
        Product2 prod = new Product2();
        prod.Name = 'test prod';
        prod.IsActive = true;
        prod.Supportable__c = true;
        insert prod;
        
        Potential_Defect__c pd = new Potential_Defect__c();
        pd.Name = 'test';
        pd.RecordTypeId = pdRecordTypeId;
        pd.Priority__c = '3';
        insert pd;
        
        RecordType rType = [Select r.SobjectType, r.Name, r.Id From RecordType r Where r.SobjectType='Case' and r.Name = 'Customer Support Ticket' limit 1];
        Case cse = new Case();
        cse.ProductId = prod.Id;
        cse.Short_Issue_Summary_WMP__c = 'Error when creating new product';
        cse.Priority = 'P2';
        cse.Subject = 'Issue with new product';
        cse.Occured_After_Upgrade_WMP__c = true;
        cse.Reported_Major_Version_WMP__c = '5.9';
        cse.Status = 'Closed';
        cse.RecordTypeId = rType.Id;
        cse.Customer_Contact_Date_Time_WMP__c = System.now();
        cse.Potential_Defect__c = pd.Id;
        insert cse;
        
        pd.Ticket_Status__c = 'Fix for Release in Progress';
        update pd;
    }
    
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
            
            Id pdRecordTypeId = [Select r.SobjectType, r.Name, r.Id From RecordType r Where Name = 'Potential Defect' and SobjectType = 'Potential_Defect__c'].Id;
            
            Product2 prod = new Product2();
            prod.Name = 'test prod';
            prod.IsActive = true;
            prod.Supportable__c = true;
            insert prod;
            
            Potential_Defect__c pd = new Potential_Defect__c();
            pd.Name = 'test';
            pd.RecordTypeId = pdRecordTypeId;
            pd.Priority__c = '3';
            insert pd;
            
            Potential_Defect__c pd1 = new Potential_Defect__c();
            pd1.Name = 'test';
            pd1.RecordTypeId = pdRecordTypeId;
            pd1.Priority__c = '3';
            insert pd1;
            
            RecordType rType = [Select r.SobjectType, r.Name, r.Id From RecordType r Where r.SobjectType='Case' and r.Name = 'Customer Support Ticket' limit 1];
            Case cse = new Case();
            cse.ProductId = prod.Id;
            cse.Short_Issue_Summary_WMP__c = 'Error when creating new product';
            cse.Priority = 'P2';
            cse.Subject = 'Issue with new product';
            cse.Occured_After_Upgrade_WMP__c = true;
            cse.Reported_Major_Version_WMP__c = '5.9';
            cse.Status = 'Closed';
            cse.RecordTypeId = rType.Id;
            cse.Customer_Contact_Date_Time_WMP__c = System.now();
            cse.Potential_Defect__c = pd.Id;
            cse.ownerId = u2.Id;
            insert cse;
            
            
            
            System.runAs(u2) {
                try {
                    cse.Potential_Defect__c = null;
                    update cse;
                } catch(Exception ex) {}
                
            }
        }
    }
}