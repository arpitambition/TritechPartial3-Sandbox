trigger OppLineItem on OpportunityLineItem (before insert, before update) {
    for(OpportunityLineItem oli :trigger.new)
     {
       if(oli.Modified_Quantity__c <> 0 && oli.Modified_quantity__c != NULL)
       	oli.quantity = oli.Modified_Quantity__c;
     }
}