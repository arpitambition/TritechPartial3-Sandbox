public with sharing class CloneTicket {
    private String caseId;
    private Case caseObj;
    private Case copyCaseObj;
    
    public CloneTicket (ApexPages.StandardController controller) {
        caseObj = new Case();
        
        
caseId =  System.currentPageReference().getParameters().get('id');
        for( Case c:[Select c.of_Days_for_Class__c, c.of_Attendees_Per_Class__c, c.Work_Order_Type__c, c.Work_Around_Impact_to_Operation__c, 
                        c.Upgrade_Type__c, c.Upgrade_Time_Differential__c, c.Upgrade_Start_Version__c, c.Upgrade_Start_Version_Patch__c, c.Upgrade_End_Version__c, 
                        c.Upgrade_End_Version_Patch__c, c.Type, c.Training_Start_Date__c, c.Training_Location__c, c.Training_End_Date__c, c.Time_Card_Duration_WMP__c, 
                        c.Tier_3_Triage_Order__c, c.Tier_3_Status__c, c.Ticket_Issue_Category__c,  c.Ticket_Age__c, c.TicketURL__c, 
                         c.Target_Patch_Release_Date__c,  c.SystemModstamp, c.SuppliedPhone, c.SuppliedName, 
                        c.SuppliedEmail, c.SuppliedCompany, c.Subject, c.Steps_to_Recreate_Issue_WMP__c, c.Status, c.Short_Issue_Summary_WMP__c, c.Service_Contract_WMP__c, 
                        c.Sensitive_Customer__c, c.Sensitive_Customer_Indicator__c, c.Secure_Folder_Path__c, c.Sales_Order_Number__c, c.SQL_Upgrade__c, c.SQL_Installation__c, 
                        c.Response_Time_min__c, c.Response_Time__c, c.Resolution_Time__c, c.Resolution_Notes_WMP__c, c.Reproducible_WMP__c, c.Reported_Patch_WMP__c, 
                        c.Reported_Minor_Version__c, c.Reported_Major_Version_WMP__c,  c.Released_In__c, c.RecordTypeId, c.Reason, c.ROID__c, 
                        c.Product_Sub_Module__c, c.Product_Family_WMP__c, c.ProductId, c.Priority, c.Pre_check_Received__c, c.Potential_Defect__c, 
                        c.Planned_Release__c, c.Patch_Status__c, c.Patch_Requested__c, c.PO_Received__c, c.PNC_Ticket__c, c.OwnerId,  
                         c.Origin, c.On_Site_MAC_Hours_Utilized__c, c.Occured_After_Upgrade_WMP__c, c.Not_Reproducible_in_Version__c, c.Media_Shipped__c, 
                        c.Master_Related_Ticket__c, c.Mac_Hours_Utilized__c, c.Legacy_Ticket_Status__c, c.Legacy_Ticket_ID__c, c.Legacy_Fixed_in_Version__c, c.Legacy_Defect_ID__c, 
                        c.Legacy_Defect_Association__c, c.Legacy_Date_Opened__c, c.Legacy_Date_Closed__c, c.LA_Case__c, c.Known_Issues_List__c,  c.Internal_Work_Activities__c, 
                        c.Internal_Ranking__c,  c.HasSelfServiceComments, c.HasCommentsUnreadByOwner,  c.External_ID__c, 
                        c.Estimated_Time_for_Upgrade_in_hours__c, c.Error_Message__c, c.Environment_Type__c, c.EMS_Customer_Number__c, c.Description,  
                        c.Defect_Status__c, c.Defect_Number__c, c.Defect_Comments__c, c.DefectStatus__c, c.DefectNumber__c, c.Days_over_SLA_Low_Priority__c, c.Days_over_SLA_High_Priority__c, 
                        c.Data_Transfer__c, c.Customer_State__c, c.Customer_Reference_Number__c, c.Customer_Priority_WMP__c, c.Customer_Contact_Date_Time_WMP__c, c.Contact_Work_Mobile__c, 
                        c.Contact_Other_Phone__c, c.ContactId, c.Closed_Incidents_Reason_WMP__c,  c.Client_Steps_to_Recreate_Issue__c, c.Choose_applicable_product_family__c, c.CaseNumber, 
                         c.Black_Box_Log_Collected__c, c.Billable__c, c.Billable_Hours__c, c.Bad_Debt__c, c.Bad_Debt_Indicator__c,  
                        c.Applicable_Sales_Order_Amount__c, c.Anticpated_Delivery_Time__c, c.Anticipated_Delivery_Date__c, c.After_Hours_Upgrade__c, c.Actual_Time_for_Upgrade_in_hours__c, c.AccountId,
                        c.Estimated_Back_Out_Duration_in_hours__c,c.Upgrade_Justification__c,c.Implementation_Plan__c,c.Back_Out_Plan__c,c.User_Acceptance_Test_Plan__c
                        From Case c where id =: caseId]){
            caseObj = c;
        }               
    }
    
    public Pagereference doClone(){
        Pagereference pr = null;
        try{
            copyCaseObj = caseObj.clone(false,true);
            copyCaseObj.Closed_Incidents_Reason_WMP__c = null;
            copyCaseObj.Resolution_Notes_WMP__c = null;
            copyCaseObj.Customer_Contact_Date_Time_WMP__c = system.now();
            copyCaseObj.Status = 'Creating Ticket';
            
            //Ram Added below for the request on 10-28-2015
            copyCaseObj.Patch_Requested_Date_Time__c = null;
            if ((copyCaseObj.Priority == 'P1 - System Down') || (copyCaseObj.Priority == 'P2'))
            {
                copyCaseObj.Priority = 'P4';
            }
            copyCaseObj.Patch_Requested__c = false;
            copyCaseObj.DefectNumber__c = null;
            copycaseObj.Potential_Defect__c = null;
            copyCaseObj.DefectStatus__c = null;
            copyCaseObj.OwnerId = UserInfo.getUserId();
            copyCaseObj.Estimated_Back_Out_Duration_in_hours__c = caseObj.Estimated_Back_Out_Duration_in_hours__c;
            copyCaseObj.Upgrade_Justification__c = caseObj.Upgrade_Justification__c;
            copyCaseObj.Implementation_Plan__c = caseObj.Implementation_Plan__c;
            copyCaseObj.Back_Out_Plan__c = caseObj.Back_Out_Plan__c;
            copyCaseObj.User_Acceptance_Test_Plan__c = caseObj.User_Acceptance_Test_Plan__c;
            //Below are formulas associated with Potential_Defect and they get nulled automatically
            //copyCaseObj.Planned_Release__c = null;
            //copyCaseObj.Released_In__c = null;
            //copyCaseObj.Defect_Comments__c = null;
                
            //copyCaseObj.Patch_Status__c = '';
            //copyCaseObj.Target_Patch_Release_Date__c= null;
            //Below are formulas associated with Potential_Defect and they get nulled automatically
            
            
            //Ram Added below for the request on 10-28-2015 */
            
            insert copyCaseObj;
            
            
            
            pr = new PageReference('/' + copyCaseObj.id + '/e?saveURL=/' + copyCaseObj.Id + '&00N80000004ZqvX=');
            pr.setRedirect(true);
            
        }
        catch(DMLException e ){
            ApexPages.addMessage(new ApexPages.message(ApexPages.severity.ERROR,e.getDMLMessage(0))); 
        }
        catch(Exception ex){
            ApexPages.addMessage(new ApexPages.message(ApexPages.severity.ERROR,ex.getMessage())); 
        }
        return pr;
    }
        
        
    
}