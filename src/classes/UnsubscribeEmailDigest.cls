public without sharing class UnsubscribeEmailDigest {
	
	public string ContactId {get;set;}
	
	public UnsubscribeEmailDigest(){
		
		if(System.currentPageReference().getParameters().get('ContactId') != null){
			ContactId = System.currentPageReference().getParameters().get('ContactId');
		}	
	}
	
	public PageReference DoLoad(){
		try{
			
			for(Contact c : [Select Id,Unsubscribe_Email_Digest__c From Contact Where Id = : ContactId limit 1]){
				c.Unsubscribe_Email_Digest__c = true;
				
				database.update(c, false);
			}
		}
		catch(Exception ex){
			system.debug(ex.getMessage());
		}
		return null;
	}
}