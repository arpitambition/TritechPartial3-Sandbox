//trigger to mark the CWI Status to Cancelled when the Associated Opportunity is Lost.
//Written by: Scott Key
//Date Created: 7/14/2017
//Change Log:
//8/1/2017 -- added a filter on the CWI object to only update CWI's that are not in a completed state. 
//8/24/2017 -- added code to help alleviate the Product Line possibly being empty since it may have been created prior to the required field being added
//  Scott Key at the Request of Tyler Harman

trigger CWICancellation on Opportunity (after update){
    Set<string> leadIds = new Set<string>();
    List<Write_In__c> rateSheetsToUpdate = new List<Write_In__c>();

    for (Opportunity Opp: Trigger.new) 
    {
        

        if ((Opp.stagename == 'Closed Lost') || (Opp.stagename == 'Closed Lost - Other') || (Opp.stagename == 'Closed Lost - No Bid'))
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
            rateSheet.CWI_Status__c = 'Cancelled';
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