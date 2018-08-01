global class SupportTicketService {

  //creates a new potential defect case based on the passed in customer support ID
  WebService static String createPotentialDefectTicket(String supportTicketID) {
    
    System.debug('createPotentialDefectTicket: supportTicketID [' + supportTicketID + ']');
        
    //retrieve the existing defect fields
    Case customerSupportTicket = [SELECT Id, ProductId, Product_Group__c, Occurrence__c, Severity__c, Product_Sub_Module__c, Patch_Requested_Date_Time__c,AccountId, ContactId, Subject, Description, Priority, Original_Customer__c, Short_Issue_Summary_WMP__c, Occured_After_Upgrade_WMP__c, Reproducible_WMP__c, Black_Box_Log_Collected__c, Reported_Major_Version_WMP__c, Reported_Minor_Version__c, Reported_Patch_WMP__c, Environment_Type__c, Service_Contract_WMP__c, Steps_to_Recreate_Issue_WMP__c, Client_Steps_to_Recreate_Issue__c FROM Case WHERE Id = :supportTicketID];
    
    System.debug('createPotentialDefectTicket: Retrieved case ['+ customerSupportTicket + ']');
    
    //create the new potential defect ticket and populate the necessary fields
    Potential_Defect__c potentialDefect = new Potential_Defect__c();
    
    //set the fields that should be populated when the user first looks at the page
    potentialDefect.Product__c = customerSupportTicket.ProductId;
    potentialDefect.Product_Sub_Module__c = customerSupportTicket.Product_Sub_Module__c;
    potentialDefect.Name = customerSupportTicket.Subject;
    potentialDefect.Product_Group_1__c = customerSupportTicket.Product_Group__c;
    potentialDefect.Description__c = customerSupportTicket.Description;
    potentialDefect.Original_Customer__c = customerSupportTicket.AccountId;
    potentialDefect.Severity__c = customerSupportTicket.Severity__c;
    potentialDefect.Occurrence__c = customerSupportTicket.Occurrence__c;
    potentialDefect.Original_Service_Contract__c = customerSupportTicket.Service_Contract_WMP__c;
    potentialDefect.Original_Contact__c = customerSupportTicket.ContactId;
    potentialDefect.Short_Issue_Summary__c = customerSupportTicket.Short_Issue_Summary_WMP__c;
    potentialDefect.Occurred_After_Upgrade__c = customerSupportTicket.Occured_After_Upgrade_WMP__c;
    potentialDefect.Reproducible__c = customerSupportTicket.Reproducible_WMP__c;
    potentialDefect.Black_Box_Collected__c = customerSupportTicket.Black_Box_Log_Collected__c;
    potentialDefect.Reported_Major_Version__c = customerSupportTicket.Reported_Major_Version_WMP__c;
    potentialDefect.Reported_Minor_Version__c = customerSupportTicket.Reported_Minor_Version__c;
    potentialDefect.Reported_Patch__c = customerSupportTicket.Reported_Patch_WMP__c;
    potentialDefect.Environment_Type__c = customerSupportTicket.Environment_Type__c;
    potentialDefect.Steps_to_Recreate_Issue__c = customerSupportTicket.Client_Steps_to_Recreate_Issue__c;
    potentialDefect.Internal_Steps_to_Recreate_Issue__c = customerSupportTicket.Steps_to_Recreate_Issue_WMP__c;
    potentialDefect.Customer_Contact_Date_Time__c = customerSupportTicket.Patch_Requested_Date_Time__c;
    
    
    //map the support ticket priority (P1 - P5) to a numerical value
    System.debug('createPotentialDefectTicket: customerSupportTicket.Priority ['+ customerSupportTicket.Priority + ']');
    if (customerSupportTicket.Priority != null) {
      if (customerSupportTicket.Priority.startsWith('P1') == true) {
        potentialDefect.Priority__c = '1';
      } else if (customerSupportTicket.Priority.startsWith('P2') == true) {
        potentialDefect.Priority__c = '2';
      } else if (customerSupportTicket.Priority.startsWith('P3') == true) {
        potentialDefect.Priority__c = '3';
      } else if (customerSupportTicket.Priority.startsWith('P4') == true) {
        potentialDefect.Priority__c = '4';
      } else if (customerSupportTicket.Priority.startsWith('P5') == true) {
        potentialDefect.Priority__c = '5';
      }
    }

    insert potentialDefect;
    //System.debug('createPotentialDefectTicket: Created potential defect ticket ['+ potentialDefect + ']');
    //****************************************************************************************************************
    List<List<Id>> batches = new List<List<Id>>();
    List<Integer> batchSizes = new List<Integer>();
    
    for(Attachment attachment : [SELECT Id, BodyLength from Attachment WHERE ParentId =: supportTicketID]) { 
        Boolean batched = false;
    
        for(Integer i = 0; i < batches.size(); i++){
            Integer batchSize = batchSizes[i];
    
            if(batchSize + attachment.BodyLength < 10000000){
                batches[i].add(attachment.Id);
                batchSizes[i] += attachment.BodyLength;
                batched = true;
                break;
            }
        }
    
        if(!batched){
            batches.add(new List<Id>{attachment.Id});
            batchSizes.add(attachment.BodyLength);
        }
    
        System.debug('>>>first loop heap=' + Limits.getHeapSize());
    }
    System.debug('>>> Batches ' + batches);
    for(List<Id> batchIds : batches){
        List<Attachment> attachmentsToInsert = new List<Attachment>();
    
        for(Attachment attachment : [SELECT Name, Body FROM Attachment WHERE Id IN :batchIds]){
            attachmentsToInsert.add(new Attachment(Name = attachment.Name, Body = attachment.Body, ParentId = potentialDefect.id));
        }
    
        System.debug('>>> second loop heap=' + Limits.getHeapSize());
        insert attachmentsToInsert;
        System.debug('>>> Attachment Ids:' + attachmentsToInsert[0].Id);
    }
    //****************************************************************************************************************
/*    
    //copy the attachments from the ticket to the potential defect - these will exist on both objects
    List<Attachment> ticketAttachments = [SELECT Id, Name, Body FROM Attachment WHERE ParentId = :supportTicketID];
    System.debug('createPotentialDefectTicket: Retrieved attachments ['+ ticketAttachments + ']');
    
    List<Attachment> defectAttachments = new List<Attachment>();
    for (Attachment tkAttachment : ticketAttachments) {
      System.debug('createPotentialDefectTicket: Cloning attachment ['+ tkAttachment.Id + ']');
      Attachment defectAttachment = new Attachment();
      //clone the existing attachment and don't preserve the ID, it's not a deep clone, preserve readonly timestamps, and don't preserve auto-number
      defectAttachment = tkAttachment.Clone(false, false, true, false);
      defectAttachment.Body = tkAttachment.Body;
      defectAttachment.Name = tkAttachment.Name;
      defectAttachment.ParentId = potentialDefect.Id;
      
      defectAttachments.add(defectAttachment);
    }
    insert defectAttachments;
  */
    //set the defect on the original customer support ticket 
    customerSupportTicket.Potential_Defect__c = potentialDefect.Id;
    update customerSupportTicket;
    
    //return the newly created potential defect ticket ID so the user will be sent to that page
    return potentialDefect.Id;
 }
 
 /************
 *TEST Cases
 ************/
 static testMethod void testCreatePotentialDefectTicket(){
    Case customerSupportTicket = new Case();
    
    //Product2 prdct = [SELECT Id, Name FROM Product2 LIMIT 1];
    Product2 prdct = new Product2();
    prdct.Name = 'test prod';
    prdct.IsActive = true;
    prdct.Supportable__c = true;
    insert prdct;
    
    customerSupportTicket.ProductId = prdct.Id;
    customerSupportTicket.Short_Issue_Summary_WMP__c = 'Error when creating new product';
    customerSupportTicket.Priority = 'P2';
    customerSupportTicket.Subject = 'Issue with new product';
    customerSupportTicket.Occured_After_Upgrade_WMP__c = true;
    customerSupportTicket.Reported_Major_Version_WMP__c = '5.9';

    insert customerSupportTicket;
    
    Attachment a = new Attachment();
    a.ParentId = customerSupportTicket.Id;
    a.name = 'Temp Ticket Attachment';
    a.Body = Blob.valueOf('Test Data');
    insert a;

    String potentialDefectId = createPotentialDefectTicket(customerSupportTicket.Id);
    System.debug('testcreatePotentialDefectTicket: Retrieved potential defect ID ['+ potentialDefectId + ']');

    Potential_Defect__c potentialDefect = [SELECT Id, Product__r.Name, Short_Issue_Summary__c, Priority__c, Occurred_After_Upgrade__c FROM Potential_Defect__c WHERE Id = :potentialDefectId];

    customerSupportTicket = [SELECT Id, Potential_Defect__c FROM Case WHERE Id = :customerSupportTicket.Id];
    //ensure the orignal support ticket is updated with the proper potential defect
    System.assertEquals(customerSupportTicket.Potential_Defect__c, potentialDefect.Id);
    
    //ensure the potential defect was created with the proper values
    System.assertEquals(potentialDefect.Product__r.Name, prdct.Name);
    System.assertEquals(potentialDefect.Short_Issue_Summary__c, 'Error when creating new product');
    System.assertEquals(potentialDefect.Priority__c, '2');
    System.assertEquals(potentialDefect.Occurred_After_Upgrade__c, true);
    
 }

}