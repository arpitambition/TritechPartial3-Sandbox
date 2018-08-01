// ==================================================================================
//   Object: NewAvailableDownloadsController
//  Company: Tritech
//   Author: Mohan Kumar (Sales Optimizer)
// Comments: List the file from the FTP server
// ==================================================================================
//  Changes: 2012-11-20 Initial version.
// ==================================================================================

public with sharing class NewAvailableDownloadsController {
    
    public String folderNames {get;set;}
    
    public NewAvailableDownloadsController() {
		
		User portalUser = [SELECT ContactId FROM User WHERE Id = :Userinfo.getUserId()];
      	system.debug('getProductFamiliesByContract: portalUser contact [' + portalUser.ContactId + ']');
      
      	if (portalUser.ContactId != null) {
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
	            
	            //set the available product families based on the values on the contract
	            List<String> activeContractTypes = new List<String>();
	            folderNames = '';
	            for (ServiceContract contract : activeContracts) {
					if(folderNames != null && contract.Product_Family_WMP__c != null && !folderNames.contains(contract.Product_Family_WMP__c)) {
						if(folderNames != '') {
							folderNames += ',' + contract.Product_Family_WMP__c;
						} else {
							folderNames = contract.Product_Family_WMP__c;
						}
					}
	            }
	            System.debug('folderNames:'+folderNames);
	          }
	        }
      	}
	}
}