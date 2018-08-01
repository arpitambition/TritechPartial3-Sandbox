global class hideTabController_CP
{
    webservice static List<boolean> hideTabMethod_CP()
    {
        List<boolean> showTabLst = new List<boolean>();
        boolean showResourceTab = false;
        boolean showDocumentTab = false;
        boolean showIMCTab = false;
        Boolean showRoundTableTab = true;
        
        string userId = UserInfo.getUserId();
        User u = [select Id, AccountID,ContactId from User where Id =:userId];
        
        //Mohan 05/02/2014
        //Adding new contract types Inform 911, Inform CAD, Inform FBR, Inform Jail, Inform Mobile, Inform RMS 
        //Mohan 05/02/2014: Adding new contract types - Inform IQ, Inform Anaytics
        //Mohan 06/25/2014: Adding new contract types - Tritech.com IQ, TriTech.com Analytics, Third Party, Geo Comm
        //removed Inform Contract types as we do not want the EMS tab displayed for Inform. SK
        //Mohan 02/20/2015: Adding new filter Product_Family_WMP__c = 'EMS' so that the EMS tab is not visible for other product families
        
        //List<string> contractType = new List<string>{'Billing','EMS CAD','FDC','Fusion ePCR','Fusion Online','SBS','Sweet-Online','AVeL','TriTech.com ePCR','TriTech.com Billing','Respond Billing','Respond ePCR', 'Sweet CAD', 'Respond CAD', 'Inform 911', 'Inform CAD', 'Inform FBR', 'Inform Jail', 'Inform Mobile', 'Inform RMS', 'Inform IQ', 'Inform Anaytics', 'Tritech.com IQ', 'TriTech.com Analytics', 'Third Party', 'Geo Comm',' Inform CAD Custom Solution',' Inform Mobile Custom Solution','Inform RMS Custom Solution','Inform FBR Custom Solution'};
        List<string> contractType = new List<string>{'Billing','EMS CAD','FDC','Fusion ePCR','Fusion Online','SBS','Sweet-Online','AVeL','TriTech.com ePCR','TriTech.com Billing','Respond Billing','Respond ePCR', 'Sweet CAD', 'Respond CAD', 'Tritech.com IQ', 'TriTech.com Analytics', 'Third Party', 'Geo Comm'};
        List<ServiceContract> scList = new List<ServiceContract>();
        scList = [Select Id, Contract_Status_WMP__c, Contract_Type__c from ServiceContract where AccountId =:u.AccountId AND (Contract_Status_WMP__c = 'Active' OR Contract_Status_WMP__c = 'Renewal Due' OR Contract_Status_WMP__c = 'No HW Support, Software Only') AND Contract_Type__c in: contractType AND Product_Family_WMP__c = 'EMS'];      
        System.debug('size::' + scList.size());
        if(scList.size() > 0)
             showResourceTab = true;
             
        List<ServiceContract> scListIMC = new List<ServiceContract>();
        List<ServiceContract> scListVisinet = new List<ServiceContract>();
        List<ServiceContract> scListAll = [Select Id, Contract_Status_WMP__c, Contract_Type__c,Product_Family_WMP__c from ServiceContract where AccountId =:u.AccountId AND (Contract_Status_WMP__c = 'Active' OR Contract_Status_WMP__c = 'Installed Not Live' OR Contract_Status_WMP__c = 'Renewal Due' OR Contract_Status_WMP__c = 'No HW Support, Software Only') AND (Product_Family_WMP__c = 'VisiNet' OR Product_Family_WMP__c = 'IMC' OR Product_Family_WMP__c = 'Inform')];
        String pFamilies = '';
        for(ServiceContract sc:scListAll)
        {
            if((sc.Product_Family_WMP__c == 'VisiNet') || (sc.Product_Family_WMP__c == 'Inform'))
            {
                scListVisinet.add(sc);
            }
            if(sc.Product_Family_WMP__c == 'IMC')
            {
                scListIMC.add(sc);
            }
            //pFamilies += sc.Product_Family_WMP__c + ',';        //remove when Perform category goes live for Round table 
        }
        
        if(scListVisinet.size() > 0)
             showDocumentTab = true;
        if(scListIMC.size() > 0)
             showIMCTab = true;
        
        
        showTabLst.add(showResourceTab);        
        showTabLst.add(showDocumentTab);
        showTabLst.add(showIMCTab);
        //showTabLst.add(showRoundTableTab);//remove when Perform category goes live for Round table
        
        return showTabLst;
    }
    static testMethod void unitTest() 
    {
        User u1 = [Select Id, AccountId from User where IsPortalEnabled = true and IsActive = true LIMIT 1];
        List<ServiceContract> scList = new List<ServiceContract>();
        ServiceContract sc1 = new ServiceContract(Name = 'SC1',Contract_Type__c = 'EMS', Contract_Status_WMP__c = 'Active', AccountId = u1.AccountId);
        scList.add(sc1);
        ServiceContract sc2 = new ServiceContract(Name = 'SC2',Product_Family_WMP__c = 'VisiNet',Contract_Status_WMP__c = 'Active', AccountId = u1.AccountId);
        scList.add(sc2);
        ServiceContract sc5 = new ServiceContract(Name = 'SC2',Product_Family_WMP__c = 'Inform',Contract_Status_WMP__c = 'Active', AccountId = u1.AccountId);
        scList.add(sc5);
        ServiceContract sc3 = new ServiceContract(Name = 'SC3',Product_Family_WMP__c = 'IMC',Contract_Status_WMP__c = 'Active', AccountId = u1.AccountId);
        scList.add(sc3);
        ServiceContract sc4 = new ServiceContract(Name = 'SC1',Contract_Type__c = 'FDC', Contract_Status_WMP__c = 'Active', AccountId = u1.AccountId);
        scList.add(sc4);
        insert scList;
        
        System.runAs(u1){
            hideTabController_CP.hideTabMethod_CP();
        }
    }
}