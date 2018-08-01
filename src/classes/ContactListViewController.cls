// ==================================================================================
//   Object: ContactListViewController
//  Company: Tritech
//   Author: Mohan Kumar
// Comments: list all the Contacts.
// ==================================================================================
//  Changes: 2012-11-10 Initial version.
// ==================================================================================

public with sharing class ContactListViewController {
    
    public List<Contact> contactList {get;set;}     //HOLDS THE CURRENT SET OF RECORDS SHOWN IN THE GUI 
    
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
    private transient List<Contact> tempList = new List<Contact>();     //THIS CONTAINS THE WHOLE DATA RETRIEVED FROM THE OBJECT
    private integer currentPage = 0;        //INDICATED WHICH PAGE THE USER IS CURRENTLY VIEWING
    private Integer totalRecordsFound = 0;  //STORES THE TOTAL RECORD FOUND
    
    private Integer pageSize = 20;  
    private Long totalPages = 0;
    
    public TabPermissions TabPermission {get; set;} 
    
    //SORTING
    private String sortExp = '';
    public String sortDirection = 'ASC';
    
    //VIEW OBJECT SUPPORTING VARIABLES
    private String whereCondition = '';
    private String queryExecutedLast = '';
    private String readOnlyProfileId = '';
    private String accountId = '';
    
    /*public ContactListViewController(Apexpages.standardController sc) {
      contactList = new List<Contact>();
      filterOptions = new List<Selectoption>();
      filterOptions.add(new Selectoption('', 'All Contacts'));
      filterOptions.add(new Selectoption('New_This_Week', 'New This Week'));
      //get read only profile
      //DEFAULT SEARCH IS DONE ON THE PAGE LOAD
      defaultContactSearch();
    }*/
    
    public ContactListViewController() {
    	setTabPermission();
      	contactList = new List<Contact>();
      	filterOptions = new List<Selectoption>();
      	filterOptions.add(new Selectoption('', 'All Contacts'));
  		filterOptions.add(new Selectoption('New_This_Week', 'New This Week'));
      
      
	    List<User> userList = [Select u.Name, u.IsPortalEnabled, u.ContactId, u.Contact.AccountId From User u Where IsPortalEnabled = true and Id =: Userinfo.getUserId()];
		if(userList.size() > 0) {
			if(userList[0].Contact.AccountId != null) accountId = userList[0].Contact.AccountId;
		}
		
      	//DEFAULT SEARCH IS DONE ON THE PAGE LOAD
      	defaultContactSearch();
    }
    
    //METHOD TO FORMAT THE DATE VALUE
    //private String formatDate(String s) {
    //    String[] sSplit = s.split('/');
    //    return sSplit[2]+ '-' + sSplit[0] + '-' + sSplit[1];
    //}
    
    //METHOD INVOKED TO FILTER THE ACCORDING TO THE SEARCH CRITERIA
    public void contactSearch() {
    	whereCondition = '';
        System.debug('where : '+whereCondition);
        contactList.clear();
        sortExpression = 'LastName';
        sortDirection = 'ASC';
        currentPage = 0;
        
        prepareQueryCondition();
        System.debug('where : '+whereCondition);
        searchQuery = 'Select c.Primary_Contact_WMP__c, c.Title, c.LastName, c.FirstName, c.Phone, c.Name, c.MailingState, c.Inactive_Contact__c, c.Id, c.Email, c.AccountId From Contact c ' + whereCondition;
        system.debug('searchQuery 1'+searchQuery);
        System.debug('Query: '+'Select c.Primary_Contact_WMP__c, c.Title, c.LastName, c.FirstName, c.Phone, c.Name, c.MailingState, c.Inactive_Contact__c, c.Id, c.Email, c.AccountId From Contact c ' + whereCondition + ' order by LastName');
        queryExecutedLast = 'Select c.Primary_Contact_WMP__c, c.Title, c.LastName, c.FirstName, c.Phone, c.Name, c.MailingState, c.Inactive_Contact__c, c.Id, c.Email, c.AccountId From Contact c ' + whereCondition + ' order by LastName';
        try {
          tempList = Database.query('Select c.Primary_Contact_WMP__c, c.Title, c.LastName, c.FirstName, c.Phone, c.Name, c.MailingState, c.Inactive_Contact__c, c.Id, c.Email, c.AccountId From Contact c ' + whereCondition + ' order by LastName');
        } catch (Exception ex) {
          System.debug('Query Failed: '+ ex.getMessage());
          ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.ERROR, ex.getMessage()));
        }
        system.debug('tempList'+tempList);
        if(tempList != null && tempList.size() > 0) {
            totalRecordsFound = tempList.size();
            contactList = prepareContactList(0, pageSize);
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
    public void defaultContactSearch() {
      System.debug('where : '+whereCondition);
        contactList = new List<Contact>();
        filterSelected = '';
        sortExpression = 'LastName';
        currentPage = 0;
        recordShowing = '0 Records';
        pageShowing = '0 of 0';
        totalRecordsFound = 0;
        showPageLabel = true;
        nextPage = true;
        previousPage = true;
        
		prepareQueryCondition();
        System.debug('where : '+whereCondition);
        searchQuery = 'Select c.Primary_Contact_WMP__c, c.Title, c.LastName, c.FirstName, c.Phone, c.Name, c.MailingState, c.Inactive_Contact__c, c.Id, c.Email, c.AccountId From Contact c ' + whereCondition;
        System.debug('query: '+'Select c.Primary_Contact_WMP__c, c.Title, c.LastName, c.FirstName, c.Phone, c.Name, c.MailingState, c.Inactive_Contact__c, c.Id, c.Email, c.AccountId From Contact c ' + whereCondition + ' order by LastName');
        queryExecutedLast = 'Select c.Primary_Contact_WMP__c, c.Title, c.LastName, c.FirstName, c.Phone, c.Name, c.MailingState, c.Inactive_Contact__c, c.Id, c.Email, c.AccountId From Contact c ' + whereCondition + ' order by LastName';
        try {
          tempList = Database.query('Select c.Primary_Contact_WMP__c, c.Title, c.LastName, c.FirstName, c.Phone, c.Name, c.MailingState, c.Inactive_Contact__c, c.Id, c.Email, c.AccountId From Contact c ' + whereCondition + ' order by LastName');
        } catch (Exception ex) {
          System.debug('Query Failed: '+ ex.getMessage());
          ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.ERROR, ex.getMessage()));
        }
        System.debug('tempList size: '+ tempList.size());
        if(tempList != null && tempList.size() > 0) {
            totalRecordsFound = tempList.size();
            contactList = prepareContactList(0, pageSize);
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
    	if(accountId != null && accountId != '') {
    		whereCondition = 'Where AccountId = \'' + accountId + '\' and Inactive_Contact__c = false';
    	}
    	if(filterSelected != null && filterSelected == 'New_This_Week') {
        	if(whereCondition != '') whereCondition += ' and CreatedDate = THIS_WEEK';
        	else whereCondition = 'Where CreatedDate = THIS_WEEK';
        }
        System.debug('where : '+whereCondition);
    }
    
    //METHOD THAT PREPARES THE CURRENT SET OF RECORDS NEED TO BE SHOWN BASED ON THE CURRENTPAGE NUMBER
    private List<Contact> prepareContactList(integer startCount, integer size) {
        List<Contact> currentList = new List<Contact>();
        integer endCount = startCount + size;
        System.debug('msg: '+startCount + '::' + size + '::' +endCount + '::' + currentPage);
        System.debug('msg1: '+tempList.size());
        if(endCount > tempList.size()) {
            endCount = tempList.size();
        }
        Integer rIndex = 0;
        Contact cnt;
        String curUserProfileId = Userinfo.getProfileId();
        for(integer index=startCount; index < endCount; index++) {
            cnt = new Contact();
            cnt = tempList.get(index);
            currentList.add(cnt);
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
      tempList = Database.query(queryExecutedLast);
        this.currentPage--;
        //this.claimProcedureList = allSubList.get(this.currentPage);
        System.debug('startRowNumber: '+startRowNumber);
        System.debug('pageSize: '+pageSize);
        Integer startIndex = (startRowNumber - pageSize) - 1;
        if(startIndex < 0) startIndex = 0;
        this.contactList = prepareContactList(startIndex, pageSize);
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
      tempList = Database.query(queryExecutedLast);
        if(!nextPage) {
            nextPage = true;
        }
        previousPage = true;
        this.currentPage++;
        this.contactList = prepareContactList(endRowNumber, pageSize);
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
            contactList.clear();
            currentPage = 0;
            String sortFullExp = sortExpression  + ' ' + sortDirection;
            /*if(sortExpression == 'Name') {
            	sortFullExp = 'LastName, FirstName'  + ' ' + sortDirection;
            }*/
            system.debug('sortFullExp '+sortFullExp);
            System.debug('query'+searchQuery + ' Order BY ' + sortFullExp);
            queryExecutedLast = searchQuery + ' Order BY ' + sortFullExp;
            try {
            	Boolean runWithNullQuery = true;
            	String searchQueryWithNull = '';
            	String searchQueryWithoutNull = '';
            	if(searchQuery != null && searchQuery.contains(' Where ')) {
            		searchQueryWithoutNull = searchQuery + ' and ' + sortExpression + ' != null';
            		searchQueryWithNull = searchQuery + ' and ' + sortExpression + ' = null';
            	} else {
            		searchQueryWithoutNull = searchQuery + ' Where ' + sortExpression + ' != null';
            		searchQueryWithNull = searchQuery + ' Where ' + sortExpression + ' = null';
            	}
            	if(sortExpression != null && (sortExpression == 'Primary_Contact_WMP__c' || sortExpression == 'Inactive_Contact__c')) {
            		runWithNullQuery = false;
            		searchQueryWithoutNull = searchQuery;
            	}
                tempList = Database.query(searchQueryWithoutNull + ' Order BY ' + sortFullExp);
              	if(runWithNullQuery) {
	              	List<Contact> tempList1 = Database.query(searchQueryWithNull + ' Order BY ' + sortFullExp);
	              	if(tempList1.size() > 0) {
	              		tempList.addAll(tempList1);
	              	}
              	}
            } catch (Exception ex) {
              System.debug('Query Failed: '+ ex.getMessage());
              ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.ERROR, ex.getMessage()));
            }
            system.debug('tempList '+tempList);
            if(tempList != null && tempList.size() > 0) {
                totalRecordsFound = tempList.size();
                contactList = prepareContactList(0, pageSize);
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
    
    public Pagereference newContact() {
    	List<User> userList = [Select u.Name, u.IsPortalEnabled, u.ContactId From User u Where IsPortalEnabled = true and Id =: Userinfo.getUserId()];
		if(userList.size() > 0) {
			//return new Pagereference('/apex/ContactEdit?retURL=/apex/ContactListView');
			return new PageReference('/003/e?retURL=%2F003%2Fo');
		}
    	return null;
    }
    
    private String getCurrentPageNumber(String enteredText, String delimitor) {
      String[] textSplit = enteredText.split(delimitor);
      System.debug('textSplit[0]:'+textSplit[0]);
      return textSplit[0];
    }
    
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
  
    private void clearData() {
      	recordShowing = '0 Records';
        pageShowing = '0 of 0';
        totalRecordsFound = 0;
        showPageLabel = true;
        nextPage = true;
        previousPage = true;
        ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.ERROR, 'No Records found!!'));
    }
    
    private void setTabPermission(){
    	TabPermissions tp = new TabPermissions();
    	
    	TabPermission = tp;
    }
    
}