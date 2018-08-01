@isTest
private class TestUpdateRollUpFieldOnAccount {
    static testMethod void testParentId() {
        //Create Account
        Account acc = new Account();
        acc.Name = 'test';
        acc.Number_of_Sworn_Personnel_WMP__c = 5;
        
        insert acc;
        
        Account accLevel1 = new Account();
        accLevel1.Name = 'test';
        accLevel1.Number_of_Sworn_Personnel_WMP__c = 4;
        accLevel1.ParentId = acc.id;
        
        insert accLevel1;
    }
    
    static testMethod void test911ParentId() {
        //Create Account
        Account acc = new Account();
        acc.Name = 'test';
        acc.Number_of_Sworn_Personnel_WMP__c = 5;
        
        insert acc;
        
        Account accLevel1 = new Account();
        accLevel1.Name = 'test';
        accLevel1.Number_of_Sworn_Personnel_WMP__c = 4;
        accLevel1.X911_Parent_Account__c = acc.id;
        
        insert accLevel1;
    }
    
    static testMethod void testRMSParentId() {
        //Create Account
        Account acc = new Account();
        acc.Name = 'test';
        acc.Number_of_Sworn_Personnel_WMP__c = 5;
        
        insert acc;
        
        Account accLevel1 = new Account();
        accLevel1.Name = 'test';
        accLevel1.Number_of_Sworn_Personnel_WMP__c = 4;
        accLevel1.RMS_Parent_Account__c = acc.id;
        
        insert accLevel1;
    }
}