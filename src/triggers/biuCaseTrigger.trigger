//author: Mohan (Navivo)
//Date: 10-10-2013
trigger biuCaseTrigger on Case (before insert, before update) {
	
	Set<Id> pIds = new Set<Id>();
	for(Case c : trigger.new) {
		if(trigger.isInsert && c.Potential_Defect__c != null) pIds.add(c.Potential_Defect__c);
		if(trigger.isUpdate) {
			Case oldValue = trigger.oldMap.get(c.Id);
			if(c.Potential_Defect__c <> oldValue.Potential_Defect__c && c.Potential_Defect__c != null) pIds.add(c.Potential_Defect__c);
			if(c.Potential_Defect__c <> oldValue.Potential_Defect__c && c.Potential_Defect__c == null) {
				c.DefectStatus__c = null;
				c.DefectNumber__c = null;
			}
		}
	}
	 
	if(pIds.size() > 0) {
		Map<Id, Potential_Defect__c> pdMap = new Map<Id, Potential_Defect__c>([Select Id, Defect_Ticket_ID__c, Ticket_Status__c 
																				From Potential_Defect__c Where Id IN :pIds]);
		for(Case c : trigger.new) {
			Boolean setPDValues = false;
			if(trigger.isInsert && c.Potential_Defect__c != null) setPDValues = true;
			if(trigger.isUpdate) {
				Case oldValue = trigger.oldMap.get(c.Id);
				if(c.Potential_Defect__c <> oldValue.Potential_Defect__c && c.Potential_Defect__c != null) setPDValues = true;
			}
			if(setPDValues) {
				Potential_Defect__c pd = pdMap.get(c.Potential_Defect__c);
				if(pd != null) {
					c.DefectStatus__c = pd.Ticket_Status__c;
					c.DefectNumber__c = pd.Defect_Ticket_ID__c;
				}
			}
		}
	}
}