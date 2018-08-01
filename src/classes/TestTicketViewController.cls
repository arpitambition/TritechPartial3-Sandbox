// ==================================================================================
//   Object: TestTicketViewController
//  Company: Tritech
//   Author: Mohan Kumar (Sales Optimizer)
// Comments: Testing of TicketViewController class..
// ==================================================================================
//  Changes: 2012-11-20 Initial version.
// ==================================================================================

@isTest
private class TestTicketViewController {

    static testMethod void myUnitTest() {
        // TO DO: implement unit test
        RecordType rType = [Select r.SobjectType, r.Name, r.Id From RecordType r Where r.SobjectType='Case' and r.Name = 'Customer Support Ticket' limit 1];
        Case cse = new Case();
    
        //Product2 prdct = [SELECT Id, Name FROM Product2 LIMIT 1];
        Product2 p = new Product2();
        p.Name = 'Test Product';
        p.Family = 'Findit';
        p.IsActive = true;
        p.ProductCode = 'TestCode';
        p.Supportable__c = true;
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
        
        TicketViewController tv = new TicketViewController(new apexpages.Standardcontroller(cse));
        tv.autoRun();
        tv.autoRunToClose();
    }
}