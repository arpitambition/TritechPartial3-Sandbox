trigger tr_case on Case (after delete, after insert, after update, before insert, before update) {
    
    if(trigger.isBefore){
        if(trigger.isInsert){
            boolean isPortalUser = [select name from profile where Id = :UserInfo.getProfileId()].name.Contains('Portal');

            if(isPortalUser){
                CaseExt ce = new CaseExt();
            
                ce.setServiceContract(trigger.new);
                ce.setRecordType(trigger.new);
            }
        }
    } 
    
    if(trigger.isAfter){
    	if(trigger.isInsert || trigger.isUpdate){
    		set <Id> caseIds = new set<Id>();
            	
    		for(Case c: trigger.new){
        		if(c.Send_Email__c == true && (trigger.isInsert || trigger.oldMap.get(c.Id).Send_Email__c == false)){
        			caseIds.add(c.Id);
            	}
        	}
            
        	if(caseIds.size()>0){
        		CaseExt.emailAlert(caseIds);
        	}
    	}
    	
    }    
}