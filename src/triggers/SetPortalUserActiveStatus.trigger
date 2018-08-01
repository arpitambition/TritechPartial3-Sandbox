trigger SetPortalUserActiveStatus on Account (after update) {
	
	Set<Id> keySet = null;
	List<Contact> contacts = null;
	List<User> portalUsers = null;
	
	system.debug('SetPortalUserActiveStatus: Trigger.old.size ['+Trigger.old.size()+']');
	system.debug('SetPortalUserActiveStatus: Trigger.new.size ['+Trigger.new.size()+']');
	
  if ((Trigger.new != null) && (Trigger.new.size() > 0)) {
  	system.debug('SetPortalUserActiveStatus: Trigger.new.size ['+Trigger.new.size()+']');
  	
  	Map<Id,Account> newAccountMap = Trigger.newMap;
    Map<Id,Account> oldAccountMap = Trigger.oldMap;
  	
  	//for (Account acct : Trigger.new) {
    for(Id accountId : newAccountMap.keySet()){
    	Account newAcct = newAccountMap.get(accountId);
      Account oldAcct = oldAccountMap.get(accountId);
      
      system.debug('SetPortalUserActiveStatus: accountId ['+accountId+'], newAcct.Client__c ['+newAcct.Client__c+'], oldAcct.Client__c ['+oldAcct.Client__c+']');
      
      if (newAcct.Client__c != oldAcct.Client__c){
      	//the client status has changed - find the contacts and the associated portal users
  		  contacts = [SELECT Id FROM Contact WHERE AccountId = :newAcct.Id];
  		  
  		  Set<Id> contactKeySet = new Set<Id>();
  		  for (Contact cnct : contacts) {
  		  	contactKeySet.add(cnct.Id);
  		  }
  		
  		  portalUsers = [SELECT Id, IsActive FROM User WHERE ContactId IN :contactKeySet AND IsPortalEnabled = true];
  		  
  		  Set<Id> portalUserSet = new Set<Id>();
  		  for (User usr : portalUsers) {
  		  	portalUserSet.add(usr.Id);
  		  }
  		
  		  //PortalUserHandler.setPortalUserEnabledStatus(portalUsers, newAcct.Client__c);
  		  PortalUserHandler.setPortalUserSetEnabledStatus(portalUserSet, newAcct.Client__c);
      }
  	}
  	/*
  	keySet = Trigger.newMap.keySet();
  	
  	List<Contact> contacts = [SELECT Id FROM Contact WHERE AccountId IN :keySet];
  	Set<Id> contactKeySet = new Set<Id>();
    
    for (Contact cnct : contacts) {
      contactKeySet.add(cnct.Id);
    }
    */
  	
  }
}