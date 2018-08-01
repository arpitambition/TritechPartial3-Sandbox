global with sharing class FeatureRequestController {
	
	public TabPermissions TabPermission {get; set;}
	public string LastFeatureRequestSortDate {get; set;}
	public static list<case> FeatureReqs {get; set;}
    public string CanSave {get;set;}
	
	public FeatureRequestController(){
		
		TabPermission = new TabPermissions();
		setLastFeatureRequestSortDate();
		CanSave = canSave(); 
	
	}
    
    private void setTabPermission(){
    	TabPermission = new TabPermissions();
    }
    
    @RemoteAction
	global static list<case> getFeatureReqs(){
		
		FeatureReqs = [select Id,CaseNumber,Subject,Status,CreatedDate,Contact.Name,Request_Priority__c,Z_Issue_Type__c,isClosed__c,AccountId from case where isClosed__c = 'false' and Z_Issue_Type__c = 'Feature' order by Request_Priority__c limit 200];
		return FeatureReqs;
	}
	
	@RemoteAction
	global static string updateTickets(list<case> tickets){
		set<Id> accountIds = new set<Id>();
		try{
			for(case c: tickets){
				accountIds.add(c.AccountId);
			}
			update tickets;
			updateLastFeatureRequestDate(accountIds);
		}
		catch(Exception e){
			return e.getMessage();
		}
		return 'success';
	}
	
	private static void updateLastFeatureRequestDate(set<Id> accountIds){
		AccountExtension ae = new AccountExtension();
		ae.updateLastFeatureRequestDate(accountIds);
	}
	
	private void setLastFeatureRequestSortDate(){
		system.debug('The value of portaluser is: '+PortalUser.getAccountId());
		if(PortalUser.getAccountId() <> null){
		Account account = [select id,Last_Feature_Request_Saved__c from Account where Id = :PortalUser.getAccountId() limit 1];
		LastFeatureRequestSortDate = string.valueOf(account.Last_Feature_Request_Saved__c);
		}
	}
    
    private string canSave(){
    	User u = [select profile.name from user where id = :UserInfo.getUserId() limit 1];
    	if(u.profile.name.contains('Read') && u.profile.name.contains('Only')){
    		return 'none';
    	} else {
    		return 'block';
    	}
    }

}