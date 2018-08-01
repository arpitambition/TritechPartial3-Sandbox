trigger tr_User on User (after insert) {
	
	if(trigger.isAfter){
		list <User> users = [select Id,Profile.Name from User where Profile.Name Like '%Portal%' and Id in :trigger.new];
		if(trigger.isInsert){
			User_c usr = new User_c();
			usr.assignBomgarPermissions(users);
		}
	}
    
}