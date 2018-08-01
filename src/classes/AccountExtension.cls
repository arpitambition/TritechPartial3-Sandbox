public without sharing class AccountExtension {
	
	public AccountExtension(){
		
	}
	
	public void updateLastFeatureRequestDate(set<Id> accountIds){
		list<Account> accounts = new list<Account>(); 
		for (Id id: accountIds){
			system.debug('The Account ID is: '+id);
			Account account = new Account(Id=id, Last_Feature_Request_Saved__c = date.today());
			accounts.add(account);
		}
		system.debug('we are going to update accounts here');
		update accounts;
	}
    
}