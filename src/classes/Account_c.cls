/*
** Revision History
** 09/20/2016  Ken Becker Katch Consulting -  Initial Creation 
**
**
*/

public class Account_c {

  public static Boolean fromFutureMethod = true;
  //public static Boolean from911ParentFutureMethod = true;
  //public static Boolean fromRmsParentFutureMethod = true;
    
  public static void rollupSwornOfficerCount(map<Id,Account> accts, map<Id,Account> oldAccts, boolean isInsert){
    set<Id> remParentIds = new set<Id>();
    List<Id> accRecId = new List<Id>();
  
    for(Account a: accts.values()){
      if((a.TriggerUpdate__c == null?0:a.TriggerUpdate__c) == (oldAccts.get(a.Id).TriggerUpdate__c == null?0:oldAccts.get(a.Id).TriggerUpdate__c)){ 
        accRecId.add(a.Id);
      }
      if(a.ParentId == null){
        if(oldAccts.get(a.Id).ParentId<> null){
          remParentIds.add(oldAccts.get(a.Id).ParentId);
        }
      }
    }
    
    if(Account_c.fromFutureMethod) {
        UpdateRollUpFieldOnAccount.rollupSwornOfficerCount(accRecId, remParentIds, isInsert);        
    }
  }
  
  public static void rollup911SwornOfficerCount(map<Id,Account> accts, map<Id,Account> oldAccts, boolean isInsert){
    set<Id> remParentIds = new set<Id>();
    List<Id> accRecId = new List<Id>();
  
    for(Account a: accts.values()){
      if((a.Trigger911Update__c == null?0:a.Trigger911Update__c) == (oldAccts.get(a.Id).Trigger911Update__c == null?0:oldAccts.get(a.Id).Trigger911Update__c)){ 
        accRecId.add(a.Id);
      }
      if(a.X911_Parent_Account__c == null){
        if(oldAccts.get(a.Id).X911_Parent_Account__c <> null){
          remParentIds.add(oldAccts.get(a.Id).X911_Parent_Account__c);
        }
      }
    }
    
    if(Account_c.fromFutureMethod) {
        UpdateRollUpFieldOnAccount.rollup911SwornOfficerCount(accRecId, remParentIds, isInsert);        
    }
  }
  
  public static void rollupRMSSwornOfficerCount(map<Id,Account> accts, map<Id,Account> oldAccts, boolean isInsert){
    set<Id> remParentIds = new set<Id>();
    List<Id> accRecId = new List<Id>();
  
    for(Account a: accts.values()){
      if((a.TriggerRMSUpdate__c == null?0:a.TriggerRMSUpdate__c) == (oldAccts.get(a.Id).TriggerRMSUpdate__c == null?0:oldAccts.get(a.Id).TriggerRMSUpdate__c)){ 
        accRecId.add(a.Id);
      }
      if(a.RMS_Parent_Account__c == null){
        if(oldAccts.get(a.Id).RMS_Parent_Account__c <> null){
          remParentIds.add(oldAccts.get(a.Id).RMS_Parent_Account__c);
        }
      }
    }
    
    if(Account_c.fromFutureMethod) {
        UpdateRollUpFieldOnAccount.rollupRMSSwornOfficerCount(accRecId, remParentIds, isInsert);        
    }
  }
  
  public list<Account> rollupSwornOfficerCount(list<Account> accts){
    
    for(Account a: accts){
      if(a.ParentId == null){
        a.CAD_Parent_Total_Sworn_Officers__c = a.Number_of_Sworn_Personnel_WMP__c == null?0:a.Number_of_Sworn_Personnel_WMP__c;
        a.CAD_Parent_Fire_EMS_Users__c = a.Fire_Career__c == null?0:a.Fire_Career__c;
        a.triggerupdate__c = Datetime.now().getTime();
      }
      
      //Arpit 22-May-2018: Adding code for 911 Parent Account and RMS Account
      if(a.X911_Parent_Account__c == null) {
        a.X911_Parent_Total_Sworn_Officers__c = a.Number_of_Sworn_Personnel_WMP__c == null?0:a.Number_of_Sworn_Personnel_WMP__c;
        a.triggerupdate__c = Datetime.now().getTime();
      }
      
      if(a.RMS_Parent_Account__c == null) {
        a.RMS_Parent_Total_Sworn_Officers__c = a.Number_of_Sworn_Personnel_WMP__c == null?0:a.Number_of_Sworn_Personnel_WMP__c;
        a.triggerupdate__c = Datetime.now().getTime();
      }
      //End of Arpit 22-May-2018: Adding code for 911 Parent Account and RMS Account
    }
    return accts;
  }
}