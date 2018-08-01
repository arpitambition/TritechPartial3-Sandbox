trigger ClearOpportunityApprovalFields on Opportunity (Before Insert) {
 
  
  for(Opportunity  p : trigger.new){
    
    p.Last_Rejection_Date__c = null;
    p.Last_Approval_Date__c = null;
    p.Most_Recent_Approval_Level__c = null;
    p.INTERNAL_Note_to_Approvers__c = null;
    p.Quote_Number__c = null;
    p.Sales_Order_Number__c = null;
    p.Purchase_Order_Number__c = null;
    p.Purchase_Order_Date__c = null;
  }
  
}