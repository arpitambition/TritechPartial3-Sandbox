// ==================================================================================
//   Object: TestNewAvailableDownloadsController
//  Company: Tritech
//   Author: Mohan Kumar (Sales Optimizer)
// Comments: Testing of NewAvailableDownloadsController class..
// ==================================================================================
//  Changes: 2012-11-20 Initial version.
// ==================================================================================

@isTest(seeAllData=true)
private class TestNewAvailableDownloadsController {

    static testMethod void myUnitTest() {
        // TO DO: implement unit test
        User portalUser = [SELECT ContactId FROM User Where isActive = true limit 1];
        System.runAs(portalUser) {
			
			Contact cnct = [SELECT AccountId FROM Contact WHERE Id = :portalUser.ContactId];
        
	        if (cnct.AccountId != null) {
	          
	          //Get the Account this contact is associated with as that has the definitive product family value
	          List<Account> accounts = [SELECT Id FROM Account WHERE Id = :cnct.AccountID];
	          Account acct;
	          if (accounts.size() > 0) {
	            acct = accounts.get(0);
	          }
	          
	          if (acct != null) {
	            
	            //get the active contracts for this account
	            List<ServiceContract> activeContracts = [SELECT Id, Contract_Type__c, Product_Family_WMP__c, Derived_Prd_Family_from_Contract_Type__c FROM ServiceContract WHERE AccountId = :acct.Id AND Contract_Status_WMP__c = 'Active'];
	            if(activeContracts.size() == 0) {
	            	ServiceContract sc = new ServiceContract();
	            	sc.AccountId = acct.Id;
	            	sc.Contract_Type__c = 'EMS';
	            	sc.Product_Family_WMP__c = 'EMS';
	            	sc.Contract_Status_WMP__c = 'Active';
	            	sc.Name = 'EMS';
	            	insert sc;
	            }
	          }
	        }
			
        	NewAvailableDownloadsController ad = new NewAvailableDownloadsController();
        }
    }
}