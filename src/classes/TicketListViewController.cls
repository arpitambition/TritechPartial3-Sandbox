// ==================================================================================
//   Object: TicketListViewController
//  Company: Tritech
// Comments: list all the tickets.
// ==================================================================================
//  Changes: 2012-11-10 Initial version.
// ==================================================================================

public with sharing class TicketListViewController {
    
    public List<TicketList> ticketList {get;set;}     //HOLDS THE CURRENT SET OF RECORDS SHOWN IN THE GUI 
    
    //REVIEW CLAIMS VARIABLES
    public String recordShowing {get;set;} //display the current set of records number shown to the user
    public String pageShowing {get;set;} //display the current page number shown to the user out of total pages found
    public String searchText {get;set;} //HOLDS THE SEARCH TEXT ENTERED BY THE USER
    public String filterSelected {get;set;} //used to store the selected  field on which search is performed
    public List<Selectoption> filterOptions {get;set;} //contains the different  field options 
    //PAGINATION
    public boolean nextPage {get;set;}  //USED FOR DISABLING THE PAGINATION BUTTON
    public boolean previousPage {get;set;}   //USED FOR DISABLING THE PAGINATION BUTTON
    public integer startRowNumber {get;set;}    //STORES THE CURRENT PAGE START INDEX
    public integer endRowNumber {get;set;}  //STORES THE CURRENT PAGE END INDEX
    public Boolean showPageLabel {get;set;} //
    
    private String searchQuery; //STORES THE LATEST QUERY EXECUTED
    private transient List<Case> tempList = new List<Case>();     //THIS CONTAINS THE WHOLE DATA RETRIEVED FROM THE OBJECT
    private integer currentPage = 0;        //INDICATED WHICH PAGE THE USER IS CURRENTLY VIEWING
    private Integer totalRecordsFound = 0;  //STORES THE TOTAL RECORD FOUND
    
    private Integer pageSize = 20;  
    private Long totalPages = 0;
    
    //SORTING
    private String sortExp = '';
    public String sortDirection = 'ASC';
    
    //VIEW OBJECT SUPPORTING VARIABLES
    private String whereCondition = '';
    private String queryExecutedLast = '';
    private String queryExecutedLastWithNull = '';
    private String queryExecutedLastWithoutNull = '';
    private String readOnlyProfileId = '';
    private Boolean sortApplied = false;
    
    public Boolean isReadOnlyProfile {get;set;}
    public String editTicketId {get;set;}
    
    public TabPermissions TabPermission {get; set;} 
    
    //Mohan 12/04/2014: Updated the new Closed Case Statuses
    private List<string> closedCaseStatus = new List<string>{'Closed','Closed - Fix ready for Release','Closed - Fix ready for Patch','Defect - No Fix Planned','Fixed in Current Release','Future Consideration','Module Scheduled for New Platform','Suspended','Referred to Enhancement Process','Works as Designed','Cancelled','Planned Release'};
    
    public TicketListViewController(Apexpages.standardController sc) {
      ticketList = new List<TicketList>();
      filterOptions = new List<Selectoption>();
      filterOptions.add(new Selectoption('Closed_All_Time', 'Closed - All Time'));
      filterOptions.add(new Selectoption('Closed_Fixed_Current_Release', 'Closed - Fixed in Current Release'));
      filterOptions.add(new Selectoption('Closed_Future_Consideration', 'Closed - Future Consideration'));
      filterOptions.add(new Selectoption('Closed_Last_Quarter', 'Closed - Last Quarter'));
      filterOptions.add(new Selectoption('Closed_Module_Scheduled_New_Platform', 'Closed - Module Scheduled New Platform'));
      filterOptions.add(new Selectoption('Closed_P1_or_P2', 'Closed - P1 or P2'));
      filterOptions.add(new Selectoption('Closed_P3_P4_or_P5', 'Closed - P3 P4 or P5'));
      filterOptions.add(new Selectoption('Closed_Referred_to_Enhancement_Process', 'Closed - Referred to Enhancement Process'));
      filterOptions.add(new Selectoption('Open_Fixed_in_Release', 'Open - Fixed in Release'));
      filterOptions.add(new Selectoption('Open_All_Tickets', 'Open - All Tickets'));
      filterOptions.add(new Selectoption('Open_P1_or_P2', 'Open - P1 or P2'));
      filterOptions.add(new Selectoption('Open_P3_P4_or_P5', 'Open - P3 P4 or P5'));
      filterOptions.add(new Selectoption('Open_Pending_Customer_Verification', 'Open - Pending Customer Verification'));
      filterOptions.add(new Selectoption('Open_Requested_Information', 'Open - Requested Information'));
      

      
      isReadOnlyProfile = false;
      //get read only profile
      List<Profile> profileList = [Select Id, Name From Profile Where Name = 'Read Only with Tickets'];
      if(profileList.size() > 0) {
        readOnlyProfileId = profileList[0].Id;
        if(Userinfo.getProfileId() == readOnlyProfileId) {
            isReadOnlyProfile = true;
        }
      }
      //DEFAULT SEARCH IS DONE ON THE PAGE LOAD
      defaultTicketSearch();
    }
    
    public TicketListViewController() {
        setTabPermission();
      ticketList = new List<TicketList>();
      filterOptions = new List<Selectoption>();
      filterOptions.add(new Selectoption('Closed_All_Time', 'Closed - All Time'));
      filterOptions.add(new Selectoption('Closed_Fixed_Current_Release', 'Closed - Fixed in Current Release'));
      filterOptions.add(new Selectoption('Closed_Future_Consideration', 'Closed - Future Consideration'));
      filterOptions.add(new Selectoption('Closed_Last_Quarter', 'Closed - Last Quarter'));
      filterOptions.add(new Selectoption('Closed_Module_Scheduled_New_Platform', 'Closed - Module Scheduled New Platform'));
      filterOptions.add(new Selectoption('Closed_P1_or_P2', 'Closed - P1 or P2'));
      filterOptions.add(new Selectoption('Closed_P3_P4_or_P5', 'Closed - P3 P4 or P5'));
      filterOptions.add(new Selectoption('Closed_Referred_to_Enhancement_Process', 'Closed - Referred to Enhancement Process'));
      filterOptions.add(new Selectoption('Open_Fixed_in_Release', 'Open - Fixed in Release'));
      filterOptions.add(new Selectoption('Open_All_Tickets_Feature', 'Open - All Tickets (Excluding Feature Requests)'));
      filterOptions.add(new Selectoption('Open_All_Tickets_Feature_Only', 'Open - All Tickets (Only Feature Requests)'));
      filterOptions.add(new Selectoption('Open_All_Tickets', 'Open - All Tickets'));
      filterOptions.add(new Selectoption('Open_Awaiting_Customer_Response', 'Open - Awaiting Customer Response'));
      filterOptions.add(new Selectoption('Open_Awaiting_Major_Release', 'Open - Awaiting Major Release'));
      filterOptions.add(new Selectoption('Open_Awaiting_Minor_Release', 'Open - Awaiting Minor Release'));
      filterOptions.add(new Selectoption('Open_Awaiting_Product_Review', 'Open - Awaiting Product Review'));
      filterOptions.add(new Selectoption('Open_Awaiting_Third_Party', 'Open - Awaiting Third Party'));
      filterOptions.add(new Selectoption('Open_Fixed_in_Release', 'Open - Fixed in Release'));
      filterOptions.add(new Selectoption('Open_In_GIS', 'Open - In GIS'));
      filterOptions.add(new Selectoption('Open_In_Progress', 'Open - In Progress'));
      filterOptions.add(new Selectoption('Open_In_Support', 'Open - In Support'));
      filterOptions.add(new Selectoption('Open_P1_or_P2', 'Open - P1 or P2'));
      filterOptions.add(new Selectoption('Open_P3_P4_or_P5', 'Open - P3 P4 or P5'));
      filterOptions.add(new Selectoption('Open_Pending_Customer_Verification', 'Open - Pending Customer Verification'));
      filterOptions.add(new Selectoption('Open_Requested_Information', 'Open - Requested Information'));
     

      
      isReadOnlyProfile = false;
      //get read only profile
      List<Profile> profileList = [Select Id, Name From Profile Where Name = 'Read Only with Tickets'];
      if(profileList.size() > 0) {
        readOnlyProfileId = profileList[0].Id;
        if(Userinfo.getProfileId() == readOnlyProfileId) {
            isReadOnlyProfile = true;
        }
      }
      //DEFAULT SEARCH IS DONE ON THE PAGE LOAD
      defaultTicketSearch();
    }
    
    //METHOD TO FORMAT THE DATE VALUE
    //private String formatDate(String s) {
    //    String[] sSplit = s.split('/');
    //    return sSplit[2]+ '-' + sSplit[0] + '-' + sSplit[1];
    //}
    
    //METHOD INVOKED TO FILTER THE ACCORDING TO THE SEARCH CRITERIA
    public void ticketSearch() {
        whereCondition = '';
        System.debug('where : '+whereCondition);
        ticketList.clear();
        sortExpression = 'CaseNumber';
        sortDirection = 'ASC';
        currentPage = 0;
        
        prepareQueryCondition();
        System.debug('where : '+whereCondition);
        searchQuery = 'Select c.Type, c.Subject, c.Ticket_Product__c, c.Status, c.Priority, c.OwnerId, c.Owner.Name, c.Legacy_Ticket_ID__c, c.Legacy_Fixed_in_Version__c, c.Id, c.Defect_Status__c, c.CreatedDate, c.Contact.Name, c.Contact.Id, c.ContactId, c.Closed_Incidents_Reason_WMP__c, c.ClosedDate, c.CaseNumber,c.Planned_Release__c From Case c ' + whereCondition;
        system.debug('searchQuery 1'+searchQuery);
        System.debug('Query: '+'Select c.Type, c.Ticket_Product__c, c.Subject, c.Status, c.Priority, c.OwnerId, c.Owner.Name, c.Legacy_Ticket_ID__c, c.Legacy_Fixed_in_Version__c, c.Id, c.Defect_Status__c, c.CreatedDate, c.Contact.Name, c.Contact.Id, c.ContactId, c.Closed_Incidents_Reason_WMP__c, c.ClosedDate, c.CaseNumber,c.Planned_Release__c From Case c ' + whereCondition + ' order by CaseNumber');
        queryExecutedLast = 'Select c.Type, c.Subject, c.Ticket_Product__c, c.Status, c.Priority, c.OwnerId, c.Owner.Name, c.Legacy_Ticket_ID__c, c.Legacy_Fixed_in_Version__c, c.Id, c.Defect_Status__c, c.CreatedDate, c.Contact.Name, c.Contact.Id, c.ContactId, c.Closed_Incidents_Reason_WMP__c, c.ClosedDate, c.CaseNumber,c.Planned_Release__c From Case c ' + whereCondition + ' order by CaseNumber';
        try {
          tempList = Database.query('Select c.Type, c.Ticket_Product__c, c.Subject, c.Status, c.Priority, c.OwnerId, c.Owner.Name, c.Legacy_Ticket_ID__c, c.Legacy_Fixed_in_Version__c, c.Id, c.Defect_Status__c, c.CreatedDate, c.Contact.Name, c.Contact.Id, c.ContactId, c.Closed_Incidents_Reason_WMP__c, c.ClosedDate, c.CaseNumber,c.Planned_Release__c From Case c ' + whereCondition + ' order by CaseNumber');
        } catch (Exception ex) {
          System.debug('Query Failed: '+ ex.getMessage());
          ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.ERROR, ex.getMessage()));
        }
        system.debug('tempList'+tempList);
        if(tempList != null && tempList.size() > 0) {
            totalRecordsFound = tempList.size();
            ticketList = prepareTicketList(0, pageSize);
            calculateTotalPages();
            setCurrentRecordsShowing();
            showPageLabel = false;
            if(totalRecordsFound <= pageSize) {
                nextPage = true;
                previousPage = true;
                showPageLabel = true;
            }
            
        } else {
            clearData();
        }
    }
    
    //DEFAULT SEARCH OR INVOKED WHEN USER HITS CLEAR BUTTON
    public void defaultTicketSearch() {
      System.debug('where : '+whereCondition);
        ticketList = new List<TicketList>();
        filterSelected = 'Open_All_Tickets';
        String viewOption = ApexPages.currentPage().getParameters().get('viewOption');
        if(viewOption != null && viewOption != '') {
            filterSelected = viewOption;
        }
        sortExpression = 'CaseNumber';
        currentPage = 0;
        recordShowing = '0 Records';
        pageShowing = '0 of 0';
        totalRecordsFound = 0;
        showPageLabel = true;
        nextPage = true;
        previousPage = true;
        
        prepareQueryCondition();
        System.debug('where : '+whereCondition);
        searchQuery = 'Select c.Type, c.Ticket_Product__c, c.Subject, c.Status, c.Priority, c.OwnerId, c.Owner.Name, c.Legacy_Ticket_ID__c, c.Legacy_Fixed_in_Version__c, c.Id, c.Defect_Status__c, c.CreatedDate, c.Contact.Name, c.Contact.Id, c.ContactId, c.Closed_Incidents_Reason_WMP__c, c.ClosedDate, c.CaseNumber,c.Planned_Release__c From Case c ' + whereCondition;
        //String qry = 'Select c.TagCsv, c.TagCsv__c, c.OwnerId, c.Owner.Name, c.Id, c.FileType, c.Title, c.Dummy__c, c.ContentSize From ContentVersion c ' + whereCondition + ' order by LastModifiedDate desc limit 50000';
        System.debug('query: '+'Select c.Type, c.Subject, c.Ticket_Product__c, c.Status, c.Priority, c.OwnerId, c.Owner.Name, c.Legacy_Ticket_ID__c, c.Legacy_Fixed_in_Version__c, c.Id, c.Defect_Status__c, c.CreatedDate, c.Contact.Name, c.Contact.Id, c.ContactId, c.Closed_Incidents_Reason_WMP__c, c.ClosedDate, c.CaseNumber,c.Planned_Release__c From Case c ' + whereCondition + ' order by CaseNumber');
        queryExecutedLast = 'Select c.Type, c.Ticket_Product__c, c.Subject, c.Status, c.Priority, c.OwnerId, c.Owner.Name, c.Legacy_Ticket_ID__c, c.Legacy_Fixed_in_Version__c, c.Id, c.Defect_Status__c, c.CreatedDate, c.Contact.Name, c.Contact.Id, c.ContactId, c.Closed_Incidents_Reason_WMP__c, c.ClosedDate, c.CaseNumber,c.Planned_Release__c From Case c ' + whereCondition + ' order by CaseNumber';
        try {
          tempList = Database.query('Select c.Type, c.Ticket_Product__c, c.Subject, c.Status, c.Priority, c.OwnerId, c.Owner.Name, c.Legacy_Ticket_ID__c, c.Legacy_Fixed_in_Version__c, c.Id, c.Defect_Status__c, c.CreatedDate, c.Contact.Name, c.Contact.Id, c.ContactId, c.Closed_Incidents_Reason_WMP__c, c.ClosedDate, c.CaseNumber,c.Planned_Release__c From Case c ' + whereCondition + ' order by CaseNumber');
        } catch (Exception ex) {
          System.debug('Query Failed: '+ ex.getMessage());
          ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.ERROR, ex.getMessage()));
        }
        System.debug('tempList size: '+ tempList.size());
        if(tempList != null && tempList.size() > 0) {
            totalRecordsFound = tempList.size();
            ticketList = prepareTicketList(0, pageSize);
            calculateTotalPages();
            setCurrentRecordsShowing();
            showPageLabel = false;
            if(totalRecordsFound <= pageSize) {
                previousPage = true;
                nextPage = true;
                showPageLabel = true;
            }
            
        } else {
            clearData();
            previousPage = true;
        }
    }
    
    private void prepareQueryCondition() {
        whereCondition = 'Where RecordType.Name in (\'Customer Support Ticket\',\'Zuercher Customer Support Ticket\',\'Cross Support Ticket\')';
        if(filterSelected != null && filterSelected == 'Closed_All_Time') {
            whereCondition += ' and (Status = \'Closed\' or Status = \'Closed - Fix ready for Release\' or Status = \'Closed - Fix ready for Patch\'or Status = \'Answered\'or Status = \'By Design\'or Status = \'Completed\' or Status = \'Duplicate\' or Status = \'Fixed\' or Status = \'Implemented\' or Status = \'Not Reproducible\' or Status = \'Resolved Pending Further Info\' or Status = \'Customer Initiated CLosure\' or Status = \'Opened in Error\' or Status = \'Test Ticket\')';
            whereCondition += ' and RecordType.Name != \'Legacy Customer Support Ticket\'';
        } else if(filterSelected != null && filterSelected == 'Closed_Fixed_Current_Release') {
            whereCondition += ' and IsClosed = true';
            whereCondition += ' and (Status = \'Fixed in Current Release\')';
        } else if(filterSelected != null && filterSelected == 'Closed_Future_Consideration') {
            //whereCondition += ' and IsClosed = true';
            whereCondition += ' and (Status = \'Future Consideration\')';
        } else if(filterSelected != null && filterSelected == 'Closed_Last_Quarter') {
            whereCondition += ' and (Status = \'Closed\' or Status = \'Closed - Fix ready for Release\' or Status = \'Closed - Fix ready for Patch\'or Status = \'Answered\'or Status = \'By Design\'or Status = \'Completed\' or Status = \'Duplicate\'or Status = \'Fixed\'or Status = \'Implemented\'or Status = \'Not Reproducible\'or Status = \'Resolved Pending Further Info\' or Status = \'Customer Initiated CLosure\'or Status = \'Opened in Error\'or Status = \'Test Ticket\')';
            whereCondition += ' and ClosedDate = LAST_QUARTER';
            whereCondition += ' and (Z_Issue_Type__c != \'Feature\')';
        } else if(filterSelected != null && filterSelected == 'Closed_Module_Scheduled_New_Platform') {
            whereCondition += ' and (Status = \'Module Scheduled for New Platform\')';
        } else if(filterSelected != null && filterSelected == 'Closed_P1_or_P2') {
            //By Madan - (12/10/2014): No need to filter according to Status incase filtring according to Priority
            //whereCondition += ' and (Status = \'Closed\' or Status = \'Closed - Fix ready for Release\' or Status = \'Closed - Fix ready for Patch\'or Status = \'Answered\'or Status = \'By Design\'or Status = \'Completed\'
        
            whereCondition += ' and IsClosed = true';
            whereCondition += ' and (Priority = \'P1 - System Down\' or Priority = \'P2\')';
        } else if(filterSelected != null && filterSelected == 'Closed_P3_P4_or_P5') {
            //By Madan - (12/10/2014): No need to filter according to Status incase filtring according to Priority
            //whereCondition += ' and (Status = \'Closed\' or Status = \'Closed - Fix ready for Release\' or Status = \'Closed - Fix ready for Patch\' or Status = \'Suspended\'or Status = \'Answered\'or Status = \'By Design\'or Status = \'Completed\'
        
            whereCondition += ' and IsClosed = true';
            whereCondition += ' and (Priority = \'P3\' or Priority = \'P4\' or Priority = \'P5\')';
        } else if(filterSelected != null && filterSelected == 'Closed_Referred_to_Enhancement_Process') {
            //whereCondition += ' and ((Status = \'Referred to Enhancement Process\')';
            //whereCondition += ' or (Closed_Incidents_Reason_WMP__c = \'Referred to Enhancement Process\'))';
            whereCondition += ' and (Closed_Incidents_Reason_WMP__c = \'Referred to Enhancement Process\')';
            whereCondition += ' and IsClosed = true';
        } else if(filterSelected != null && filterSelected == 'Open_Fixed_in_Release') {
            whereCondition += ' and ((Status = \'Fixed in Release\' or Status = \'Fixed in Current Release\')';
            whereCondition += ' or (Legacy_Ticket_Status__c = \'Fixed in version (closed)\'))';
            //whereCondition += ' and (Status = \'Fixed in Release\')';
        } else if(filterSelected != null && filterSelected == 'Open_All_Tickets') {
            whereCondition += ' and IsClosed = false ';
            whereCondition += ' and Status != \'Closed\' and Status NOT IN :closedCaseStatus';
        } else if(filterSelected != null && filterSelected == 'Open_P1_or_P2') {
            //By Madan - (12/10/2014): No need to filter according to Status incase filtring according to Priority
            //whereCondition += ' and Status != \'Closed\' and Status NOT IN :closedCaseStatus';
            whereCondition += ' and IsClosed != true';
            whereCondition += ' and (Priority = \'P1 - System Down\' or Priority = \'P2\')';
            whereCondition += ' and (Z_Issue_Type__c != \'Feature\')';
        } else if(filterSelected != null && filterSelected == 'Open_P3_P4_or_P5') {
            //By Madan - (12/10/2014): No need to filter according to Status incase filtring according to Priority
            //whereCondition += ' and Status != \'Closed\' and Status NOT IN :closedCaseStatus';
            whereCondition += ' and IsClosed != true';
            whereCondition += ' and (Priority = \'P3\' or Priority = \'P4\' or Priority = \'P5\')';
            whereCondition += ' and (Z_Issue_Type__c != \'Feature\')';
        } 
        else if(filterSelected != null && filterSelected == 'Open_Pending_Customer_Verification') {
            whereCondition += ' and (Status = \'Pending Customer Verification\')';
            whereCondition += ' and (Z_Issue_Type__c != \'Feature\')';
        } 
        else if(filterSelected != null && filterSelected == 'Open_Requested_Information') {
            whereCondition += ' and (Status = \'Requested Information from Customer\')';
            whereCondition += ' and (Z_Issue_Type__c != \'Feature\')';
        }
        else if(filterSelected != null && filterSelected == 'Open_All_Tickets_Feature') {
            whereCondition += ' and IsClosed = false ';
            whereCondition += ' and Status != \'Closed\' and Status NOT IN :closedCaseStatus';
            whereCondition += ' and (Z_Issue_Type__c != \'Feature\')';
        }
        else if(filterSelected != null && filterSelected == 'Open_All_Tickets_Feature_Only') {
            whereCondition += ' and IsClosed = false ';
            whereCondition += ' and Status != \'Closed\' and Status NOT IN :closedCaseStatus';
            whereCondition += ' and (Z_Issue_Type__c = \'Feature\')';
        }
        
        else if(filterSelected != null && filterSelected == 'Open_In_GIS') {
            whereCondition += ' and (Status = \'In GIS\')';
            whereCondition += ' and (Z_Issue_Type__c != \'Feature\')';
        }
        else if(filterSelected != null && filterSelected == 'Open_Awaiting_Minor_Release') {
            whereCondition += ' and (Status = \'Awaiting Minor Release\')';
            whereCondition += ' and (Z_Issue_Type__c != \'Feature\')';
        }
        else if(filterSelected != null && filterSelected == 'Open_Awaiting_Major_Release') {
            whereCondition += ' and (Status = \'Awaiting Major Release\')';
            whereCondition += ' and (Z_Issue_Type__c != \'Feature\')';
        }
        else if(filterSelected != null && filterSelected == 'Open_In_Progress') {
            whereCondition += ' and (Status = \'In Progress\')';
            whereCondition += ' and (Z_Issue_Type__c != \'Feature\')';
        }
        else if(filterSelected != null && filterSelected == 'Open_Awaiting_Product_Review') {
            whereCondition += ' and (Status = \'Awaiting Product Review\')';
            whereCondition += ' and (Z_Issue_Type__c != \'Feature\')';
        }
        else if(filterSelected != null && filterSelected == 'Open_Awaiting_Third_Party') {
            whereCondition += ' and (Status = \'Awaiting Third Party\')';
            whereCondition += ' and (Z_Issue_Type__c != \'Feature\')';
        }
        else if(filterSelected != null && filterSelected == 'Open_Awaiting_Customer_Response') {
            whereCondition += ' and (Status = \'Awaiting Customer Response\')';
            whereCondition += ' and (Z_Issue_Type__c != \'Feature\')';
        }
        else if(filterSelected != null && filterSelected == 'Open_In_Support') {
            whereCondition += ' and (Status = \'In Support\')';
            whereCondition += ' and (Z_Issue_Type__c != \'Feature\')';
        }
        /*
        if(filterSelected != null && filterSelected == 'CSC_Closed_Tickets_All_Time') {
            whereCondition = 'Where RecordType.Name = \'Customer Support Ticket\'';
            whereCondition += ' and (Status = \'Closed\' or Status = \'Closed - Fix ready for Release\' or Status = \'Closed - Fix ready for Patch\')';
            whereCondition += ' and RecordType.Name != \'Legacy Customer Support Ticket\'';
        } else if(filterSelected != null && filterSelected == 'CSC_Closed_Tickets_Last_Quarter') {
            whereCondition = 'Where RecordType.Name = \'Customer Support Ticket\'';
            whereCondition += ' and (Status = \'Closed\' or Status = \'Closed - Fix ready for Release\' or Status = \'Closed - Fix ready for Patch\')';
            whereCondition += ' and ClosedDate = LAST_QUARTER';
        } else if(filterSelected != null && filterSelected == 'CSC_Closed_Tickets_P1_or_P2') {
            whereCondition = 'Where RecordType.Name = \'Customer Support Ticket\'';
            whereCondition += ' and (Status = \'Closed\' or Status = \'Closed - Fix ready for Release\' or Status = \'Closed - Fix ready for Patch\')';
            whereCondition += ' and (Priority = \'P1 - System Down\' or Priority = \'P2\')';
        } else if(filterSelected != null && filterSelected == 'CSC_Closed_Tickets_P3_P4_P5') {
            whereCondition = 'Where RecordType.Name = \'Customer Support Ticket\'';
            whereCondition += ' and (Status = \'Closed\' or Status = \'Closed - Fix ready for Release\' or Status = \'Closed - Fix ready for Patch\')';
            whereCondition += ' and (Priority = \'P3\' or Priority = \'P4\' or Priority = \'P5\')';
        } else if(filterSelected != null && filterSelected == 'CSC_Fixed_in_Release_Closed') {
            whereCondition = 'Where RecordType.Name = \'Customer Support Ticket\'';
            whereCondition += ' and ((Status = \'Fixed in Release\' or Status = \'Fixed in Current Release\')';
            whereCondition += ' or (Legacy_Ticket_Status__c like \'%Fixed in Version (closed)%\'))';
        } else if(filterSelected != null && filterSelected == 'Customer_Portal_Open') {
            whereCondition = 'Where RecordType.Name = \'Customer Support Ticket\'';
            whereCondition += ' and (Status != \'Closed\' and Status != \'Closed - Fix ready for Release\' and Status != \'Closed - Fix ready for Patch\' and Status != \'Suspended\')';
        } else if(filterSelected != null && filterSelected == 'CSC_Open_Tickets_P1_or_P2') {
            whereCondition = 'Where RecordType.Name = \'Customer Support Ticket\'';
            whereCondition += ' and (Status != \'Closed\' and Status != \'Closed - Fix ready for Release\' and Status != \'Closed - Fix ready for Patch\' and Status != \'Suspended\')';
            whereCondition += ' and (Priority = \'P1 - System Down\' or Priority = \'P2\')';
        } else if(filterSelected != null && filterSelected == 'CSC_Open_Tickets_P3_P4_P5') {
            whereCondition = 'Where RecordType.Name = \'Customer Support Ticket\'';
            whereCondition += ' and (Status != \'Closed\' and Status != \'Closed - Fix ready for Release\' and Status != \'Closed - Fix ready for Patch\' and Status != \'Suspended\')';
            whereCondition += ' and (Priority = \'P3\' or Priority = \'P4\' or Priority = \'P5\')';
        } else if(filterSelected != null && filterSelected == 'Referred_to_Enhancement_Process') {
            whereCondition = 'Where RecordType.Name = \'Customer Support Ticket\'';
            //whereCondition += ' and Closed_Incidents_Reason_WMP__c != \'Referred to Enhancement Process\'';
            whereCondition += ' and Closed_Incidents_Reason_WMP__c = \'Referred to Enhancement Process\'';
        }*/
        System.debug('where : '+whereCondition);
    }
    
    //METHOD THAT PREPARES THE CURRENT SET OF RECORDS NEED TO BE SHOWN BASED ON THE CURRENTPAGE NUMBER
    private List<TicketList> prepareTicketList(integer startCount, integer size) {
        List<TicketList> currentList = new List<TicketList>();
        integer endCount = startCount + size;
        System.debug('msg: '+startCount + '::' + size + '::' +endCount + '::' + currentPage);
        System.debug('msg1: '+tempList.size());
        if(endCount > tempList.size()) {
            endCount = tempList.size();
        }
        Integer rIndex = 0;
        TicketList tkt;
        String curUserProfileId = Userinfo.getProfileId();
        for(integer index=startCount; index < endCount; index++) {
            tkt = new TicketList();
            tkt.cse = tempList.get(index);
            System.debug('readOnlyProfileId == curUserProfileId >> '+ readOnlyProfileId + ' == ' + curUserProfileId);
            if(tkt.cse.Status != null && (tkt.cse.Status == 'Closed' || tkt.cse.Status == 'Closed – Fix ready for Release'
                || tkt.cse.Status == 'Closed – Fix ready for Patch' || tkt.cse.Status == 'Suspended' 
                || tkt.cse.Status == 'Fixed in Current Release' || tkt.cse.Status == 'Module Scheduled for New Platform' 
                || tkt.cse.Status == 'Future Consideration')) tkt.isEdit = false;
            else if(readOnlyProfileId != null && curUserProfileId != null && curUserProfileId == readOnlyProfileId) tkt.isEdit = false;
            //.RowIndex__c = rIndex;
            currentList.add(tkt);
            rIndex++;
        }
        if(startCount == 0) {
            nextPage = false;
        } else {
            nextPage = true;
        }
        if(endCount < tempList.size() || tempList.size() < size) {
            previousPage = true;
        } else {
            previousPage = false;
        }
        
        if(startCount == 0) {
            startRowNumber = 1;
            endRowNumber = endCount;
            if(tempList.size() <= pageSize) {
                previousPage = false;
            }
        }
        /*else {
            startRowNumber = startCount+1;
            endRowNumber = endCount;
        }*/
        System.debug('previousPage'+previousPage);
        System.debug('nextPage'+nextPage);
        return currentList;
    }
    
    //INVOKED WHEN PREVIOUS BUTTON IS ENTERED
    public void goToPreviousPage() {
        if(sortApplied) {
            tempList = Database.query(queryExecutedLastWithoutNull);
            List<Case> tempList1 = Database.query(queryExecutedLastWithNull);
            if(tempList1.size() > 0) {
                tempList.addAll(tempList1);
            }
        } else {
            tempList = Database.query(queryExecutedLast);
        }
        this.currentPage--;
        //this.claimProcedureList = allSubList.get(this.currentPage);
        System.debug('startRowNumber: '+startRowNumber);
        System.debug('pageSize: '+pageSize);
        Integer startIndex = (startRowNumber - pageSize) - 1;
        if(startIndex < 0) startIndex = 0;
        this.ticketList = prepareTicketList(startIndex, pageSize);
        if(this.currentPage == 0) {
            nextPage = false;
            previousPage = true;
            startRowNumber = 1;
            endRowNumber = pageSize;
        } else {
            previousPage = false;
            nextPage = false;
            startRowNumber -= pageSize;
            endRowNumber = (startRowNumber + pageSize) - 1;
        }
        System.debug('startRowNumber: '+startRowNumber);
        System.debug('endRowNumber: '+endRowNumber);
        setCurrentRecordsShowing();
    }
    
    //INVOKED WHEN NEXT BUTTON IS ENTERED
    public void goToNextPage() {
        if(sortApplied) {
            tempList = Database.query(queryExecutedLastWithoutNull);
            List<Case> tempList1 = Database.query(queryExecutedLastWithNull);
            if(tempList1.size() > 0) {
                tempList.addAll(tempList1);
            }
        } else {
            tempList = Database.query(queryExecutedLast);
        }
        if(!nextPage) {
            nextPage = true;
        }
        previousPage = true;
        this.currentPage++;
        this.ticketList = prepareTicketList(endRowNumber, pageSize);
        //String.valueOf(currentPage+1) + ' of ' + String.valueOf(totalPages);
        System.debug('count: '+currentPage + '::' + totalPages);
        if(currentPage+1 == totalPages) {
          nextPage = true;
          previousPage = false;
        } else {
          previousPage = false;
          nextPage = false;
        }
        startRowNumber = endRowNumber+1;
        endRowNumber = endRowNumber + pageSize;
        if(endRowNumber > tempList.size()) {
            endRowNumber = tempList.size();
        }
        System.debug('startRowNumber: '+startRowNumber);
        System.debug('endRowNumber: '+endRowNumber);
        setCurrentRecordsShowing();
    }
    
    //SHOWS THE COUNT OF THE RECORDS SHOWN ON THE PAGE
    private void setCurrentRecordsShowing() {
        recordShowing = 'Showing: ' + String.valueOf(startRowNumber) + '-' + String.valueOf(endRowNumber) + ' of ' + String.valueOf(totalRecordsFound);
        pageShowing = String.valueOf(currentPage+1) + ' of ' + String.valueOf(totalPages);
    }
    
    //SETS THE SORT DIRECTION FOR THE SORTING COLUMN
    public String sortExpression{
        get {
            return sortExp;
        }
        set {
            //if the column is clicked on then switch between Ascending and Descending modes
            if (value == sortExp)
                sortDirection = (sortDirection == 'DESC')? 'ASC' : 'DESC';
            else
                sortDirection = 'ASC';
                sortExp = value;
        }
    }
    
    //method returning sort direction value i.e ASC
    public String getSortDirection(){
        //if not column is selected 
        if (sortExpression == null || sortExpression == '')
            return 'ASC';
        else
            return sortDirection;
    }
    
    //METHOD TO SORT THE SEARCH RESULT COLUMNS
    public void sortData(){
        if(searchQuery != null && searchQuery.length() > 0) {
            system.debug('searchQuery '+searchQuery);
            ticketList.clear();
            currentPage = 0;
            String sortFullExp = sortExpression  + ' ' + sortDirection;
            system.debug('sortFullExp '+sortFullExp);
            System.debug('query'+searchQuery + ' Order BY ' + sortFullExp);
            queryExecutedLast = searchQuery + ' Order BY ' + sortFullExp;
            try {
                String searchQueryWithNull = '';
                String searchQueryWithoutNull = '';
                if(searchQuery != null && searchQuery.contains(' Where ')) {
                    searchQueryWithoutNull = searchQuery + ' and ' + sortExpression + ' != null';
                    searchQueryWithNull = searchQuery + ' and ' + sortExpression + ' = null';
                } else {
                    searchQueryWithoutNull = searchQuery + ' Where ' + sortExpression + ' != null';
                    searchQueryWithNull = searchQuery + ' Where ' + sortExpression + ' = null';
                }
                //store the sort queries
                queryExecutedLastWithNull = searchQueryWithNull + ' Order BY ' + sortFullExp;
                queryExecutedLastWithoutNull = searchQueryWithoutNull + ' Order BY ' + sortFullExp;
                tempList = Database.query(searchQueryWithoutNull + ' Order BY ' + sortFullExp);
                List<Case> tempList1 = Database.query(searchQueryWithNull + ' Order BY ' + sortFullExp);
                if(tempList1.size() > 0) {
                    tempList.addAll(tempList1);
                }
                sortApplied = true;
            } catch (Exception ex) {
              System.debug('Query Failed: '+ ex.getMessage());
              ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.ERROR, ex.getMessage()));
            }
            system.debug('tempList '+tempList);
            if(tempList != null && tempList.size() > 0) {
                totalRecordsFound = tempList.size();
                ticketList = prepareTicketList(0, pageSize);
                calculateTotalPages();
                setCurrentRecordsShowing();
                showPageLabel = false;
                if(totalRecordsFound <= pageSize) {
                    nextPage = true;
                    previousPage = true;
                    showPageLabel = true;
                }
                
            } else {
                clearData();
            }
            
        }
    }
    
    /*public void pageRedirection(){
      tempList = Database.query(queryExecutedLast);
      System.debug('pageShowing '+pageShowing);
      if(pageShowing != null) {
        if(pageShowing == '') {
          this.currentPage = 0;
          ticketList = prepareTicketList(0, pageSize);
            setCurrentRecordsShowing();
        } else {
          String enteredPageNumber = formatString(pageShowing);
          if(enteredPageNumber.indexOf('of') > -1) {
            String pageIndex = getCurrentPageNumber(enteredPageNumber, 'of');
            buildProcedureList(pageIndex);
          } else {
            buildProcedureList(enteredPageNumber);
          }
        }
      }
    }*/
    
    public Pagereference newTicket() {
        List<User> userList = [Select u.Name, u.IsPortalEnabled, u.ContactId From User u Where IsPortalEnabled = true and Id =: Userinfo.getUserId()];
        if(userList.size() > 0) {
            return new Pagereference('/apex/TritechHome'); //('/500/e?retURL=/apex/TicketListView');
        }
        return new Pagereference('/setup/ui/recordtypeselect.jsp?ent=Case&retURL=/apex/TicketListView');
    }
    
    private String getCurrentPageNumber(String enteredText, String delimitor) {
      String[] textSplit = enteredText.split(delimitor);
      System.debug('textSplit[0]:'+textSplit[0]);
      return textSplit[0];
    }
    
    /*private void buildProcedureList(String pageNumber) {
      
      Integer pNumb = Integer.valueOf(pageNumber);
      Boolean prepareNumb = false;
      System.debug('pNumb:'+pNumb);
      System.debug('totalRecordsFound:'+totalRecordsFound);
      if(pNumb <= 0) {
        this.currentPage = 0;
      ticketList = prepareTicketList(0, pageSize);
          setCurrentRecordsShowing();
      } else if(pNumb > totalPages) {
        pNumb = Integer.valueOf(totalPages);
        this.currentPage = Integer.valueOf(totalPages) - 1;
        Integer i = currentPage * pageSize;
        System.debug('i value:'+i);
      ticketList = prepareTicketList(i, pageSize);
      prepareNumb = true;
      } else {
        this.currentPage = pNumb - 1;
        Integer i = currentPage * pageSize;
        System.debug('i value:'+i);
      ticketList = prepareTicketList(i, pageSize);
      prepareNumb = true;
      }
      if(prepareNumb) {
      startRowNumber = ((pNumb - 1) * pageSize) + 1;
          endRowNumber = ((pNumb - 1) * pageSize) + pageSize;
          if(endRowNumber > tempList.size()) {
              endRowNumber = tempList.size();
          }
          setCurrentRecordsShowing();
      }
    }*/
    
    private void calculateTotalPages() {
    
    Decimal rowSize = totalRecordsFound;
      Decimal ttlPages = rowSize.divide(pageSize, 2, System.RoundingMode.UP);
      //System.debug('ttlPages '+ttlPages);
      totalPages = ttlPages.round();
      if(ttlPages > totalPages) {
          totalPages += 1;
        }
        system.debug('Total Pages'+totalPages);
        
  }
  
  /*private String formatString(String s) {
      
      if(s.startsWith(' ')) {
          s = s.substring(1, s.length()-1);
        }
        if(s.endsWith(' ')) {
          s = s.substring(0, s.length()-2);
      }
      
      while(s.indexOf(' ') > -1){
      s = s.replace(' ', '');
        }
        
    //System.debug('formated '+s);
    return s;
    }*/
    
    private void clearData() {
      recordShowing = '0 Records';
        pageShowing = '0 of 0';
        totalRecordsFound = 0;
        showPageLabel = true;
        nextPage = true;
        previousPage = true;
        ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.ERROR, 'No Records found!!'));
    }
    
    public class TicketList {
      public Case cse {get;set;}
      public Boolean isEdit {get;set;}
      
      public TicketList() {
        cse = new Case();
        isEdit = true;
      }
    }
    
    private void setTabPermission(){
        TabPermission = new TabPermissions();
    }
    
}