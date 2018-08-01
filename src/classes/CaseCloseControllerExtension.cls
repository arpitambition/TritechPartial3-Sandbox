public with sharing class CaseCloseControllerExtension {
	
    public case cs;
 	public string Status{get; set;}
    public list<SelectOption> StatusList{get; set;} 
	
	public CaseCloseControllerExtension(ApexPages.StandardController stdController){
        
        this.cs = (case)stdController.getRecord();
        
        setStatus();
	}  

	private void setStatus(){
        if(this.cs.RecordTypeId != null) {
            String recTypeName = [Select Id, Name from RecordType where sObjectType = 'Case' and Id =: this.cs.RecordTypeId].Name;
            if(recTypeName == 'Zuercher Customer Support Ticket'){
                cs.Status = 'Customer Initiated Closure';
                setStatusList('Customer Initiated Closure');
            } else if (recTypeName == 'Customer Support Ticket'){
                cs.Status = 'Closed';
                setStatusList('Closed');
            } else if(recTypeName == 'Cross Support Ticket') {
                cs.Status = 'Customer Initiated Closure';
                setStatusList('Customer Initiated Closure');
            }
        }
	}
    
    private void setStatusList(string s){
        list<SelectOption> statuses = new list<SelectOption>();
        	statuses.add(new SelectOption(s,s));
        StatusList = statuses;
        Status=s;
    }
}