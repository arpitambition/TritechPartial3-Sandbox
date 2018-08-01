/*
** Revision History
** 09/20/2016	Ken Becker Katch Consulting -	Initial Creation 
**
**
*/

trigger tr_Account on Account (after insert, after update, before delete, before insert, before update) {
	
	if(trigger.isBefore){
		if(trigger.isInsert){
			Account_c account_c = new Account_c();
			list<Account> accts = new list<Account>();
			
			accts = account_c.rollupSwornOfficerCount(trigger.new);
			
			for(Integer i=0; i<trigger.new.size(); i++){
				if(accts[i].ParentId == null){
					trigger.new[i].CAD_Parent_Total_Sworn_Officers__c = accts[i].CAD_Parent_Total_Sworn_Officers__c;
				}
				i++;
			}
			for(Integer j=0; j<trigger.new.size(); j++){
				if(accts[j].ParentId == null){
					trigger.new[j].CAD_Parent_Fire_EMS_Users__c = accts[j].CAD_Parent_Fire_EMS_Users__c;
				}
				j++;
			}
			for(Integer j=0; j<trigger.new.size(); j++){
				if(accts[j].RMS_Parent_Account__c == null){
					trigger.new[j].RMS_Parent_Account__c = accts[j].RMS_Parent_Account__c;
				}
				j++;
			}
			for(Integer j=0; j<trigger.new.size(); j++){
				if(accts[j].X911_Parent_Account__c == null){
					trigger.new[j].X911_Parent_Account__c = accts[j].X911_Parent_Account__c;
				}
				j++;
			}
			
			
		}
		

		
		if(trigger.isUpdate){
			list<Account> accts;
			//Account_c account_c = new Account_c();
			
			Account_c.rollupSwornOfficerCount(trigger.newMap,trigger.oldMap,false);
			Account_c.rollup911SwornOfficerCount(trigger.newMap,trigger.oldMap,false);
			Account_c.rollupRMSSwornOfficerCount(trigger.newMap,trigger.oldMap,false);
            
		}		
		
	}
	
	if(trigger.isAfter){
		if(trigger.isInsert){
			map<Id,Account>accts = new map<Id,Account>();
			//Account_c account_c = new Account_c();
			for(Account a: trigger.new){
				if(a.ParentId <> null){
					accts.put(a.Id,a);
				}
			}
			
			list<Account> accounts = new list<Account>();
			//Account_c.rollupSwornOfficerCount(accts,accts,true);
			//Account_c.rollup911SwornOfficerCount(accts,accts,true);
			//Account_c.rollupRMSSwornOfficerCount(accts,accts,true);
		}
	}
    
}