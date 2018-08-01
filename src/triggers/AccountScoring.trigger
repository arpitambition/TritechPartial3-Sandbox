trigger AccountScoring on Account (before insert, before update) {  
set<Id> ParentIds = new set<Id>(); 
set<Id> ParIds = new set<Id>();

List<Account> parentObjList = new List<Account>(); 
For (Account a : Trigger.new){
    if(a.ParentId != null)
        ParentIds.add(a.ParentId);
    ParIds.add(a.Id);
}

List<Account> lstAcc = [Select Highest_relationship_level_with_Account__c,Number_of_Sworn_Personnel_WMP__c,CAD_Parent_Total_Sworn_Officers__c,Relationship_w_Decision_Maker_Sponsor__c,Strong_relationship_w_functional_roles__c,What_is_Prospect_s_purchasing_process__c,Competitive_position_with_this_Prospect__c,Potential_deal_size_of_this_opportunity__c,Planning_to_replace_RMS_provider__c,Planning_to_replace_CAD_provider__c,Planning_to_replace_911_provider__c,Planning_to_replace_Jail_provider__c,Multi_jurisdictional_system__c,of_firefighters_at_largest_PSAP_agency__c, Id,ParentId from Account 
                        where ((ParentId != null AND ParentId in :ParentIds) OR 
                               (Id != null AND Id in :ParentIds) OR 
                               (ParentId != null AND ParentId in :ParIds) OR 
                               (Id != null AND Id = :ParIds))
                        AND Number_of_Sworn_Personnel_WMP__c != null];

    
    for(Account a : Trigger.new){
        decimal AcctScore = 0;
        decimal CadParent = 0;
        Decimal CadSworn = 0;
        CadSworn = a.Number_of_Sworn_Personnel_WMP__c;
        CadParent = a.CAD_Parent_Total_Sworn_Officers__c;
        if(a.Highest_relationship_level_with_Account__c == 'Decision Maker / Project Sponsor'){
          AcctScore = AcctScore + 12;            
         } 
         if(a.Highest_relationship_level_with_Account__c == 'Selection Committee Members'){
          AcctScore = AcctScore + 9;            
         }
         if((a.Highest_relationship_level_with_Account__c == 'Chief, Sheriff, 911 Director')||(a.Highest_relationship_level_with_Account__c == 'Procurement')){
          AcctScore = AcctScore + 6;            
         } 
         if(a.Highest_relationship_level_with_Account__c == 'Public Safety Committee'){
          AcctScore = AcctScore + 3;            
         }   
         if(a.Highest_relationship_level_with_Account__c == 'No Relationship'){
          AcctScore = AcctScore - 6;            
         }  
         if(a.Relationship_w_Decision_Maker_Sponsor__c == 'Seen as Partner/Trusted Advisor'){
          AcctScore = AcctScore + 12;            
         } 
         if(a.Relationship_w_Decision_Maker_Sponsor__c == 'Seen as Preferred Supplier'){
          AcctScore = AcctScore + 9;            
         } 
         if((a.Relationship_w_Decision_Maker_Sponsor__c == 'No Relationship')||(a.Relationship_w_Decision_Maker_Sponsor__c == 'Not in Good Standing')){
          AcctScore = AcctScore - 6;            
         }
         if(a.Relationship_w_Decision_Maker_Sponsor__c == 'Seen as a Viable Option'){
          AcctScore = AcctScore + 6;            
         }  
         if(a.Strong_relationship_w_functional_roles__c == 'Purchasing Decision Maker / Project Sponsor & Selection Committee Members'){
          AcctScore = AcctScore + 16;            
         } 
         if(a.Strong_relationship_w_functional_roles__c == 'Purchasing Decision Maker / Project Sponsor or Selection Committee Members'){
          AcctScore = AcctScore + 12;            
         }
         if(a.Strong_relationship_w_functional_roles__c == 'Chief, Sheriff, 911 Director'){
          AcctScore = AcctScore + 12;            
         } 
         if(a.Strong_relationship_w_functional_roles__c == 'Procurement'){
          AcctScore = AcctScore + 8;            
         } 
         if(a.Strong_relationship_w_functional_roles__c == 'No Relationship'){
          AcctScore = AcctScore - 8;            
         } 
         if(a.What_is_Prospect_s_purchasing_process__c == 'Sole Source / GSA / State Contract'){
          AcctScore = AcctScore + 4;            
         } 
         if(a.What_is_Prospect_s_purchasing_process__c == 'Competitive Procurement'){
          AcctScore = AcctScore + 1.33;            
         }
         if(a.What_is_Prospect_s_purchasing_process__c == 'Unknown'){
          AcctScore = AcctScore + 0;            
         }
         if(a.Competitive_position_with_this_Prospect__c == 'TriTech is Well Positioned'){
          AcctScore = AcctScore + 6;            
         }
         if(a.Competitive_position_with_this_Prospect__c == 'TriTech has Influenced RFP Specs'){
          AcctScore = AcctScore + 4.5;            
         }
         if(a.Competitive_position_with_this_Prospect__c == 'Level playing field'){
          AcctScore = AcctScore + 3;            
         }
         if(a.Competitive_position_with_this_Prospect__c == 'TriTech is in a Defensive Position'){
          AcctScore = AcctScore + 1.5;            
         }
         if(a.Competitive_position_with_this_Prospect__c == 'TriTech Will Be Locked Out'){
          AcctScore = AcctScore - 3;            
         }
         if(a.Competitive_position_with_this_Prospect__c == 'Unknown'){
          AcctScore = AcctScore + 0;            
         } 
         if(a.Potential_deal_size_of_this_opportunity__c == '>$2 Million'){
          AcctScore = AcctScore + 6;            
         }
         if(a.Potential_deal_size_of_this_opportunity__c == '$1 Million - $1.9 Million'){
          AcctScore = AcctScore + 4.5;            
         }
         if(a.Potential_deal_size_of_this_opportunity__c == '$500K - $.9 Million'){
          AcctScore = AcctScore + 3;            
         }
         if(a.Potential_deal_size_of_this_opportunity__c == '$0 - $499K'){
          AcctScore = AcctScore + 1.5;            
         }
         if(a.Potential_deal_size_of_this_opportunity__c == 'Unknown'){
          AcctScore = AcctScore + 0;            
         }
         if(a.Planning_to_replace_RMS_provider__c == '0-2 Years to Decision' || a.Planning_to_replace_RMS_provider__c == '2017'){
          AcctScore = AcctScore + 4;            
         }
         if(a.Planning_to_replace_RMS_provider__c == '2-4 Years to Decision' || a.Planning_to_replace_RMS_provider__c == '2019'){
          AcctScore = AcctScore + 3;            
         }
         if(a.Planning_to_replace_RMS_provider__c == '4-6 Years to Decision' || a.Planning_to_replace_RMS_provider__c == '2021'){
          AcctScore = AcctScore + 2;            
         }
         if(a.Planning_to_replace_RMS_provider__c == '> 6 Years to decision' || a.Planning_to_replace_RMS_provider__c == '2023'){
          AcctScore = AcctScore + 1;            
         }
         if(a.Planning_to_replace_RMS_provider__c == 'Unknown'){
          AcctScore = AcctScore + 0;            
         }
         if(a.Planning_to_replace_CAD_provider__c == '0-2 Years to Decision' || a.Planning_to_replace_CAD_provider__c == '2017'){
          AcctScore = AcctScore + 4; 
         }
         if(a.Planning_to_replace_CAD_provider__c == '2-4 Years to Decision' || a.Planning_to_replace_CAD_provider__c == '2019'){
          AcctScore = AcctScore + 3;            
         }
         if(a.Planning_to_replace_CAD_provider__c == '4-6 Years to Decision' || a.Planning_to_replace_CAD_provider__c == '2021'){
          AcctScore = AcctScore + 2;            
         }
         if(a.Planning_to_replace_CAD_provider__c == '> 6 Years to decision' || a.Planning_to_replace_CAD_provider__c == '2023'){
          AcctScore = AcctScore + 1; 
         }
         if(a.Planning_to_replace_CAD_provider__c == 'Unknown'){
          AcctScore = AcctScore + 0;            
         }
         if(a.Planning_to_replace_911_provider__c == '0-2 Years to Decision' || a.Planning_to_replace_911_provider__c == '2017'){
          AcctScore = AcctScore + 4;            
         }
         if(a.Planning_to_replace_911_provider__c == '2-4 Years to Decision' || a.Planning_to_replace_911_provider__c == '2019'){
          AcctScore = AcctScore + 3;            
         }
         if(a.Planning_to_replace_911_provider__c == '4-6 Years to Decision' || a.Planning_to_replace_911_provider__c == '2021'){
          AcctScore = AcctScore + 2;            
         }
         if(a.Planning_to_replace_911_provider__c == '> 6 Years to decision' || a.Planning_to_replace_911_provider__c == '2023'){
          AcctScore = AcctScore + 1; 
         }
         if(a.Planning_to_replace_911_provider__c == 'Unknown'){
          AcctScore = AcctScore + 0;            
         }
         if(a.Planning_to_replace_Jail_provider__c == '0-2 Years to Decision' || a.Planning_to_replace_Jail_provider__c == '2017'){
          AcctScore = AcctScore + 4;            
         }
         if(a.Planning_to_replace_Jail_provider__c == '2-4 Years to Decision' || a.Planning_to_replace_Jail_provider__c == '2019'){
          AcctScore = AcctScore + 3;            
         }
         if(a.Planning_to_replace_Jail_provider__c == '4-6 Years to Decision' || a.Planning_to_replace_Jail_provider__c == '2021'){
          AcctScore = AcctScore + 2;            
         }
         if(a.Planning_to_replace_Jail_provider__c == '> 6 Years to decision' || a.Planning_to_replace_Jail_provider__c == '2023'){
          AcctScore = AcctScore + 1;
         } 
         if(a.Planning_to_replace_Jail_provider__c == 'Unknown'){
          AcctScore = AcctScore + 0;            
         }
         if(a.Multi_jurisdictional_system__c == 'Yes'){
          AcctScore = AcctScore + 8;            
         }
         if(a.Multi_jurisdictional_system__c == 'No'){
          AcctScore = AcctScore + 4;
         } 
         if(a.Multi_jurisdictional_system__c == 'Unknown'){
          AcctScore = AcctScore + 0;            
         }
         if(a.of_firefighters_at_largest_PSAP_agency__c == 'Over 750'){
          AcctScore = AcctScore + 10;            
         }
         if(a.of_firefighters_at_largest_PSAP_agency__c == '400-749'){
          AcctScore = AcctScore + 5;            
         }
         if(a.of_firefighters_at_largest_PSAP_agency__c == '1-399'){
          AcctScore = AcctScore + 3;
         } 
         if(a.of_firefighters_at_largest_PSAP_agency__c == 'None'){
          AcctScore = AcctScore - 5;            
         }
         if(a.ParentId != null){
         if(a.Number_of_Sworn_Personnel_WMP__c >= 1000){
          AcctScore = AcctScore + 10;
         }
         if((a.Number_of_Sworn_Personnel_WMP__c >= 250)&&(a.Number_of_Sworn_Personnel_WMP__c < 999)){
          AcctScore = AcctScore + 7.5;
         }
         if((a.Number_of_Sworn_Personnel_WMP__c >= 100)&&(a.Number_of_Sworn_Personnel_WMP__c < 249)){
          AcctScore = AcctScore + 5;
         }
         if(a.Number_of_Sworn_Personnel_WMP__c < 100){
          AcctScore = AcctScore + 0;
         }
               
         
         }
         if(a.ParentId == null){
         if(a.CAD_Parent_Total_Sworn_Officers__c >= 1000){
          AcctScore = AcctScore + 10;
         }
         if((a.CAD_Parent_Total_Sworn_Officers__c >= 250)&&(a.CAD_Parent_Total_Sworn_Officers__c < 999)){
          AcctScore = AcctScore + 7.5;
         }
         if((a.CAD_Parent_Total_Sworn_Officers__c >= 100)&&(a.CAD_Parent_Total_Sworn_Officers__c < 249)){
          AcctScore = AcctScore + 5;
         }
         if(a.CAD_Parent_Total_Sworn_Officers__c < 100){
          AcctScore = AcctScore + 0;
         }
         }
            a.Account_Score__c = AcctScore;
        
    }

}