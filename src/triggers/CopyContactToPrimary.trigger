trigger CopyContactToPrimary on Opportunity (before insert, before update) {
for(Opportunity o : trigger.new) {
    System.debug('o: '+o);
    if(o.Primary_Quote_Contact__c == null) {
      
      //copy mailing/billing address
      o.Primary_Quote_Contact__c = o.Contact__c;
      
    }
  }
}