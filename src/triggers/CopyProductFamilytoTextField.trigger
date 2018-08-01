trigger CopyProductFamilytoTextField on Account (before insert, before update) {
for(Account a : trigger.new) {
    System.debug('a: '+a);
    if((a.Product_Family_WMP__c != null || a.Product_Family_WMP__c != '')) {
      
      //copy mailing/billing address
      a.Product_Family__c = a.Product_Family_WMP__c;
      
    }
  }
}