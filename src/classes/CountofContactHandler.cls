public class CountofContactHandler {
    public static void updateCountOnOpportunity(Boolean isBefore, Boolean isUpdate, List<Opportunity> newList) {
        try {
            if(isBefore && isUpdate) {
                Set<Id> setOppId = new Set<Id>();
                Map<String, Decimal> mapOppContactRoleCount = new Map<String, Decimal>();
                for(Opportunity opp : newList) {
                    setOppId.add(opp.Id);
                }// End of for(Opportunity opp : newList)
                
                if(setOppId.size() > 0) {
                    List<OpportunityContactRole> listOppContactRole = [Select Id, OpportunityId from OpportunityContactRole where OpportunityId =: setOppId];
                    
                    // Adding of if condition is empty
                    if(!listOppContactRole.isEmpty()) {
                        Decimal count = 0.00;
                        for(OpportunityContactRole oppConRole : listOppContactRole) {
                            if(mapOppContactRoleCount.containsKey(oppConRole.OpportunityId)) {
                                count = mapOppContactRoleCount.get(oppConRole.OpportunityId) + 1;
                            } else {
                                count = 1.00;
                            }
                            mapOppContactRoleCount.put(oppConRole.OpportunityId, count);
                            
                        }//End of for(OpportunityContactRole oppConRole : listOppContactRole)
                        
                        for(Opportunity opp : newList) {
                            if(mapOppContactRoleCount.containsKey(opp.Id)) opp.Count_of_Contacts__c = mapOppContactRoleCount.get(opp.Id);
                        }
                    }// End of if(!listOppContactRole.isEmpty())
                }// End of if(setOppId.size() > 0)
            }//End of if(isBefore && isUpdate)         
        } catch(Exception e) {
            System.debug('Exception:'+e.getMessage());
        }
    }
}