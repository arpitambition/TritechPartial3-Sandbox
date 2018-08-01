trigger CaseOwnerRetention on Case (after update) {
    Map<Id,Case> changedOwnerCases = new Map<Id,Case>();
for (Integer idx = 0; idx < trigger.new.size(); idx++) {
        if (Trigger.new[idx].OwnerId <> Trigger.old[idx].OwnerId) {
            changedOwnerCases.put(Trigger.new[idx].id, Trigger.new[idx]);
        }
    }
    List<Task> restoreTaskOwner = new List<Task>();
    //System.debug('changedOwnerCases:' + changedOwnerCases);
    // Find all the tasks that are not closed for these cases and revert them
    for(Task t : [SELECT Id, WhatId, OwnerId, Last_Assigned_User__c
                  FROM Task
                  Where WhatId in : changedOwnerCases.keySet() AND IsClosed <> TRUE AND Last_Assigned_User__c <> null and type <> 'Project']) {
        system.debug('t.OwnerId:' + t.OwnerId);
        system.debug('t.Last_Assigned_Owner__c:' + t.Last_Assigned_User__c);
        if (t.OwnerId <> t.Last_Assigned_User__c) {
            t.OwnerId = t.Last_Assigned_User__c;
            restoreTaskOwner.add(t);
        }
    }
    System.debug('restoreTaskOwner:' + restoreTaskOwner);
    if (!restoreTaskOwner.isEmpty()) {
        update restoreTaskOwner;
    }
}