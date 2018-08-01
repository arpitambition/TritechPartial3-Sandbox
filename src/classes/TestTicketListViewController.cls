// ==================================================================================
//   Object: TestTicketListViewController
//  Company: Tritech
//   Author: Mohan Kumar (Sales Optimizer)
// Comments: Testing of TicketListViewController class..
// ==================================================================================
//  Changes: 2012-11-20 Initial version.
// ==================================================================================

@isTest
private class TestTicketListViewController {

    static testMethod void myUnitTest1() {
        // TO DO: implement unit test
        RecordType rType = [Select r.SobjectType, r.Name, r.Id From RecordType r Where r.SobjectType='Case' and r.Name = 'Customer Support Ticket' limit 1];
        Case cse = new Case();
    
        //Product2 prdct = [SELECT Id, Name FROM Product2 LIMIT 1];
        Product2 p = new Product2();
        p.Name = 'Test Product';
        p.Family = 'Findit';
        p.IsActive = true;
        p.Supportable__c = true;
        p.ProductCode = 'TestCode';
        insert p;
            
        cse.ProductId = p.Id;
        cse.Short_Issue_Summary_WMP__c = 'Error when creating new product';
        cse.Priority = 'P2';
        cse.Subject = 'Issue with new product';
        cse.Occured_After_Upgrade_WMP__c = true;
        cse.Reported_Major_Version_WMP__c = '5.9';
        cse.Status = 'Closed';
        cse.RecordTypeId = rType.Id;
        cse.Customer_Contact_Date_Time_WMP__c = System.now();
        
        insert cse;
        
        TicketListViewController tkt = new TicketListViewController(new apexpages.standardController(cse));
        
        tkt = new TicketListViewController();
    }
    
    static testMethod void myUnitTest2() {
        // TO DO: implement unit test
        RecordType rType = [Select r.SobjectType, r.Name, r.Id From RecordType r Where r.SobjectType='Case' and r.Name = 'Customer Support Ticket' limit 1];
        Case cse = new Case();
    
        //Product2 prdct = [SELECT Id, Name FROM Product2 LIMIT 1];
        Product2 p = new Product2();
        p.Name = 'Test Product';
        p.Family = 'Findit';
        p.IsActive = true;
        p.Supportable__c = true;
        p.ProductCode = 'TestCode';
        insert p;
            
        cse.ProductId = p.Id;
        cse.Short_Issue_Summary_WMP__c = 'Error when creating new product';
        cse.Priority = 'P2';
        cse.Subject = 'Issue with new product';
        cse.Occured_After_Upgrade_WMP__c = true;
        cse.Reported_Major_Version_WMP__c = '5.9';
        cse.Status = 'Closed';
        cse.RecordTypeId = rType.Id;
        cse.Customer_Contact_Date_Time_WMP__c = System.now();

        insert cse;
        
        TicketListViewController tkt = new TicketListViewController(new apexpages.standardController(cse));
        tkt.filterSelected = 'Closed_All_Time';
        tkt.ticketSearch();
        tkt.filterSelected = 'Closed_Last_Quarter';
        tkt.ticketSearch();
        tkt.getSortDirection();
        tkt.sortData();
        try {
            tkt.goToNextPage();
            tkt.goToPreviousPage();
        } catch(exception ex) {}
        tkt.newTicket();
        
    }
    
    static testMethod void myUnitTest3() {
        // TO DO: implement unit test
        RecordType rType = [Select r.SobjectType, r.Name, r.Id From RecordType r Where r.SobjectType='Case' and r.Name = 'Customer Support Ticket' limit 1];
        Case cse = new Case();
    
        //Product2 prdct = [SELECT Id, Name FROM Product2 LIMIT 1];
        Product2 p = new Product2();
        p.Name = 'Test Product';
        p.Family = 'Findit';
        p.IsActive = true;
        p.Supportable__c = true;
        p.ProductCode = 'TestCode';
        insert p;
            
        cse.ProductId = p.Id;
        cse.Short_Issue_Summary_WMP__c = 'Error when creating new product';
        cse.Priority = 'P2';
        cse.Subject = 'Issue with new product';
        cse.Occured_After_Upgrade_WMP__c = true;
        cse.Reported_Major_Version_WMP__c = '5.9';
        //cse.Status = 'Closed';
        //cse.RecordTypeId = rType.Id;
        cse.Customer_Contact_Date_Time_WMP__c = System.now();

        insert cse;
        
        TicketListViewController tkt = new TicketListViewController(new apexpages.standardController(cse));
        tkt.ticketSearch();
        
        
    }
    
