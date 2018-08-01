trigger DisablePortalUser on Contact (after update) {
	Set<Id> disabledConIds = new SET<Id>();
	
	for(Contact c : Trigger.new){
		if(c.Inactive_Contact__c && Trigger.oldMap.get(c.Id).Inactive_Contact__c == false){
			disabledConIds.add(c.id);
		}
	}
	
	Set<Id> usersTobeDisabled = new Set<Id>();
	for(User u :[select id, name, isActive,ContactId from User where contactId != null AND isActive=true AND contactId IN : disabledConIds]){
		usersTobeDisabled.add(u.Id);
	}
	
	if(!Test.isRunningTest()){
		//Mohan 05/20/2014: adding size check before calling the future method
		if(usersTobeDisabled.size() > 0) DisablePortaUserHelper.disablePortalUsers(usersTobeDisabled);
	}
}