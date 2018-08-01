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
private class TestCWICancellation {

    static testMethod void myUnitTest() {
        
    Account acc = new Account();
      acc.Name = 'WO test';
      //acc.RecordTypeId = rt.Id;
      insert acc;
      
   contact cont = new contact();
   cont.lastname = 'Brown';
   insert cont;
   
   Opportunity opp = new Opportunity();
        opp.name = 'Opp Test';
        opp.AccountID = acc.id;
        opp.CloseDate = System.Today();
        opp.StageName = 'Opportunity Identified';
        opp.Contact__c = cont.id;
        insert opp;
    
    Write_In__c WI = new Write_In__c();
        WI.Opportunity__c = opp.id;        
        WI.CWI_Status__c = 'Draft';
        WI.Product_Line__c = 'Inform';
        WI.TriTech_Product_Version__c = '10';
        insert WI;
    
    opp.StageName = 'Closed Lost';
    opp.CloseDate = System.Today();
    opp.Reason_TriTech_Lost__c = 'Price';
    upsert opp;  
    
    opp.StageName = 'Booked';
    opp.CloseDate = System.Today();
    opp.booked_value__c = 100.00;
    upsert opp;    
    }
}