trigger WOAssignment1 on Case (after update) 
{
	//building a list to store the possible Task records
  List<Task> insertTask = new List<Task>();	
  for(Case c : trigger.new) {
  	//getting the old values to see if the status or CIS and SE values have changed
  	Case oldCase = Trigger.oldMap.get(c.Id);
  	//Assigning people to variables for the task assignment
  	string ass1 = 'Edwin Juarez';
  	string ass2 = 'Armando Saenz';
  	string ass3 = 'Jon Pitt';
  	string ass4 = 'Scott Kraetsch';
  	//Determining the high level criteria to see if the trigger needs to even continue
  	//first piece is for Cases where the Status has been changed to Approved - Assigned
    if((c.RecordTypeId == Schema.SObjectType.Case.getRecordTypeInfosByName().get('Work Order Ticket').getRecordTypeId()		
		&& c.Account_Support_Team__c.startsWith('Inform')
		&& c.Work_Order_Type__c == 'Project - Rehost' 
		&& c.Status == 'Approved - Assigned'
		&& c.status != oldCase.Status
		&& c.CIS_Rehost_Task__c == oldCase.CIS_Rehost_Task__c
		&& c.owner == oldCase.owner
	) 
	|| 
     	//this is for cases with an existing status of approved - Assigned but have updated the SE or CIS list values
    	(c.RecordTypeId == Schema.SObjectType.Case.getRecordTypeInfosByName().get('Work Order Ticket').getRecordTypeId()
    		&& c.Account_Support_Team__c.startsWith('Inform')
    		&& c.Work_Order_Type__c == 'Project - Rehost'
    		&& c.Status == 'Approved - Assigned'
    		&& c.CIS_Rehost_Task__c != oldCase.CIS_Rehost_Task__c
    		&& c.owner == oldCase.owner
    	)
    )
    {
      
      //second step logic to see what tasks need to be created.
      //the !oldCase looks at the previous data to verify that the value has been added and only creates tasks when changes are made to the SE and CIS lists.
      If((c.CIS_Rehost_Task__c != ''))
      {
      Account[] acct = [Select Name from account where id = :c.AccountId];	
      if(!string.isblank(c.CIS_Rehost_Task__c))
      {
      	
      if(c.CIS_Rehost_Task__c.contains('CAD.')&& !string.isblank(oldCase.CIS_Rehost_Task__c))      {
      	if(c.CIS_Rehost_Task__c.contains('CAD.')&& !oldCase.CIS_Rehost_Task__c.contains('CAD.'))      	{
      	Task newTask = new Task();
		newTask.subject = 'CIS Rehost Task - CAD';
		newTask.Description = 'CIS Team to Rehost the Primary CAD server to the Pre-Production CAD server. Please see project scope in the secure folder for Date and Time of the Rehostc Cad outage – 2 to 4 hours';
		newTask.whatId = c.Id;
		newTask.Type = 'Project';
		//newTask.Account_Name__c = acct[0].Name;
		newTask.ownerId = [select id from user where name = :ass2].id;
		newTask.ActivityDate = c.createdDate.date() + 30;
		
		insertTask.add(newTask);      	}      }
      if(c.CIS_Rehost_Task__c.contains('CAD.')&& string.isblank(oldCase.CIS_Rehost_Task__c))      {
      	Task newTask = new Task();
		newTask.subject = 'CIS Rehost Task - CAD';
		newTask.Description = 'CIS Team to Rehost the Primary CAD server to the Pre-Production CAD server. Please see project scope in the secure folder for Date and Time of the Rehostc Cad outage – 2 to 4 hours';
		newTask.whatId = c.Id;
		newTask.Type = 'Project';
		//newTask.Account_Name__c = acct[0].Name;
		newTask.ownerId = [select id from user where name = :ass2].id;
		newTask.ActivityDate = c.createdDate.date() + 30;
		
		insertTask.add(newTask);      }
      if(c.CIS_Rehost_Task__c.contains('CAD Interface(s)')&& !string.isblank(oldCase.CIS_Rehost_Task__c))      {
      	if(c.CIS_Rehost_Task__c.contains('CAD Interface(s)')&& !oldCase.CIS_Rehost_Task__c.contains('CAD Interface(s)'))      	{
      	Task newTask = new Task();
		newTask.subject = 'CIS Rehost Task - Interface(s)';
		newTask.Description = 'CIS Team to Rehost the Primary Interface server(s) to the Pre-Production Interface server(s) Please see project scope in the secure folder for Date and Time of the Rehost.';
		newTask.whatId = c.Id;
		newTask.Type = 'Project';
		//newTask.Account_Name__c = acct[0].Name;
		newTask.ownerId = [select id from user where name = :ass2].id;
		newTask.ActivityDate = c.createdDate.date() + 30;
		
		insertTask.add(newTask);      	}      }
      if(c.CIS_Rehost_Task__c.contains('CAD Interface(s)')&& string.isblank(oldCase.CIS_Rehost_Task__c))      {
      	Task newTask = new Task();
		newTask.subject = 'CIS Rehost Task - Interface(s)';
		newTask.Description = 'CIS Team to Rehost the Primary Interface server(s) to the Pre-Production Interface server(s) Please see project scope in the secure folder for Date and Time of the Rehost.';
		newTask.whatId = c.Id;
		newTask.Type = 'Project';
		//newTask.Account_Name__c = acct[0].Name;
		newTask.ownerId = [select id from user where name = :ass2].id;
		newTask.ActivityDate = c.createdDate.date() + 30;
		
		insertTask.add(newTask);      }
      if(c.CIS_Rehost_Task__c.contains('CAD Relay Server')&& !string.isblank(oldCase.CIS_Rehost_Task__c))      {
      	if(c.CIS_Rehost_Task__c.contains('CAD Relay Server')&& !oldCase.CIS_Rehost_Task__c.contains('CAD Relay Server'))      	{
      	Task newTask = new Task();
		newTask.subject = 'CIS Rehost Task - CAD Relay Server';
		newTask.Description = 'CIS Rehost Task - CAD Relay Server';
		newTask.whatId = c.Id;
		newTask.Type = 'Project';
		//newTask.Account_Name__c = acct[0].Name;
		newTask.ownerId = [select id from user where name = :ass2].id;
		newTask.ActivityDate = c.createdDate.date() + 30;
		
		insertTask.add(newTask);      	}      }
      if(c.CIS_Rehost_Task__c.contains('CAD Relay Server')&& string.isblank(oldCase.CIS_Rehost_Task__c))      {
      	Task newTask = new Task();
		newTask.subject = 'CIS Rehost Task - CAD Relay Server';
		newTask.Description = 'CIS Rehost Task - CAD Relay Server';
		newTask.whatId = c.Id;
		newTask.Type = 'Project';
		//newTask.Account_Name__c = acct[0].Name;
		newTask.ownerId = [select id from user where name = :ass2].id;
		newTask.ActivityDate = c.createdDate.date() + 30;
		
		insertTask.add(newTask);      }
      if(c.CIS_Rehost_Task__c.contains('CAD RPT/DWH')&& !string.isblank(oldCase.CIS_Rehost_Task__c))      {
      	if(c.CIS_Rehost_Task__c.contains('CAD RPT/DWH')&& !oldCase.CIS_Rehost_Task__c.contains('CAD RPT/DWH'))      	{
      	Task newTask = new Task();
		newTask.subject = 'CIS Rehost Task - RPT/DWH';
		newTask.Description = 'CIS Team to Rehost the Primary RPT/DWH server to the Pre-Production RPT/DWH server. Please see project scope in the secure folder for Date and Time of the Rehost.';
		newTask.whatId = c.Id;
		newTask.Type = 'Project';
		//newTask.Account_Name__c = acct[0].Name;
		newTask.ownerId = [select id from user where name = :ass2].id;
		newTask.ActivityDate = c.createdDate.date() + 30;
		
		insertTask.add(newTask);      	}      }
      if(c.CIS_Rehost_Task__c.contains('CAD RPT/DWH')&& string.isblank(oldCase.CIS_Rehost_Task__c))      {
      	Task newTask = new Task();
		newTask.subject = 'CIS Rehost Task - RPT/DWH';
		newTask.Description = 'CIS Team to Rehost the Primary RPT/DWH server to the Pre-Production RPT/DWH server. Please see project scope in the secure folder for Date and Time of the Rehost. ';
		newTask.whatId = c.Id;
		newTask.Type = 'Project';
		//newTask.Account_Name__c = acct[0].Name;
		newTask.ownerId = [select id from user where name = :ass2].id;
		newTask.ActivityDate = c.createdDate.date() + 30;
		
		insertTask.add(newTask);      }
      if(c.CIS_Rehost_Task__c.contains('CAD Test Environment')&& !string.isblank(oldCase.CIS_Rehost_Task__c))      {
      	if(c.CIS_Rehost_Task__c.contains('CAD Test Environment')&& !oldCase.CIS_Rehost_Task__c.contains('CAD Test Environment'))      	{
      	Task newTask = new Task();
		newTask.subject = 'CIS Rehost Task - CAD Test Environment';
		newTask.Description = 'CIS Team to Rehost the Test server(s) to the Pre-Production Test server(s). Please see project scope in the secure folder for Date and Time of the Rehost. Non-Critical.';
		newTask.whatId = c.Id;
		newTask.Type = 'Project';
		//newTask.Account_Name__c = acct[0].Name;
		newTask.ownerId = [select id from user where name = :ass2].id;
		newTask.ActivityDate = c.createdDate.date() + 30;
		
		insertTask.add(newTask);      	}      }
      if(c.CIS_Rehost_Task__c.contains('CAD Test Environment')&& string.isblank(oldCase.CIS_Rehost_Task__c))      {
      	Task newTask = new Task();
		newTask.subject = 'CIS Rehost Task - CAD Test Environment';
		newTask.Description = 'CIS Team to Rehost the Test server(s) to the Pre-Production Test server(s). Please see project scope in the secure folder for Date and Time of the Rehost. Non-Critical.';
		newTask.whatId = c.Id;
		newTask.Type = 'Project';
		//newTask.Account_Name__c = acct[0].Name;
		newTask.ownerId = [select id from user where name = :ass2].id;
		newTask.ActivityDate = c.createdDate.date() + 30;
		
		insertTask.add(newTask);      }
      if(c.CIS_Rehost_Task__c.contains('CAD Training Environment')&& !string.isblank(oldCase.CIS_Rehost_Task__c))      {
      	if(c.CIS_Rehost_Task__c.contains('CAD Training Environment')&& !oldCase.CIS_Rehost_Task__c.contains('CAD Training Environment'))      	{
      	Task newTask = new Task();
		newTask.subject = 'CIS Rehost Task - CAD Training Environment';
		newTask.Description = 'CIS Team to Rehost the Training server(s) to the Pre-Production Training server(s). Please see project scope in the secure folder for Date and Time of the Rehost. Non-Critical';
		newTask.whatId = c.Id;
		newTask.Type = 'Project';
		//newTask.Account_Name__c = acct[0].Name;
		newTask.ownerId = [select id from user where name = :ass2].id;
		newTask.ActivityDate = c.createdDate.date() + 30;
		
		insertTask.add(newTask);      	}      }
      if(c.CIS_Rehost_Task__c.contains('CAD Training Environment')&& string.isblank(oldCase.CIS_Rehost_Task__c))      {
      	Task newTask = new Task();
		newTask.subject = 'CIS Rehost Task - CAD Training Environment';
		newTask.Description = 'CIS Team to Rehost the Training server(s) to the Pre-Production Training server(s). Please see project scope in the secure folder for Date and Time of the Rehost. Non-Critical';
		newTask.whatId = c.Id;
		newTask.Type = 'Project';
		//newTask.Account_Name__c = acct[0].Name;
		newTask.ownerId = [select id from user where name = :ass2].id;
		newTask.ActivityDate = c.createdDate.date() + 30;
		
		insertTask.add(newTask);      }
      if(c.CIS_Rehost_Task__c.contains('CAD WEB/Browser')&& !string.isblank(oldCase.CIS_Rehost_Task__c))      {
      	if(c.CIS_Rehost_Task__c.contains('CAD WEB/Browser')&& !oldCase.CIS_Rehost_Task__c.contains('CAD WEB/Browser'))      	{
      	Task newTask = new Task();
		newTask.subject = 'CIS Rehost Task - WEB/Browser';
		newTask.Description = 'CIS Team to Rehost the Primary WEB/Browser server(s) to the Pre-Production WEB/Browser server(s). Please see project scope in the secure folder for Date and Time of the Rehost.';
		newTask.whatId = c.Id;
		newTask.Type = 'Project';
		//newTask.Account_Name__c = acct[0].Name;
		newTask.ownerId = [select id from user where name = :ass2].id;
		newTask.ActivityDate = c.createdDate.date() + 30;
		
		insertTask.add(newTask);      	}      }
      if(c.CIS_Rehost_Task__c.contains('CAD WEB/Browser')&& string.isblank(oldCase.CIS_Rehost_Task__c))      {
      	Task newTask = new Task();
		newTask.subject = 'CIS Rehost Task - WEB/Browser';
		newTask.Description = 'CIS Team to Rehost the Primary WEB/Browser server(s) to the Pre-Production WEB/Browser server(s). Please see project scope in the secure folder for Date and Time of the Rehost.';
		newTask.whatId = c.Id;
		newTask.Type = 'Project';
		//newTask.Account_Name__c = acct[0].Name;
		newTask.ownerId = [select id from user where name = :ass2].id;
		newTask.ActivityDate = c.createdDate.date() + 30;
		
		insertTask.add(newTask);      }
      if(c.CIS_Rehost_Task__c.contains('DR Environment')&& !string.isblank(oldCase.CIS_Rehost_Task__c))      {
      	if(c.CIS_Rehost_Task__c.contains('DR Environment')&& !oldCase.CIS_Rehost_Task__c.contains('DR Environment'))      	{
      	Task newTask = new Task();
		newTask.subject = 'CIS Rehost Task - DR Environment';
		newTask.Description = 'CIS Rehost Task - DR Environment';
		newTask.whatId = c.Id;
		newTask.Type = 'Project';
		//newTask.Account_Name__c = acct[0].Name;
		newTask.ownerId = [select id from user where name = :ass2].id;
		newTask.ActivityDate = c.createdDate.date() + 30;
		
		insertTask.add(newTask);      	}      }
      if(c.CIS_Rehost_Task__c.contains('DR Environment')&& string.isblank(oldCase.CIS_Rehost_Task__c))      {
      	Task newTask = new Task();
		newTask.subject = 'CIS Rehost Task - DR Environment';
		newTask.Description = 'CIS Rehost Task - DR Environment';
		newTask.whatId = c.Id;
		newTask.Type = 'Project';
		//newTask.Account_Name__c = acct[0].Name;
		newTask.ownerId = [select id from user where name = :ass2].id;
		newTask.ActivityDate = c.createdDate.date() + 30;
		
		insertTask.add(newTask);      }
      if(c.CIS_Rehost_Task__c.contains('IQ')&& !string.isblank(oldCase.CIS_Rehost_Task__c))      {
      	if(c.CIS_Rehost_Task__c.contains('IQ')&& !oldCase.CIS_Rehost_Task__c.contains('IQ'))      	{
      	Task newTask = new Task();
		newTask.subject = 'CIS Rehost Task - IQ';
		newTask.Description = 'CIS Team to Rehost the Primary IQ servers to the Pre-Production IQ servers. Please see project scope in the secure folder for Date and Time of the Rehost.';
		newTask.whatId = c.Id;
		newTask.Type = 'Project';
		//newTask.Account_Name__c = acct[0].Name;
		newTask.ownerId = [select id from user where name = :ass2].id;
		newTask.ActivityDate = c.createdDate.date() + 30;
		
		insertTask.add(newTask);      	}      }
      if(c.CIS_Rehost_Task__c.contains('IQ')&& string.isblank(oldCase.CIS_Rehost_Task__c))      {
      	Task newTask = new Task();
		newTask.subject = 'CIS Rehost Task - IQ';
		newTask.Description = 'CIS Team to Rehost the Primary IQ servers to the Pre-Production IQ servers. Please see project scope in the secure folder for Date and Time of the Rehost.';
		newTask.whatId = c.Id;
		newTask.Type = 'Project';
		//newTask.Account_Name__c = acct[0].Name;
		newTask.ownerId = [select id from user where name = :ass2].id;
		newTask.ActivityDate = c.createdDate.date() + 30;
		
		insertTask.add(newTask);      }
      if(c.CIS_Rehost_Task__c.contains('Jail.')&& !string.isblank(oldCase.CIS_Rehost_Task__c))      {
      	if(c.CIS_Rehost_Task__c.contains('Jail.')&& !oldCase.CIS_Rehost_Task__c.contains('Jail.'))      	{
      	Task newTask = new Task();
		newTask.subject = 'CIS Rehost Task - Jail';
		newTask.Description = 'CIS Rehost Task - Jail';
		newTask.whatId = c.Id;
		newTask.Type = 'Project';
		//newTask.Account_Name__c = acct[0].Name;
		newTask.ownerId = [select id from user where name = :ass2].id;
		newTask.ActivityDate = c.createdDate.date() + 30;
		
		insertTask.add(newTask);      	}      }
      if(c.CIS_Rehost_Task__c.contains('Jail.')&& string.isblank(oldCase.CIS_Rehost_Task__c))      {
      	Task newTask = new Task();
		newTask.subject = 'CIS Rehost Task - Jail';
		newTask.Description = 'CIS Rehost Task - Jail';
		newTask.whatId = c.Id;
		newTask.Type = 'Project';
		//newTask.Account_Name__c = acct[0].Name;
		newTask.ownerId = [select id from user where name = :ass2].id;
		newTask.ActivityDate = c.createdDate.date() + 30;
		
		insertTask.add(newTask);      }
      if(c.CIS_Rehost_Task__c.contains('Jail Training Environment')&& !string.isblank(oldCase.CIS_Rehost_Task__c))      {
      	if(c.CIS_Rehost_Task__c.contains('Jail Training Environment')&& !oldCase.CIS_Rehost_Task__c.contains('Jail Training Environment'))      	{
      	Task newTask = new Task();
		newTask.subject = 'CIS Rehost Task - Jail Training Environment';
		newTask.Description = 'CIS Rehost Task - Jail Training Environment';
		newTask.whatId = c.Id;
		newTask.Type = 'Project';
		//newTask.Account_Name__c = acct[0].Name;
		newTask.ownerId = [select id from user where name = :ass2].id;
		newTask.ActivityDate = c.createdDate.date() + 30;
		
		insertTask.add(newTask);      	}      }
      if(c.CIS_Rehost_Task__c.contains('Jail Training Environment')&& string.isblank(oldCase.CIS_Rehost_Task__c))      {
      	Task newTask = new Task();
		newTask.subject = 'CIS Rehost Task - Jail Training Environment';
		newTask.Description = 'CIS Rehost Task - Jail Training Environment';
		newTask.whatId = c.Id;
		newTask.Type = 'Project';
		//newTask.Account_Name__c = acct[0].Name;
		newTask.ownerId = [select id from user where name = :ass2].id;
		newTask.ActivityDate = c.createdDate.date() + 30;
		
		insertTask.add(newTask);      }
      if(c.CIS_Rehost_Task__c.contains('Mobile/Mobile Interface')&& !string.isblank(oldCase.CIS_Rehost_Task__c))      {
      	if(c.CIS_Rehost_Task__c.contains('Mobile/Mobile Interface')&& !oldCase.CIS_Rehost_Task__c.contains('Mobile/Mobile Interface'))      	{
      	Task newTask = new Task();
		newTask.subject = 'CIS Rehost Task - Mobile/Mobile Interface';
		newTask.Description = 'CIS Team to Rehost the Primary Mobile/Mobile Interface server(s) to the Pre-Production Mobile/Mobile Interface server(s). Please see project scope in the secure folder for Date and Time of the Rehost';
		newTask.whatId = c.Id;
		newTask.Type = 'Project';
		//newTask.Account_Name__c = acct[0].Name;
		newTask.ownerId = [select id from user where name = :ass2].id;
		newTask.ActivityDate = c.createdDate.date() + 30;
		
		insertTask.add(newTask);      	}      }
      if(c.CIS_Rehost_Task__c.contains('Mobile/Mobile Interface')&& string.isblank(oldCase.CIS_Rehost_Task__c))      {
      	Task newTask = new Task();
		newTask.subject = 'CIS Rehost Task - Mobile/Mobile Interface';
		newTask.Description = 'CIS Team to Rehost the Primary Mobile/Mobile Interface server(s) to the Pre-Production Mobile/Mobile Interface server(s). Please see project scope in the secure folder for Date and Time of the Rehost';
		newTask.whatId = c.Id;
		newTask.Type = 'Project';
		//newTask.Account_Name__c = acct[0].Name;
		newTask.ownerId = [select id from user where name = :ass2].id;
		newTask.ActivityDate = c.createdDate.date() + 30;
		
		insertTask.add(newTask);      }
      
      
      if(c.CIS_Rehost_Task__c.contains('Reinstall SQL Replication')&& !string.isblank(oldCase.CIS_Rehost_Task__c))      {
      	if(c.CIS_Rehost_Task__c.contains('Reinstall SQL Replication')&& !oldCase.CIS_Rehost_Task__c.contains('Reinstall SQL Replication'))      	{
      	Task newTask = new Task();
		newTask.subject = 'CIS Rehost Task - Reinstall SQL Replication';
		newTask.Description = 'TriTech DBA team to re-install SQL replication from NEW Production CAD server to NEW RPT/DWH Server.';
		newTask.whatId = c.Id;
		newTask.Type = 'Project';
		//newTask.Account_Name__c = acct[0].Name;
		newTask.ownerId = [select id from user where name = :ass2].id;
		newTask.ActivityDate = c.createdDate.date() + 30;
		
		insertTask.add(newTask);      	}      }
      if(c.CIS_Rehost_Task__c.contains('Reinstall SQL Replication')&& string.isblank(oldCase.CIS_Rehost_Task__c))      {
      	Task newTask = new Task();
		newTask.subject = 'CIS Rehost Task - Reinstall SQL Replication';
		newTask.Description = 'TriTech DBA team to re-install SQL replication from NEW Production CAD server to NEW RPT/DWH Server.';
		newTask.whatId = c.Id;
		newTask.Type = 'Project';
		//newTask.Account_Name__c = acct[0].Name;
		newTask.ownerId = [select id from user where name = :ass2].id;
		newTask.ActivityDate = c.createdDate.date() + 30;
		
		insertTask.add(newTask);      }
      if(c.CIS_Rehost_Task__c.contains('RMS.')&& !string.isblank(oldCase.CIS_Rehost_Task__c))      {
      	if(c.CIS_Rehost_Task__c.contains('RMS.')&& !oldCase.CIS_Rehost_Task__c.contains('RMS.'))      	{
      	Task newTask = new Task();
		newTask.subject = 'CIS Rehost Task - RMS';
		newTask.Description = 'CIS Team to Rehost the Primary RMS Server(s) WEB SQL, Classic SQL and Web IIS. Please see project scope in the secure folder for Date and Time of the Rehost.';
		newTask.whatId = c.Id;
		newTask.Type = 'Project';
		//newTask.Account_Name__c = acct[0].Name;
		newTask.ownerId = [select id from user where name = :ass2].id;
		newTask.ActivityDate = c.createdDate.date() + 30;
		
		insertTask.add(newTask);      	}      }
      if(c.CIS_Rehost_Task__c.contains('RMS.')&& string.isblank(oldCase.CIS_Rehost_Task__c))      {
      	Task newTask = new Task();
		newTask.subject = 'CIS Rehost Task - RMS';
		newTask.Description = 'CIS Team to Rehost the Primary RMS Server(s) WEB SQL, Classic SQL and Web IIS. Please see project scope in the secure folder for Date and Time of the Rehost.';
		newTask.whatId = c.Id;
		newTask.Type = 'Project';
		//newTask.Account_Name__c = acct[0].Name;
		newTask.ownerId = [select id from user where name = :ass2].id;
		newTask.ActivityDate = c.createdDate.date() + 30;
		
		insertTask.add(newTask);      }
      if(c.CIS_Rehost_Task__c.contains('RMS Training Environment')&& !string.isblank(oldCase.CIS_Rehost_Task__c))      {
      	if(c.CIS_Rehost_Task__c.contains('RMS Training Environment')&& !oldCase.CIS_Rehost_Task__c.contains('RMS Training Environment'))      	{
      	Task newTask = new Task();
		newTask.subject = 'CIS Rehost Task - RMS Training Environment';
		newTask.Description = 'CIS Team to Rehost the Training server(s) to the Pre-Production Training server(s). Please see project scope in the secure folder for Date and Time of the Rehost. Non-Critical.';
		newTask.whatId = c.Id;
		newTask.Type = 'Project';
		//newTask.Account_Name__c = acct[0].Name;
		newTask.ownerId = [select id from user where name = :ass2].id;
		newTask.ActivityDate = c.createdDate.date() + 30;
		
		insertTask.add(newTask);      	}      }
      if(c.CIS_Rehost_Task__c.contains('RMS Training Environment')&& string.isblank(oldCase.CIS_Rehost_Task__c))      {
      	Task newTask = new Task();
		newTask.subject = 'CIS Rehost Task - RMS Training Environment';
		newTask.Description = 'CIS Team to Rehost the Training server(s) to the Pre-Production Training server(s). Please see project scope in the secure folder for Date and Time of the Rehost. Non-Critical.';
		newTask.whatId = c.Id;
		newTask.Type = 'Project';
		//newTask.Account_Name__c = acct[0].Name;
		newTask.ownerId = [select id from user where name = :ass2].id;
		newTask.ActivityDate = c.createdDate.date() + 30;
		
		insertTask.add(newTask);      }
      if(c.CIS_Rehost_Task__c.contains('RMS Test Environment')&& !string.isblank(oldCase.CIS_Rehost_Task__c))      {
      	if(c.CIS_Rehost_Task__c.contains('RMS Test Environment')&& !oldCase.CIS_Rehost_Task__c.contains('RMS Test Environment'))      	{
      	Task newTask = new Task();
		newTask.subject = 'CIS Rehost Task - RMS Test Environment';
		newTask.Description = 'CIS Rehost Task - RMS Test Environment';
		newTask.whatId = c.Id;
		newTask.Type = 'Project';
		//newTask.Account_Name__c = acct[0].Name;
		newTask.ownerId = [select id from user where name = :ass2].id;
		newTask.ActivityDate = c.createdDate.date() + 30;
		
		insertTask.add(newTask);      	}      }
      if(c.CIS_Rehost_Task__c.contains('RMS Test Environment')&& string.isblank(oldCase.CIS_Rehost_Task__c))      {
      	Task newTask = new Task();
		newTask.subject = 'CIS Rehost Task - RMS Test Environment';
		newTask.Description = 'CIS Rehost Task - RMS Test Environment';
		newTask.whatId = c.Id;
		newTask.Type = 'Project';
		//newTask.Account_Name__c = acct[0].Name;
		newTask.ownerId = [select id from user where name = :ass2].id;
		newTask.ActivityDate = c.createdDate.date() + 30;
		
		insertTask.add(newTask);      }
      if(c.CIS_Rehost_Task__c.contains('Routing Server')&& !string.isblank(oldCase.CIS_Rehost_Task__c))      {
      	if(c.CIS_Rehost_Task__c.contains('Routing Server')&& !oldCase.CIS_Rehost_Task__c.contains('Routing Server'))      	{
      	Task newTask = new Task();
		newTask.subject = 'CIS Rehost Task - Routing Server';
		newTask.Description = 'CIS Rehost Task - Routing Server';
		newTask.whatId = c.Id;
		newTask.Type = 'Project';
		//newTask.Account_Name__c = acct[0].Name;
		newTask.ownerId = [select id from user where name = :ass2].id;
		newTask.ActivityDate = c.createdDate.date() + 30;
		
		insertTask.add(newTask);      	}      }
      if(c.CIS_Rehost_Task__c.contains('Routing Server')&& string.isblank(oldCase.CIS_Rehost_Task__c))      {
      	Task newTask = new Task();
		newTask.subject = 'CIS Rehost Task - Routing Server';
		newTask.Description = 'CIS Rehost Task - Routing Server';
		newTask.whatId = c.Id;
		newTask.Type = 'Project';
		//newTask.Account_Name__c = acct[0].Name;
		newTask.ownerId = [select id from user where name = :ass2].id;
		newTask.ActivityDate = c.createdDate.date() + 30;
		
		insertTask.add(newTask);      }
      if(c.CIS_Rehost_Task__c.contains('TTMS/CIM')&& !string.isblank(oldCase.CIS_Rehost_Task__c))      {
      	if(c.CIS_Rehost_Task__c.contains('TTMS/CIM')&& !oldCase.CIS_Rehost_Task__c.contains('TTMS/CIM'))      	{
      	Task newTask = new Task();
		newTask.subject = 'CIS Rehost Task - TTMS/CIM';
		newTask.Description = 'CIS Team to Rehost the Primary TTMS and or CIM server to the Pre-Production TTMS and or CIM server. Please see project scope in the secure folder for Date and Time of the Rehost.';
		newTask.whatId = c.Id;
		newTask.Type = 'Project';
		//newTask.Account_Name__c = acct[0].Name;
		newTask.ownerId = [select id from user where name = :ass2].id;
		newTask.ActivityDate = c.createdDate.date() + 30;
		
		insertTask.add(newTask);     	}      }
      if(c.CIS_Rehost_Task__c.contains('TTMS/CIM')&& string.isblank(oldCase.CIS_Rehost_Task__c))      {
      	Task newTask = new Task();
		newTask.subject = 'CIS Rehost Task - TTMS/CIM';
		newTask.Description = 'CIS Team to Rehost the Primary TTMS and or CIM server to the Pre-Production TTMS and or CIM server. Please see project scope in the secure folder for Date and Time of the Rehost.';
		newTask.whatId = c.Id;
		newTask.Type = 'Project';
		//newTask.Account_Name__c = acct[0].Name;
		newTask.ownerId = [select id from user where name = :ass2].id;
		newTask.ActivityDate = c.createdDate.date() + 30;
		
		insertTask.add(newTask);       }
		if(c.CIS_Rehost_Task__c.contains('Build ISR')&& !string.isblank(oldCase.CIS_Rehost_Task__c))      {
      	if(c.CIS_Rehost_Task__c.contains('Build ISR')&& !oldCase.CIS_Rehost_Task__c.contains('Build ISR'))      	{
      	Task newTask = new Task();
		newTask.subject = 'CIS Rehost Task - Build ISR';
		newTask.Description = 'CIS Team to build the base ISR and provide this to the Project manager to forward onto the client.';
		newTask.whatId = c.Id;
		newTask.Type = 'Project';
		//newTask.Account_Name__c = acct[0].Name;
		newTask.ownerId = [select id from user where name = :ass2].id;
		newTask.ActivityDate = c.createdDate.date() + 30;
		
		insertTask.add(newTask);     	}      }
      if(c.CIS_Rehost_Task__c.contains('Build ISR')&& string.isblank(oldCase.CIS_Rehost_Task__c))      {
      	Task newTask = new Task();
		newTask.subject = 'CIS Rehost Task - Build ISR';
		newTask.Description = 'CIS Team to build the base ISR and provide this to the Project manager to forward onto the client.';
		newTask.whatId = c.Id;
		newTask.Type = 'Project';
		//newTask.Account_Name__c = acct[0].Name;
		newTask.ownerId = [select id from user where name = :ass2].id;
		newTask.ActivityDate = c.createdDate.date() + 30;
		
		insertTask.add(newTask);       }
		if(c.CIS_Rehost_Task__c.contains('Prep Work')&& !string.isblank(oldCase.CIS_Rehost_Task__c))      {
      	if(c.CIS_Rehost_Task__c.contains('Prep Work')&& !oldCase.CIS_Rehost_Task__c.contains('Prep Work'))      	{
      	Task newTask = new Task();
		newTask.subject = 'CIS Rehost Task - Prep Work';
		newTask.Description = ' CIS Team to prep the servers listed in the server planner and ISR.';
		newTask.whatId = c.Id;
		newTask.Type = 'Project';
		//newTask.Account_Name__c = acct[0].Name;
		newTask.ownerId = [select id from user where name = :ass2].id;
		newTask.ActivityDate = c.createdDate.date() + 30;
		
		insertTask.add(newTask);     	}      }
      if(c.CIS_Rehost_Task__c.contains('Prep Work')&& string.isblank(oldCase.CIS_Rehost_Task__c))      {
      	Task newTask = new Task();
		newTask.subject = 'CIS Rehost Task - Prep Work';
		newTask.Description = ' CIS Team to prep the servers listed in the server planner and ISR.';
		newTask.whatId = c.Id;
		newTask.Type = 'Project';
		//newTask.Account_Name__c = acct[0].Name;
		newTask.ownerId = [select id from user where name = :ass2].id;
		newTask.ActivityDate = c.createdDate.date() + 30;
		
		insertTask.add(newTask);       }
		if(c.CIS_Rehost_Task__c.contains('Project Scope')&& !string.isblank(oldCase.CIS_Rehost_Task__c))      {
      	if(c.CIS_Rehost_Task__c.contains('Project Scope')&& !oldCase.CIS_Rehost_Task__c.contains('Project Scope'))      	{
      	Task newTask = new Task();
		newTask.subject = 'CIS Rehost Task - Project Scope';
		newTask.Description = 'CIS Team to build the Project Scope document detailing the Clients and TriTech’s responsibilities for the project. Please add dates and times for each Task and store in the Clients Secure folder.';
		newTask.whatId = c.Id;
		newTask.Type = 'Project';
		//newTask.Account_Name__c = acct[0].Name;
		newTask.ownerId = [select id from user where name = :ass2].id;
		newTask.ActivityDate = c.createdDate.date() + 30;
		
		insertTask.add(newTask);     	}      }
      if(c.CIS_Rehost_Task__c.contains('Project Scope')&& string.isblank(oldCase.CIS_Rehost_Task__c))      {
      	Task newTask = new Task();
		newTask.subject = 'CIS Rehost Task - Project Scope';
		newTask.Description = 'CIS Team to build the Project Scope document detailing the Clients and TriTech’s responsibilities for the project. Please add dates and times for each Task and store in the Clients Secure folder.';
		newTask.whatId = c.Id;
		newTask.Type = 'Project';
		//newTask.Account_Name__c = acct[0].Name;
		newTask.ownerId = [select id from user where name = :ass2].id;
		newTask.ActivityDate = c.createdDate.date() + 30;
		
		insertTask.add(newTask);       }
	  }
    }
    }
  }  
  if(insertTask.size() > 0)
	insert insertTask;	
}