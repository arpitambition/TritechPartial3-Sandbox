trigger sumSCAmount on Account (before update) {
     for(Account record: Trigger.new) {
        record.Active_Service_Contract_Value_Rollup__c = null;
     }
     for(AggregateResult result: [SELECT SUM(Contract_Amount__c) Amt, Account.Id Id FROM ServiceContract WHERE Account.Id IN :Trigger.new 
         and (Contract_Status_WMP__c = 'Active' or Contract_Status_WMP__c = 'Emergency Support Only' or Contract_Status_WMP__c = 'Installed Not Live' or Contract_Status_WMP__c = 'Vendor/Partner' or Contract_Status_WMP__c = 'No HW Support, Software Only') GROUP BY Account.Id]) {
         Trigger.newMap.get((Id)result.get('Id')).Active_Service_Contract_Value_Rollup__c = (Decimal)result.get('Amt');
     }
 }