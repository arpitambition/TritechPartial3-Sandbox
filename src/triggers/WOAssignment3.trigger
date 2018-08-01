trigger WOAssignment3 on Case (after update) 
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
    if((c.RecordTypeId == Schema.SObjectType.Case.getRecordTypeInfosByName().get('Work Order Ticket').getRecordTypeId() && c.Account_Support_Team__c.startsWith('Inform') && 
	(c.Work_Order_Type__c == 'Project - New Build' || c.Work_Order_Type__c == 'SE Task') 
		&& c.Status == 'Approved - Assigned' 
		&& c.status != oldCase.Status
		&& c.CIS_Task_List__c == oldCase.CIS_Task_List__c
		&& c.owner == oldCase.owner
	)
	|| 
        //this is for cases with an existing status of approved - Assigned but have updated the SE or CIS list values
        (c.RecordTypeId == Schema.SObjectType.Case.getRecordTypeInfosByName().get('Work Order Ticket').getRecordTypeId() && c.Account_Support_Team__c.startsWith('Inform') &&
        (c.Work_Order_Type__c == 'Project - New Build' || c.Work_Order_Type__c == 'SE Task')
        	&& c.Status == 'Approved - Assigned'
        	&& c.CIS_Task_List__c != oldCase.CIS_Task_List__c
        	&& c.owner == oldCase.owner
        ))
    {
      
      //second step logic to see what tasks need to be created.
      //the !oldCase looks at the previous data to verify that the value has been added and only creates tasks when changes are made to the SE and CIS lists.
      If(c.CIS_Task_List__c != '')
      {
      	Account[] acct = [Select Name from account where id = :c.AccountId];  
      if(!string.isblank(c.CIS_Task_List__c))
      {
      	if(!string.isblank(c.CIS_Task_List__c))
      { 
      	
      	if(c.CIS_Task_List__c.contains('Build ISR')&& !string.isblank(oldCase.CIS_Task_List__c))
      {
        if(c.CIS_Task_List__c.contains('Build ISR')&& !oldCase.CIS_Task_List__c.contains('Build ISR'))
        {
        Task newTask = new Task();
        newTask.subject = 'CIS NEW Install Task - Build ISR';
        newTask.Description = 'CIS Team to build the base ISR and provide this to the Project manager to forward onto the client.';
        newTask.whatId = c.Id;
        newTask.Type = 'Project';
        //newTask.Account_Name__c = acct[0].Name;
        newTask.ownerId = [select id from user where name = :ass2].id;
        newTask.ActivityDate = c.createdDate.date() + 30;
        
        insertTask.add(newTask);
        }
      }
      if(c.CIS_Task_List__c.contains('Build ISR')&& string.isblank(oldCase.CIS_Task_List__c))
      {
        Task newTask = new Task();
        newTask.subject = 'CIS NEW Install Task - Build ISR';
        newTask.Description = 'CIS Team to build the base ISR and provide this to the Project manager to forward onto the client.';
        newTask.whatId = c.Id;
        newTask.Type = 'Project';
        //newTask.Account_Name__c = acct[0].Name;
        newTask.ownerId = [select id from user where name = :ass2].id;
        newTask.ActivityDate = c.createdDate.date() + 30;
        
        insertTask.add(newTask);
      }

if(c.CIS_Task_List__c.contains('Prep Work')&& !string.isblank(oldCase.CIS_Task_List__c))
      {
        if(c.CIS_Task_List__c.contains('Prep Work')&& !oldCase.CIS_Task_List__c.contains('Prep Work'))
        {
        Task newTask = new Task();
        newTask.subject = 'CIS NEW Install Task - Prep Work';
        newTask.Description = 'CIS Team to prep the servers listed in the server planner and ISR.';
        newTask.whatId = c.Id;
        newTask.Type = 'Project';
        //newTask.Account_Name__c = acct[0].Name;
        newTask.ownerId = [select id from user where name = :ass2].id;
        newTask.ActivityDate = c.createdDate.date() + 30;
        
        insertTask.add(newTask);
        }
      }
      if(c.CIS_Task_List__c.contains('Prep Work')&& string.isblank(oldCase.CIS_Task_List__c))
      {
        Task newTask = new Task();
        newTask.subject = 'CIS NEW Install Task - Prep Work';
        newTask.Description = 'CIS Team to prep the servers listed in the server planner and ISR.';
        newTask.whatId = c.Id;
        newTask.Type = 'Project';
        //newTask.Account_Name__c = acct[0].Name;
        newTask.ownerId = [select id from user where name = :ass2].id;
        newTask.ActivityDate = c.createdDate.date() + 30;
        
        insertTask.add(newTask);
      }

	if(c.CIS_Task_List__c.contains('Project Scope')&& !string.isblank(oldCase.CIS_Task_List__c))
      {
        if(c.CIS_Task_List__c.contains('Project Scope')&& !oldCase.CIS_Task_List__c.contains('Project Scope'))
        {
        Task newTask = new Task();
        newTask.subject = 'CIS NEW Install Task - Project Scope';
        newTask.Description = 'CIS Team to build the Project Scope document detailing the Clients and TriTech’s responsibilities for the project. Please add dates and times for each Task and store in the Clients Secure folder.';
        newTask.whatId = c.Id;
        newTask.Type = 'Project';
        //newTask.Account_Name__c = acct[0].Name;
        newTask.ownerId = [select id from user where name = :ass2].id;
        newTask.ActivityDate = c.createdDate.date() + 30;
        
        insertTask.add(newTask);
        }
      }
      if(c.CIS_Task_List__c.contains('Project Scope')&& string.isblank(oldCase.CIS_Task_List__c))
      {
        Task newTask = new Task();
        newTask.subject = 'CIS NEW Install Task - Project Scope';
        newTask.Description = 'CIS Team to build the Project Scope document detailing the Clients and TriTech’s responsibilities for the project. Please add dates and times for each Task and store in the Clients Secure folder.';
        newTask.whatId = c.Id;
        newTask.Type = 'Project';
        //newTask.Account_Name__c = acct[0].Name;
        newTask.ownerId = [select id from user where name = :ass2].id;
        newTask.ActivityDate = c.createdDate.date() + 30;
        
        insertTask.add(newTask);
      }   
      if(c.CIS_Task_List__c.contains('CAD.')&& !string.isblank(oldCase.CIS_Task_List__c))
      {
        if(c.CIS_Task_List__c.contains('CAD.')&& !oldCase.CIS_Task_List__c.contains('CAD.'))
        {
        Task newTask = new Task();
        newTask.subject = 'CIS NEW Install Task - CAD';
        newTask.Description = 'CIS Team to Install the Pre-Production CAD server. Please see project scope in the secure folder for Date and Time of the NEW Install.';
        newTask.whatId = c.Id;
        newTask.Type = 'Project';
        //newTask.Account_Name__c = acct[0].Name;
        newTask.ownerId = [select id from user where name = :ass2].id;
        newTask.ActivityDate = c.createdDate.date() + 30;
        
        insertTask.add(newTask);
        }
      }
      if(c.CIS_Task_List__c.contains('CAD.')&& string.isblank(oldCase.CIS_Task_List__c))
      {
        Task newTask = new Task();
        newTask.subject = 'CIS NEW Install Task - CAD';
        newTask.Description = 'CIS Team to Install the Pre-Production CAD server. Please see project scope in the secure folder for Date and Time of the NEW Install.';
        newTask.whatId = c.Id;
        newTask.Type = 'Project';
        //newTask.Account_Name__c = acct[0].Name;
        newTask.ownerId = [select id from user where name = :ass2].id;
        newTask.ActivityDate = c.createdDate.date() + 30;
        
        insertTask.add(newTask);
      }
      if(c.CIS_Task_List__c.contains('CAD GIS Link Workstation')&& !string.isblank(oldCase.CIS_Task_List__c))
      {
        if(c.CIS_Task_List__c.contains('CAD GIS Link Workstation')&& !oldCase.CIS_Task_List__c.contains('CAD GIS Link Workstation'))
        {
        Task newTask = new Task();
        newTask.subject = 'CIS NEW Install Task - CAD GIS Link Workstation';
        newTask.Description = 'CIS NEW Install Task - CAD GIS Link Workstation.';
        newTask.whatId = c.Id;
        newTask.Type = 'Project';
        //newTask.Account_Name__c = acct[0].Name;
        newTask.ownerId = [select id from user where name = :ass2].id;
        newTask.ActivityDate = c.createdDate.date() + 30;
        
        insertTask.add(newTask);
        }
      }
      if(c.CIS_Task_List__c.contains('CAD GIS Link Workstation')&& string.isblank(oldCase.CIS_Task_List__c))
      {
        Task newTask = new Task();
        newTask.subject = 'CIS NEW Install Task - CAD GIS Link Workstation';
        newTask.Description = 'CIS NEW Install Task - CAD GIS Link Workstation.';
        newTask.whatId = c.Id;
        newTask.Type = 'Project';
        //newTask.Account_Name__c = acct[0].Name;
        newTask.ownerId = [select id from user where name = :ass2].id;
        newTask.ActivityDate = c.createdDate.date() + 30;
        
        insertTask.add(newTask);
      }	
      if(c.CIS_Task_List__c.contains('CAD Interface Servers')&& !string.isblank(oldCase.CIS_Task_List__c))
      {
        if(c.CIS_Task_List__c.contains('CAD Interface Servers')&& !oldCase.CIS_Task_List__c.contains('CAD Interface Servers'))
        {
        Task newTask = new Task();
        newTask.subject = 'CIS NEW Install Task - Interface Servers';
        newTask.Description = 'CIS Team to Install the Interface server(s). Please see project scope in the secure folder for Date and Time of the NEW Install.';
        newTask.whatId = c.Id;
        newTask.Type = 'Project';
        //newTask.Account_Name__c = acct[0].Name;
        newTask.ownerId = [select id from user where name = :ass2].id;
        newTask.ActivityDate = c.createdDate.date() + 30;
        
        insertTask.add(newTask);
        }
      }
      if(c.CIS_Task_List__c.contains('CAD Interface Servers')&& string.isblank(oldCase.CIS_Task_List__c))
      {
        Task newTask = new Task();
        newTask.subject = 'CIS NEW Install Task - Interface Servers';
        newTask.Description = 'CIS Team to Install the Interface server(s). Please see project scope in the secure folder for Date and Time of the NEW Install.';
        newTask.whatId = c.Id;
        newTask.Type = 'Project';
        //newTask.Account_Name__c = acct[0].Name;
        newTask.ownerId = [select id from user where name = :ass2].id;
        newTask.ActivityDate = c.createdDate.date() + 30;
        
        insertTask.add(newTask);
      }
      if(c.CIS_Task_List__c.contains('CAD Reinstall SQL Replication')&& !string.isblank(oldCase.CIS_Task_List__c))
      {
        if(c.CIS_Task_List__c.contains('CAD Reinstall SQL Replication')&& !oldCase.CIS_Task_List__c.contains('CAD Reinstall SQL Replication'))
        {
        Task newTask = new Task();
        newTask.subject = 'DBA NEW Install Task - Reinstall SQL Replication';
        newTask.Description = 'DBA NEW Install Task - Reinstall SQL Replication.';
        newTask.whatId = c.Id;
        newTask.Type = 'Project';
        //newTask.Account_Name__c = acct[0].Name;
        newTask.ownerId = [select id from user where name = :ass4].id;
        newTask.ActivityDate = c.createdDate.date() + 30;
        
        insertTask.add(newTask);
        }
      }
      if(c.CIS_Task_List__c.contains('CAD Reinstall SQL Replication')&& string.isblank(oldCase.CIS_Task_List__c))
      {
        Task newTask = new Task();
        newTask.subject = 'DBA NEW Install Task - Reinstall SQL Replication';
        newTask.Description = 'DBA NEW Install Task - Reinstall SQL Replication.';
        newTask.whatId = c.Id;
        newTask.Type = 'Project';
        //newTask.Account_Name__c = acct[0].Name;
        newTask.ownerId = [select id from user where name = :ass4].id;
        newTask.ActivityDate = c.createdDate.date() + 30;
        
        insertTask.add(newTask);
      }	
      if(c.CIS_Task_List__c.contains('CAD Relay Server')&& !string.isblank(oldCase.CIS_Task_List__c))
      {
        if(c.CIS_Task_List__c.contains('CAD Relay Server')&& !oldCase.CIS_Task_List__c.contains('CAD Relay Server'))
        {
        Task newTask = new Task();
        newTask.subject = 'CIS NEW Install Task - CAD Relay Server';
        newTask.Description = 'CIS NEW Install Task - CAD Relay Server.';
        newTask.whatId = c.Id;
        newTask.Type = 'Project';
        //newTask.Account_Name__c = acct[0].Name;
        newTask.ownerId = [select id from user where name = :ass2].id;
        newTask.ActivityDate = c.createdDate.date() + 30;
        
        insertTask.add(newTask);
        }
      }
      if(c.CIS_Task_List__c.contains('CAD Relay Server')&& string.isblank(oldCase.CIS_Task_List__c))
      {
        Task newTask = new Task();
        newTask.subject = 'CIS NEW Install Task - CAD Relay Server';
        newTask.Description = 'CIS NEW Install Task - CAD Relay Server.';
        newTask.whatId = c.Id;
        newTask.Type = 'Project';
        //newTask.Account_Name__c = acct[0].Name;
        newTask.ownerId = [select id from user where name = :ass2].id;
        newTask.ActivityDate = c.createdDate.date() + 30;
        
        insertTask.add(newTask);
      }
      if(c.CIS_Task_List__c.contains('CAD RPT/DWH')&& !string.isblank(oldCase.CIS_Task_List__c))
      {
        if(c.CIS_Task_List__c.contains('CAD RPT/DWH')&& !oldCase.CIS_Task_List__c.contains('CAD RPT/DWH'))
        {
        Task newTask = new Task();
        newTask.subject = 'CIS NEW Install Task - RPT/DWH';
        newTask.Description = 'CIS Team to Install the Pre-Production RPT/DWH server. Please see project scope in the secure folder for Date and Time of the NEW Install.';
        newTask.whatId = c.Id;
        newTask.Type = 'Project';
        //newTask.Account_Name__c = acct[0].Name;
        newTask.ownerId = [select id from user where name = :ass2].id;
        newTask.ActivityDate = c.createdDate.date() + 30;
        
        insertTask.add(newTask);
        }
      }
      if(c.CIS_Task_List__c.contains('CAD RPT/DWH')&& string.isblank(oldCase.CIS_Task_List__c))
      {
        Task newTask = new Task();
        newTask.subject = 'CIS NEW Install Task - RPT/DWH';
        newTask.Description = 'CIS Team to Install the Pre-Production RPT/DWH server. Please see project scope in the secure folder for Date and Time of the NEW Install.';
        newTask.whatId = c.Id;
        newTask.Type = 'Project';
        //newTask.Account_Name__c = acct[0].Name;
        newTask.ownerId = [select id from user where name = :ass2].id;
        newTask.ActivityDate = c.createdDate.date() + 30;
        
        insertTask.add(newTask);
      }
      if(c.CIS_Task_List__c.contains('CAD Test')&& !string.isblank(oldCase.CIS_Task_List__c))
      {
        if(c.CIS_Task_List__c.contains('CAD Test')&& !oldCase.CIS_Task_List__c.contains('CAD Test'))
        {
        Task newTask = new Task();
        newTask.subject = 'CIS NEW Install Task - CAD Test Environment';
        newTask.Description = 'CIS Team to Install the Pre-Production Test server(s). Please see project scope in the secure folder for Date and Time of the NEW Install.';
        newTask.whatId = c.Id;
        newTask.Type = 'Project';
        //newTask.Account_Name__c = acct[0].Name;
        newTask.ownerId = [select id from user where name = :ass2].id;
        newTask.ActivityDate = c.createdDate.date() + 30;
        
        insertTask.add(newTask);
        }
      }
      if(c.CIS_Task_List__c.contains('CAD Test')&& string.isblank(oldCase.CIS_Task_List__c))
      {
        Task newTask = new Task();
        newTask.subject = 'CIS NEW Install Task - CAD Test Environment';
        newTask.Description = 'CIS Team to Install the Pre-Production Test server(s). Please see project scope in the secure folder for Date and Time of the NEW Install.';
        newTask.whatId = c.Id;
        newTask.Type = 'Project';
        //newTask.Account_Name__c = acct[0].Name;
        newTask.ownerId = [select id from user where name = :ass2].id;
        newTask.ActivityDate = c.createdDate.date() + 30;
        
        insertTask.add(newTask);
      }
      if(c.CIS_Task_List__c.contains('CAD Training')&& !string.isblank(oldCase.CIS_Task_List__c))
      {
        if(c.CIS_Task_List__c.contains('CAD Training')&& !oldCase.CIS_Task_List__c.contains('CAD Training'))
        {
        Task newTask = new Task();
        newTask.subject = 'CIS NEW Install Task - CAD Training Environment';
        newTask.Description = 'CIS Team to Install the Pre-Production Training server(s). Please see project scope in the secure folder for Date and Time of the NEW Install.';
        newTask.whatId = c.Id;
        newTask.Type = 'Project';
        //newTask.Account_Name__c = acct[0].Name;
        newTask.ownerId = [select id from user where name = :ass2].id;
        newTask.ActivityDate = c.createdDate.date() + 30;
        
        insertTask.add(newTask);
        }
      }
      if(c.CIS_Task_List__c.contains('CAD Training')&& string.isblank(oldCase.CIS_Task_List__c))
      {
        Task newTask = new Task();
        newTask.subject = 'CIS NEW Install Task - CAD Training Environment';
        newTask.Description = 'CIS Team to Install the Pre-Production Training server(s). Please see project scope in the secure folder for Date and Time of the NEW Install.';
        newTask.whatId = c.Id;
        newTask.Type = 'Project';
        //newTask.Account_Name__c = acct[0].Name;
        newTask.ownerId = [select id from user where name = :ass2].id;
        newTask.ActivityDate = c.createdDate.date() + 30;
        
        insertTask.add(newTask);
      }
      if(c.CIS_Task_List__c.contains('CAD WEB/Browser')&& !string.isblank(oldCase.CIS_Task_List__c))
      {
        if(c.CIS_Task_List__c.contains('CAD WEB/Browser')&& !oldCase.CIS_Task_List__c.contains('CAD WEB/Browser'))
        {
        Task newTask = new Task();
        newTask.subject = 'CIS NEW Install Task - CAD WEB/Browser';
        newTask.Description = 'CIS Team to Install the Pre-Production WEB/Browser server(s). Please see project scope in the secure folder for Date and Time of the NEW Install.';
        newTask.whatId = c.Id;
        newTask.Type = 'Project';
        //newTask.Account_Name__c = acct[0].Name;
        newTask.ownerId = [select id from user where name = :ass2].id;
        newTask.ActivityDate = c.createdDate.date() + 30;
        
        insertTask.add(newTask);
        }
      }
      if(c.CIS_Task_List__c.contains('CAD WEB/Browser')&& string.isblank(oldCase.CIS_Task_List__c))
      {
        Task newTask = new Task();
        newTask.subject = 'CIS NEW Install Task - CAD WEB/Browser';
        newTask.Description = 'CIS Team to Install the Pre-Production WEB/Browser server(s). Please see project scope in the secure folder for Date and Time of the NEW Install.';
        newTask.whatId = c.Id;
        newTask.Type = 'Project';
        //newTask.Account_Name__c = acct[0].Name;
        newTask.ownerId = [select id from user where name = :ass2].id;
        newTask.ActivityDate = c.createdDate.date() + 30;
        
        insertTask.add(newTask);
      }
      if(c.CIS_Task_List__c.contains('DR')&& !string.isblank(oldCase.CIS_Task_List__c))
      {
        if(c.CIS_Task_List__c.contains('DR')&& !oldCase.CIS_Task_List__c.contains('DR'))
        {
        Task newTask = new Task();
        newTask.subject = 'CIS NEW Install Task - DR Environment';
        newTask.Description = 'CIS Team to Install the Pre-Production DR server(s). Please see project scope in the secure folder for Date and Time of the NEW Install.';
        newTask.whatId = c.Id;
        newTask.Type = 'Project';
        //newTask.Account_Name__c = acct[0].Name;
        newTask.ownerId = [select id from user where name = :ass2].id;
        newTask.ActivityDate = c.createdDate.date() + 30;
        
        insertTask.add(newTask);
        }
      }
      if(c.CIS_Task_List__c.contains('DR')&& string.isblank(oldCase.CIS_Task_List__c))
      {
        Task newTask = new Task();
        newTask.subject = 'CIS NEW Install Task - DR Environment';
        newTask.Description = 'CIS Team to Install the Pre-Production DR server(s). Please see project scope in the secure folder for Date and Time of the NEW Install.';
        newTask.whatId = c.Id;
        newTask.Type = 'Project';
        //newTask.Account_Name__c = acct[0].Name;
        newTask.ownerId = [select id from user where name = :ass2].id;
        newTask.ActivityDate = c.createdDate.date() + 30;
        
        insertTask.add(newTask);
      }
      if(c.CIS_Task_List__c.contains('IQ Cloud.')&& !string.isblank(oldCase.CIS_Task_List__c))
      {
        if(c.CIS_Task_List__c.contains('IQ Cloud.')&& !oldCase.CIS_Task_List__c.contains('IQ Cloud.'))
        {
        Task newTask = new Task();
        newTask.subject = 'CIS NEW Install Task - IQ Cloud Search';
        newTask.Description = 'CIS NEW Install Task - IQ Cloud Search.';
        newTask.whatId = c.Id;
        newTask.Type = 'Project';
        //newTask.Account_Name__c = acct[0].Name;
        newTask.ownerId = [select id from user where name = :ass3].id;
        newTask.ActivityDate = c.createdDate.date() + 30;
        
        insertTask.add(newTask);
        }
      }
      if(c.CIS_Task_List__c.contains('IQ Cloud.')&& string.isblank(oldCase.CIS_Task_List__c))
      {
        Task newTask = new Task();
        newTask.subject = 'CIS NEW Install Task - IQ Cloud Search';
        newTask.Description = 'CIS NEW Install Task - IQ Cloud Search.';
        newTask.whatId = c.Id;
        newTask.Type = 'Project';
        //newTask.Account_Name__c = acct[0].Name;
        newTask.ownerId = [select id from user where name = :ass3].id;
        newTask.ActivityDate = c.createdDate.date() + 30;
        
        insertTask.add(newTask);
      }
      if(c.CIS_Task_List__c.contains('IQ Cloud Analytics')&& !string.isblank(oldCase.CIS_Task_List__c))
      {
        if(c.CIS_Task_List__c.contains('IQ Cloud Analytics')&& !oldCase.CIS_Task_List__c.contains('IQ Cloud Analytics'))
        {
        Task newTask = new Task();
        newTask.subject = 'CIS NEW Install Task - IQ Cloud Analytics';
        newTask.Description = 'CIS NEW Install Task - IQ Cloud Analytics.';
        newTask.whatId = c.Id;
        newTask.Type = 'Project';
        //newTask.Account_Name__c = acct[0].Name;
        newTask.ownerId = [select id from user where name = :ass3].id;
        newTask.ActivityDate = c.createdDate.date() + 30;
        
        insertTask.add(newTask);
        }
      }
      if(c.CIS_Task_List__c.contains('IQ Cloud Analytics')&& string.isblank(oldCase.CIS_Task_List__c))
      {
        Task newTask = new Task();
        newTask.subject = 'CIS NEW Install Task - IQ Cloud Analytics';
        newTask.Description = 'CIS NEW Install Task - IQ Cloud Analytics.';
        newTask.whatId = c.Id;
        newTask.Type = 'Project';
        //newTask.Account_Name__c = acct[0].Name;
        newTask.ownerId = [select id from user where name = :ass3].id;
        newTask.ActivityDate = c.createdDate.date() + 30;
        
        insertTask.add(newTask);
      }
      if(c.CIS_Task_List__c.contains('IQ On Prem')&& !string.isblank(oldCase.CIS_Task_List__c))
      {
        if(c.CIS_Task_List__c.contains('IQ On Prem')&& !oldCase.CIS_Task_List__c.contains('IQ On Prem'))
        {
        Task newTask = new Task();
        newTask.subject = 'CIS NEW Install Task - IQ Cloud Prem';
        newTask.Description = 'CIS Team to Install the Pre-Production (On Premise) IQ servers. Please see project scope in the secure folder for Date and Time of the NEW Install.';
        newTask.whatId = c.Id;
        newTask.Type = 'Project';
        //newTask.Account_Name__c = acct[0].Name;
        newTask.ownerId = [select id from user where name = :ass2].id;
        newTask.ActivityDate = c.createdDate.date() + 30;
        
        insertTask.add(newTask);
        }
      }
      if(c.CIS_Task_List__c.contains('IQ On Prem')&& string.isblank(oldCase.CIS_Task_List__c))
      {
        Task newTask = new Task();
        newTask.subject = 'CIS NEW Install Task - IQ Cloud Prem';
        newTask.Description = 'CIS Team to Install the Pre-Production (On Premise) IQ servers. Please see project scope in the secure folder for Date and Time of the NEW Install.';
        newTask.whatId = c.Id;
        newTask.Type = 'Project';
        //newTask.Account_Name__c = acct[0].Name;
        newTask.ownerId = [select id from user where name = :ass2].id;
        newTask.ActivityDate = c.createdDate.date() + 30;
        
        insertTask.add(newTask);
      }
      if(c.CIS_Task_List__c.contains('Jail.')&& !string.isblank(oldCase.CIS_Task_List__c))
      {
        if(c.CIS_Task_List__c.contains('Jail.')&& !oldCase.CIS_Task_List__c.contains('Jail.'))
        {
        Task newTask = new Task();
        newTask.subject = 'CIS NEW Install Task - Jail';
        newTask.Description = 'CIS Team to Install the Jail server(s) Please see project scope in the secure folder for Date and Time of the NEW Install.';
        newTask.whatId = c.Id;
        newTask.Type = 'Project';
        //newTask.Account_Name__c = acct[0].Name;
        newTask.ownerId = [select id from user where name = :ass2].id;
        newTask.ActivityDate = c.createdDate.date() + 30;
        
        insertTask.add(newTask);
        }
      }
      if(c.CIS_Task_List__c.contains('Jail.')&& string.isblank(oldCase.CIS_Task_List__c))
      {
        Task newTask = new Task();
        newTask.subject = 'CIS NEW Install Task - Jail';
        newTask.Description = 'CIS Team to Install the Jail server(s) Please see project scope in the secure folder for Date and Time of the NEW Install.';
        newTask.whatId = c.Id;
        newTask.Type = 'Project';
        //newTask.Account_Name__c = acct[0].Name;
        newTask.ownerId = [select id from user where name = :ass2].id;
        newTask.ActivityDate = c.createdDate.date() + 30;
        
        insertTask.add(newTask);
      }
      if(c.CIS_Task_List__c.contains('Jail Test')&& !string.isblank(oldCase.CIS_Task_List__c))
      {
        if(c.CIS_Task_List__c.contains('Jail Test')&& !oldCase.CIS_Task_List__c.contains('Jail Test'))
        {
        Task newTask = new Task();
        newTask.subject = 'CIS NEW Install Task - Jail Test';
        newTask.Description = 'CIS NEW Install Task - Jail Test.';
        newTask.whatId = c.Id;
        newTask.Type = 'Project';
        //newTask.Account_Name__c = acct[0].Name;
        newTask.ownerId = [select id from user where name = :ass2].id;
        newTask.ActivityDate = c.createdDate.date() + 30;
        
        insertTask.add(newTask);
        }
      }
      if(c.CIS_Task_List__c.contains('Jail Test')&& string.isblank(oldCase.CIS_Task_List__c))
      {
        Task newTask = new Task();
        newTask.subject = 'CIS NEW Install Task - Jail Test';
        newTask.Description = 'CIS NEW Install Task - Jail Test.';
        newTask.whatId = c.Id;
        newTask.Type = 'Project';
        //newTask.Account_Name__c = acct[0].Name;
        newTask.ownerId = [select id from user where name = :ass2].id;
        newTask.ActivityDate = c.createdDate.date() + 30;
        
        insertTask.add(newTask);
      }
      if(c.CIS_Task_List__c.contains('Jail Training')&& !string.isblank(oldCase.CIS_Task_List__c))
      {
        if(c.CIS_Task_List__c.contains('Jail Training')&& !oldCase.CIS_Task_List__c.contains('Jail Training'))
        {
        Task newTask = new Task();
        newTask.subject = 'CIS NEW Install Task - Jail Training';
        newTask.Description = 'CIS NEW Install Task - Jail Training.';
        newTask.whatId = c.Id;
        newTask.Type = 'Project';
        //newTask.Account_Name__c = acct[0].Name;
        newTask.ownerId = [select id from user where name = :ass2].id;
        newTask.ActivityDate = c.createdDate.date() + 30;
        
        insertTask.add(newTask);
        }
      }
      if(c.CIS_Task_List__c.contains('Jail Training')&& string.isblank(oldCase.CIS_Task_List__c))
      {
        Task newTask = new Task();
        newTask.subject = 'CIS NEW Install Task - Jail Training';
        newTask.Description = 'CIS NEW Install Task - Jail Training.';
        newTask.whatId = c.Id;
        newTask.Type = 'Project';
        //newTask.Account_Name__c = acct[0].Name;
        newTask.ownerId = [select id from user where name = :ass2].id;
        newTask.ActivityDate = c.createdDate.date() + 30;
        
        insertTask.add(newTask);
      }
      if(c.CIS_Task_List__c.contains('Mobile/Mobile Interface')&& !string.isblank(oldCase.CIS_Task_List__c))
      {
        if(c.CIS_Task_List__c.contains('Mobile/Mobile Interface')&& !oldCase.CIS_Task_List__c.contains('Mobile/Mobile Interface'))
        {
        Task newTask = new Task();
        newTask.subject = 'CIS NEW Install Task - Mobile/Mobile Interface';
        newTask.Description = 'CIS Team to Install the Pre-Production Mobile/Mobile Interface server(s). Please see project scope in the secure folder for Date and Time of the NEW Install.';
        newTask.whatId = c.Id;
        newTask.Type = 'Project';
        //newTask.Account_Name__c = acct[0].Name;
        newTask.ownerId = [select id from user where name = :ass2].id;
        newTask.ActivityDate = c.createdDate.date() + 30;
        
        insertTask.add(newTask);
        }
      }
      if(c.CIS_Task_List__c.contains('Mobile/Mobile Interface')&& string.isblank(oldCase.CIS_Task_List__c))
      {
        Task newTask = new Task();
        newTask.subject = 'CIS NEW Install Task - Mobile/Mobile Interface';
        newTask.Description = 'CIS Team to Install the Pre-Production Mobile/Mobile Interface server(s). Please see project scope in the secure folder for Date and Time of the NEW Install.';
        newTask.whatId = c.Id;
        newTask.Type = 'Project';
        //newTask.Account_Name__c = acct[0].Name;
        newTask.ownerId = [select id from user where name = :ass2].id;
        newTask.ActivityDate = c.createdDate.date() + 30;
        
        insertTask.add(newTask);
      }
      if(c.CIS_Task_List__c.contains('RMS.')&& !string.isblank(oldCase.CIS_Task_List__c))
      {
        if(c.CIS_Task_List__c.contains('RMS.')&& !oldCase.CIS_Task_List__c.contains('RMS.'))
        {
        Task newTask = new Task();
        newTask.subject = 'CIS NEW Install Task - RMS';
        newTask.Description = 'CIS Team to Install the RMS Server(s) WEB SQL, Classic SQL and Web IIS. Please see project scope in the secure folder for Date and Time of the NEW Install.';
        newTask.whatId = c.Id;
        newTask.Type = 'Project';
        //newTask.Account_Name__c = acct[0].Name;
        newTask.ownerId = [select id from user where name = :ass2].id;
        newTask.ActivityDate = c.createdDate.date() + 30;
        
        insertTask.add(newTask);
        }
      }
      if(c.CIS_Task_List__c.contains('RMS.')&& string.isblank(oldCase.CIS_Task_List__c))
      {
        Task newTask = new Task();
        newTask.subject = 'CIS NEW Install Task - RMS';
        newTask.Description = 'CIS Team to Install the RMS Server(s) WEB SQL, Classic SQL and Web IIS. Please see project scope in the secure folder for Date and Time of the NEW Install.';
        newTask.whatId = c.Id;
        newTask.Type = 'Project';
        //newTask.Account_Name__c = acct[0].Name;
        newTask.ownerId = [select id from user where name = :ass2].id;
        newTask.ActivityDate = c.createdDate.date() + 30;
        
        insertTask.add(newTask);
      }
      if(c.CIS_Task_List__c.contains('RMS Test')&& !string.isblank(oldCase.CIS_Task_List__c))
      {
        if(c.CIS_Task_List__c.contains('RMS Test')&& !oldCase.CIS_Task_List__c.contains('RMS Test'))
        {
        Task newTask = new Task();
        newTask.subject = 'CIS NEW Install Task - RMS Test';
        newTask.Description = 'CIS NEW Install Task - RMS Test.';
        newTask.whatId = c.Id;
        newTask.Type = 'Project';
        //newTask.Account_Name__c = acct[0].Name;
        newTask.ownerId = [select id from user where name = :ass2].id;
        newTask.ActivityDate = c.createdDate.date() + 30;
        
        insertTask.add(newTask);
        }
      }
      if(c.CIS_Task_List__c.contains('RMS Test')&& string.isblank(oldCase.CIS_Task_List__c))
      {
        Task newTask = new Task();
        newTask.subject = 'CIS NEW Install Task - RMS Test';
        newTask.Description = 'CIS NEW Install Task - RMS Test.';
        newTask.whatId = c.Id;
        newTask.Type = 'Project';
        //newTask.Account_Name__c = acct[0].Name;
        newTask.ownerId = [select id from user where name = :ass2].id;
        newTask.ActivityDate = c.createdDate.date() + 30;
        
        insertTask.add(newTask);
      }
      if(c.CIS_Task_List__c.contains('RMS Training')&& !string.isblank(oldCase.CIS_Task_List__c))
      {
        if(c.CIS_Task_List__c.contains('RMS Training')&& !oldCase.CIS_Task_List__c.contains('RMS Training'))
        {
        Task newTask = new Task();
        newTask.subject = 'CIS NEW Install Task - RMS Training';
        newTask.Description = 'CIS NEW Install Task - RMS Training.';
        newTask.whatId = c.Id;
        newTask.Type = 'Project';
        //newTask.Account_Name__c = acct[0].Name;
        newTask.ownerId = [select id from user where name = :ass2].id;
        newTask.ActivityDate = c.createdDate.date() + 30;
        
        insertTask.add(newTask);
        }
      }
      if(c.CIS_Task_List__c.contains('RMS Training')&& string.isblank(oldCase.CIS_Task_List__c))
      {
        Task newTask = new Task();
        newTask.subject = 'CIS NEW Install Task - RMS Training';
        newTask.Description = 'CIS NEW Install Task - RMS Training.';
        newTask.whatId = c.Id;
        newTask.Type = 'Project';
        //newTask.Account_Name__c = acct[0].Name;
        newTask.ownerId = [select id from user where name = :ass2].id;
        newTask.ActivityDate = c.createdDate.date() + 30;
        
        insertTask.add(newTask);
      }
      if(c.CIS_Task_List__c.contains('Routing Server')&& !string.isblank(oldCase.CIS_Task_List__c))
      {
        if(c.CIS_Task_List__c.contains('Routing Server')&& !oldCase.CIS_Task_List__c.contains('Routing Server'))
        {
        Task newTask = new Task();
        newTask.subject = 'CIS NEW Install Task - Routing Server';
        newTask.Description = 'CIS NEW Install Task - Routing Server.';
        newTask.whatId = c.Id;
        newTask.Type = 'Project';
        //newTask.Account_Name__c = acct[0].Name;
        newTask.ownerId = [select id from user where name = :ass2].id;
        newTask.ActivityDate = c.createdDate.date() + 30;
        
        insertTask.add(newTask);
        }
      }
      if(c.CIS_Task_List__c.contains('Routing Server')&& string.isblank(oldCase.CIS_Task_List__c))
      {
        Task newTask = new Task();
        newTask.subject = 'CIS NEW Install Task - Routing Server';
        newTask.Description = 'CIS NEW Install Task - Routing Server.';
        newTask.whatId = c.Id;
        newTask.Type = 'Project';
        //newTask.Account_Name__c = acct[0].Name;
        newTask.ownerId = [select id from user where name = :ass2].id;
        newTask.ActivityDate = c.createdDate.date() + 30;
        
        insertTask.add(newTask);
      }
      if(c.CIS_Task_List__c.contains('RMS Workstations')&& string.isblank(oldCase.CIS_Task_List__c))
      {
        Task newTask = new Task();
        newTask.subject = 'CIS NEW Install Task - RMS Workstations';
        newTask.Description = 'CIS NEW Install Task - RMS Workstations.';
        newTask.whatId = c.Id;
        newTask.Type = 'Project';
        //newTask.Account_Name__c = acct[0].Name;
        newTask.ownerId = [select id from user where name = :ass2].id;
        newTask.ActivityDate = c.createdDate.date() + 30;
        
        insertTask.add(newTask);      }
      if(c.CIS_Task_List__c.contains('CAD Workstations')&& string.isblank(oldCase.CIS_Task_List__c))      {
        Task newTask = new Task();
        newTask.subject = 'CIS NEW Install Task - CAD Workstations';
        newTask.Description = 'CIS NEW Install Task - CAD Workstations.';
        newTask.whatId = c.Id;
        newTask.Type = 'Project';
        //newTask.Account_Name__c = acct[0].Name;
        newTask.ownerId = [select id from user where name = :ass2].id;
        newTask.ActivityDate = c.createdDate.date() + 30;
        
        insertTask.add(newTask);      }
      if(c.CIS_Task_List__c.contains('Jail Workstations')&& string.isblank(oldCase.CIS_Task_List__c))      {
        Task newTask = new Task();
        newTask.subject = 'CIS NEW Install Task - Jail Workstations';
        newTask.Description = 'CIS NEW Install Task - Jail Workstations.';
        newTask.whatId = c.Id;
        newTask.Type = 'Project';
        //newTask.Account_Name__c = acct[0].Name;
        newTask.ownerId = [select id from user where name = :ass2].id;
        newTask.ActivityDate = c.createdDate.date() + 30;
        
        insertTask.add(newTask);      }
      if(c.CIS_Task_List__c.contains('CIS Handoff Meeting')&& string.isblank(oldCase.CIS_Task_List__c))      {
        Task newTask = new Task();
        newTask.subject = 'CIS NEW Install Task - CIS Handoff Meeting';
        newTask.Description = 'CIS NEW Install Task - CIS Handoff Meeting.';
        newTask.whatId = c.Id;
        newTask.Type = 'Project';
        //newTask.Account_Name__c = acct[0].Name;
        newTask.ownerId = [select id from user where name = :ass2].id;
        newTask.ActivityDate = c.createdDate.date() + 30;
        
        insertTask.add(newTask);      }
        



      if(c.CIS_Task_List__c.contains('TTMS/CIM')&& !string.isblank(oldCase.CIS_Task_List__c))      {
        if(c.CIS_Task_List__c.contains('TTMS/CIM')&& !oldCase.CIS_Task_List__c.contains('TTMS/CIM'))        {
        Task newTask = new Task();
        newTask.subject = 'CIS NEW Install Task - TTMS/CIM';
        newTask.Description = 'CIS Team to Install the Pre-Production TTMS and or CIM server. Please see project scope in the secure folder for Date and Time of the NEW Install.';
        newTask.whatId = c.Id;
        newTask.Type = 'Project';
        //newTask.Account_Name__c = acct[0].Name;
        newTask.ownerId = [select id from user where name = :ass2].id;
        newTask.ActivityDate = c.createdDate.date() + 30;
        
        insertTask.add(newTask);        }      }
      if(c.CIS_Task_List__c.contains('TTMS/CIM')&& string.isblank(oldCase.CIS_Task_List__c))      {
        Task newTask = new Task();
        newTask.subject = 'CIS NEW Install Task - TTMS/CIM';
        newTask.Description = 'CIS Team to Install the Pre-Production TTMS and or CIM server. Please see project scope in the secure folder for Date and Time of the NEW Install.';
        newTask.whatId = c.Id;
        newTask.Type = 'Project';
        //newTask.Account_Name__c = acct[0].Name;
        newTask.ownerId = [select id from user where name = :ass2].id;
        newTask.ActivityDate = c.createdDate.date() + 30;
        
        insertTask.add(newTask);      }
      }
      }
    }
  }
  }
  if(insertTask.size() > 0)
    insert insertTask;  
}