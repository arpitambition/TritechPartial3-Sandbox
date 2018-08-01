/**
 * This class contains unit tests for validating the behavior of Apex classes
 * and triggers.
 *
 * Unit tests are class methods that verify whether a particular piece
 * of code is working properly. Unit test methods take no arguments,
 * commit no data to the database, and are flagged with the testMethod
 * keyword in the method definition.
 *
 * All test methods in an organization are executed whenever Apex code is deployed
 * to a production organization to confirm correctness, ensure code
 * coverage, and prevent regressions. All Apex classes are
 * required to have at least 75% code coverage in order to be deployed
 * to a production organization. In addition, all triggers must have some code coverage.
 * 
 * The @isTest class annotation indicates this class only contains test
 * methods. Classes defined with the @isTest annotation do not count against
 * the organization size limit for all Apex scripts.
 *
 * See the Apex Language Reference for more information about Testing and Code Coverage.
 */
@isTest(SeeAllData=false)
private class APTS_AssociatePriceBookTest {

    static testMethod void WOAssignment() {
        Account acc=new Account();
        acc.Name='Test Account';
        acc.Product_Family_WMP__c = 'Inform';
        acc.Master_Account_Type__c = 'Agency';
        acc.Phone = 'xxx-xxx-xxxx';
        acc.Mailing_Billing_City_WMP__c = 'Test City';
        acc.Mailing_Billing_Country_WMP__c = 'USA';
        acc.Mailing_Billing_State_WMP__c = 'CA';
        acc.Mailing_Billing_Zip_Postal_Code_WMP__c = 'xxxxxx';
        acc.Mailing_Billing_Street_WMP__c = 'Test Street';
        insert acc;
        
        contact cont = new contact();
   		cont.lastname = 'Brown';
   		insert cont;
        
        /*Create a Price Book;
        Product2 prod = new Product2();
        prod.name = 'Test Prod';
        insert prod;
        
        Pricebook2 pbook = new Pricebook2();
        pbook.Name = 'Test Pricebook';
        insert pbook;
        
        PricebookEntry pbe = new PricebookEntry(Pricebook2Id=pbook.ID,Product2Id=prod.ID, UnitPrice=0.00, IsActive=TRUE, UseStandardPrice=FALSE);
        //insert pbe;
        */
        Opportunity oppty=new Opportunity();
        oppty.Name = 'Test Opportunity1';
        oppty.Account=acc;
        oppty.Amount = 1000.00;
        oppty.Product_Family_WMP__c = 'Inform';
        oppty.LeadSource = 'Website';
        oppty.CloseDate = Date.today();
        oppty.StageName = 'Evaluation';
        oppty.Contact__c = cont.id;
        oppty.Products_Required__c = '911';
        insert oppty;
    }
}