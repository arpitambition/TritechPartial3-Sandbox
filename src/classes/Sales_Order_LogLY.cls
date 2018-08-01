//Class to gather data for Sales Order Log Excel output
//written by Scott Key
//8-17-2017

public class Sales_Order_LogLY {
    public List<Sales_Order__c> soc{get; set;}
    public Sales_Order_LogLY()
    {
    Pagereference pr = null;	
    soc = new List<Sales_Order__c>();
       for (Sales_Order__c c : [Select Director__c, Quote_Number__c,Sales_Order_Number__c,Change_Order_Number__c,Client__c,GP_Customer_ID__c,Product_Type__c,N_E__c,
        G_or_C__c,Bookings_Date__c,Sales_Rep__c,CSL__c,Project_Manager__c,Inform_Bookings_Amount__c,Total_Contract_Amount__c,CAD_Software_List__c,Interface_CAD_Mobile_Software__c,
        Interface_RMS_FBR_Jail_Software__c,	Mobile_List__c,RMS_List__c,FBR_List__c,Jail_List__c,Fire_List__c,Software_Subscription_On_Prem__c,
        IQ_List__c,Telephony_List__c,Subscription_List__c,Software_List__c,Software_Discounts__c,Software_Total__c,P_I_List__c,IS_Services_List__c,Training_Services_List__c,
        PM_Services__c,Other_Services__c,Services_List__c,Services_Discount__c,Services_Total__c,Hardware_List__c,Hardware_Support_List__c,X3rd_Party_Soft_List__c,
        X3rd_Party_Support__c,Subcontract_List__c,Subcontract_Support_List__c,Datavault_List__c,System_Integration__c,HW_3rd_Paty_List__c,Hardware_3rd_party_Discount__c,
        HW_3rd_party_SW_Subtotal__c,Shipping__c,Escrow__c,TriCon_Fees__c,Bonds__c,Travel_Fixed__c,Travel_BAI__c,Other__c,Discount_Other__c,Total_Other__c,Software_Support__c,
        Prepain_maintenance_Pool__c,Tax__c,Other_Deferred_Rev__c,Tritech_Com_IQ_Hosting_List__c,Tritech_Com_Cont_2_Yrs_List__c,Tritech_Com_Other_List__c,Tritech_Com_Install_List__c,
        Tritech_Com_Training_List__c,Tritech_Com_Discount__c,Tritech_Com_List__c,Tritech_Com_Net__c,Retail__c,MO__c,ArcGIS_Run_Time__c,MO_Upgrade__c,NE__c,ArcGIS_Engine_10X__c,
        ArcGIS_Server_Network_Analyst__c,Dundas_Analytics__c,Possitive_Access__c,ESRI__c,Cost_Worksheet_Other__c,Total_Cost__c,Commissionable_Value__c,C_or_N__c from Sales_Order__c where Bookings_Date__c = Last_Year order by bookings_date__c])
       {       
           soc.add(c);
       }
    pr = new PageReference('/apex/SalesOrderLog?sfdc.tabName=01r4D0000008lED');
    pr.setRedirect(true);
    }
    public  Sales_Order_LogLY(ApexPages.StandardController stdController) {
    }
}