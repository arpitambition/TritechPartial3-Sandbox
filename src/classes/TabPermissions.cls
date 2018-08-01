/*************************************************************************
**	Class user for custom permissions to App Tabs for use with
**	customer portal 
**
**	Revision History
**	7/24/2016	Ken Becker (Katch Consulting) Initial Development 
**
**************************************************************************/

public without sharing class TabPermissions {
	
	public string RoundTable {get; set;}
	public string MyPerform {get; set;}
	public string RespondEMS {get; set;}
	public string FeatureRequest {get; set;}	
	public string Contact_c {get; set;}
	public string Report_c {get; set;}
	public string Ticket_c {get; set;}
	public integer IntPermission {get; set;}
	
	private map<string,CustomPermissions__c> TabPermissionByProduct{get; set;}
	private map<string,CustomPermissions__c> TabPermissionByProfile{get; set;}
	private list <string> ContractTypes {get; set;}
	private Account Acct {get; set;}
	private Contact Cnct {get; set;}
	private User CurrentUser {get; set;}
	
	public TabPermissions(){
		
		setTabPermissionByProduct();
		setCurrentUser();
		setCnct();
		setAcct();
		setContractTypes();
		
		
		RoundTable = 'none';
		MyPerform = 'none';
		RespondEMS = 'none';
		FeatureRequest = 'none';
		Contact_c = 'none';
		Report_c = 'none';
		Ticket_c = 'none';
		IntPermission = 0;
		
	
		setRoundTable();
		setMyPerform();
		setRespondEMS();
		setFeatureRequest();
		setContact();
		setReport();
		setTicket();
		 
	}
	
	private void setRoundTable() {
		
		try{
			for(string ct: ContractTypes){
				Integer t = 1 & Integer.valueOf(TabPermissionByProduct.get(ct).Tab_Setting__c);
				if(t == 1){
					RoundTable = 'block';
					IntPermission +=1;
					break;
				}
			}
		}
		catch(Exception e){
			system.debug('Error Caught: TabPermissions.setRoundTable() '+e); 
		}		
	}
	
	private void setMyPerform() {
		
		try{
			for(string ct: ContractTypes){
				Integer t = 2 & Integer.valueOf(TabPermissionByProduct.get(ct).Tab_Setting__c);
				if(t == 2){
					MyPerform = 'block';
					IntPermission +=2;
					break;
				}
			}
		}
		catch(Exception e){
			system.debug('Error Caught: TabPermissions.setMyPerform() '+e);
		}		
	}
	
	private void setRespondEMS() {
		
		try{
			for(string ct: ContractTypes){
				Integer t = 4 & Integer.valueOf(TabPermissionByProduct.get(ct).Tab_Setting__c);
				if(t == 4){
					RespondEMS = 'block';
					IntPermission +=4;
					break;
				}
			}
		}
		catch(Exception e){
			system.debug('Error Caught: TabPermissions.setRespondEMS() '+e);
		}		
	}
	
	private void setFeatureRequest() {
		
		try{
			for(string ct: ContractTypes){
				Integer t = 136 & (Integer.valueOf(TabPermissionByProduct.get(ct).Tab_Setting__c) + Integer.valueOf(TabPermissionByProfile.get(UserInfo.getProfileId()).Tab_Setting__c));
				if(t == 136){
					FeatureRequest = 'block';
					IntPermission +=136;
					break;
				}
			}
		}
		catch(Exception e){
			system.debug('Error Caught: TabPermissions.setFeatureRequests() '+e);
		}	
	}
	
	private void setContact() {
		
		try{
			Integer t = 16 & Integer.valueOf(TabPermissionByProfile.get(UserInfo.getProfileId()).Tab_Setting__c);
			if(t == 16){
				Contact_c = 'block';
					IntPermission +=16;
			}
		}
		catch(Exception e){
			system.debug('Error Caught: TabPermissions.setContact() '+e);
		}	
	}
	
	private void setReport() {
		
		try{
				Integer t = 32 & Integer.valueOf(TabPermissionByProfile.get(UserInfo.getProfileId()).Tab_Setting__c);
				if(t == 32){
					Report_c = 'block';
					IntPermission +=32;
				}
		}
		catch(Exception e){
			system.debug('Error Caught: TabPermissions.setReport() '+e);
		}	
	}
	
	private void setTicket() {
		
		try{
				Integer t = 64 & Integer.valueOf(TabPermissionByProfile.get(UserInfo.getProfileId()).Tab_Setting__c);
				if(t == 64){
					Report_c = 'block';
					IntPermission +=64;
				}
		}
		catch(Exception e){
			system.debug('Error Caught: TabPermissions.setTicket() '+e);
		}	
	}
	

	private void setTabPermissionByProduct() {
					
		TabPermissionByProduct = new map <string,CustomPermissions__c>();
		TabPermissionByProfile = new map <string,CustomPermissions__c>();
    		
    		for(CustomPermissions__c t : CustomPermissions__c.getAll().values()){
    			if(t.Product_Family__c != null){
    				TabPermissionByProduct.put(t.Product_Family__c.toLowerCase(),t);
    			} 
    			if (t.Profile_Id__c != null){
    				TabPermissionByProfile.put(t.Profile_Id__c,t);
    			}
			}
	}
	
	private void setCurrentUser(){
		CurrentUser = [select Id,name,ContactId,ProfileId from User where Id = :UserInfo.getUserId()];
		
	}
	
	private void setCnct(){
		try{
			Cnct = [select Id,Name,AccountID from Contact where Id = :CurrentUser.ContactId];
		}
		catch(Exception e){
			system.debug('Error Caught: TabPermissions.SetCnct() '+e);
		}
	}
	
	private void setAcct (){
		try{
			Acct = new Account(Id = Cnct.AccountId);
		}
		catch(Exception e){
			system.debug('Error Caught: TabPermissions.SetAcct() '+e);
		}	
	}
	
	private void setContractTypes(){
		
		ContractTypes = new list<string>();

		try{
			for(ServiceContract sc: [Select Id,Product_Family_WMP__c From ServiceContract
	    						Where Contract_Status_WMP__c IN ('Active','Installed Not Live','Renewal Due','No HW Support, Software Only') AND AccountId =:Acct.Id]){			
				ContractTypes.add(sc.Product_Family_WMP__c.toLowerCase());
			}
		}
		catch(Exception e){
			system.debug('Error Caught: TabPermissions.SetContractTypes() '+e);
		}

	}

}