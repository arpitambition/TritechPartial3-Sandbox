//trigger to mark the CWI Status to Cancelled when the Associated Opportunity is Lost.
//Written by: Scott Key
//Date Created: 10/2/2017
//Change Log:
// 
//  Scott Key at the Request of Tyler Harman 20171002-1053

trigger CWIComplete on Opportunity (after update){
    Set<string> leadIds = new Set<string>();
    List<Write_In__c> rateSheetsToUpdate = new List<Write_In__c>();

    for (Opportunity Opp: Trigger.new) 
    {
        

        if (Opp.stagename == 'Booked') 
         { 
            leadIds.add(Opp.Id);
        }
    }
    if(trigger.isupdate && trigger.isafter)
    {
    string s1 = string.valueof(leadIds);
    if (s1.length() > 1)
    {
    integer i = s1.length();
    if(i > 10)
    {
    string s2 = s1.substring(1,i - 4);
    for (Write_In__c rateSheet: [select Id from Write_In__c where cwi_status__c != 'Complete' and Opportunity_ID__c =: s2]) 
        {
          //added 8/24/2017
          rateSheet.Product_Line__c = 'Inform';
          rateSheet.CWI_Status__c = 'Complete';
            rateSheetsToUpdate.add(rateSheet);
          
        }
     system.debug(s2); 
    

    if (!rateSheetsToUpdate.isEmpty()) {
        update rateSheetsToUpdate;
    }
    }
    }
    }
}