    static testMethod void myUnitTest4() {
        // TO DO: implement unit test
        RecordType rType = [Select r.SobjectType, r.Name, r.Id From RecordType r Where r.SobjectType='Case' and r.Name = 'Customer Support Ticket' limit 1];
        Case cse = new Case();
    
        //Product2 prdct = [SELECT Id, Name FROM Product2 LIMIT 1];
        Product2 p = new Product2();
        p.Name = 'Test Product';
        p.Family = 'Findit';
        p.IsActive = true;
        p.Supportable__c = true;
        p.ProductCode = 'TestCode';
        insert p;
            
        cse.ProductId = p.Id;
        cse.Short_Issue_Summary_WMP__c = 'Error when creating new product';
        cse.Priority = 'P2';
        cse.Subject = 'Issue with new product';
        cse.Occured_After_Upgrade_WMP__c = true;
        cse.Reported_Major_Version_WMP__c = '5.9';
        //cse.Status = 'Closed';
        //cse.RecordTypeId = rType.Id;
        cse.Customer_Contact_Date_Time_WMP__c = System.now();

        insert cse;
        
        TicketListViewController tkt = new TicketListViewController(new apexpages.standardController(cse));
        tkt.filterSelected = 'Closed_Last_Quarter';
        tkt.ticketSearch();
        tkt.filterSelected = 'Closed_Future_Consideration';
        tkt.ticketSearch();
        tkt.filterSelected = 'Closed_Module_Scheduled_New_Platform';
        tkt.ticketSearch();
        tkt.filterSelected = 'Closed_P1_or_P2';
        tkt.ticketSearch();
        tkt.filterSelected = 'Closed_P3_P4_or_P5';
        tkt.ticketSearch();
        tkt.filterSelected = 'Closed_Referred_to_Enhancement_Process';
        tkt.ticketSearch();
        tkt.filterSelected = 'Open_Fixed_in_Release';
        tkt.ticketSearch();
        tkt.filterSelected = 'Open_All_Tickets';
        tkt.ticketSearch();
        tkt.filterSelected = 'Open_P1_or_P2';
        tkt.ticketSearch();
        tkt.filterSelected = 'Open_P3_P4_or_P5';
        tkt.ticketSearch();
        tkt.filterSelected = 'Open_Pending_Customer_Verification';
        tkt.ticketSearch();
        tkt.filterSelected = 'Open_Requested_Information';
    }
    
    static testMethod void myUnitTest5() {
        // TO DO: implement unit test
        RecordType rType = [Select r.SobjectType, r.Name, r.Id From RecordType r Where r.SobjectType='Case' and r.Name = 'Customer Support Ticket' limit 1];
        
    	
        
        
    
        //Product2 prdct = [SELECT Id, Name FROM Product2 LIMIT 1];
        
        Product2 p = new Product2();
        p.Name = 'Test Product';
        p.Family = 'Findit';
        p.IsActive = true;
        p.Supportable__c = true;
        p.ProductCode = 'TestCode';
        insert p;
        
        Case cse = new Case();    
        List<Case> cLIst = new List<Case>();
        for(Integer i=0; i<25; i++) {
        cse = new Case();    
        cse.ProductId = p.Id;
        myfunc2();
        cse.Short_Issue_Summary_WMP__c = 'Error when creating new product';
        cse.Priority = 'P2';
        cse.Subject = 'Issue with new product';
        cse.Occured_After_Upgrade_WMP__c = true;
        cse.Reported_Major_Version_WMP__c = '5.9';
        cse.Status = 'Closed';
        cse.RecordTypeId = rType.Id;
        cse.Customer_Contact_Date_Time_WMP__c = System.now();
        cLIst.add(cse);
        }
        
        insert cLIst;
        
        TicketListViewController tkt = new TicketListViewController(new apexpages.standardController(cse));
        try {
            tkt.goToNextPage();
            tkt.goToPreviousPage();
        } catch(Exception ex) {}
    }
    @future
    private static void myfunc2()
    {
    	Group g1 = new Group(Name='group name', type='Queue');
        insert g1;
        QueuesObject q1 = new QueueSObject(QueueID = g1.id, SobjectType = 'Case');
        insert q1;
    }
}