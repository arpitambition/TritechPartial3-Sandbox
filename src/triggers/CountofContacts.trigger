trigger CountofContacts on Opportunity (before update) {
    CountofcontactHandler.updateCountOnOpportunity(trigger.isBefore, trigger.isUpdate, trigger.new);
    /*
	for(Opportunity opp : trigger.new)
	{
		string cId = opp.Id;
		List<Opportunity> cDet = [Select Id from Opportunity where Id = :cId];
		AggregateResult[] ct = [Select count(Id) from OpportunityContactRole where OpportunityId = :cDet];
		opp.Count_of_Contacts__c = (Integer)ct[0].get('expr0');		
		
	}
	*/
 }