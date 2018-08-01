//author: Mohan (Navivo)
//Date: 10-10-2013
trigger auPotentialDefectTrigger on Potential_Defect__c (after update) {
	Set<Id> pIds = new Set<Id>();
	for(Potential_Defect__c p : trigger.new) {
		Potential_Defect__c oldValue = trigger.oldMap.get(p.Id);
		if(p.Ticket_Status__c <> oldValue.Ticket_Status__c) pIds.add(p.Id);
	}
	
	if(pIds.size() > 0) {
		List<Case> caseList = [Select Id, DefectStatus__c, Potential_Defect__c From Case Where Potential_Defect__c IN :pIds];
		if(caseList.size() > 0) {
			Map<Id, Potential_Defect__c> pdMap = trigger.newMap;
			for(Case c : caselist) {
				c.DefectStatus__c = pdMap.get(c.Potential_Defect__c).Ticket_Status__c;
			}
			update caseList;
		}
		
	}
}