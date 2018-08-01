@isTest
private class TestCloneTicket {

    static testMethod void myUnitTest() {
        //Create Account
        Account acc = new Account();
        acc.Name = 'test';
        //acc.RecordTypeId = rt.Id;
        insert acc;
        
        //Create Case
        Case c = new Case();
        c.AccountId = acc.Id;
        c.Status = 'New';
        insert c;
        
        ApexPages.StandardController sc = new ApexPages.StandardController(c);
        System.currentPageReference().getParameters().put('id', c.Id);
        
        CloneTicket clonTicketObj = new CloneTicket(sc);
        Pagereference result = clonTicketObj.doClone();
         
    }
}