public class DisablePortaUserHelper {
	@future
	public static void disablePortalUsers(Set<Id> usersSet){
		if(usersSet != null && usersSet.size() > 0){
			List<user> listUsers = new List<User>();
			for(Id uId : usersSet){
				User u = new User(Id=uId);
				u.isActive = false;
				listUsers.add(u);
			}
			
			if(listUsers.size() > 0){
				update listUsers;
			}
		}
	}
}