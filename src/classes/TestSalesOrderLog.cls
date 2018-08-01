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
private class TestSalesOrderLog {

    static testMethod void SalesOrderTest() {
    Account testAccount = new Account();
    testAccount.Name='Visinet Test Account';
    insert testAccount; 
    
    Contact cont = new Contact();
    cont.FirstName='Jen';
    cont.LastName='Vansant';
    cont.Accountid=testAccount.id;
    insert cont;
    
    Product2 prd = new product2();
    prd.name = 'Test Product';
    prd.Shopping_Cart_Hierarchy__c = 'Software Base';
    insert prd;
    
    Id pricebookid = Test.getStandardPricebookId();
    
    Pricebookentry standardprice = new PriceBookEntry(
    Pricebook2Id = pricebookId, Product2Id = prd.Id,
            UnitPrice = 10000, IsActive = true
    );
    insert standardprice;
    
    Pricebook2 customPB = new Pricebook2(Name='Custom Pricebook', isActive=true);
    insert customPB; 
    
    PricebookEntry customPrice = new PricebookEntry(
            Pricebook2Id = customPB.Id, Product2Id = prd.Id,
            UnitPrice = 12000, IsActive = true);
        insert customPrice;  
            
    opportunity opp = new opportunity(name='Visinet Test',
    Account=testAccount,
    Contact__c=cont.id,
    Products_Required__c='RMS',
    CloseDate=System.today(),
    Quote_Number__c='QUO-12345-abcd',
    RecordTypeID=[select id from recordtype where name = 'Tritech Non-Competitive'].id,
    Description='Executive Summary',
    StageName='Booked',
    Booked_Value__c = 1000.00,
    RMS_Type__c = 'UCR');
    insert opp;  
    
    List<OpportunityContactRole> listOppContactRole = new List<OpportunityContactRole>();
    OpportunityContactRole ocr = new OpportunityContactRole();
    ocr.ContactId = cont.Id;
    ocr.OpportunityId = opp.Id;
    ocr.IsPrimary = TRUE;
    ocr.Role = 'Decision Maker';
    
    listOppContactRole.add(ocr);
    //insert ocr;
    OpportunityContactRole ocr1 = new OpportunityContactRole();
    ocr1.ContactId = cont.Id;
    ocr1.OpportunityId = opp.Id;
    ocr1.IsPrimary = FALSE;
    ocr1.Role = 'Decision Maker';
    
    listOppContactRole.add(ocr1);
    
    insert listOppContactRole;
    
    Sales_Order__c sol = new Sales_Order__c();
    sol.quote_number__c = opp.quote_number__C;
    sol.related_opportunity__c = opp.id;
    insert sol;
    
    Opportunitylineitem oli = new  Opportunitylineitem();
    oli.Product2 = prd;
    oli.Functional_Area__c = 'CAD';
    oli.Type__c = 'Software';
    oli.OpportunityID = opp.id;
    oli.Charge_Type__c = 'Perpetual License';
    oli.quantity = 5;
    oli.unitprice = 5.00;
    oli.Extended_list__c = 30.00;
    oli.PricebookEntryId = customPrice.id;
    insert oli;
    upsert opp;
    upsert sol;
    
    Opportunitylineitem oli1 = new  Opportunitylineitem();
    //oli1.Product2.Name = 'Test product';
    oli1.Functional_Area__c = 'RMS';
    oli1.Type__c = 'Software';
    oli1.Charge_Type__c = 'Perpetual License';
    oli1.quantity = 5;
    oli1.unitprice = 5.00;
    oli1.Extended_list__c = 30.00;
    oli1.OpportunityID = opp.id;
    oli1.PricebookEntryId = customPrice.id;
    //oli1.Product2.Shopping_Cart_Hierarchy__c = 'Software Base';
    //oli.PricebookEntryId = customPrice.id;
    insert oli1;
    upsert opp;
    upsert sol;
    
    Opportunitylineitem oli2 = new  Opportunitylineitem();
    //oli2.Product2.Name = 'Test product';
    oli2.Functional_Area__c = 'FBR';
    oli2.Type__c = 'Software';
    oli2.Charge_Type__c = 'Perpetual License';
    oli2.OpportunityID = opp.id;
    oli2.quantity = 5;
    oli2.unitprice = 5.00;
    oli2.Extended_list__c = 30.00;
    oli2.PricebookEntryId = customPrice.id;
    insert oli2;
    upsert opp;
    upsert sol;
    
    Opportunitylineitem oli3 = new  Opportunitylineitem();
    //oli3.Product2.Name = 'Test product';
    oli3.Functional_Area__c = 'Fire';
    oli3.Type__c = 'Software';
    oli3.Charge_Type__c = 'Perpetual License';
    oli3.OpportunityID = opp.id;
    oli3.quantity = 5;
    oli3.unitprice = 5.00;
    oli3.Extended_list__c = 30.00;
    oli3.PricebookEntryId = customPrice.id;
    insert oli3;
    upsert opp;
    upsert sol;
    
    Opportunitylineitem oli4 = new  Opportunitylineitem();
    //oli4.Product2.Name = 'Test product';
    oli4.Functional_Area__c = 'Jail';
    oli4.Type__c = 'Software';
    oli4.Charge_Type__c = 'Perpetual License';
    oli4.OpportunityID = opp.id;
    oli4.quantity = 5;
    oli4.unitprice = 5.00;
    oli4.Extended_list__c = 30.00;
    oli4.PricebookEntryId = customPrice.id;
    insert oli4;
    upsert opp;
    upsert sol;
    
    Opportunitylineitem oli5 = new  Opportunitylineitem();
    //oli5.Product2.Name = 'Test product';
    oli5.Functional_Area__c = 'Mobile';
    oli5.Type__c = 'Software';
    oli5.Charge_Type__c = 'Perpetual License';
    oli5.quantity = 5;
    oli5.unitprice = 5.00;
    oli5.OpportunityID = opp.id;
    oli5.Extended_list__c = 30.00;
    oli5.PricebookEntryId = customPrice.id;
    insert oli5;
    upsert opp;
    upsert sol;
    
    Opportunitylineitem oli6 = new  Opportunitylineitem();
    //oli6.Product2.Name = 'Test product';
    oli6.Functional_Area__c = '911';
    oli6.Type__c = 'Software';
    oli6.Charge_Type__c = 'Perpetual License';
    oli6.OpportunityID = opp.id;
    oli6.quantity = 5;
    oli6.unitprice = 5.00;
    oli6.Extended_list__c = 30.00;
    oli6.PricebookEntryId = customPrice.id;
    insert oli6;
    upsert opp;
    upsert sol;
    
    Test.startTest();
    
    Opportunitylineitem oli7 = new  Opportunitylineitem();
    //oli7.Product2.Name = 'Test product';
    oli7.Functional_Area__c = 'RMS';
    oli7.Type__c = 'Software';
    oli7.Charge_Type__c = 'Annual Subscription';
    oli7.OpportunityID = opp.id;
    oli7.quantity = 5;
    oli7.unitprice = 5.00;
    oli7.Extended_list__c = 30.00;
    oli7.PricebookEntryId = customPrice.id;
    insert oli7;
    upsert opp;   
    upsert sol;
    
    Opportunitylineitem oli8 = new  Opportunitylineitem();
    //oli8.Product2.Name = 'Test product';
    oli8.Functional_Area__c = 'IQ';
    oli8.Charge_Type__c = 'Software Subscription';
    oli8.OpportunityID = opp.id;
    oli8.quantity = 5;
    oli8.unitprice = 5.00;
    oli8.Extended_list__c = 30.00;
    oli8.PricebookEntryId = customPrice.id;
    insert oli8;
    upsert opp;  
    upsert sol;
    
    Opportunitylineitem oli9 = new  Opportunitylineitem();
    //oli9.Product2.Name = 'Test product';
    oli9.Functional_Area__c = 'CAD';
    oli9.Type__c = 'Software';
    oli9.Charge_Type__c = 'Perpetual License';
    //oli9.Product2.Shopping_Cart_Hierarchy__c = 'Software Interfaces';
    oli9.OpportunityID = opp.id;
    oli9.quantity = 5;
    oli9.unitprice = 5.00;
    oli9.Extended_list__c = 30.00;
    oli9.PricebookEntryId = customPrice.id;
    insert oli9;
    upsert opp;  
    upsert sol; 
    
    Opportunitylineitem oli10 = new  Opportunitylineitem();
    //oli10.Product2.Name = 'Test product';
    oli10.Functional_Area__c = 'CAD';
    oli10.Type__c = 'Software';
    oli10.Charge_Type__c = 'Perpetual License';
    //oli10.Product2.Shopping_Cart_Hierarchy__c = 'Software Interfaces';
    oli10.OpportunityID = opp.id;
    oli10.quantity = 5;
    oli10.unitprice = 5.00;
    oli10.Extended_list__c = 30.00;
    oli10.PricebookEntryId = customPrice.id;
    insert oli10;
    upsert opp; 
    upsert sol;  
    
    Opportunitylineitem oli12 = new  Opportunitylineitem();
    //oli12.Product2.Name = 'Test product';
    oli12.Functional_Area__c = 'RMS';
    oli12.Type__c = 'Software';
    oli12.Charge_Type__c = 'Perpetual License';
    //oli12.Product2.Shopping_Cart_Hierarchy__c = 'Software Interfaces';
    oli12.OpportunityID = opp.id;
    oli12.quantity = 5;
    oli12.unitprice = 5.00;
    oli12.Extended_list__c = 30.00;
    oli12.PricebookEntryId = customPrice.id;
    insert oli12;
    upsert opp;   
    upsert sol;
    
    Opportunitylineitem oli11 = new  Opportunitylineitem();
    //oli11.Product2.Item_Sub_Type__c = 'Installation';
    oli11.Functional_Area__c = 'RMS';
    oli11.Type__c = 'Services';
    oli11.OpportunityID = opp.id;
    oli11.quantity = 5;
    oli11.unitprice = 5.00;
    oli11.Extended_list__c = 30.00;
    oli11.PricebookEntryId = customPrice.id;
    insert oli11;
    upsert opp;   
    upsert sol;
    
    Opportunitylineitem oli13 = new  Opportunitylineitem();
    //oli13.Product2.Item_Sub_Type__c = 'Custom Integrated Solution';
    oli13.Functional_Area__c = 'RMS';
    oli13.Type__c = 'Services';
    oli13.quantity = 5;
    oli13.OpportunityID = opp.id;
    oli13.unitprice = 5.00;
    oli13.Extended_list__c = 30.00;
    oli13.PricebookEntryId = customPrice.id;
    insert oli13;
    upsert opp;
    upsert sol;   
    
    Opportunitylineitem oli14 = new  Opportunitylineitem();
    //oli14.Product2.Item_Sub_Type__c = 'Training';
    oli14.Functional_Area__c = 'RMS';
    oli14.Type__c = 'Services';
    oli14.quantity = 5;
    oli14.unitprice = 5.00;
    oli14.OpportunityID = opp.id;
    oli14.Extended_list__c = 30.00;
    oli14.PricebookEntryId = customPrice.id;
    insert oli14;
    upsert opp; 
    upsert sol; 
    
    Opportunitylineitem oli15 = new  Opportunitylineitem();
    //oli15.Product2.Item_Sub_Type__c = 'Training';
    oli15.Functional_Area__c = '3rd Party';
    oli15.Type__c = 'Hardware';
    oli15.quantity = 5;
    oli15.OpportunityID = opp.id;
    oli15.unitprice = 5.00;
    oli15.Extended_list__c = 30.00;
    oli15.PricebookEntryId = customPrice.id;
    insert oli15;
    upsert opp; 
    upsert sol; 
    
    Opportunitylineitem oli16 = new  Opportunitylineitem();
    //.Product2.Item_Sub_Type__c = 'Training';
    oli16.Functional_Area__c = '3rd Party';
    oli16.Type__c = 'Software';
    oli16.OpportunityID = opp.id;
    oli16.quantity = 5;
    oli16.unitprice = 5.00;
    oli16.Extended_list__c = 30.00;
    oli16.PricebookEntryId = customPrice.id;
    insert oli16;
    upsert opp; 
    upsert sol; 
    
    Opportunitylineitem oli17 = new  Opportunitylineitem();
    //oli17.Product2.Item_Sub_Type__c = 'Training';
    oli17.Functional_Area__c = 'Data Vault';
    oli17.Type__c = 'Software';
    oli17.OpportunityID = opp.id;
    oli17.quantity = 5;
    oli17.unitprice = 5.00;
    oli17.Extended_list__c = 30.00;
    oli17.PricebookEntryId = customPrice.id;
    insert oli17;
    upsert opp;  
    upsert sol;
    
    Opportunitylineitem oli18 = new  Opportunitylineitem();
    oli18.Description = 'Systems Integration Fee';
    oli18.quantity = 5;
    oli18.unitprice = 5.00;
    oli18.Extended_list__c = 30.00;
    oli18.OpportunityID = opp.id;
    oli18.T_E_Fee__c = 20.00;
    oli18.Maintenance_Amount__c = 15.00;
    oli18.PricebookEntryId = customPrice.id;
    insert oli18;
    upsert opp;  
    upsert sol;
    
    Opportunitylineitem oli19 = new  Opportunitylineitem();
    //oli19.Product2.Name = 'Shipping';
    oli19.quantity = 5;
    oli19.unitprice = 5.00;
    oli19.Extended_list__c = 30.00;
    oli19.OpportunityID = opp.id;
    oli19.PricebookEntryId = customPrice.id;
    insert oli19;
    upsert opp;
    
    Opportunitylineitem oli20 = new  Opportunitylineitem();
    //oli20.Product2.Name = 'Escrow';
    oli20.quantity = 5;
    oli20.unitprice = 5.00;
    oli20.OpportunityID = opp.id;
    oli20.Extended_list__c = 30.00;
    oli20.PricebookEntryId = customPrice.id;
    insert oli20;
    upsert opp;
    upsert sol;
    
    Opportunitylineitem oli21 = new  Opportunitylineitem();
    //oli21.Product2.Name = 'Performance Bond';
    oli21.quantity = 5;
    oli21.unitprice = 5.00;
    oli21.OpportunityID = opp.id;
    oli21.Extended_list__c = 30.00;
    oli21.PricebookEntryId = customPrice.id;
    insert oli21;
    upsert opp; 
    upsert sol;  
    
    Opportunitylineitem oli31 = new  Opportunitylineitem();
    //oli31.Product2.Name = 'Performance Bond';
    oli31.quantity = 5;
    oli31.unitprice = 5.00;
    oli31.OpportunityID = opp.id;
    oli31.Extended_list__c = 30.00;
    oli31.PricebookEntryId = customPrice.id;
    insert oli31;
    upsert opp;   
    upsert sol;
    
    Opportunitylineitem oli22 = new  Opportunitylineitem();
    //oli22.Product2.Name = 'Test product';
    //oli22.Product2.Item_Sub_Type__c = 'Annual Subscription';
    oli22.Type__c = 'Software Subscriptions';
    oli22.Functional_Area__c = 'IQ';
    oli22.Charge_Type__c = 'Software Subscription';
    oli22.quantity = 5;
    oli22.OpportunityID = opp.id;
    oli22.unitprice = 5.00;
    oli22.Extended_list__c = 30.00;
    oli22.PricebookEntryId = customPrice.id;
    insert oli22;
    upsert opp;
    upsert sol;
    
    Opportunitylineitem oli23 = new  Opportunitylineitem();
    //oli23.Product2.Name = 'Test product';
    //oli23.Product2.Item_Sub_Type__c = 'Implementation';
    oli23.Type__c = 'Services';
    oli23.Functional_Area__c = 'IQ';
    oli23.Charge_Type__c = 'Software Subscription';
    oli23.quantity = 5;
    oli23.OpportunityID = opp.id;
    oli23.unitprice = 5.00;
    oli23.Extended_list__c = 30.00;
    oli23.PricebookEntryId = customPrice.id;
    insert oli23;
    upsert opp;  
    upsert sol; 
    
    Opportunitylineitem oli24 = new  Opportunitylineitem();
    //oli24.Product2.Name = 'Test product';
    //oli24.Product2.Item_Sub_Type__c = 'Training';
    oli24.Type__c = 'Services';
    oli24.Functional_Area__c = 'IQ';
    oli24.Charge_Type__c = 'Software Subscription';
    oli24.OpportunityID = opp.id;
    oli24.quantity = 5;
    oli24.unitprice = 5.00;
    oli24.Extended_list__c = 30.00;
    oli24.PricebookEntryId = customPrice.id;
    insert oli24;
    upsert opp;   
    upsert sol;
    
    Opportunitylineitem oli25 = new  Opportunitylineitem();
    //oli25.Product2.Name = 'Inform Mobile Base Position';
    oli25.Type__c = 'Services';
    oli25.Functional_Area__c = 'IQ';
    oli25.Charge_Type__c = 'Software Subscription';
    oli25.OpportunityID = opp.id;
    oli25.quantity = 5;
    oli25.unitprice = 5.00;
    oli25.Extended_list__c = 30.00;
    oli25.PricebookEntryId = customPrice.id;
    insert oli25;
    upsert opp;   
    upsert sol;
    
    Opportunitylineitem oli26 = new  Opportunitylineitem();
    //oli26.Product2.Name = 'Inform CAD Mapping';
    oli26.Type__c = 'Services';
    oli26.Functional_Area__c = 'IQ';
    oli26.Charge_Type__c = 'Software Subscription';
    oli26.OpportunityID = opp.id;
    oli26.quantity = 5;
    oli26.unitprice = 5.00;
    oli26.Extended_list__c = 30.00;
    oli26.PricebookEntryId = customPrice.id;
    insert oli26;
    upsert opp; 
    upsert sol;  
    
    Opportunitylineitem oli27 = new  Opportunitylineitem();
    //oli27.Product2.Name = 'Inform Mobile Mapping Upgrade v5.6 / 5.7';
    oli27.Type__c = 'Software';
    oli27.Functional_Area__c = 'IQ';
    oli27.Charge_Type__c = 'Software Subscription';
    oli27.OpportunityID = opp.id;
    oli27.quantity = 5;
    oli27.unitprice = 5.00;
    oli27.Extended_list__c = 30.00;
    oli27.PricebookEntryId = customPrice.id;
    insert oli27;
    upsert opp;  
    upsert sol; 
    
    Opportunitylineitem oli28 = new  Opportunitylineitem();
    //oli28.Product2.Name = 'IQ Analytics 5 Concurrent User Bundle One Year Subscription';
    oli28.Type__c = 'Software';
    oli28.Functional_Area__c = 'IQ';
    oli28.Charge_Type__c = 'Software Subscription';
    oli28.OpportunityID = opp.id;
    oli28.quantity = 5;
    oli28.unitprice = 5.00;
    oli28.Extended_list__c = 30.00;
    oli28.PricebookEntryId = customPrice.id;
    insert oli28;
    upsert opp;   
    upsert sol;
    
    Test.stopTest();
    }
}