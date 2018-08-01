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
private class TestOpportunities {

    static testMethod void myUnitTest() {
      Account acc = new Account();
      acc.Name = 'WO test parent';
      //acc.RecordTypeId = rt.Id;
      insert acc;
      
      Contact cnt = new Contact();
      cnt.lastname = 'Manager';
      cnt.accountid = acc.id;
      insert cnt;
      
      Opportunity opp = new Opportunity();
      opp.name = 'Test Opp';
      opp.AccountId = acc.id;
      opp.contact__c = cnt.id;
      opp.CloseDate = system.Today();
      opp.Sales_Order_Number__c = '12345';
      opp.Purchase_Order_Date__c = system.Today();
      opp.stagename = 'Booked';
      opp.Booked_Value__c = 100.00;
      opp.Booked_Date__c = system.today();
      insert opp;
      
      OpportunityContactRole OppCntRol = new OpportunityContactRole();
      OppCntRol.Contactid = cnt.id;
      OppCntRol.role = 'Coach';
      OppCntRol.OpportunityId = opp.id;
      insert OppCntRol; 
      
      Id pb = Test.GetStandardPriceBookId();
      
      
      
      product2 p2 = new product2();
      p2.isactive = true;
      p2.name = 'test product';
      insert p2; 
      
      pricebookentry pbe = new pricebookentry();
      pbe.isactive = true;
      pbe.product2id = p2.id;
      pbe.pricebook2id = pb;
      pbe.unitprice = 54.00;
      insert pbe; 
      
      OpportunityLineItem oppl = new OpportunityLineItem();
      //oppl.Product2.Id = [select id from product2 where name = 'test product'].id;
      oppl.OpportunityID = opp.id;
      oppl.PricebookEntryId = pbe.id;
      oppl.quantity = 2;
      oppl.UnitPrice = 150.00;
      
      oppl.Description = 'Test Opp Line ITem';
      oppl.Maintenance_Amount__c = 75.00;
      oppl.Converted_to_Asset__c = false;
      insert oppl;  
      
      oppl.Modified_Quantity__c = -3;
      upsert oppl;
      
      ApexPages.StandardController sc = new ApexPages.StandardController(opp);
      System.currentPageReference().getParameters().put('id', opp.Id);
        
      CloneOpp clonTicketObj = new CloneOpp(sc);
      Pagereference result = clonTicketObj.doClone();
      
      opp.Quote_Number__c = 'QUO-334455';
      opp.RecordTypeId = [select id from recordtype where name = 'Tritech Competitive'].id;
      upsert opp;
          
      opp.RecordTypeId = [select id from recordtype where name = 'Zuercher Competitive'].id;
      upsert opp;
          
      Pagereference result1 = clonTicketObj.CopyQuote();
      
      opp.RecordTypeId = [select id from recordtype where name = 'Zuercher Change Order'].id;
      upsert opp;
          
      Pagereference result2 = clonTicketObj.CopyQuote();
    }
}