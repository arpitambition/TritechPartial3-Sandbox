// ==================================================================================
//   Object: TestIMCandVisinetSupportController
//  Company: TriTech
//   Author: Mohan Kumar (Sales Optimizer)
// Comments: Testing of IMCandVisinetSupportController class
// ==================================================================================
//  Changes: 2012-11-25 Initial version.
// ==================================================================================

@isTest
private class TestIMCandVisinetSupportController {

    static testMethod void myUnitTest() {
        User u1 = [Select Id, AccountId from User where IsPortalEnabled = true LIMIT 1];
        List<ServiceContract> scList = new List<ServiceContract>();
        ServiceContract sc1 = new ServiceContract(Name = 'SC1',Contract_Type__c = 'EMS', Contract_Status_WMP__c = 'Active', AccountId = u1.AccountId);
        scList.add(sc1);
        ServiceContract sc2 = new ServiceContract(Name = 'SC2',Product_Family_WMP__c = 'VisiNet',Contract_Status_WMP__c = 'Active', AccountId = u1.AccountId);
        scList.add(sc2);
        ServiceContract sc3 = new ServiceContract(Name = 'SC3',Product_Family_WMP__c = 'IMC',Contract_Status_WMP__c = 'Active', AccountId = u1.AccountId);
        scList.add(sc3);
        insert scList;
        IMCandVisinetSupportController controller = new IMCandVisinetSupportController();
        controller.autoCheckIMC();
        controller.autoCheckVisinet();
    }
}