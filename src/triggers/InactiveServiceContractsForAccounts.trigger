trigger InactiveServiceContractsForAccounts on ServiceContract (after insert, after update, after delete) 
{
 
	//Grab all account Ids associated with the service contracts
	set<ID> setAccountId = new set<ID>();
	if (trigger.isDelete) 
	{
		for(ServiceContract sc : trigger.old)
		{
			 setAccountId.add(sc.AccountId);
		}
	}
	else
	{
		for(ServiceContract sc : trigger.new)
		{
			 setAccountId.add(sc.AccountId);
		}
	}
	
	
	List<Account> listAccount = new List<Account>();
	
	// fetch all related accounts with associated active service contracts 
	for(Account a : [Select a.Id, a.Contract_Types__c, (Select Id, AccountId,Contract_Type__c From ServiceContracts 
	Where (Contract_Status_WMP__c != 'Active' 
	AND Contract_Status_WMP__c != 'Installed Not Live' 
    AND Contract_Status_WMP__c != 'Renewal Due' 
    AND Contract_Status_WMP__c !='Vendor/Partner'
    AND Contract_Status_WMP__c != 'No HW Support, Software Only') 
    AND Contract_Type__c != null ) 
	From Account a Where Id  IN : setAccountId])
	{
		
		string contractTypes = '';
		
		// create set of unique contract types (SET creates unique records)
		SET<string> setContractType = new SET<string>();
		for(ServiceContract sc: a.ServiceContracts ){
			setContractType.add(sc.Contract_Type__c);
		}
		
		// prepare comma separated string
		for(string str: setContractType){
			if(contractTypes != ''){
				contractTypes = contractTypes + ', '; 
			}
			contractTypes = contractTypes + str;
		}
		
		a.Inactive_Contract_Types__c = contractTypes;
		
		listAccount.add(a);
	}
	
	// update account
	if(listAccount.size() > 0){
		update listAccount;
	}
	 
}