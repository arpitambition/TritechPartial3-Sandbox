/*********************************************************************************
* Test Class: {TestAvailableDownloadsController}
* Created by {Madan Vishwakarma}, Navivo, {DateCreated 09/17/2014}
----------------------------------------------------------------------------------
* Purpose/Methods:
* - {Increasing Code coverage of AvailableDownloadsController.cls}
----------------------------------------------------------------------------------
* Utility Test Data: {}
----------------------------------------------------------------------------------
* History:
* - VERSION DEVELOPER NAME DATE DETAIL FEATURES
1.0 Madan 09/17/2014 INITIAL DEVELOPMENT
2.0 Name MM/DD/YYYY UDAC WIRE FRAME CHANGES*/

@isTest
private class TestAvailableDownloadsController {

    static testMethod void myUnitTest() {
        
        
        ContentVersion cv = new contentVersion();
        cv.VersionData = Blob.valueOf('test');
        cv.Title = 'testMV';
        cv.Description = 'test';
        //cv.FirstPublishLocationId = [Select Id From ContentWorkspace c where (Name = 'Perform' OR Name = 'EMS' OR Name = 'Zuercher')].Id;
        cv.PathOnClient = '/test.txt';
        insert cv;
        
        //ContentWorkspace contWorkspace = new ContentWorkspace();
        //insert contWorkspace;
        
        AvailableDownloadsController avlDownloadObj = new AvailableDownloadsController();
        List<AvailableDownloadsController.AvailableDownload> lstAvlDownload = avlDownloadObj.getAvailableDownloads();
        
        AvailableDownloadsController.AvailableDownload avlDown = new AvailableDownloadsController.AvailableDownload();
        
        avlDown.description = 'test';
    }/*
    static testMethod void myUnitTest1() {
        Test.startTest();
        Profile portalProfile = [ select Id from Profile where Name = 'TriTech Portal Manager' Limit 1];
        
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
        String str = System.now().getTime().intValue().format();
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
        u2.PortalRole = 'Test Account Customer Manager';
        u2.username= 'testBatchIdeasReport' + str + '@test.com';
        u2.ContactId = c.Id;
        u2.CompanyName = 'Test Company';
        insert u2;
        
        
        
        ContentVersion cv = new contentVersion();
        cv.VersionData = Blob.valueOf('test');
        cv.Title = 'testMV';
        cv.Description = 'test';
        cv.FirstPublishLocationId = [Select Id From ContentWorkspace c where (Name = 'Perform' OR Name = 'EMS')].Id;
        cv.PathOnClient = '/test.txt';
        insert cv;
        
        System.runAs(u2) {
            List<ServiceContract> scList = new List<ServiceContract>();
            ServiceContract sc1 = new ServiceContract(Name = 'SC1',Contract_Type__c = 'EMS', Contract_Status_WMP__c = 'Active', AccountId = a.Id);
            scList.add(sc1);
            ServiceContract sc2 = new ServiceContract(Name = 'SC2',Product_Family_WMP__c = 'VisiNet',Contract_Status_WMP__c = 'Active', AccountId = a.Id);
            scList.add(sc2);
            ServiceContract sc3 = new ServiceContract(Name = 'SC3',Product_Family_WMP__c = 'IMC',Contract_Status_WMP__c = 'Active', AccountId = a.Id);
            scList.add(sc3);
            insert scList;
            AvailableDownloadsController avlDownloadObj = new AvailableDownloadsController();
            List<AvailableDownloadsController.AvailableDownload> lstAvlDownload = avlDownloadObj.getAvailableDownloads();
            
            AvailableDownloadsController.AvailableDownload avlDown = new AvailableDownloadsController.AvailableDownload();
            PortalUserUtil.ProductFamilies p = new PortalUserUtil.ProductFamilies();
            p.productFamilyIMC = true;
            avlDown.description = 'test';
        }Test.stopTest();
    }
    static testMethod void myUnitTest2() {
        Test.startTest();
        Profile portalProfile = [ select Id from Profile where Name = 'TriTech Portal Manager' Limit 1];
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
        String str = System.now().getTime().intValue().format();
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
        u2.PortalRole = 'Test Account Customer Manager';
        u2.CompanyName = 'Test Company';
        insert u2;
        System.runAs(u2) {
            List<ServiceContract> scList = new List<ServiceContract>();
            ServiceContract sc1 = new ServiceContract(Name = 'SC1',Contract_Type__c = 'EMS',Product_Family_WMP__c = 'EMS', Contract_Status_WMP__c = 'Active', AccountId = a.Id);
            scList.add(sc1);
            ServiceContract sc2 = new ServiceContract(Name = 'SC2',Product_Family_WMP__c = 'VisiNet',Contract_Status_WMP__c = 'Active', AccountId = a.Id);
            scList.add(sc2);
            ServiceContract sc3 = new ServiceContract(Name = 'SC3',Product_Family_WMP__c = 'IMC',Contract_Status_WMP__c = 'Active', AccountId = a.Id);
            scList.add(sc3);
            insert scList;
            AvailableDownloadsController avlDownloadObj = new AvailableDownloadsController();
            List<AvailableDownloadsController.AvailableDownload> lstAvlDownload = avlDownloadObj.getAvailableDownloads();
            
            AvailableDownloadsController.AvailableDownload avlDown = new AvailableDownloadsController.AvailableDownload();
            PortalUserUtil.ProductFamilies p = new PortalUserUtil.ProductFamilies();
            p.productFamilyEMS = true;
            avlDown.description = 'test';
        }Test.stopTest();
    }*/
        
}