public class PortalUser {
	
	private static User CurrentUser {get; set;}
	
	
	public static Id getAccountId(){
		setCurrentUser();
		return CurrentUser.Contact.AccountId;
	}
	
	private static void setCurrentUser(){
		CurrentUser = [select Id,name,ContactId,Contact.Name,Contact.AccountId,ProfileId from User where Id = :UserInfo.getUserId()];
		
	}
    
}