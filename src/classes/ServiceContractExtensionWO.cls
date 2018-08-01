public with sharing class ServiceContractExtensionWO {

  private ServiceContract svcContract {get; set;}
  
  private String serviceContractId {get; set;}

  public ServiceContractExtensionWO(ApexPages.StandardController std) {
    svcContract = (ServiceContract) std.getRecord();
 
    if (svcContract.Id == null) {
      //get the passed in parameter
      serviceContractId = ApexPages.currentPage().getParameters().get('contractID');
    } else {
      //if the record is passed in, use that
      serviceContractId = svcContract.Id;
    }
     
  }
  
  public PageReference createTicketFromServiceContract() {
 
    Case supportTicket = null;
    
    svcContract = [SELECT Id, AccountId FROM ServiceContract WHERE Id = :serviceContractId];
    
    supportTicket = new Case();
 
    supportTicket.Service_Contract_WMP__c = svcContract.Id;
    supportTicket.AccountId = svcContract.AccountId;
    
    
    for(RecordType rt: [Select id From RecordType Where sObjectType = 'Case' AND Name = 'Work Order Ticket' limit 1]){
        supportTicket.RecordTypeId = rt.Id;
    }
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
    ServiceContractExtensionWO sce = new ServiceContractExtensionWO(std);
    
    //sce.createTicketFromServiceContract();
  }
  
}