// ==================================================================================
//   Object: CopyBAEmailfromAccount
//  Company: Tritech
//   Author: Scott key
// Comments: When the contact address is left blank then copy the Account mailing/billing
//       address to contact address.
// ==================================================================================
//  Changes: 2013-03-04 Initial version.
// ==================================================================================

trigger CopyBAEmailfromAccount on Case (before insert, before update) {
  Set<Id> accntIds = new Set<Id>();
  for(Case c : trigger.new) {
    if((c.CAD_BA_Email__c == null || c.CAD_BA_Email__c == '') 
      || (c.FBR_BA_Email__c == null || c.FBR_BA_Email__c == '')
      || (c.Mobile_BA_Email__c == null || c.Mobile_BA_Email__c == '')
      || (c.PM_1_Email__c == null || c.PM_1_Email__c == '')
      || (c.PM_2_Email__c == null || c.PM_2_Email__c == '')
      || (c.RMS_BA_Email__c == null || c.RMS_BA_Email__c == '')) {
      //collect the account IDs to pull the Mailing/Billing address info
      if(c.AccountId != null) accntIds.add(c.AccountId);
    }
  }
  //get all the account mailing/billing address
  Map<Id, Account> accntMap = new Map<Id, Account>([Select Id, CAD_BA_Email__c, 
                            FBR_BA_Email__c, 
                            Mobile_BA_Email__c, 
                            PM_1_Email__c, 
                            PM_2_Email__c,
                            RMS_BA_Email__c From Account
                            Where Id IN: accntIds]);
  for(Case c : trigger.new) 
  {
    //if((c.CAD_BA_Email__c == null || c.CAD_BA_Email__c == '') 
    //  || (c.FBR_BA_Email__c == null || c.FBR_BA_Email__c == '')
    //  || (c.Mobile_BA_Email__c == null || c.Mobile_BA_Email__c == '')
    //  || (c.PM_1_Email__c == null || c.PM_1_Email__c == '')
    //  || (c.PM_2_Email__c == null || c.PM_2_Email__c == '')
    //  || (c.RMS_BA_Email__c == null || c.RMS_BA_Email__c == '') ) 
    //  {
      //get the account Mailing/Billing address info using accntMap
      Account a = accntMap.get(c.AccountId);
      if(a != null) 
      {
        c.CAD_BA_Email__c = a.CAD_BA_Email__c;
        c.FBR_BA_Email__c = a.FBR_BA_Email__c;
        c.Mobile_BA_Email__c = a.Mobile_BA_Email__c;
        c.PM_1_Email__c = a.PM_1_Email__c;
        c.PM_2_Email__c = a.PM_2_Email__c;
        c.RMS_BA_Email__c = a.RMS_BA_Email__c;
      }
   // }
  }
}