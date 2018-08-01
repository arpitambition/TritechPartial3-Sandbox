public with  sharing class TritechHome {
    
    public User CurrentUser {get;set;}
    
    public string SelectedView {get;set;}
    
    public List<Case> listRecentTicket {get;set;}    
    
    public List<Portal_Notices__c> listImpMessage {get;set;}
    
    public List<KnowledgeArticleVersion> listKA {get;set;}
    
    public List<Related_Link__c> listLinks {get;set;}
    
    public boolean IsManagerUser {get;set;}
    
    public boolean IsReadOnlyUser {get;set;}
    
    public string IsActiveContractType {get;set;}
    
    public boolean productFamilyIMC {get;set;}

    public boolean productFamilyEMS {get;set;}

    public boolean productFamilyVisiNet {get;set;}

    public boolean productFamilyVisionAIR {get;set;}

    public boolean productFamilyZuercher {get;set;}

    public boolean productFamilyLETG {get;set;}
    
    public boolean productFamilyTiburon {get;set;}

    public boolean productFamilyETI {get;set;}
    
    public String profilePictureLink {get;set;}
    public Boolean photoExist {get;set;}
    
    public TabPermissions TabPermission {get; set;} 
    public string CanSave {get;set;}
    
    private String profilePictureId;
    private Contact curContactRecord = new Contact();
     
    public TritechHome(){
        setTabPermission();
        photoExist = false;
        IsManagerUser = false;
        IsReadOnlyUser = false;
        
        IsActiveContractType = 'NO';
        SelectedView = 'Open_All_Tickets';
        CurrentUser = new User();
        
        CanSave = canSave(); 
        
        for(User u : [Select Id, FirstName, ContactId,LastName, Name, Email,Phone, Title,FullPhotoUrl, Profile.Name From User Where Id = : UserInfo.getUserId() ]){
            CurrentUser = u;
            if(u.Profile.Name == 'TriTech Portal Manager'){
                IsManagerUser = true;
            }
            if(u.Profile.Name == 'TriTech Portal Read-Only User'){
                IsReadOnlyUser = true;
            }
            
            
           // check for active service contract type     
           if (u.ContactId != null) {
            
             for(Contact cnct : [SELECT AccountId, PictId__c FROM Contact WHERE Id = :u.ContactId AND AccountId != null Limit 1]){
                curContactRecord = cnct;
                if(cnct.PictId__c != null) {
                    profilePictureLink = '/servlet/servlet.FileDownload?file=' + cnct.PictId__c;
                    photoExist = true;
                    profilePictureId = cnct.PictId__c;
                }
                for(ServiceContract serCon: [Select s.Id,s.Status, s.Contract_Status_WMP__c,s.AccountId, s.name, s.Contract_Type__c From ServiceContract s 
                                            Where (Contract_Status_WMP__c = 'Active' OR Contract_Status_WMP__c = 'Installed Not Live' 
                                            OR Contract_Status_WMP__c = 'Renewal Due' OR Contract_Status_WMP__c = 'No HW Support, Software Only')
                                            AND AccountId =:cnct.AccountId limit 1]){
                    IsActiveContractType = 'YES';
                }
             }
           }  
        
        }
        
        listRecentTicket = new List<Case>();
        
        listRecentTicket = [Select Id, CaseNumber, Subject, OwnerId, Owner.Name, Status From Case Where RecordType.Name in ('Customer Support Ticket', 'Zuercher Customer Support Ticket', 'Cross Support Ticket') Order By CreatedDate DESC Limit 6];
        
        
        PortalUserUtil.ProductFamilies prodFamilies = PortalUserUtil.getProductFamiliesByContract(UserInfo.getUserId());
        System.debug('prodFamilies: '+prodFamilies);
          productFamilyIMC = prodFamilies.productFamilyIMC;
          productFamilyEMS = prodFamilies.productFamilyEMS;
          productFamilyVisiNet = prodFamilies.productFamilyVisiNet;
          productFamilyVisionAIR = prodFamilies.productFamilyVisionAIR;
          productFamilyZuercher = prodFamilies.productFamilyZuercher;
          productFamilyLETG = prodFamilies.productFamilyLETG;
          productFamilyTiburon = prodFamilies.productFamilyTiburon;
          productFamilyETI = prodFamilies.productFamilyETI;
        
        listImpMessage = new List<Portal_Notices__c>();
        Date tDate = Date.today();
        String todayDate = String.valueOf(tDate.year()) + '-';
        String tmp = String.valueOf(tDate.month());
        if(tmp.length() == 1) tmp = '0' + tmp;
        todayDate += tmp + '-';
        tmp = String.valueOf(tDate.day());
        if(tmp.length() == 1) tmp = '0' + tmp;
        todayDate += tmp;
        String prodFamilyFilter = '';
        if(productFamilyIMC != null && productFamilyIMC) {
            prodFamilyFilter  = ' Product_Family__c includes (\'IMC\')';
        }
        if(productFamilyEMS != null && productFamilyEMS) {
            if(prodFamilyFilter != '') prodFamilyFilter  += ' or Product_Family__c includes (\'EMS\')';
            else prodFamilyFilter  = ' Product_Family__c includes (\'EMS\')';
        }
        if(productFamilyVisiNet != null && productFamilyVisiNet) {
            if(prodFamilyFilter != '') prodFamilyFilter  += ' or Product_Family__c includes (\'VisiNet\')';
            else prodFamilyFilter  = ' Product_Family__c includes (\'VisiNet\')';
        }
        if(productFamilyVisionAIR != null && productFamilyVisionAIR) {
            if(prodFamilyFilter != '') prodFamilyFilter  += ' or Product_Family__c includes (\'VisionAir\')';
            else prodFamilyFilter  = ' Product_Family__c includes (\'VisionAir\')';
        }
        if(productFamilyZuercher != null && productFamilyZuercher) {
            if(prodFamilyFilter != '') prodFamilyFilter  += ' or Product_Family__c includes (\'Zuercher\')';
            else prodFamilyFilter  = ' Product_Family__c includes (\'Zuercher\')';
        }
        if(productFamilyLETG != null && productFamilyLETG) {
            if(prodFamilyFilter != '') prodFamilyFilter  += ' or Product_Family__c includes (\'LETG\')';
            else prodFamilyFilter  = ' Product_Family__c includes (\'LETG\')';
        }
        if(productFamilyTiburon != null && productFamilyTiburon) {
            if(prodFamilyFilter != '') prodFamilyFilter  += ' or Product_Family__c includes (\'Tiburon\')';
            else prodFamilyFilter  = ' Product_Family__c includes (\'Tiburon\')';
        }
        if(productFamilyETI != null && productFamilyETI) {
            if(prodFamilyFilter != '') prodFamilyFilter  += ' or Product_Family__c includes (\'ETI\')';
            else prodFamilyFilter  = ' Product_Family__c includes (\'ETI\')';
        }
        if(IsManagerUser == true){
            String pnQuery = 'Select Id, Body__c, Title__c,Body_Short__c From Portal_Notices__c Where Start_Date__c <= ' + todayDate;
            pnQuery += ' AND End_Date__c >= ' + todayDate + ' AND Title__c != null AND General_Notices__c = false';
            if(prodFamilyFilter != '') pnQuery += ' and (' + prodFamilyFilter + ')';
            pnQuery += ' Order By Start_Date__c ASC Limit 5';
            
            listImpMessage = Database.query(pnQuery);
            
        }
        else{
            String pnQuery = 'Select Id, Body__c, Title__c,Body_Short__c From Portal_Notices__c Where Start_Date__c <= ' + todayDate;
            pnQuery += ' AND End_Date__c >= ' + todayDate + ' AND Title__c != null AND Manager_Notices__c = false';
            if(prodFamilyFilter != '') pnQuery += ' and (' + prodFamilyFilter + ')';
            pnQuery += ' Order By Start_Date__c ASC Limit 5';
            
            listImpMessage = Database.query(pnQuery);
        }
        
        for(Portal_Notices__c m : listImpMessage){
            if(m.Body__c != null ){
                
                if(string.valueOf(m.Body__c).length() > 210){
                    m.Body_Short__c = string.valueOf(m.Body__c).substring(0, 210) + '...';
                }
                else{
                    m.Body_Short__c = m.Body__c;
                }
            }
        }
        SET<Id> filteredIds = new SET<Id>();
  
        for (Defect__DataCategorySelection c : [SELECT ParentId, DataCategoryName, DataCategoryGroupName FROM Defect__DataCategorySelection]) {
          if (AddIdToFilterResults(c.dataCategoryGroupName, c.dataCategoryName) == true) {
             filteredIds.add(c.ParentId);
          }
        }
 
        for (FAQ__DataCategorySelection c : [SELECT ParentId, DataCategoryName, DataCategoryGroupName FROM FAQ__DataCategorySelection]) {
          if (AddIdToFilterResults(c.dataCategoryGroupName, c.dataCategoryName) == true) {
            filteredIds.add(c.ParentId);
          }
        }
 
        for (How_To__DataCategorySelection c : [SELECT ParentId, DataCategoryName, DataCategoryGroupName FROM How_To__DataCategorySelection]) {
          if (AddIdToFilterResults(c.dataCategoryGroupName, c.dataCategoryName) == true) {
            filteredIds.add(c.ParentId);
          }
        }
  
        for (Release_Notes__DataCategorySelection c : [SELECT ParentId, DataCategoryName, DataCategoryGroupName FROM Release_Notes__DataCategorySelection]) {
          if (AddIdToFilterResults(c.dataCategoryGroupName, c.dataCategoryName) == true) {
            filteredIds.add(c.ParentId);
          }
        }
     
      for (Tech_Advisory__DataCategorySelection c : [SELECT ParentId, DataCategoryName, DataCategoryGroupName FROM Tech_Advisory__DataCategorySelection]) {
        if (AddIdToFilterResults(c.dataCategoryGroupName, c.dataCategoryName) == true) {
          filteredIds.add(c.ParentId);
        }
      }
 
        for (Tech_Tips__DataCategorySelection c : [SELECT ParentId, DataCategoryName, DataCategoryGroupName FROM Tech_Tips__DataCategorySelection]) {
          if (AddIdToFilterResults(c.dataCategoryGroupName, c.dataCategoryName) == true) {
            filteredIds.add(c.ParentId);
          }
        }
 
        for (Ticket_Solutions__DataCategorySelection c : [SELECT ParentId, DataCategoryName, DataCategoryGroupName FROM Ticket_Solutions__DataCategorySelection]) {
          if (AddIdToFilterResults(c.dataCategoryGroupName, c.dataCategoryName) == true) {
            filteredIds.add(c.ParentId);
          }
        }
 
        for (User_Manuals__DataCategorySelection c : [SELECT ParentId, DataCategoryName, DataCategoryGroupName FROM User_Manuals__DataCategorySelection]) {
          if (AddIdToFilterResults(c.dataCategoryGroupName, c.dataCategoryName) == true) {
            filteredIds.add(c.ParentId);
          }
        }
                                            
        listKA = [SELECT Id, Title, LastPublishedDate FROM KnowledgeArticleVersion 
                  WHERE PublishStatus = 'Online' AND Language = 'en_US' AND  Id IN: filteredIds Order By CreatedDate DESC Limit 3];
        
        
        listLinks = new List<Related_Link__c>();
        
        listLinks = [Select Id, Name, URL__c From Related_Link__c Order By CreatedDate DESC Limit 5 ];
    }
    
    public pageReference DoLoad(){
        PageReference pr = null;
        if(IsActiveContractType != 'YES'){
            pr = new PageReference('/secur/logout.jsp');
            pr.setRedirect(true);
        }
        return pr;
    }
    
     //check if the data category matches based on the filter criteria to add to the filter list or not
    public boolean AddIdToFilterResults(String dataCategoryGroupName, String dataCategoryName) {
 
      //check if they have access to the data category family
      if ((productFamilyIMC == false && dataCategoryGroupName == PortalUserUtil.PERFORM_PRODUCT_FAMILY)
         || (productFamilyEMS == false && dataCategoryGroupName == PortalUserUtil.EMS_PRODUCT_FAMILY)
         || (productFamilyVisiNet == false && dataCategoryGroupName == PortalUserUtil.VISINET_PRODUCT_FAMILY)
         || (productFamilyVisionAir == false && dataCategoryGroupName == PortalUserUtil.VISIONAIR_PRODUCT_FAMILY)
         || (productFamilyZuercher == false && dataCategoryGroupName == PortalUserUtil.PRODUCT_FAMILY_Zuercher)
         || (productFamilyZuercher == false && dataCategoryGroupName == PortalUserUtil.PRODUCT_FAMILY_Tiburon)
         || (productFamilyZuercher == false && dataCategoryGroupName == PortalUserUtil.PRODUCT_FAMILY_ETI)) {
 
           return false;
      }

      //check if they have access to the data category family but the filter is null - return all articles
      if (((productFamilyIMC == true)  && (dataCategoryGroupName == PortalUserUtil.PERFORM_PRODUCT_FAMILY))
         || ((productFamilyEMS == true)  && (dataCategoryGroupName == PortalUserUtil.EMS_PRODUCT_FAMILY))
         || ((productFamilyVisiNET == true) && (dataCategoryGroupName == PortalUserUtil.VISINET_PRODUCT_FAMILY))
         || ((productFamilyVisionAIR == true)  && (dataCategoryGroupName == PortalUserUtil.VISIONAIR_PRODUCT_FAMILY))
         || ((productFamilyZuercher == true)  && (dataCategoryGroupName == PortalUserUtil.PRODUCT_FAMILY_Zuercher))
         || ((productFamilyZuercher == true)  && (dataCategoryGroupName == PortalUserUtil.PRODUCT_FAMILY_Tiburon))
         || ((productFamilyZuercher == true)  && (dataCategoryGroupName == PortalUserUtil.PRODUCT_FAMILY_ETI))) {

 
          return true;
      }

      boolean categoryMatchesFamily = (((productFamilyIMC == true)  && (dataCategoryGroupName == PortalUserUtil.PERFORM_PRODUCT_FAMILY)  )
             || ((productFamilyEMS == true)  && (dataCategoryGroupName == PortalUserUtil.EMS_PRODUCT_FAMILY)  )
             || ((productFamilyVisiNet == true)  && (dataCategoryGroupName == PortalUserUtil.VISINET_PRODUCT_FAMILY)  )
             || ((productFamilyVisionAir == true)  && (dataCategoryGroupName == PortalUserUtil.VISIONAIR_PRODUCT_FAMILY)  )
             || ((productFamilyZuercher == true)  && (dataCategoryGroupName == PortalUserUtil.PRODUCT_FAMILY_Zuercher)  )
             || ((productFamilyZuercher == true)  && (dataCategoryGroupName == PortalUserUtil.PRODUCT_FAMILY_Tiburon)  )
             || ((productFamilyZuercher == true)  && (dataCategoryGroupName == PortalUserUtil.PRODUCT_FAMILY_ETI)  ));
 
      return categoryMatchesFamily;

    }
   
   
    
    public List<SelectOption> getTicketViews() {
        List<SelectOption> options = new List<SelectOption>();
        /*options.add(new SelectOption('fcf=00B80000007nCDU','Closed Tickets - All Time'));  //fcf=00B80000007nCDU
        options.add(new SelectOption('fcf=00B80000007nD6P','Closed Tickets - Last Quarter'));  //fcf=00B80000007nD6P
        options.add(new SelectOption('fcf=00B80000007nD6e','Closed Tickets - P1 or P2'));  //fcf=00B80000007nD6e
        options.add(new SelectOption('fcf=00B80000007nD6j','Closed Tickets - P3,P4,P5'));  //fcf=00B80000007nD6j
        options.add(new SelectOption('fcf=00B80000007nHB9','Fixed in Release (Closed)'));  //fcf=00B80000007nHB9
        options.add(new SelectOption('fcf=00B80000007n3bD','Open Tickets'));  //fcf=00B80000007n3bD
        options.add(new SelectOption('fcf=00B80000007nD6F','Open Tickets - P1 or P2'));  //fcf=00B80000007nD6F
        options.add(new SelectOption('fcf=00B80000007nD6U','Open Tickets - P3,P4,P5'));  //fcf=00B80000007nD6U
        options.add(new SelectOption('Referred_To_Process','Referred To Enhancement Process'));*/
        
        options.add(new Selectoption('Closed_All_Time', 'Closed - All Time'));
        options.add(new Selectoption('Closed_Fixed_Current_Release', 'Closed - Fixed in Current Release'));
        options.add(new Selectoption('Closed_Future_Consideration', 'Closed - Future Consideration'));
        options.add(new Selectoption('Closed_Last_Quarter', 'Closed - Last Quarter'));
        options.add(new Selectoption('Closed_Module_Scheduled_New_Platform', 'Closed - Module Scheduled New Platform'));
        options.add(new Selectoption('Closed_P1_or_P2', 'Closed - P1 or P2'));
        options.add(new Selectoption('Closed_P3_P4_or_P5', 'Closed - P3 P4 or P5'));
        options.add(new Selectoption('Closed_Referred_to_Enhancement_Process', 'Closed - Referred to Enhancement Process'));
        options.add(new Selectoption('Open_All_Tickets_Feature', 'Open - All Tickets (Excluding Feature Requests)'));
        options.add(new Selectoption('Open_All_Tickets_Feature_Only', 'Open - All Tickets (Only Feature Requests)'));
        options.add(new Selectoption('Open_All_Tickets', 'Open - All Tickets'));
        options.add(new Selectoption('Open_Awaiting_Customer_Response', 'Open - Awaiting Customer Response'));
        options.add(new Selectoption('Open_Awaiting_Major_Release', 'Open - Awaiting Major Release'));
        options.add(new Selectoption('Open_Awaiting_Minor_Release', 'Open - Awaiting Minor Release'));
        options.add(new Selectoption('Open_Awaiting_Product_Review', 'Open - Awaiting Product Review'));
        options.add(new Selectoption('Open_Awaiting_Third_Party', 'Open - Awaiting Third Party'));
        options.add(new Selectoption('Open_Fixed_in_Release', 'Open - Fixed in Release'));
        options.add(new Selectoption('Open_In_GIS', 'Open - In GIS'));
        options.add(new Selectoption('Open_In_Progress', 'Open - In Progress'));
        options.add(new Selectoption('Open_In_Support', 'Open - In Support'));
        options.add(new Selectoption('Open_P1_or_P2', 'Open - P1 or P2'));
        options.add(new Selectoption('Open_P3_P4_or_P5', 'Open - P3 P4 or P5'));
        options.add(new Selectoption('Open_Pending_Customer_Verification', 'Open - Pending Customer Verification'));
        options.add(new Selectoption('Open_Requested_Information', 'Open - Requested Information'));
        
        return options;
  }
  
    public Pagereference newTicket() {
        return new Pagereference('/500/e?retURL=/apex/HomePage');
    }
    
    private void setTabPermission(){
        TabPermissions tp = new TabPermissions();
        
        TabPermission = tp;
    }
    
    private string canSave(){
        User u = [select profile.name from user where id = :UserInfo.getUserId() limit 1];
        if(u.profile.name.contains('Read') && u.profile.name.contains('Only')){
            return 'none';
        } else {
            return 'inline';
        }
    }
    
}