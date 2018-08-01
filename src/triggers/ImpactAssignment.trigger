trigger ImpactAssignment on Case (before update) {

	  
	  
	  list<Id> new1 = new List<Id>();
	  list<Id> old1 = new List<Id>();
	  list<Id> str1 = new List<Id>();
	  list<Id> str3 = new List<Id>();
	  
	  for(Case cold : Trigger.old){
	  	old1.add(cold.ownerid);
	  }
	  
	  queuesobject que = [select queueid from queueSObject where queue.name like 'Impact Support - Tier 1'];
	  Id str = que.queueId;
	  str1.add(str);
	  queuesobject que2 = [select queueid from queueSObject where queue.name like 'Impact Support - Tier 2'];
	  Id str2 = que2.queueId;
	  str3.add(str2);
	  
      for(Case co : Trigger.new){
      		new1.add(co.ownerid);
      }
      
	  	     
	For(Case c : Trigger.new)
	{
		
		
		if((old1 != new1) && (c.ownerid == str))
		{
			c.Impact_Tier_1__c = datetime.now();
            c.Impact_Internal_1__c = NULL;
		}
		if((old1 != new1) && (c.ownerid == str2))
		{
			c.Impact_Tier_2__c = datetime.now();
            c.Impact_Internal_2__c = NULL;
		}
		if(c.Ticket_Owner_Email__c <> null){
		if(old1 == str1  && c.Ticket_Owner_Email__c.contains('zuerchertech'))
		{
			c.Impact_Internal_1__c = datetime.now();
            
		}
		if(old1 == str3  && c.Ticket_Owner_Email__c.contains('zuerchertech'))
		{
			c.Impact_Internal_2__c = datetime.now();
            
		}
		}
	}
            
}