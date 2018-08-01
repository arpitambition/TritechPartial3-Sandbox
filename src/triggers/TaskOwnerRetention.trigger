trigger TaskOwnerRetention on Task (before insert) {
for (Task t : Trigger.new) {
  t.Last_Assigned_User__c = t.OwnerId;
}
}