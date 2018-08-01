public with sharing class CaseControllerExtension {

    public string caseNumber{get; set;}
    public string contactName{get; set;}
    public string recordTypeName{get; set;}
    
    private final case cs;  

    
    public CaseControllerExtension(ApexPages.StandardController stdController){
        this.cs = (case)stdController.getRecord();
        setContractProperties();
        setCaseNumber();
        setContactName();
    }
    
    private void setContractProperties(){
        cs.SCID__c = ApexPages.currentPage().getParameters().get('00N56000000aq9v');
        cs.SCTY__c = ApexPages.currentPage().getParameters().get('00N56000000aqLc');
        
        if(cs.SCID__c != null) {
            //Adding code for portal user
            ServiceContract svcContract = [SELECT Id, AccountId, Zuercher_Suite_Version__c, Account_Support_Team_WMP__c,Contract_Type__c FROM ServiceContract WHERE Id = :cs.SCID__c];
            ID rtIdZ = Schema.SObjectType.Case.getRecordTypeInfosByName().get('Zuercher Customer Support Ticket').getRecordTypeId();
            ID rtIdT = Schema.SObjectType.Case.getRecordTypeInfosByName().get('Customer Support Ticket').getRecordTypeId();
            ID rtFO = Schema.SObjectType.Case.getRecordTypeInfosByName().get('Cross Support Ticket').getRecordTypeId();
            
            if(((svcContract.Account_Support_Team_WMP__c == 'Zuercher')||(svcContract.Account_Support_Team_WMP__c == 'LETG')||(svcContract.Account_Support_Team_WMP__c == 'ETI')||(svcContract.Account_Support_Team_WMP__c == 'Impact'))&& svcContract.Contract_Type__c != 'Field Ops') {
            	cs.RecordTypeId = Schema.SObjectType.Case.getRecordTypeInfosByName().get('Zuercher Customer Support Ticket').getRecordTypeId();
            	recordTypeName = Schema.SObjectType.Case.getRecordTypeInfosByName().get('Zuercher Customer Support Ticket').getName();
            	cs.Reported_Major_Version_WMP__c = svcContract.Zuercher_Suite_Version__c;
            }
            if(((svcContract.Account_Support_Team_WMP__c != 'Zuercher')&&(svcContract.Account_Support_Team_WMP__c != 'LETG')&&(svcContract.Account_Support_Team_WMP__c != 'ETI')&&(svcContract.Account_Support_Team_WMP__c != 'Impact'))&& svcContract.Contract_Type__c != 'Field Ops') {
                cs.RecordTypeId = Schema.SObjectType.Case.getRecordTypeInfosByName().get('Customer Support Ticket').getRecordTypeId();
                recordTypeName = Schema.SObjectType.Case.getRecordTypeInfosByName().get('Customer Support Ticket').getName();
            }
            if(svcContract.Contract_Type__c == 'Field Ops') {
                cs.RecordTypeId = Schema.SObjectType.Case.getRecordTypeInfosByName().get('Cross Support Ticket').getRecordTypeId();
                recordTypeName = Schema.SObjectType.Case.getRecordTypeInfosByName().get('Cross Support Ticket').getName();
            }
            //End of Adding code for portal user
        } else {
            recordTypeName = [Select Id, Name from RecordType where Id =: this.cs.RecordTypeId].Name;
        }
        
	
        //cs.Contact = cs.Contact == null?new Contact(Id=Id.valueOf(ApexPages.currentPage().getParameters().get('cas3_lkid'))):cs.Contact;
        cs.Origin = 'Customer Portal';
    }
    
    private void setCaseNumber(){
        caseNumber = cs.CaseNumber == null? 'Pending' : cs.CaseNumber;
    }
    
    private void setContactName(){
        contactName = cs.Contact.Name == null ? UserInfo.getName() : cs.Contact.Name;
	        System.debug('cs****'+cs);
    }
}