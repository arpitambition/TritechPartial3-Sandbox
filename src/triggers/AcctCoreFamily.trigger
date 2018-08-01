trigger AcctCoreFamily on Account (before update) {
    
    for(Account a : Trigger.new)
    {
    	if(a.product_family__c <> null)
    	{
    	if((a.product_Family__c.contains('911')||
    		a.product_Family__c.contains('911')||
			a.product_Family__c.contains('EMS')||
			a.product_Family__c.contains('Inform')||
			a.product_Family__c.contains('Omega')||
			a.product_Family__c.contains('PSSI')||
			a.product_Family__c.contains('Tiburon')||
			a.product_Family__c.contains('VisiNet')||
			a.product_Family__c.contains('VisionAIR'))
			&&    	
    		(
    			!a.product_Family__c.contains('ETI')||
				!a.product_Family__c.contains('ETI 911')||
				!a.product_Family__c.contains('IMC')||
				!a.product_Family__c.contains('Impact')||
				!a.product_Family__c.contains('LETG')||
				!a.product_Family__c.contains('Metro')||
				!a.product_Family__c.contains('Zuercher'))
    		)
    		{a.Core_Company__c = 'TriTech';}
    		
    	if((!a.product_Family__c.contains('911')||
    		!a.product_Family__c.contains('911')||
			!a.product_Family__c.contains('EMS')||
			!a.product_Family__c.contains('Inform')||
			!a.product_Family__c.contains('Omega')||
			!a.product_Family__c.contains('PSSI')||
			!a.product_Family__c.contains('Tiburon')||
			!a.product_Family__c.contains('VisiNet')||
			!a.product_Family__c.contains('VisionAIR'))
			&&    	
    		(
    			a.product_Family__c.contains('ETI')||
				a.product_Family__c.contains('ETI 911')||
				a.product_Family__c.contains('IMC')||
				a.product_Family__c.contains('Impact')||
				a.product_Family__c.contains('LETG')||
				a.product_Family__c.contains('Metro')||
				a.product_Family__c.contains('Zuercher'))
    		)
    		{a.Core_Company__c = 'Zuercher';}
    	
    	if((a.product_Family__c.contains('911')||
    		a.product_Family__c.contains('911')||
			a.product_Family__c.contains('EMS')||
			a.product_Family__c.contains('Inform')||
			a.product_Family__c.contains('Omega')||
			a.product_Family__c.contains('PSSI')||
			a.product_Family__c.contains('Tiburon')||
			a.product_Family__c.contains('VisiNet')||
			a.product_Family__c.contains('VisionAIR'))
			&&    	
    		(
    			a.product_Family__c.contains('ETI')||
				a.product_Family__c.contains('ETI 911')||
				a.product_Family__c.contains('IMC')||
				a.product_Family__c.contains('Impact')||
				a.product_Family__c.contains('LETG')||
				a.product_Family__c.contains('Metro')||
				a.product_Family__c.contains('Zuercher'))
    		)
    		{a.Core_Company__c = 'TriTech,Zuercher';}
    	
    }}
    
    
    
    
}