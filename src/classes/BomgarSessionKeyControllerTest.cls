@IsTest
public class BomgarSessionKeyControllerTest {

    static testMethod void generateSessionKeyTest() {
        Test.startTest();
        
        PageReference bomgarSessionKeyPage = Page.BomgarSessionKey;
        Test.setCurrentPage(bomgarSessionKeyPage);
        ApexPages.currentPage().getParameters().put('record_id','246642');
        
        BomgarSessionKeyController bgsController = new BomgarSessionKeyController();
        bgsController.generateSessionKey();
        
        System.assertNotEquals(null, bgsController.sessionKey);
        System.assertNotEquals(null, bgsController.sessionKeyUrl);
        
        Test.stopTest();
    }
    
    static testMethod void emailSessionKeyTest() {
        Test.startTest();

        // test with bad data
        PageReference bomgarSessionKeyPage = Page.BomgarSessionKey;
        Test.setCurrentPage(bomgarSessionKeyPage);
        ApexPages.currentPage().getParameters().put('record_id','2352353413542');
        BomgarSessionKeyController bgsController = new BomgarSessionKeyController();
        bgsController.generateSessionKey();
        bgsController.emailSessionKey();
        
		// create test data        
        Contact testContact = new Contact();
        testContact.FirstName = 'Jim';
        testContact.LastName = 'Bob';
        testContact.Email = 'jimbob@job.bob.job.bob.com';
        insert testContact;
        Contact currentContact = [Select id from Contact where Email = 'jimbob@job.bob.job.bob.com'];
        Case testCase = new Case();
        testCase.Status = 'New';
        testCase.Origin = 'Phone';
        testCase.Subject = 'testmeandtestmeandtestme';
        testCase.ContactId = currentContact.Id;
        insert testCase;
        Case currentCase = [Select Id from Case where Subject = 'testmeandtestmeandtestme'];
        
		// test with good data
        ApexPages.currentPage().getParameters().put('record_id',currentCase.Id);
        bgsController.generateSessionKey();
        bgsController.emailSessionKey();
        
        System.assertNotEquals(null, bgsController.sessionKey);
        System.assertNotEquals(null, bgsController.sessionKeyUrl);
        
        Test.stopTest();
    }
}