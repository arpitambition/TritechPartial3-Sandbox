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
@isTest
private class TestPotentialDefect {

    static testMethod void myUnitTest() {
       //Create Account
        Account acc = new Account();
        acc.Name = 'test';
        //acc.RecordTypeId = rt.Id;
        insert acc;
        
        //Create Service Contract
        ServiceContract sc = new ServiceContract();
        sc.AccountId = acc.Id;
        sc.Name = 'Scott SC Test';
        sc.Contract_Type__c = 'Visinet';
        sc.Product_GRoup1__c = 'Inform CAD-Mobile';
        sc.Product_Family_WMP__c = 'VisiNet';
        sc.Contract_Status_WMP__c = 'Active';
        insert sc;
        
        //Create Case
        Case c = new Case();
        c.AccountId = acc.Id;
        c.Service_Contract_WMP__c = sc.id; 
        c.Status = 'New';
        c.DefectStatus__c = 'Test';
        
        insert c;
        
        //Create Potential Defect
        Potential_Defect__c pd = new Potential_Defect__c();
        pd.RecordType = [select name from recordtype where name = 'Potential Defect'];
        pd.Name = 'Test';
        pd.Ticket_Status__c = 'Rejected';
        insert pd;
        
        pd.Ticket_Status__c = 'Future Consideration';
        upsert pd;
        
        c.Potential_Defect__c = pd.id;
        upsert c;
    }
}