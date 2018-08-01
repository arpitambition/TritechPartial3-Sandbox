public class CreateServiceTicketController {
	
    public List<PortalContract> PortalContracts {get;set;}
    public User CurrentUser {get; set;}
    public Contact CurrentContact {get; set;}
    
    public CreateServiceTicketController(){
    	setCurrentUser();
    	setCurrentContact();
    	setPortalContracts();
    }
    
    
    private void setCurrentUser(){

    	User u = new User(Id=UserInfo.getUserId());
    	CurrentUser = [Select Id,Name,Email,Phone,Title,ContactId,Profile.Name From User Where Id = :u.Id limit 1];
    }
    private void setCurrentContact(){

    	//Contact c = new Contact(Id=CurrentUser.ContactId);
    	CurrentContact = [Select Id, AccountId From Contact Where Id = :CurrentUser.ContactId limit 1];
    	
    }
    
    private void setPortalContracts(){

    	list <ServiceContract> serviceContracts = new list <ServiceContract>();
    	serviceContracts = [Select s.Id,s.Status, s.Contract_Status_WMP__c,s.AccountId, s.name, s.Contract_Type__c From ServiceContract s 
    						Where Contract_Status_WMP__c IN ('Active','Installed Not Live','Renewal Due','No HW Support, Software Only') AND AccountId =:CurrentContact.AccountId];

    	list<PortalContract>pContracts = new list<PortalContract>();
    	for(ServiceContract sc: serviceContracts){
    		
        	PortalContract pc = new PortalContract();
            pc.Name = sc.name == null?'':sc.name; 
            pc.contractType = sc.Contract_Type__c == null?'':sc.Contract_Type__c;
            pc.Id = sc.Id;
            pc.setLandingPage(sc.Contract_Type__c == null?'':sc.Contract_Type__c);
            pc.Status = sc.Status;
            pc.ContractStatus = sc.Contract_Status_WMP__c;
            pContracts.add(pc);                        	
        }
        PortalContracts = pContracts;
    }
    
	
	 class PortalContract{
    	public string Name {get; set;}
    	public string ContractType {get; set;}
    	public string Id {get; set;}
    	public string LandingPage {get; set;}
    	public string Status {get; set;}
    	public string ContractStatus {get; set;}
    	
    	
    	public void setLandingPage(string ct){
    		map<string,string> landingPages = new map<string,string>();
    		
    		for(Support_Ticket_Settings__c rt : Support_Ticket_Settings__c.getAll().values()){
    			LandingPages.put(rt.Contract_Type__c,rt.Landing_Page__c);
			}
			
			if(!landingPages.containsKey(ct)){
				LandingPage = landingPages.get('Default');
			}
			else{
				LandingPage = landingPages.get(ct);
			}
		}
		   
    }
    
}