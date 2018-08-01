public with sharing class ServiceContractExtension {

  private ServiceContract svcContract {get; set;}
  
  private String serviceContractId {get; set;}

  public ServiceContractExtension(ApexPages.StandardController std) {
    svcContract = (ServiceContract) std.getRecord();
    system.debug('ServiceContractExtension: svcContract [' + svcContract.Id + ']');
    
    if (svcContract.Id == null) {
      //get the passed in parameter
      serviceContractId = ApexPages.currentPage().getParameters().get('contractID');
    } else {
      //if the record is passed in, use that
      serviceContractId = svcContract.Id;
    }
    
    system.debug('ServiceContractExtension: serviceContractId [' + serviceContractId + ']');
  }
  
  public PageReference createTicketFromServiceContract() {
    system.debug('createTicketFromServiceContract: Creating support ticket from service contract [' + serviceContractId + ']');
    Case supportTicket = null;
    
    svcContract = [SELECT Id, AccountId,Zuercher_Suite_Version__c, Account_Support_Team_WMP__c,Contract_Type__c FROM ServiceContract WHERE Id = :serviceContractId];
    ID rtIdZ = [Select Id from RecordType where Name = 'Zuercher Customer Support Ticket'].Id;
    ID rtIdT = [Select Id from RecordType where Name = 'Customer Support Ticket'].Id;
    ID rtFO = [Select Id from RecordType where Name = 'Cross Support Ticket'].Id;
    
    supportTicket = new Case();
    //populate the values from the service contract
    supportTicket.Service_Contract_WMP__c = svcContract.Id;
    supportTicket.AccountId = svcContract.AccountId;
    if(((svcContract.Account_Support_Team_WMP__c == 'Zuercher')||(svcContract.Account_Support_Team_WMP__c == 'LETG')||(svcContract.Account_Support_Team_WMP__c == 'Metro')||(svcContract.Account_Support_Team_WMP__c == 'ETI')||(svcContract.Account_Support_Team_WMP__c == 'Impact'))&& svcContract.Contract_Type__c != 'Field Ops')
    {
        supportTicket.RecordTypeId = rtIdZ;
        supportTicket.Reported_Major_Version_WMP__c = svcContract.Zuercher_Suite_Version__c;
    }
    if(((svcContract.Account_Support_Team_WMP__c != 'Zuercher')&&(svcContract.Account_Support_Team_WMP__c != 'LETG')&&(svcContract.Account_Support_Team_WMP__c != 'Metro')&&(svcContract.Account_Support_Team_WMP__c != 'ETI')&&(svcContract.Account_Support_Team_WMP__c != 'Impact'))&& svcContract.Contract_Type__c != 'Field Ops')
        supportTicket.RecordTypeId = rtIdT;
    if(svcContract.Contract_Type__c == 'Field Ops')
        supportTicket.RecordTypeId = rtFO;
    system.debug('createTicketFromServiceContract: Created support ticket [' + supportTicket + ']');
    
    insert supportTicket;
    
    PageReference ticketEditPage = new ApexPages.Standardcontroller(supportTicket).edit();
    
    ticketEditPage.getParameters().put('retURL', supportTicket.Id);

    //navigate to the ticket in edit mode
    return ticketEditPage;
  }
  
  @IsTest
  public static void testCreateTicket() {
    ServiceContract sc = new ServiceContract();
    sc.Name = 'Test Service Contract';
    insert sc;
    
    ApexPages.standardController std = new ApexPages.standardController(sc);
    ServiceContractExtension sce = new ServiceContractExtension(std);
    
    sce.createTicketFromServiceContract();
  }
  
}