trigger UpdateSwornPersonnel on Account (after insert, after update, before insert, before update ) {  
set<Id> ParentIds = new set<Id>(); 
set<Id> ParIds = new set<Id>();

List<Account> parentObjList = new List<Account>(); 
For (Account a : Trigger.new){
    if(a.ParentId != null)
        ParentIds.add(a.ParentId);
    ParIds.add(a.Id);
}

List<Account> lstAcc = [Select Number_of_Sworn_Personnel_WMP__c, Id,ParentId from Account 
                        where ((ParentId != null AND ParentId in :ParentIds) OR 
                               (Id != null AND Id in :ParentIds) OR 
                               (ParentId != null AND ParentId in :ParIds) OR 
                               (Id != null AND Id = :ParIds))
                        AND Number_of_Sworn_Personnel_WMP__c != null];

if(trigger.isBefore){
    
    for(Account a : Trigger.new){
        if(a.ParentId == null){
            
            double NOS = 0;
            for(Account acc: lstAcc){
                if(acc.ParentId == a.Id || acc.Id == a.Id ){
                    
                    NOS = NOS + acc.Number_of_Sworn_Personnel_WMP__c;
                }
            }
            
            a.CAD_Parent_Total_Sworn_Officers__c = NOS;
        }
    }
}
if(trigger.isAfter){
    SET<ID> setPId = new SET<ID>();
    for(Account a : Trigger.new){
        if(a.ParentId != null){
            setPId.add(a.ParentId);
        }
    }
    
    List<Account> lstAccP =  [Select id From Account Where Id IN: setPId];
    update lstAccP;
}
}