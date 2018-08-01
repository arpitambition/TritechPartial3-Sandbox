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
private class TestWOAssignment5 {

    static testMethod void WOAssignment() {
      Test.StartTest();	
      WOUtils.setupTest();
      ID acc = WOUtils.getAccountId();
      Case c = new Case();
      c.Id = WOUtils.getCaseId();
      c.CIS_Task_List__c = 'CAD.';
      update c;
        
      string d11 = [SELECT description FROM Case WHERE AccountId = :acc limit 1].description;
      string d12 = String.valueof([Select SE_Task_List__c FROM Case WHERE AccountId = :acc limit 1]);
      string d13 = String.valueof([Select subject from task where whatid = :c.Id]);
      string d14 = String.valueof([Select description from task where whatid = :c.Id]);
      string d15 = String.valueof([Select ownerId from task where whatid = :c.Id]);
      string d16 = String.valueof([Select whatId from task where whatid = :c.Id]);
      string d17 = String.valueof([Select subject from task where whatid = :c.Id]);
      string d18 = String.valueof([Select Account_Name_DE__c from task where whatid = :c.Id]);
      string d19 = String.valueof([Select ActivityDate from task where whatid = :c.Id]);
      string d20 = String.valueof([Select CIS_Task_List__c from case where AccountId = :acc limit 1]);
      string d21 = String.valueof([Select CIS_Rehost_Task__c from case where AccountId = :acc limit 1]);
      string d22 = String.valueof([Select Type from task where whatid = :c.Id]);
      System.debug('Price after trigger fired: ' + d11);
      WOUtils.CodeCoverage1a();
      Test.StopTest();
    }
    static testMethod void WOAssignment1() {
      Test.StartTest();	
      WOUtils.setupTest();
      ID acc = WOUtils.getAccountId();
      Case c = new Case();
      c.Id = WOUtils.getCaseId();
      c.CIS_Task_List__c = 'CAD.';
      update c;
        
      string d11 = [SELECT description FROM Case WHERE AccountId = :acc limit 1].description;
      string d12 = String.valueof([Select SE_Task_List__c FROM Case WHERE AccountId = :acc limit 1]);
      string d13 = String.valueof([Select subject from task where whatid = :c.Id]);
      string d14 = String.valueof([Select description from task where whatid = :c.Id]);
      string d15 = String.valueof([Select ownerId from task where whatid = :c.Id]);
      string d16 = String.valueof([Select whatId from task where whatid = :c.Id]);
      string d17 = String.valueof([Select subject from task where whatid = :c.Id]);
      string d18 = String.valueof([Select Account_Name_DE__c from task where whatid = :c.Id]);
      string d19 = String.valueof([Select ActivityDate from task where whatid = :c.Id]);
      string d20 = String.valueof([Select CIS_Task_List__c from case where AccountId = :acc limit 1]);
      string d21 = String.valueof([Select CIS_Rehost_Task__c from case where AccountId = :acc limit 1]);
      string d22 = String.valueof([Select Type from task where whatid = :c.Id]);
      System.debug('Price after trigger fired: ' + d11);
      WOUtils.CodeCoverage1a();
      Test.StopTest();
    }
     static testMethod void WOAssignment2() {
      Test.StartTest();	
      WOUtils.setupTest();
      ID acc = WOUtils.getAccountId();
      Case c = new Case();
      c.Id = WOUtils.getCaseId();
      c.SE_Task_List__c = 'ANI/ALI';
      update c;
        
      string d11 = [SELECT description FROM Case WHERE AccountId = :acc limit 1].description;
      string d12 = String.valueof([Select SE_Task_List__c FROM Case WHERE AccountId = :acc limit 1]);
      string d13 = String.valueof([Select subject from task where whatid = :c.Id]);
      string d14 = String.valueof([Select description from task where whatid = :c.Id]);
      string d15 = String.valueof([Select ownerId from task where whatid = :c.Id]);
      string d16 = String.valueof([Select whatId from task where whatid = :c.Id]);
      string d17 = String.valueof([Select subject from task where whatid = :c.Id]);
      string d18 = String.valueof([Select Account_Name_DE__c from task where whatid = :c.Id]);
      string d19 = String.valueof([Select ActivityDate from task where whatid = :c.Id]);
      string d20 = String.valueof([Select CIS_Task_List__c from case where AccountId = :acc limit 1]);
      string d21 = String.valueof([Select CIS_Rehost_Task__c from case where AccountId = :acc limit 1]);
      string d22 = String.valueof([Select Type from task where whatid = :c.Id]);
      System.debug('Price after trigger fired: ' + d11);
      WOUtils.CodeCoverage1a();
      Test.StopTest();
    }
    static testMethod void WOAssignment3() {
      Test.StartTest();	
      WOUtils.setupTest();
      ID acc = WOUtils.getAccountId();
      Case c = new Case();
      c.Id = WOUtils.getCaseId();
      c.SE_Task_List__c = 'ASAP';
      update c;
        
      string d11 = [SELECT description FROM Case WHERE AccountId = :acc limit 1].description;
      string d12 = String.valueof([Select SE_Task_List__c FROM Case WHERE AccountId = :acc limit 1]);
      string d13 = String.valueof([Select subject from task where whatid = :c.Id]);
      string d14 = String.valueof([Select description from task where whatid = :c.Id]);
      string d15 = String.valueof([Select ownerId from task where whatid = :c.Id]);
      string d16 = String.valueof([Select whatId from task where whatid = :c.Id]);
      string d17 = String.valueof([Select subject from task where whatid = :c.Id]);
      string d18 = String.valueof([Select Account_Name_DE__c from task where whatid = :c.Id]);
      string d19 = String.valueof([Select ActivityDate from task where whatid = :c.Id]);
      string d20 = String.valueof([Select CIS_Task_List__c from case where AccountId = :acc limit 1]);
      string d21 = String.valueof([Select CIS_Rehost_Task__c from case where AccountId = :acc limit 1]);
      string d22 = String.valueof([Select Type from task where whatid = :c.Id]);
      System.debug('Price after trigger fired: ' + d11);
      WOUtils.CodeCoverage1a();
      Test.StopTest();
    }
    static testMethod void WOAssignment4() {
      Test.StartTest();	
      WOUtils.setupTest();
      ID acc = WOUtils.getAccountId();
      Case c = new Case();
      c.Id = WOUtils.getCaseId();
      c.SE_Task_List__c = 'CAD to CAD';
      update c;
        
      string d11 = [SELECT description FROM Case WHERE AccountId = :acc limit 1].description;
      string d12 = String.valueof([Select SE_Task_List__c FROM Case WHERE AccountId = :acc limit 1]);
      string d13 = String.valueof([Select subject from task where whatid = :c.Id]);
      string d14 = String.valueof([Select description from task where whatid = :c.Id]);
      string d15 = String.valueof([Select ownerId from task where whatid = :c.Id]);
      string d16 = String.valueof([Select whatId from task where whatid = :c.Id]);
      string d17 = String.valueof([Select subject from task where whatid = :c.Id]);
      string d18 = String.valueof([Select Account_Name_DE__c from task where whatid = :c.Id]);
      string d19 = String.valueof([Select ActivityDate from task where whatid = :c.Id]);
      string d20 = String.valueof([Select CIS_Task_List__c from case where AccountId = :acc limit 1]);
      string d21 = String.valueof([Select CIS_Rehost_Task__c from case where AccountId = :acc limit 1]);
      string d22 = String.valueof([Select Type from task where whatid = :c.Id]);
      System.debug('Price after trigger fired: ' + d11);
      WOUtils.CodeCoverage1a();
      Test.StopTest();
    }
    static testMethod void WOAssignment5() {
      Test.StartTest();	
      WOUtils.setupTest();
      ID acc = WOUtils.getAccountId();
      Case c = new Case();
      c.Id = WOUtils.getCaseId();
      c.SE_Task_List__c = 'CAD to EXT';
      update c;
        
      string d11 = [SELECT description FROM Case WHERE AccountId = :acc limit 1].description;
      string d12 = String.valueof([Select SE_Task_List__c FROM Case WHERE AccountId = :acc limit 1]);
      string d13 = String.valueof([Select subject from task where whatid = :c.Id]);
      string d14 = String.valueof([Select description from task where whatid = :c.Id]);
      string d15 = String.valueof([Select ownerId from task where whatid = :c.Id]);
      string d16 = String.valueof([Select whatId from task where whatid = :c.Id]);
      string d17 = String.valueof([Select subject from task where whatid = :c.Id]);
      string d18 = String.valueof([Select Account_Name_DE__c from task where whatid = :c.Id]);
      string d19 = String.valueof([Select ActivityDate from task where whatid = :c.Id]);
      string d20 = String.valueof([Select CIS_Task_List__c from case where AccountId = :acc limit 1]);
      string d21 = String.valueof([Select CIS_Rehost_Task__c from case where AccountId = :acc limit 1]);
      string d22 = String.valueof([Select Type from task where whatid = :c.Id]);
      System.debug('Price after trigger fired: ' + d11);
      WOUtils.CodeCoverage1a();
      Test.StopTest();
    }
    static testMethod void WOAssignment6() {
      Test.StartTest();	
      WOUtils.setupTest();
      ID acc = WOUtils.getAccountId();
      Case c = new Case();
      c.Id = WOUtils.getCaseId();
      c.SE_Task_List__c = 'CFS.';
      update c;
        
      string d11 = [SELECT description FROM Case WHERE AccountId = :acc limit 1].description;
      string d12 = String.valueof([Select SE_Task_List__c FROM Case WHERE AccountId = :acc limit 1]);
      string d13 = String.valueof([Select subject from task where whatid = :c.Id]);
      string d14 = String.valueof([Select description from task where whatid = :c.Id]);
      string d15 = String.valueof([Select ownerId from task where whatid = :c.Id]);
      string d16 = String.valueof([Select whatId from task where whatid = :c.Id]);
      string d17 = String.valueof([Select subject from task where whatid = :c.Id]);
      string d18 = String.valueof([Select Account_Name_DE__c from task where whatid = :c.Id]);
      string d19 = String.valueof([Select ActivityDate from task where whatid = :c.Id]);
      string d20 = String.valueof([Select CIS_Task_List__c from case where AccountId = :acc limit 1]);
      string d21 = String.valueof([Select CIS_Rehost_Task__c from case where AccountId = :acc limit 1]);
      string d22 = String.valueof([Select Type from task where whatid = :c.Id]);
      System.debug('Price after trigger fired: ' + d11);
      WOUtils.CodeCoverage1a();
      Test.StopTest();
    }
    static testMethod void WOAssignment7() {
      Test.StartTest();	
      WOUtils.setupTest();
      ID acc = WOUtils.getAccountId();
      Case c = new Case();
      c.Id = WOUtils.getCaseId();
      c.SE_Task_List__c = 'CFS Test';
      update c;
        
      string d11 = [SELECT description FROM Case WHERE AccountId = :acc limit 1].description;
      string d12 = String.valueof([Select SE_Task_List__c FROM Case WHERE AccountId = :acc limit 1]);
      string d13 = String.valueof([Select subject from task where whatid = :c.Id]);
      string d14 = String.valueof([Select description from task where whatid = :c.Id]);
      string d15 = String.valueof([Select ownerId from task where whatid = :c.Id]);
      string d16 = String.valueof([Select whatId from task where whatid = :c.Id]);
      string d17 = String.valueof([Select subject from task where whatid = :c.Id]);
      string d18 = String.valueof([Select Account_Name_DE__c from task where whatid = :c.Id]);
      string d19 = String.valueof([Select ActivityDate from task where whatid = :c.Id]);
      string d20 = String.valueof([Select CIS_Task_List__c from case where AccountId = :acc limit 1]);
      string d21 = String.valueof([Select CIS_Rehost_Task__c from case where AccountId = :acc limit 1]);
      string d22 = String.valueof([Select Type from task where whatid = :c.Id]);
      System.debug('Price after trigger fired: ' + d11);
      WOUtils.CodeCoverage1a();
      Test.StopTest();
    }
    static testMethod void WOAssignment8() {
      Test.StartTest();	
      WOUtils.setupTest();
      ID acc = WOUtils.getAccountId();
      Case c = new Case();
      c.Id = WOUtils.getCaseId();
      c.SE_Task_List__c = 'CFS Training';
      update c;
        
      string d11 = [SELECT description FROM Case WHERE AccountId = :acc limit 1].description;
      string d12 = String.valueof([Select SE_Task_List__c FROM Case WHERE AccountId = :acc limit 1]);
      string d13 = String.valueof([Select subject from task where whatid = :c.Id]);
      string d14 = String.valueof([Select description from task where whatid = :c.Id]);
      string d15 = String.valueof([Select ownerId from task where whatid = :c.Id]);
      string d16 = String.valueof([Select whatId from task where whatid = :c.Id]);
      string d17 = String.valueof([Select subject from task where whatid = :c.Id]);
      string d18 = String.valueof([Select Account_Name_DE__c from task where whatid = :c.Id]);
      string d19 = String.valueof([Select ActivityDate from task where whatid = :c.Id]);
      string d20 = String.valueof([Select CIS_Task_List__c from case where AccountId = :acc limit 1]);
      string d21 = String.valueof([Select CIS_Rehost_Task__c from case where AccountId = :acc limit 1]);
      string d22 = String.valueof([Select Type from task where whatid = :c.Id]);
      System.debug('Price after trigger fired: ' + d11);
      WOUtils.CodeCoverage1a();
      Test.StopTest();
    }
    static testMethod void WOAssignment9() {
      Test.StartTest();	
      WOUtils.setupTest();
      ID acc = WOUtils.getAccountId();
      Case c = new Case();
      c.Id = WOUtils.getCaseId();
      c.SE_Task_List__c = 'CIM.';
      update c;
        
      string d11 = [SELECT description FROM Case WHERE AccountId = :acc limit 1].description;
      string d12 = String.valueof([Select SE_Task_List__c FROM Case WHERE AccountId = :acc limit 1]);
      string d13 = String.valueof([Select subject from task where whatid = :c.Id]);
      string d14 = String.valueof([Select description from task where whatid = :c.Id]);
      string d15 = String.valueof([Select ownerId from task where whatid = :c.Id]);
      string d16 = String.valueof([Select whatId from task where whatid = :c.Id]);
      string d17 = String.valueof([Select subject from task where whatid = :c.Id]);
      string d18 = String.valueof([Select Account_Name_DE__c from task where whatid = :c.Id]);
      string d19 = String.valueof([Select ActivityDate from task where whatid = :c.Id]);
      string d20 = String.valueof([Select CIS_Task_List__c from case where AccountId = :acc limit 1]);
      string d21 = String.valueof([Select CIS_Rehost_Task__c from case where AccountId = :acc limit 1]);
      string d22 = String.valueof([Select Type from task where whatid = :c.Id]);
      System.debug('Price after trigger fired: ' + d11);
      WOUtils.CodeCoverage1a();
      Test.StopTest();
    }
    static testMethod void WOAssignment10() {
      Test.StartTest();	
      WOUtils.setupTest();
      ID acc = WOUtils.getAccountId();
      Case c = new Case();
      c.Id = WOUtils.getCaseId();
      c.SE_Task_List__c = 'CIM Training';
      update c;
        
      string d11 = [SELECT description FROM Case WHERE AccountId = :acc limit 1].description;
      string d12 = String.valueof([Select SE_Task_List__c FROM Case WHERE AccountId = :acc limit 1]);
      string d13 = String.valueof([Select subject from task where whatid = :c.Id]);
      string d14 = String.valueof([Select description from task where whatid = :c.Id]);
      string d15 = String.valueof([Select ownerId from task where whatid = :c.Id]);
      string d16 = String.valueof([Select whatId from task where whatid = :c.Id]);
      string d17 = String.valueof([Select subject from task where whatid = :c.Id]);
      string d18 = String.valueof([Select Account_Name_DE__c from task where whatid = :c.Id]);
      string d19 = String.valueof([Select ActivityDate from task where whatid = :c.Id]);
      string d20 = String.valueof([Select CIS_Task_List__c from case where AccountId = :acc limit 1]);
      string d21 = String.valueof([Select CIS_Rehost_Task__c from case where AccountId = :acc limit 1]);
      string d22 = String.valueof([Select Type from task where whatid = :c.Id]);
      System.debug('Price after trigger fired: ' + d11);
      WOUtils.CodeCoverage1a();
      Test.StopTest();
    } 
    static testMethod void WOAssignment11() {
      Test.StartTest();	
      WOUtils.setupTest();
      ID acc = WOUtils.getAccountId();
      Case c = new Case();
      c.Id = WOUtils.getCaseId();
      c.CIS_Task_List__c = 'CAD Interface Servers';
      update c;
      c.CIS_Task_List__c = 'CAD.';
      update c;
  
      string d11 = [SELECT description FROM Case WHERE AccountId = :acc limit 1].description;
      string d12 = String.valueof([Select SE_Task_List__c FROM Case WHERE AccountId = :acc limit 1]);
      string d13 = String.valueof([Select subject from task where whatid = :c.Id]);
      string d14 = String.valueof([Select description from task where whatid = :c.Id]);
      string d15 = String.valueof([Select ownerId from task where whatid = :c.Id]);
      string d16 = String.valueof([Select whatId from task where whatid = :c.Id]);
      string d17 = String.valueof([Select subject from task where whatid = :c.Id]);
      string d18 = String.valueof([Select Account_Name_DE__c from task where whatid = :c.Id]);
      string d19 = String.valueof([Select ActivityDate from task where whatid = :c.Id]);
      string d20 = String.valueof([Select CIS_Task_List__c from case where AccountId = :acc limit 1]);
      string d21 = String.valueof([Select CIS_Rehost_Task__c from case where AccountId = :acc limit 1]);
      string d22 = String.valueof([Select Type from task where whatid = :c.Id]);
      System.debug('Price after trigger fired: ' + d11);
      WOUtils.CodeCoverage1a();
      Test.StopTest();
    }
    static testMethod void WOAssignment21() {
      Test.StartTest();	
      WOUtils.setupTest();
      ID acc = WOUtils.getAccountId();
      Case c = new Case();
      c.Id = WOUtils.getCaseId();
      c.CIS_Task_List__c = 'CAD Interface Servers';
      update c;
      c.CIS_Task_List__c = 'CAD.';
      update c;
        
      string d11 = [SELECT description FROM Case WHERE AccountId = :acc limit 1].description;
      string d12 = String.valueof([Select SE_Task_List__c FROM Case WHERE AccountId = :acc limit 1]);
      string d13 = String.valueof([Select subject from task where whatid = :c.Id]);
      string d14 = String.valueof([Select description from task where whatid = :c.Id]);
      string d15 = String.valueof([Select ownerId from task where whatid = :c.Id]);
      string d16 = String.valueof([Select whatId from task where whatid = :c.Id]);
      string d17 = String.valueof([Select subject from task where whatid = :c.Id]);
      string d18 = String.valueof([Select Account_Name_DE__c from task where whatid = :c.Id]);
      string d19 = String.valueof([Select ActivityDate from task where whatid = :c.Id]);
      string d20 = String.valueof([Select CIS_Task_List__c from case where AccountId = :acc limit 1]);
      string d21 = String.valueof([Select CIS_Rehost_Task__c from case where AccountId = :acc limit 1]);
      string d22 = String.valueof([Select Type from task where whatid = :c.Id]);
      System.debug('Price after trigger fired: ' + d11);
      WOUtils.CodeCoverage1a();
      Test.StopTest();
    }
     static testMethod void WOAssignment12() {
      Test.StartTest();	
      WOUtils.setupTest();
      ID acc = WOUtils.getAccountId();
      Case c = new Case();
      c.Id = WOUtils.getCaseId();
      c.SE_Task_List__c = 'ASAP';
      update c;
      c.SE_Task_List__c = 'ANI/ALI';
      update c;
        
      string d11 = [SELECT description FROM Case WHERE AccountId = :acc limit 1].description;
      string d12 = String.valueof([Select SE_Task_List__c FROM Case WHERE AccountId = :acc limit 1]);
      string d13 = String.valueof([Select subject from task where whatid = :c.Id]);
      string d14 = String.valueof([Select description from task where whatid = :c.Id]);
      string d15 = String.valueof([Select ownerId from task where whatid = :c.Id]);
      string d16 = String.valueof([Select whatId from task where whatid = :c.Id]);
      string d17 = String.valueof([Select subject from task where whatid = :c.Id]);
      string d18 = String.valueof([Select Account_Name_DE__c from task where whatid = :c.Id]);
      string d19 = String.valueof([Select ActivityDate from task where whatid = :c.Id]);
      string d20 = String.valueof([Select CIS_Task_List__c from case where AccountId = :acc limit 1]);
      string d21 = String.valueof([Select CIS_Rehost_Task__c from case where AccountId = :acc limit 1]);
      string d22 = String.valueof([Select Type from task where whatid = :c.Id]);
      System.debug('Price after trigger fired: ' + d11);
      WOUtils.CodeCoverage1a();
      Test.StopTest();
    }
    static testMethod void WOAssignment13() {
      Test.StartTest();	
      WOUtils.setupTest();
      ID acc = WOUtils.getAccountId();
      Case c = new Case();
      c.Id = WOUtils.getCaseId();
      c.SE_Task_List__c = 'CAD to CAD';
      update c;   
      c.SE_Task_List__c = 'ASAP';
      update c;
        
      string d11 = [SELECT description FROM Case WHERE AccountId = :acc limit 1].description;
      string d12 = String.valueof([Select SE_Task_List__c FROM Case WHERE AccountId = :acc limit 1]);
      string d13 = String.valueof([Select subject from task where whatid = :c.Id]);
      string d14 = String.valueof([Select description from task where whatid = :c.Id]);
      string d15 = String.valueof([Select ownerId from task where whatid = :c.Id]);
      string d16 = String.valueof([Select whatId from task where whatid = :c.Id]);
      string d17 = String.valueof([Select subject from task where whatid = :c.Id]);
      string d18 = String.valueof([Select Account_Name_DE__c from task where whatid = :c.Id]);
      string d19 = String.valueof([Select ActivityDate from task where whatid = :c.Id]);
      string d20 = String.valueof([Select CIS_Task_List__c from case where AccountId = :acc limit 1]);
      string d21 = String.valueof([Select CIS_Rehost_Task__c from case where AccountId = :acc limit 1]);
      string d22 = String.valueof([Select Type from task where whatid = :c.Id]);
      System.debug('Price after trigger fired: ' + d11);
      WOUtils.CodeCoverage1a();
      Test.StopTest();
    }
    static testMethod void WOAssignment14() {
      Test.StartTest();	
      WOUtils.setupTest();
      ID acc = WOUtils.getAccountId();
      Case c = new Case();
      c.Id = WOUtils.getCaseId();
      c.SE_Task_List__c = 'CAD to EXT';
      update c;
      c.SE_Task_List__c = 'CAD to CAD';
      update c;
        
      string d11 = [SELECT description FROM Case WHERE AccountId = :acc limit 1].description;
      string d12 = String.valueof([Select SE_Task_List__c FROM Case WHERE AccountId = :acc limit 1]);
      string d13 = String.valueof([Select subject from task where whatid = :c.Id]);
      string d14 = String.valueof([Select description from task where whatid = :c.Id]);
      string d15 = String.valueof([Select ownerId from task where whatid = :c.Id]);
      string d16 = String.valueof([Select whatId from task where whatid = :c.Id]);
      string d17 = String.valueof([Select subject from task where whatid = :c.Id]);
      string d18 = String.valueof([Select Account_Name_DE__c from task where whatid = :c.Id]);
      string d19 = String.valueof([Select ActivityDate from task where whatid = :c.Id]);
      string d20 = String.valueof([Select CIS_Task_List__c from case where AccountId = :acc limit 1]);
      string d21 = String.valueof([Select CIS_Rehost_Task__c from case where AccountId = :acc limit 1]);
      string d22 = String.valueof([Select Type from task where whatid = :c.Id]);
      System.debug('Price after trigger fired: ' + d11);
      WOUtils.CodeCoverage1a();
      Test.StopTest();
    }
    static testMethod void WOAssignment15() {
      Test.StartTest();	
      WOUtils.setupTest();
      ID acc = WOUtils.getAccountId();
      Case c = new Case();
      c.Id = WOUtils.getCaseId();
      c.SE_Task_List__c = 'CFS.';
      update c;       
      c.SE_Task_List__c = 'CAD to EXT';
      update c;
        
      string d11 = [SELECT description FROM Case WHERE AccountId = :acc limit 1].description;
      string d12 = String.valueof([Select SE_Task_List__c FROM Case WHERE AccountId = :acc limit 1]);
      string d13 = String.valueof([Select subject from task where whatid = :c.Id]);
      string d14 = String.valueof([Select description from task where whatid = :c.Id]);
      string d15 = String.valueof([Select ownerId from task where whatid = :c.Id]);
      string d16 = String.valueof([Select whatId from task where whatid = :c.Id]);
      string d17 = String.valueof([Select subject from task where whatid = :c.Id]);
      string d18 = String.valueof([Select Account_Name_DE__c from task where whatid = :c.Id]);
      string d19 = String.valueof([Select ActivityDate from task where whatid = :c.Id]);
      string d20 = String.valueof([Select CIS_Task_List__c from case where AccountId = :acc limit 1]);
      string d21 = String.valueof([Select CIS_Rehost_Task__c from case where AccountId = :acc limit 1]);
      string d22 = String.valueof([Select Type from task where whatid = :c.Id]);
      System.debug('Price after trigger fired: ' + d11);
      WOUtils.CodeCoverage1a();
      Test.StopTest();
    }
    static testMethod void WOAssignment16() {
      Test.StartTest();	
      WOUtils.setupTest();
      ID acc = WOUtils.getAccountId();
      Case c = new Case();
      c.Id = WOUtils.getCaseId();
      c.SE_Task_List__c = 'CFS Test';
      update c;
      c.SE_Task_List__c = 'CFS.';
      update c;
        
      string d11 = [SELECT description FROM Case WHERE AccountId = :acc limit 1].description;
      string d12 = String.valueof([Select SE_Task_List__c FROM Case WHERE AccountId = :acc limit 1]);
      string d13 = String.valueof([Select subject from task where whatid = :c.Id]);
      string d14 = String.valueof([Select description from task where whatid = :c.Id]);
      string d15 = String.valueof([Select ownerId from task where whatid = :c.Id]);
      string d16 = String.valueof([Select whatId from task where whatid = :c.Id]);
      string d17 = String.valueof([Select subject from task where whatid = :c.Id]);
      string d18 = String.valueof([Select Account_Name_DE__c from task where whatid = :c.Id]);
      string d19 = String.valueof([Select ActivityDate from task where whatid = :c.Id]);
      string d20 = String.valueof([Select CIS_Task_List__c from case where AccountId = :acc limit 1]);
      string d21 = String.valueof([Select CIS_Rehost_Task__c from case where AccountId = :acc limit 1]);
      string d22 = String.valueof([Select Type from task where whatid = :c.Id]);
      System.debug('Price after trigger fired: ' + d11);
      WOUtils.CodeCoverage1a();
      Test.StopTest();
    }
    static testMethod void WOAssignment17() {
      Test.StartTest();	
      WOUtils.setupTest();
      ID acc = WOUtils.getAccountId();
      Case c = new Case();
      c.Id = WOUtils.getCaseId();
      c.SE_Task_List__c = 'CFS Training';
      update c;
      c.SE_Task_List__c = 'CFS Test';
      update c;
        
      string d11 = [SELECT description FROM Case WHERE AccountId = :acc limit 1].description;
      string d12 = String.valueof([Select SE_Task_List__c FROM Case WHERE AccountId = :acc limit 1]);
      string d13 = String.valueof([Select subject from task where whatid = :c.Id]);
      string d14 = String.valueof([Select description from task where whatid = :c.Id]);
      string d15 = String.valueof([Select ownerId from task where whatid = :c.Id]);
      string d16 = String.valueof([Select whatId from task where whatid = :c.Id]);
      string d17 = String.valueof([Select subject from task where whatid = :c.Id]);
      string d18 = String.valueof([Select Account_Name_DE__c from task where whatid = :c.Id]);
      string d19 = String.valueof([Select ActivityDate from task where whatid = :c.Id]);
      string d20 = String.valueof([Select CIS_Task_List__c from case where AccountId = :acc limit 1]);
      string d21 = String.valueof([Select CIS_Rehost_Task__c from case where AccountId = :acc limit 1]);
      string d22 = String.valueof([Select Type from task where whatid = :c.Id]);
      System.debug('Price after trigger fired: ' + d11);
      WOUtils.CodeCoverage1a();
      Test.StopTest();
    }
    static testMethod void WOAssignment18() {
      Test.StartTest();	
      WOUtils.setupTest();
      ID acc = WOUtils.getAccountId();
      Case c = new Case();
      c.Id = WOUtils.getCaseId();
      c.SE_Task_List__c = 'CIM.';
      update c;
      c.SE_Task_List__c = 'CFS Training';
      update c;
        
      string d11 = [SELECT description FROM Case WHERE AccountId = :acc limit 1].description;
      string d12 = String.valueof([Select SE_Task_List__c FROM Case WHERE AccountId = :acc limit 1]);
      string d13 = String.valueof([Select subject from task where whatid = :c.Id]);
      string d14 = String.valueof([Select description from task where whatid = :c.Id]);
      string d15 = String.valueof([Select ownerId from task where whatid = :c.Id]);
      string d16 = String.valueof([Select whatId from task where whatid = :c.Id]);
      string d17 = String.valueof([Select subject from task where whatid = :c.Id]);
      string d18 = String.valueof([Select Account_Name_DE__c from task where whatid = :c.Id]);
      string d19 = String.valueof([Select ActivityDate from task where whatid = :c.Id]);
      string d20 = String.valueof([Select CIS_Task_List__c from case where AccountId = :acc limit 1]);
      string d21 = String.valueof([Select CIS_Rehost_Task__c from case where AccountId = :acc limit 1]);
      string d22 = String.valueof([Select Type from task where whatid = :c.Id]);
      System.debug('Price after trigger fired: ' + d11);
      WOUtils.CodeCoverage1a();
      Test.StopTest();
    }
    static testMethod void WOAssignment19() {
      Test.StartTest();	
      WOUtils.setupTest();
      ID acc = WOUtils.getAccountId();
      Case c = new Case();
      c.Id = WOUtils.getCaseId();
      c.SE_Task_List__c = 'CIM Training';
      update c;
      c.SE_Task_List__c = 'CIM.';
      update c;
        
      string d11 = [SELECT description FROM Case WHERE AccountId = :acc limit 1].description;
      string d12 = String.valueof([Select SE_Task_List__c FROM Case WHERE AccountId = :acc limit 1]);
      string d13 = String.valueof([Select subject from task where whatid = :c.Id]);
      string d14 = String.valueof([Select description from task where whatid = :c.Id]);
      string d15 = String.valueof([Select ownerId from task where whatid = :c.Id]);
      string d16 = String.valueof([Select whatId from task where whatid = :c.Id]);
      string d17 = String.valueof([Select subject from task where whatid = :c.Id]);
      string d18 = String.valueof([Select Account_Name_DE__c from task where whatid = :c.Id]);
      string d19 = String.valueof([Select ActivityDate from task where whatid = :c.Id]);
      string d20 = String.valueof([Select CIS_Task_List__c from case where AccountId = :acc limit 1]);
      string d21 = String.valueof([Select CIS_Rehost_Task__c from case where AccountId = :acc limit 1]);
      string d22 = String.valueof([Select Type from task where whatid = :c.Id]);
      System.debug('Price after trigger fired: ' + d11);
      WOUtils.CodeCoverage1a();
      Test.StopTest();
    }
    static testMethod void WOAssignment20() {
      Test.StartTest();	
      WOUtils.setupTest();
      ID acc = WOUtils.getAccountId();
      Case c = new Case();
      c.Id = WOUtils.getCaseId();
      c.SE_Task_List__c = 'CIM.';
      update c;
      c.SE_Task_List__c = 'CIM Training';
      update c;
        
      string d11 = [SELECT description FROM Case WHERE AccountId = :acc limit 1].description;
      string d12 = String.valueof([Select SE_Task_List__c FROM Case WHERE AccountId = :acc limit 1]);
      string d13 = String.valueof([Select subject from task where whatid = :c.Id]);
      string d14 = String.valueof([Select description from task where whatid = :c.Id]);
      string d15 = String.valueof([Select ownerId from task where whatid = :c.Id]);
      string d16 = String.valueof([Select whatId from task where whatid = :c.Id]);
      string d17 = String.valueof([Select subject from task where whatid = :c.Id]);
      string d18 = String.valueof([Select Account_Name_DE__c from task where whatid = :c.Id]);
      string d19 = String.valueof([Select ActivityDate from task where whatid = :c.Id]);
      string d20 = String.valueof([Select CIS_Task_List__c from case where AccountId = :acc limit 1]);
      string d21 = String.valueof([Select CIS_Rehost_Task__c from case where AccountId = :acc limit 1]);
      string d22 = String.valueof([Select Type from task where whatid = :c.Id]);
      System.debug('Price after trigger fired: ' + d11);
      WOUtils.CodeCoverage1a();
      Test.StopTest();
    } 
    static testMethod void WOAssignment32() {
      Test.StartTest();	
      WOUtils.setupTest();
      ID acc = WOUtils.getAccountId();
      Case c = new Case();
      c.Id = WOUtils.getCaseId();
      c.CIS_Task_List__c = '';
      update c;
      c.CIS_Task_List__c = 'CAD.';
      update c;
  
      string d11 = [SELECT description FROM Case WHERE AccountId = :acc limit 1].description;
      string d12 = String.valueof([Select SE_Task_List__c FROM Case WHERE AccountId = :acc limit 1]);
      string d13 = String.valueof([Select subject from task where whatid = :c.Id]);
      string d14 = String.valueof([Select description from task where whatid = :c.Id]);
      string d15 = String.valueof([Select ownerId from task where whatid = :c.Id]);
      string d16 = String.valueof([Select whatId from task where whatid = :c.Id]);
      string d17 = String.valueof([Select subject from task where whatid = :c.Id]);
      string d18 = String.valueof([Select Account_Name_DE__c from task where whatid = :c.Id]);
      string d19 = String.valueof([Select ActivityDate from task where whatid = :c.Id]);
      string d20 = String.valueof([Select CIS_Task_List__c from case where AccountId = :acc limit 1]);
      string d21 = String.valueof([Select CIS_Rehost_Task__c from case where AccountId = :acc limit 1]);
      string d22 = String.valueof([Select Type from task where whatid = :c.Id]);
      System.debug('Price after trigger fired: ' + d11);
      WOUtils.CodeCoverage1a();
      Test.StopTest();
    }
    static testMethod void WOAssignment22() {
      Test.StartTest();	
      WOUtils.setupTest();
      ID acc = WOUtils.getAccountId();
      Case c = new Case();
      c.Id = WOUtils.getCaseId();
      c.CIS_Task_List__c = '';
      update c;
      c.CIS_Task_List__c = 'CAD.';
      update c;
        
      string d11 = [SELECT description FROM Case WHERE AccountId = :acc limit 1].description;
      string d12 = String.valueof([Select SE_Task_List__c FROM Case WHERE AccountId = :acc limit 1]);
      string d13 = String.valueof([Select subject from task where whatid = :c.Id]);
      string d14 = String.valueof([Select description from task where whatid = :c.Id]);
      string d15 = String.valueof([Select ownerId from task where whatid = :c.Id]);
      string d16 = String.valueof([Select whatId from task where whatid = :c.Id]);
      string d17 = String.valueof([Select subject from task where whatid = :c.Id]);
      string d18 = String.valueof([Select Account_Name_DE__c from task where whatid = :c.Id]);
      string d19 = String.valueof([Select ActivityDate from task where whatid = :c.Id]);
      string d20 = String.valueof([Select CIS_Task_List__c from case where AccountId = :acc limit 1]);
      string d21 = String.valueof([Select CIS_Rehost_Task__c from case where AccountId = :acc limit 1]);
      string d22 = String.valueof([Select Type from task where whatid = :c.Id]);
      System.debug('Price after trigger fired: ' + d11);
      WOUtils.CodeCoverage1a();
      Test.StopTest();
    }
     static testMethod void WOAssignment23() {
      Test.StartTest();	
      WOUtils.setupTest();
      ID acc = WOUtils.getAccountId();
      Case c = new Case();
      c.Id = WOUtils.getCaseId();
      c.SE_Task_List__c = '';
      update c;
      c.SE_Task_List__c = 'ANI/ALI';
      update c;
        
      string d11 = [SELECT description FROM Case WHERE AccountId = :acc limit 1].description;
      string d12 = String.valueof([Select SE_Task_List__c FROM Case WHERE AccountId = :acc limit 1]);
      string d13 = String.valueof([Select subject from task where whatid = :c.Id]);
      string d14 = String.valueof([Select description from task where whatid = :c.Id]);
      string d15 = String.valueof([Select ownerId from task where whatid = :c.Id]);
      string d16 = String.valueof([Select whatId from task where whatid = :c.Id]);
      string d17 = String.valueof([Select subject from task where whatid = :c.Id]);
      string d18 = String.valueof([Select Account_Name_DE__c from task where whatid = :c.Id]);
      string d19 = String.valueof([Select ActivityDate from task where whatid = :c.Id]);
      string d20 = String.valueof([Select CIS_Task_List__c from case where AccountId = :acc limit 1]);
      string d21 = String.valueof([Select CIS_Rehost_Task__c from case where AccountId = :acc limit 1]);
      string d22 = String.valueof([Select Type from task where whatid = :c.Id]);
      System.debug('Price after trigger fired: ' + d11);
      WOUtils.CodeCoverage1a();
      Test.StopTest();
    }
    static testMethod void WOAssignment24() {
      Test.StartTest();	
      WOUtils.setupTest();
      ID acc = WOUtils.getAccountId();
      Case c = new Case();
      c.Id = WOUtils.getCaseId();
      c.SE_Task_List__c = '';
      update c;   
      c.SE_Task_List__c = 'ASAP';
      update c;
        
      string d11 = [SELECT description FROM Case WHERE AccountId = :acc limit 1].description;
      string d12 = String.valueof([Select SE_Task_List__c FROM Case WHERE AccountId = :acc limit 1]);
      string d13 = String.valueof([Select subject from task where whatid = :c.Id]);
      string d14 = String.valueof([Select description from task where whatid = :c.Id]);
      string d15 = String.valueof([Select ownerId from task where whatid = :c.Id]);
      string d16 = String.valueof([Select whatId from task where whatid = :c.Id]);
      string d17 = String.valueof([Select subject from task where whatid = :c.Id]);
      string d18 = String.valueof([Select Account_Name_DE__c from task where whatid = :c.Id]);
      string d19 = String.valueof([Select ActivityDate from task where whatid = :c.Id]);
      string d20 = String.valueof([Select CIS_Task_List__c from case where AccountId = :acc limit 1]);
      string d21 = String.valueof([Select CIS_Rehost_Task__c from case where AccountId = :acc limit 1]);
      string d22 = String.valueof([Select Type from task where whatid = :c.Id]);
      System.debug('Price after trigger fired: ' + d11);
      WOUtils.CodeCoverage1a();
      Test.StopTest();
    }
    static testMethod void WOAssignment25() {
      Test.StartTest();	
      WOUtils.setupTest();
      ID acc = WOUtils.getAccountId();
      Case c = new Case();
      c.Id = WOUtils.getCaseId();
      c.SE_Task_List__c = '';
      update c;
      c.SE_Task_List__c = 'CAD to CAD';
      update c;
        
      string d11 = [SELECT description FROM Case WHERE AccountId = :acc limit 1].description;
      string d12 = String.valueof([Select SE_Task_List__c FROM Case WHERE AccountId = :acc limit 1]);
      string d13 = String.valueof([Select subject from task where whatid = :c.Id]);
      string d14 = String.valueof([Select description from task where whatid = :c.Id]);
      string d15 = String.valueof([Select ownerId from task where whatid = :c.Id]);
      string d16 = String.valueof([Select whatId from task where whatid = :c.Id]);
      string d17 = String.valueof([Select subject from task where whatid = :c.Id]);
      string d18 = String.valueof([Select Account_Name_DE__c from task where whatid = :c.Id]);
      string d19 = String.valueof([Select ActivityDate from task where whatid = :c.Id]);
      string d20 = String.valueof([Select CIS_Task_List__c from case where AccountId = :acc limit 1]);
      string d21 = String.valueof([Select CIS_Rehost_Task__c from case where AccountId = :acc limit 1]);
      string d22 = String.valueof([Select Type from task where whatid = :c.Id]);
      System.debug('Price after trigger fired: ' + d11);
      WOUtils.CodeCoverage1a();
      Test.StopTest();
    }
    static testMethod void WOAssignment26() {
      Test.StartTest();	
      WOUtils.setupTest();
      ID acc = WOUtils.getAccountId();
      Case c = new Case();
      c.Id = WOUtils.getCaseId();
      c.SE_Task_List__c = '';
      update c;       
      c.SE_Task_List__c = 'CAD to EXT';
      update c;
        
      string d11 = [SELECT description FROM Case WHERE AccountId = :acc limit 1].description;
      string d12 = String.valueof([Select SE_Task_List__c FROM Case WHERE AccountId = :acc limit 1]);
      string d13 = String.valueof([Select subject from task where whatid = :c.Id]);
      string d14 = String.valueof([Select description from task where whatid = :c.Id]);
      string d15 = String.valueof([Select ownerId from task where whatid = :c.Id]);
      string d16 = String.valueof([Select whatId from task where whatid = :c.Id]);
      string d17 = String.valueof([Select subject from task where whatid = :c.Id]);
      string d18 = String.valueof([Select Account_Name_DE__c from task where whatid = :c.Id]);
      string d19 = String.valueof([Select ActivityDate from task where whatid = :c.Id]);
      string d20 = String.valueof([Select CIS_Task_List__c from case where AccountId = :acc limit 1]);
      string d21 = String.valueof([Select CIS_Rehost_Task__c from case where AccountId = :acc limit 1]);
      string d22 = String.valueof([Select Type from task where whatid = :c.Id]);
      System.debug('Price after trigger fired: ' + d11);
      WOUtils.CodeCoverage1a();
      Test.StopTest();
    }
    static testMethod void WOAssignment27() {
      Test.StartTest();	
      WOUtils.setupTest();
      ID acc = WOUtils.getAccountId();
      Case c = new Case();
      c.Id = WOUtils.getCaseId();
      c.SE_Task_List__c = '';
      update c;
      c.SE_Task_List__c = 'CFS.';
      update c;
        
      string d11 = [SELECT description FROM Case WHERE AccountId = :acc limit 1].description;
      string d12 = String.valueof([Select SE_Task_List__c FROM Case WHERE AccountId = :acc limit 1]);
      string d13 = String.valueof([Select subject from task where whatid = :c.Id]);
      string d14 = String.valueof([Select description from task where whatid = :c.Id]);
      string d15 = String.valueof([Select ownerId from task where whatid = :c.Id]);
      string d16 = String.valueof([Select whatId from task where whatid = :c.Id]);
      string d17 = String.valueof([Select subject from task where whatid = :c.Id]);
      string d18 = String.valueof([Select Account_Name_DE__c from task where whatid = :c.Id]);
      string d19 = String.valueof([Select ActivityDate from task where whatid = :c.Id]);
      string d20 = String.valueof([Select CIS_Task_List__c from case where AccountId = :acc limit 1]);
      string d21 = String.valueof([Select CIS_Rehost_Task__c from case where AccountId = :acc limit 1]);
      string d22 = String.valueof([Select Type from task where whatid = :c.Id]);
      System.debug('Price after trigger fired: ' + d11);
      WOUtils.CodeCoverage1a();
      Test.StopTest();
    }
    static testMethod void WOAssignment28() {
      Test.StartTest();	
      WOUtils.setupTest();
      ID acc = WOUtils.getAccountId();
      Case c = new Case();
      c.Id = WOUtils.getCaseId();
      c.SE_Task_List__c = '';
      update c;
      c.SE_Task_List__c = 'CFS Test';
      update c;
        
      string d11 = [SELECT description FROM Case WHERE AccountId = :acc limit 1].description;
      string d12 = String.valueof([Select SE_Task_List__c FROM Case WHERE AccountId = :acc limit 1]);
      string d13 = String.valueof([Select subject from task where whatid = :c.Id]);
      string d14 = String.valueof([Select description from task where whatid = :c.Id]);
      string d15 = String.valueof([Select ownerId from task where whatid = :c.Id]);
      string d16 = String.valueof([Select whatId from task where whatid = :c.Id]);
      string d17 = String.valueof([Select subject from task where whatid = :c.Id]);
      string d18 = String.valueof([Select Account_Name_DE__c from task where whatid = :c.Id]);
      string d19 = String.valueof([Select ActivityDate from task where whatid = :c.Id]);
      string d20 = String.valueof([Select CIS_Task_List__c from case where AccountId = :acc limit 1]);
      string d21 = String.valueof([Select CIS_Rehost_Task__c from case where AccountId = :acc limit 1]);
      string d22 = String.valueof([Select Type from task where whatid = :c.Id]);
      System.debug('Price after trigger fired: ' + d11);
      WOUtils.CodeCoverage1a();
      Test.StopTest();
    }
    static testMethod void WOAssignment29() {
      Test.StartTest();	
      WOUtils.setupTest();
      ID acc = WOUtils.getAccountId();
      Case c = new Case();
      c.Id = WOUtils.getCaseId();
      c.SE_Task_List__c = '';
      update c;
      c.SE_Task_List__c = 'CFS Training';
      update c;
        
      string d11 = [SELECT description FROM Case WHERE AccountId = :acc limit 1].description;
      string d12 = String.valueof([Select SE_Task_List__c FROM Case WHERE AccountId = :acc limit 1]);
      string d13 = String.valueof([Select subject from task where whatid = :c.Id]);
      string d14 = String.valueof([Select description from task where whatid = :c.Id]);
      string d15 = String.valueof([Select ownerId from task where whatid = :c.Id]);
      string d16 = String.valueof([Select whatId from task where whatid = :c.Id]);
      string d17 = String.valueof([Select subject from task where whatid = :c.Id]);
      string d18 = String.valueof([Select Account_Name_DE__c from task where whatid = :c.Id]);
      string d19 = String.valueof([Select ActivityDate from task where whatid = :c.Id]);
      string d20 = String.valueof([Select CIS_Task_List__c from case where AccountId = :acc limit 1]);
      string d21 = String.valueof([Select CIS_Rehost_Task__c from case where AccountId = :acc limit 1]);
      string d22 = String.valueof([Select Type from task where whatid = :c.Id]);
      System.debug('Price after trigger fired: ' + d11);
      WOUtils.CodeCoverage1a();
      Test.StopTest();
    }
    static testMethod void WOAssignment30() {
      Test.StartTest();	
      WOUtils.setupTest();
      ID acc = WOUtils.getAccountId();
      Case c = new Case();
      c.Id = WOUtils.getCaseId();
      c.SE_Task_List__c = '';
      update c;
      c.SE_Task_List__c = 'CIM.';
      update c;
        
      string d11 = [SELECT description FROM Case WHERE AccountId = :acc limit 1].description;
      string d12 = String.valueof([Select SE_Task_List__c FROM Case WHERE AccountId = :acc limit 1]);
      string d13 = String.valueof([Select subject from task where whatid = :c.Id]);
      string d14 = String.valueof([Select description from task where whatid = :c.Id]);
      string d15 = String.valueof([Select ownerId from task where whatid = :c.Id]);
      string d16 = String.valueof([Select whatId from task where whatid = :c.Id]);
      string d17 = String.valueof([Select subject from task where whatid = :c.Id]);
      string d18 = String.valueof([Select Account_Name_DE__c from task where whatid = :c.Id]);
      string d19 = String.valueof([Select ActivityDate from task where whatid = :c.Id]);
      string d20 = String.valueof([Select CIS_Task_List__c from case where AccountId = :acc limit 1]);
      string d21 = String.valueof([Select CIS_Rehost_Task__c from case where AccountId = :acc limit 1]);
      string d22 = String.valueof([Select Type from task where whatid = :c.Id]);
      System.debug('Price after trigger fired: ' + d11);
      WOUtils.CodeCoverage1a();
      Test.StopTest();
    }
    static testMethod void WOAssignment31() {
      Test.StartTest();	
      WOUtils.setupTest();
      ID acc = WOUtils.getAccountId();
      Case c = new Case();
      c.Id = WOUtils.getCaseId();
      c.SE_Task_List__c = '';
      update c;
      c.SE_Task_List__c = 'CIM Training';
      update c;
        
      string d11 = [SELECT description FROM Case WHERE AccountId = :acc limit 1].description;
      string d12 = String.valueof([Select SE_Task_List__c FROM Case WHERE AccountId = :acc limit 1]);
      string d13 = String.valueof([Select subject from task where whatid = :c.Id]);
      string d14 = String.valueof([Select description from task where whatid = :c.Id]);
      string d15 = String.valueof([Select ownerId from task where whatid = :c.Id]);
      string d16 = String.valueof([Select whatId from task where whatid = :c.Id]);
      string d17 = String.valueof([Select subject from task where whatid = :c.Id]);
      string d18 = String.valueof([Select Account_Name_DE__c from task where whatid = :c.Id]);
      string d19 = String.valueof([Select ActivityDate from task where whatid = :c.Id]);
      string d20 = String.valueof([Select CIS_Task_List__c from case where AccountId = :acc limit 1]);
      string d21 = String.valueof([Select CIS_Rehost_Task__c from case where AccountId = :acc limit 1]);
      string d22 = String.valueof([Select Type from task where whatid = :c.Id]);
      System.debug('Price after trigger fired: ' + d11);
      WOUtils.CodeCoverage1a();
      Test.StopTest();
    } 
}