trigger WOAssignment2 on Case (after update) 
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
		&& c.Account_Support_Team__c.startsWith('Tiburon')
		&& c.Work_Order_Type__c == 'Project_-_Tiburon' 
		&& c.Status == 'Approved - Assigned'
		&& c.status != oldCase.Status
    		&& c.Tiburon_Task_List__c == oldCase.Tiburon_Task_List__c
    		&& c.owner == oldCase.owner)
    	|| 
    	//this is for cases with an existing status of approved - Assigned but have updated the SE or CIS list values
    	(c.RecordTypeId == Schema.SObjectType.Case.getRecordTypeInfosByName().get('Work Order Ticket').getRecordTypeId()
    		&& c.Account_Support_Team__c.startsWith('Tiburon')
    		&& c.Work_Order_Type__c == 'Project_-_Tiburon'
    		&& c.Status == 'Approved - Assigned'
    		&& c.Tiburon_Task_List__c != oldCase.Tiburon_Task_List__c
    		&& c.owner == oldCase.owner
    	)
    )
    {
      
      //second step logic to see what tasks need to be created.
      //the !oldCase looks at the previous data to verify that the value has been added and only creates tasks when changes are made to the SE and CIS lists.
      If((c.Tiburon_Task_List__c != ''))
      {
      Account[] acct = [Select Name from account where id = :c.AccountId];	
      if(!string.isblank(c.Tiburon_Task_List__c))
      {
      	if(c.Tiburon_Task_List__c.contains('CIS Task – Technical Meeting')&& !string.isblank(oldCase.Tiburon_Task_List__c))
      {
        if(c.Tiburon_Task_List__c.contains('CIS Task – Technical Meeting')&& !oldCase.Tiburon_Task_List__c.contains('CIS Task – Technical Meeting'))
        {
        Task newTask = new Task();
        newTask.subject = 'CIS Task – Technical Meeting';
        newTask.Description = 'CIS Task – Technical Meeting';
        newTask.whatId = c.Id;
        newTask.Type = 'Project';
        //newTask.Account_Name__c = acct[0].Name;
        newTask.ownerId = [select id from user where name = :ass3].id;
        newTask.ActivityDate = c.createdDate.date() + 30;
        
        insertTask.add(newTask);
        }
      }
      if(c.Tiburon_Task_List__c.contains('CIS Task – Technical Meeting')&& string.isblank(oldCase.Tiburon_Task_List__c))
      {
        Task newTask = new Task();
        newTask.subject = 'CIS Task – Technical Meeting';
        newTask.Description = 'CIS Task – Technical Meeting';
        newTask.whatId = c.Id;
        newTask.Type = 'Project';
        //newTask.Account_Name__c = acct[0].Name;
        newTask.ownerId = [select id from user where name = :ass3].id;
        newTask.ActivityDate = c.createdDate.date() + 30;
        
        insertTask.add(newTask);
      }
        
       if(c.Tiburon_Task_List__c.contains('CIS Task – Technical Handoff')&& !string.isblank(oldCase.Tiburon_Task_List__c))
      {
        if(c.Tiburon_Task_List__c.contains('CIS Task – Technical Handoff')&& !oldCase.Tiburon_Task_List__c.contains('CIS Task – Technical Handoff'))
        {
        Task newTask = new Task();
        newTask.subject = 'CIS Task – Technical Handoff';
        newTask.Description = 'CIS Task – Technical Handoff';
        newTask.whatId = c.Id;
        newTask.Type = 'Project';
        //newTask.Account_Name__c = acct[0].Name;
        newTask.ownerId = [select id from user where name = :ass3].id;
        newTask.ActivityDate = c.createdDate.date() + 30;
        
        insertTask.add(newTask);
        }
      }
      if(c.Tiburon_Task_List__c.contains('CIS Task – Technical Handoff')&& string.isblank(oldCase.Tiburon_Task_List__c))
      {
        Task newTask = new Task();
        newTask.subject = 'CIS Task – Technical Handoff';
        newTask.Description = 'CIS Task – Technical Handoff';
        newTask.whatId = c.Id;
        newTask.Type = 'Project';
        //newTask.Account_Name__c = acct[0].Name;
        newTask.ownerId = [select id from user where name = :ass3].id;
        newTask.ActivityDate = c.createdDate.date() + 30;
        
        insertTask.add(newTask);
      }
        
      if(c.Tiburon_Task_List__c.contains('CIS Task – Hardware Prep')&& !string.isblank(oldCase.Tiburon_Task_List__c))
      {
        if(c.Tiburon_Task_List__c.contains('CIS Task – Hardware Prep')&& !oldCase.Tiburon_Task_List__c.contains('CIS Task – Hardware Prep'))
        {
        Task newTask = new Task();
        newTask.subject = 'CIS Task – Hardware Prep';
        newTask.Description = 'CIS Task – Hardware Prep';
        newTask.whatId = c.Id;
        newTask.Type = 'Project';
        //newTask.Account_Name__c = acct[0].Name;
        newTask.ownerId = [select id from user where name = :ass3].id;
        newTask.ActivityDate = c.createdDate.date() + 30;
        
        insertTask.add(newTask);
        }
      }
      if(c.Tiburon_Task_List__c.contains('CIS Task – Hardware Prep')&& string.isblank(oldCase.Tiburon_Task_List__c))
      {
        Task newTask = new Task();
        newTask.subject = 'CIS Task – Technical Hardware Prep';
        newTask.Description = 'CIS Task – Technical Hardware Prep';
        newTask.whatId = c.Id;
        newTask.Type = 'Project';
        //newTask.Account_Name__c = acct[0].Name;
        newTask.ownerId = [select id from user where name = :ass3].id;
        newTask.ActivityDate = c.createdDate.date() + 30;
        
        insertTask.add(newTask);
      }
      if(c.Tiburon_Task_List__c.contains('CIS Task – Go Live Support')&& !string.isblank(oldCase.Tiburon_Task_List__c))
      {
        if(c.Tiburon_Task_List__c.contains('CIS Task – Go Live Support')&& !oldCase.Tiburon_Task_List__c.contains('CIS Task – Go Live Support'))
        {
        Task newTask = new Task();
        newTask.subject = 'CIS Task – Go Live Support';
        newTask.Description = 'CIS Task – Go Live Support';
        newTask.whatId = c.Id;
        newTask.Type = 'Project';
        //newTask.Account_Name__c = acct[0].Name;
        newTask.ownerId = [select id from user where name = :ass3].id;
        newTask.ActivityDate = c.createdDate.date() + 30;
        
        insertTask.add(newTask);
        }
      }
      if(c.Tiburon_Task_List__c.contains('CIS Task – Go Live Support')&& string.isblank(oldCase.Tiburon_Task_List__c))
      {
        Task newTask = new Task();
        newTask.subject = 'CIS Task – Go Live Support';
        newTask.Description = 'CIS Task – Go Live Support';
        newTask.whatId = c.Id;
        newTask.Type = 'Project';
        //newTask.Account_Name__c = acct[0].Name;
        newTask.ownerId = [select id from user where name = :ass3].id;
        newTask.ActivityDate = c.createdDate.date() + 30;
        
        insertTask.add(newTask);
      }
        
      	if(c.Tiburon_Task_List__c.contains('DBA Task - Go Live Support')&& !string.isblank(oldCase.Tiburon_Task_List__c))
      {
        if(c.Tiburon_Task_List__c.contains('DBA Task - Go Live Support')&& !oldCase.Tiburon_Task_List__c.contains('DBA Task - Go Live Support'))
        {
        Task newTask = new Task();
        newTask.subject = 'DBA Task - Go Live Support';
        newTask.Description = 'DBA Task - Go Live Support';
        newTask.whatId = c.Id;
        newTask.Type = 'Project';
        //newTask.Account_Name__c = acct[0].Name;
        newTask.ownerId = [select id from user where name = :ass3].id;
        newTask.ActivityDate = c.createdDate.date() + 30;
        
        insertTask.add(newTask);
        }
      }
      if(c.Tiburon_Task_List__c.contains('DBA Task - Go Live Support')&& string.isblank(oldCase.Tiburon_Task_List__c))
      {
        Task newTask = new Task();
        newTask.subject = 'DBA Task - Go Live Support';
        newTask.Description = 'DBA Task - Go Live Support';
        newTask.whatId = c.Id;
        newTask.Type = 'Project';
        //newTask.Account_Name__c = acct[0].Name;
        newTask.ownerId = [select id from user where name = :ass3].id;
        newTask.ActivityDate = c.createdDate.date() + 30;
        
        insertTask.add(newTask);
      }
        
      
      if(c.Tiburon_Task_List__c.contains('CIS Task – Install CAD')&& !string.isblank(oldCase.Tiburon_Task_List__c))
      {
        if(c.Tiburon_Task_List__c.contains('CIS Task – Install CAD')&& !oldCase.Tiburon_Task_List__c.contains('CIS Task – Install CAD'))
        {
        Task newTask = new Task();
        newTask.subject = 'CIS Task – Install CAD';
        newTask.Description = 'CIS Task – Install CAD';
        newTask.whatId = c.Id;
        newTask.Type = 'Project';
        //newTask.Account_Name__c = acct[0].Name;
        newTask.ownerId = [select id from user where name = :ass3].id;
        newTask.ActivityDate = c.createdDate.date() + 30;
        
        insertTask.add(newTask);
        }
      }
      if(c.Tiburon_Task_List__c.contains('CIS Task – Install CAD')&& string.isblank(oldCase.Tiburon_Task_List__c))
      {
        Task newTask = new Task();
        newTask.subject = 'CIS Task – Install CAD';
        newTask.Description = 'CIS Task – Install CAD';
        newTask.whatId = c.Id;
        newTask.Type = 'Project';
        //newTask.Account_Name__c = acct[0].Name;
        newTask.ownerId = [select id from user where name = :ass3].id;
        newTask.ActivityDate = c.createdDate.date() + 30;
        
        insertTask.add(newTask);
      }
      if(c.Tiburon_Task_List__c.contains('CIS Task – Install WebQuery')&& !string.isblank(oldCase.Tiburon_Task_List__c))
      {
        if(c.Tiburon_Task_List__c.contains('CIS Task – Install WebQuery')&& !oldCase.Tiburon_Task_List__c.contains('CIS Task – Install WebQuery'))
        {
        Task newTask = new Task();
        newTask.subject = 'CIS Task – Install WebQuery';
        newTask.Description = 'CIS Task – Install WebQuery';
        newTask.whatId = c.Id;
        newTask.Type = 'Project';
        //newTask.Account_Name__c = acct[0].Name;
        newTask.ownerId = [select id from user where name = :ass3].id;
        newTask.ActivityDate = c.createdDate.date() + 30;
        
        insertTask.add(newTask);
        }
      }
      if(c.Tiburon_Task_List__c.contains('CIS Task – Install WebQuery')&& string.isblank(oldCase.Tiburon_Task_List__c))
      {
        Task newTask = new Task();
        newTask.subject = 'CIS Task – Install WebQuery';
        newTask.Description = 'CIS Task – Install WebQuery';
        newTask.whatId = c.Id;
        newTask.Type = 'Project';
        //newTask.Account_Name__c = acct[0].Name;
        newTask.ownerId = [select id from user where name = :ass3].id;
        newTask.ActivityDate = c.createdDate.date() + 30;
        
        insertTask.add(newTask);
      }
      if(c.Tiburon_Task_List__c.contains('CIS Task – CAD/RMS Integration')&& !string.isblank(oldCase.Tiburon_Task_List__c))
      {
        if(c.Tiburon_Task_List__c.contains('CIS Task – CAD/RMS Integration')&& !oldCase.Tiburon_Task_List__c.contains('CIS Task – CAD/RMS Integration'))
        {
        Task newTask = new Task();
        newTask.subject = 'CIS Task – CAD/RMS Integration';
        newTask.Description = 'CIS Task – CAD/RMS Integration';
        newTask.whatId = c.Id;
        newTask.Type = 'Project';
        //newTask.Account_Name__c = acct[0].Name;
        newTask.ownerId = [select id from user where name = :ass3].id;
        newTask.ActivityDate = c.createdDate.date() + 30;
        
        insertTask.add(newTask);
        }
      }
      if(c.Tiburon_Task_List__c.contains('CIS Task – CAD/RMS Integration')&& string.isblank(oldCase.Tiburon_Task_List__c))
      {
        Task newTask = new Task();
        newTask.subject = 'CIS Task – CAD/RMS Integration';
        newTask.Description = 'CIS Task – CAD/RMS Integration';
        newTask.whatId = c.Id;
        newTask.Type = 'Project';
        //newTask.Account_Name__c = acct[0].Name;
        newTask.ownerId = [select id from user where name = :ass3].id;
        newTask.ActivityDate = c.createdDate.date() + 30;
        
        insertTask.add(newTask);
      }
      if(c.Tiburon_Task_List__c.contains('CIS Task – ANI/ALI')&& !string.isblank(oldCase.Tiburon_Task_List__c))
      {
        if(c.Tiburon_Task_List__c.contains('CIS Task – ANI/ALI')&& !oldCase.Tiburon_Task_List__c.contains('CIS Task – ANI/ALI'))
        {
        Task newTask = new Task();
        newTask.subject = 'CIS Task – ANI/ALI';
        newTask.Description = 'CIS Task – ANI/ALI';
        newTask.whatId = c.Id;
        newTask.Type = 'Project';
        //newTask.Account_Name__c = acct[0].Name;
        newTask.ownerId = [select id from user where name = :ass3].id;
        newTask.ActivityDate = c.createdDate.date() + 30;
        
        insertTask.add(newTask);
        }
      }
      if(c.Tiburon_Task_List__c.contains('CIS Task – ANI/ALI')&& string.isblank(oldCase.Tiburon_Task_List__c))
      {
        Task newTask = new Task();
        newTask.subject = 'CIS Task – ANI/ALI';
        newTask.Description = 'CIS Task – ANI/ALI';
        newTask.whatId = c.Id;
        newTask.Type = 'Project';
        //newTask.Account_Name__c = acct[0].Name;
        newTask.ownerId = [select id from user where name = :ass3].id;
        newTask.ActivityDate = c.createdDate.date() + 30;
        
        insertTask.add(newTask);
      }
      if(c.Tiburon_Task_List__c.contains('CIS Task – Interface')&& !string.isblank(oldCase.Tiburon_Task_List__c))
      {
        if(c.Tiburon_Task_List__c.contains('CIS Task – Interface')&& !oldCase.Tiburon_Task_List__c.contains('CIS Task – Interface'))
        {
        Task newTask = new Task();
        newTask.subject = 'CIS Task – Interface';
        newTask.Description = 'CIS Task – Interface';
        newTask.whatId = c.Id;
        newTask.Type = 'Project';
        //newTask.Account_Name__c = acct[0].Name;
        newTask.ownerId = [select id from user where name = :ass3].id;
        newTask.ActivityDate = c.createdDate.date() + 30;
        
        insertTask.add(newTask);
        }
      }
      if(c.Tiburon_Task_List__c.contains('CIS Task – Interface')&& string.isblank(oldCase.Tiburon_Task_List__c))
      {
        Task newTask = new Task();
        newTask.subject = 'CIS Task – Interface';
        newTask.Description = 'CIS Task – Interface';
        newTask.whatId = c.Id;
        newTask.Type = 'Project';
        //newTask.Account_Name__c = acct[0].Name;
        newTask.ownerId = [select id from user where name = :ass3].id;
        newTask.ActivityDate = c.createdDate.date() + 30;
        
        insertTask.add(newTask);
      }
      if(c.Tiburon_Task_List__c.contains('CIS Task – Interface #2')&& !string.isblank(oldCase.Tiburon_Task_List__c))
      {
        if(c.Tiburon_Task_List__c.contains('CIS Task – Interface #2')&& !oldCase.Tiburon_Task_List__c.contains('CIS Task – Interface #2'))
        {
        Task newTask = new Task();
        newTask.subject = 'CIS Task – Interface #2';
        newTask.Description = 'CIS Task – Interface #2';
        newTask.whatId = c.Id;
        newTask.Type = 'Project';
        //newTask.Account_Name__c = acct[0].Name;
        newTask.ownerId = [select id from user where name = :ass3].id;
        newTask.ActivityDate = c.createdDate.date() + 30;
        
        insertTask.add(newTask);
        }
      }
      if(c.Tiburon_Task_List__c.contains('CIS Task – Interface #2')&& string.isblank(oldCase.Tiburon_Task_List__c))
      {
        Task newTask = new Task();
        newTask.subject = 'CIS Task – Interface #2';
        newTask.Description = 'CIS Task – Interface #2';
        newTask.whatId = c.Id;
        newTask.Type = 'Project';
        //newTask.Account_Name__c = acct[0].Name;
        newTask.ownerId = [select id from user where name = :ass3].id;
        newTask.ActivityDate = c.createdDate.date() + 30;
        
        insertTask.add(newTask);
      }
      if(c.Tiburon_Task_List__c.contains('CIS Task – CAD File Maintenance Conversion')&& !string.isblank(oldCase.Tiburon_Task_List__c))
      {
        if(c.Tiburon_Task_List__c.contains('CIS Task – CAD File Maintenance Conversion')&& !oldCase.Tiburon_Task_List__c.contains('CIS Task – CAD File Maintenance Conversion'))
        {
        Task newTask = new Task();
        newTask.subject = 'CIS Task – CAD File Maintenance Conversion';
        newTask.Description = 'CIS Task – CAD File Maintenance Conversion';
        newTask.whatId = c.Id;
        newTask.Type = 'Project';
        //newTask.Account_Name__c = acct[0].Name;
        newTask.ownerId = [select id from user where name = :ass3].id;
        newTask.ActivityDate = c.createdDate.date() + 30;
        
        insertTask.add(newTask);
        }
      }
      if(c.Tiburon_Task_List__c.contains('CIS Task – CAD File Maintenance Conversion')&& string.isblank(oldCase.Tiburon_Task_List__c))
      {
        Task newTask = new Task();
        newTask.subject = 'CIS Task – CAD File Maintenance Conversion';
        newTask.Description = 'CIS Task – CAD File Maintenance Conversion';
        newTask.whatId = c.Id;
        newTask.Type = 'Project';
        //newTask.Account_Name__c = acct[0].Name;
        newTask.ownerId = [select id from user where name = :ass3].id;
        newTask.ActivityDate = c.createdDate.date() + 30;
        
        insertTask.add(newTask);
      }
      if(c.Tiburon_Task_List__c.contains('CIS Task – CAD Histories Conversion')&& !string.isblank(oldCase.Tiburon_Task_List__c))
      {
        if(c.Tiburon_Task_List__c.contains('CIS Task – CAD Histories Conversion')&& !oldCase.Tiburon_Task_List__c.contains('CIS Task – CAD Histories Conversion'))
        {
        Task newTask = new Task();
        newTask.subject = 'CIS Task – CAD Histories Conversion';
        newTask.Description = 'CIS Task – CAD Histories Conversion';
        newTask.whatId = c.Id;
        newTask.Type = 'Project';
        //newTask.Account_Name__c = acct[0].Name;
        newTask.ownerId = [select id from user where name = :ass3].id;
        newTask.ActivityDate = c.createdDate.date() + 30;
        
        insertTask.add(newTask);
        }
      }
      if(c.Tiburon_Task_List__c.contains('CIS Task – CAD Histories Conversion')&& string.isblank(oldCase.Tiburon_Task_List__c))
      {
        Task newTask = new Task();
        newTask.subject = 'CIS Task – CAD Histories Conversion';
        newTask.Description = 'CIS Task – CAD Histories Conversion';
        newTask.whatId = c.Id;
        newTask.Type = 'Project';
        //newTask.Account_Name__c = acct[0].Name;
        newTask.ownerId = [select id from user where name = :ass3].id;
        newTask.ActivityDate = c.createdDate.date() + 30;
        
        insertTask.add(newTask);
      }
      if(c.Tiburon_Task_List__c.contains('CIS Task – CAD Warehouse Conversion')&& !string.isblank(oldCase.Tiburon_Task_List__c))
      {
        if(c.Tiburon_Task_List__c.contains('CIS Task – CAD Warehouse Conversion')&& !oldCase.Tiburon_Task_List__c.contains('CIS Task – CAD Warehouse Conversion'))
        {
        Task newTask = new Task();
        newTask.subject = 'CIS Task – CAD Warehouse Conversion';
        newTask.Description = 'CIS Task – CAD Warehouse Conversion';
        newTask.whatId = c.Id;
        newTask.Type = 'Project';
        //newTask.Account_Name__c = acct[0].Name;
        newTask.ownerId = [select id from user where name = :ass3].id;
        newTask.ActivityDate = c.createdDate.date() + 30;
        
        insertTask.add(newTask);
        }
      }
      if(c.Tiburon_Task_List__c.contains('CIS Task – CAD Warehouse Conversion')&& string.isblank(oldCase.Tiburon_Task_List__c))
      {
        Task newTask = new Task();
        newTask.subject = 'CIS Task – CAD Warehouse Conversion';
        newTask.Description = 'CIS Task – CAD Warehouse Conversion';
        newTask.whatId = c.Id;
        newTask.Type = 'Project';
        //newTask.Account_Name__c = acct[0].Name;
        newTask.ownerId = [select id from user where name = :ass3].id;
        newTask.ActivityDate = c.createdDate.date() + 30;
        
        insertTask.add(newTask);
      }
      if(c.Tiburon_Task_List__c.contains('DBA Task – DB Migrate - CAD')&& !string.isblank(oldCase.Tiburon_Task_List__c))
      {
        if(c.Tiburon_Task_List__c.contains('DBA Task – DB Migrate - CAD')&& !oldCase.Tiburon_Task_List__c.contains('DBA Task – DB Migrate - CAD'))
        {
        Task newTask = new Task();
        newTask.subject = 'DBA Task – DB Migrate - CAD';
        newTask.Description = 'DBA Task – DB Migrate - CAD';
        newTask.whatId = c.Id;
        newTask.Type = 'Project';
        //newTask.Account_Name__c = acct[0].Name;
        newTask.ownerId = [select id from user where name = :ass3].id;
        newTask.ActivityDate = c.createdDate.date() + 30;
        
        insertTask.add(newTask);
        }
      }
      if(c.Tiburon_Task_List__c.contains('DBA Task – DB Migrate - CAD')&& string.isblank(oldCase.Tiburon_Task_List__c))
      {
        Task newTask = new Task();
        newTask.subject = 'DBA Task – DB Migrate - CAD';
        newTask.Description = 'DBA Task – DB Migrate - CAD';
        newTask.whatId = c.Id;
        newTask.Type = 'Project';
        //newTask.Account_Name__c = acct[0].Name;
        newTask.ownerId = [select id from user where name = :ass3].id;
        newTask.ActivityDate = c.createdDate.date() + 30;
        
        insertTask.add(newTask);
      }
      if(c.Tiburon_Task_List__c.contains('DBA Task – DB Migrate - DW')&& !string.isblank(oldCase.Tiburon_Task_List__c))
      {
        if(c.Tiburon_Task_List__c.contains('DBA Task – DB Migrate - DW')&& !oldCase.Tiburon_Task_List__c.contains('DBA Task – DB Migrate - DW'))
        {
        Task newTask = new Task();
        newTask.subject = 'DBA Task – DB Migrate - DW';
        newTask.Description = 'DBA Task – DB Migrate - DW';
        newTask.whatId = c.Id;
        newTask.Type = 'Project';
        //newTask.Account_Name__c = acct[0].Name;
        newTask.ownerId = [select id from user where name = :ass3].id;
        newTask.ActivityDate = c.createdDate.date() + 30;
        
        insertTask.add(newTask);
        }
      }
      if(c.Tiburon_Task_List__c.contains('DBA Task – DB Migrate - DW')&& string.isblank(oldCase.Tiburon_Task_List__c))
      {
        Task newTask = new Task();
        newTask.subject = 'DBA Task – DB Migrate - DW';
        newTask.Description = 'DBA Task – DB Migrate - DW';
        newTask.whatId = c.Id;
        newTask.Type = 'Project';
        //newTask.Account_Name__c = acct[0].Name;
        newTask.ownerId = [select id from user where name = :ass3].id;
        newTask.ActivityDate = c.createdDate.date() + 30;
        
        insertTask.add(newTask);
      }
      if(c.Tiburon_Task_List__c.contains('DBA Task – DB Migrate - RMS')&& !string.isblank(oldCase.Tiburon_Task_List__c))
      {
        if(c.Tiburon_Task_List__c.contains('DBA Task – DB Migrate - RMS')&& !oldCase.Tiburon_Task_List__c.contains('DBA Task – DB Migrate - RMS'))
        {
        Task newTask = new Task();
        newTask.subject = 'DBA Task – DB Migrate - RMS';
        newTask.Description = 'DBA Task – DB Migrate - RMS';
        newTask.whatId = c.Id;
        newTask.Type = 'Project';
        //newTask.Account_Name__c = acct[0].Name;
        newTask.ownerId = [select id from user where name = :ass3].id;
        newTask.ActivityDate = c.createdDate.date() + 30;
        
        insertTask.add(newTask);
        }
      }
      if(c.Tiburon_Task_List__c.contains('DBA Task – DB Migrate - RMS')&& string.isblank(oldCase.Tiburon_Task_List__c))
      {
        Task newTask = new Task();
        newTask.subject = 'DBA Task – DB Migrate - RMS';
        newTask.Description = 'DBA Task – DB Migrate - RMS';
        newTask.whatId = c.Id;
        newTask.Type = 'Project';
        //newTask.Account_Name__c = acct[0].Name;
        newTask.ownerId = [select id from user where name = :ass3].id;
        newTask.ActivityDate = c.createdDate.date() + 30;
        
        insertTask.add(newTask);
      }
      if(c.Tiburon_Task_List__c.contains('DBA Task – DB Migrate - Copperfire')&& !string.isblank(oldCase.Tiburon_Task_List__c))
      {
        if(c.Tiburon_Task_List__c.contains('DBA Task – DB Migrate - Copperfire')&& !oldCase.Tiburon_Task_List__c.contains('DBA Task – DB Migrate - Copperfire'))
        {
        Task newTask = new Task();
        newTask.subject = 'DBA Task – DB Migrate - Copperfire';
        newTask.Description = 'DBA Task – DB Migrate - Copperfire';
        newTask.whatId = c.Id;
        newTask.Type = 'Project';
        //newTask.Account_Name__c = acct[0].Name;
        newTask.ownerId = [select id from user where name = :ass3].id;
        newTask.ActivityDate = c.createdDate.date() + 30;
        
        insertTask.add(newTask);
        }
      }
      if(c.Tiburon_Task_List__c.contains('DBA Task – DB Migrate - Copperfire')&& string.isblank(oldCase.Tiburon_Task_List__c))
      {
        Task newTask = new Task();
        newTask.subject = 'DBA Task – DB Migrate - Copperfire';
        newTask.Description = 'DBA Task – DB Migrate - Copperfire';
        newTask.whatId = c.Id;
        newTask.Type = 'Project';
        //newTask.Account_Name__c = acct[0].Name;
        newTask.ownerId = [select id from user where name = :ass3].id;
        newTask.ActivityDate = c.createdDate.date() + 30;
        
        insertTask.add(newTask);
      }
      if(c.Tiburon_Task_List__c.contains('DBA Task – DB Migrate - Fire')&& !string.isblank(oldCase.Tiburon_Task_List__c))
      {
        if(c.Tiburon_Task_List__c.contains('DBA Task – DB Migrate - Fire')&& !oldCase.Tiburon_Task_List__c.contains('DBA Task – DB Migrate - Fire'))
        {
        Task newTask = new Task();
        newTask.subject = 'DBA Task – DB Migrate - Fire';
        newTask.Description = 'DBA Task – DB Migrate - Fire';
        newTask.whatId = c.Id;
        newTask.Type = 'Project';
        //newTask.Account_Name__c = acct[0].Name;
        newTask.ownerId = [select id from user where name = :ass3].id;
        newTask.ActivityDate = c.createdDate.date() + 30;
        
        insertTask.add(newTask);
        }
      }
      if(c.Tiburon_Task_List__c.contains('DBA Task – DB Migrate - Fire')&& string.isblank(oldCase.Tiburon_Task_List__c))
      {
        Task newTask = new Task();
        newTask.subject = 'DBA Task – DB Migrate - Fire';
        newTask.Description = 'DBA Task – DB Migrate - Fire';
        newTask.whatId = c.Id;
        newTask.Type = 'Project';
        //newTask.Account_Name__c = acct[0].Name;
        newTask.ownerId = [select id from user where name = :ass3].id;
        newTask.ActivityDate = c.createdDate.date() + 30;
        
        insertTask.add(newTask);
      }
      if(c.Tiburon_Task_List__c.contains('DBA Task – Maintenance plans')&& !string.isblank(oldCase.Tiburon_Task_List__c))
      {
        if(c.Tiburon_Task_List__c.contains('DBA Task – Maintenance plans')&& !oldCase.Tiburon_Task_List__c.contains('DBA Task – Maintenance plans'))
        {
        Task newTask = new Task();
        newTask.subject = 'DBA Task – Maintenance plans';
        newTask.Description = 'DBA Task – Maintenance plans';
        newTask.whatId = c.Id;
        newTask.Type = 'Project';
        //newTask.Account_Name__c = acct[0].Name;
        newTask.ownerId = [select id from user where name = :ass3].id;
        newTask.ActivityDate = c.createdDate.date() + 30;
        
        insertTask.add(newTask);
        }
      }
      if(c.Tiburon_Task_List__c.contains('DBA Task – Maintenance plans')&& string.isblank(oldCase.Tiburon_Task_List__c))
      {
        Task newTask = new Task();
        newTask.subject = 'DBA Task – Maintenance plans';
        newTask.Description = 'DBA Task – Maintenance plans';
        newTask.whatId = c.Id;
        newTask.Type = 'Project';
        //newTask.Account_Name__c = acct[0].Name;
        newTask.ownerId = [select id from user where name = :ass3].id;
        newTask.ActivityDate = c.createdDate.date() + 30;
        
        insertTask.add(newTask);
      }
      if(c.Tiburon_Task_List__c.contains('DBA Task – Interface')&& !string.isblank(oldCase.Tiburon_Task_List__c))
      {
        if(c.Tiburon_Task_List__c.contains('DBA Task – Interface')&& !oldCase.Tiburon_Task_List__c.contains('DBA Task – Interface'))
        {
        Task newTask = new Task();
        newTask.subject = 'DBA Task – Interface';
        newTask.Description = 'DBA Task – Interface';
        newTask.whatId = c.Id;
        newTask.Type = 'Project';
        //newTask.Account_Name__c = acct[0].Name;
        newTask.ownerId = [select id from user where name = :ass3].id;
        newTask.ActivityDate = c.createdDate.date() + 30;
        
        insertTask.add(newTask);
        }
      }
      if(c.Tiburon_Task_List__c.contains('DBA Task – Interface')&& string.isblank(oldCase.Tiburon_Task_List__c))
      {
        Task newTask = new Task();
        newTask.subject = 'DBA Task – Interface';
        newTask.Description = 'DBA Task – Interface';
        newTask.whatId = c.Id;
        newTask.Type = 'Project';
        //newTask.Account_Name__c = acct[0].Name;
        newTask.ownerId = [select id from user where name = :ass3].id;
        newTask.ActivityDate = c.createdDate.date() + 30;
        
        insertTask.add(newTask);
      }
      if(c.Tiburon_Task_List__c.contains('DBA Task – Interface #2')&& !string.isblank(oldCase.Tiburon_Task_List__c))
      {
        if(c.Tiburon_Task_List__c.contains('DBA Task – Interface #2')&& !oldCase.Tiburon_Task_List__c.contains('DBA Task – Interface #2'))
        {
        Task newTask = new Task();
        newTask.subject = 'DBA Task – Interface #2';
        newTask.Description = 'DBA Task – Interface #2';
        newTask.whatId = c.Id;
        newTask.Type = 'Project';
        //newTask.Account_Name__c = acct[0].Name;
        newTask.ownerId = [select id from user where name = :ass3].id;
        newTask.ActivityDate = c.createdDate.date() + 30;
        
        insertTask.add(newTask);
        }
      }
      if(c.Tiburon_Task_List__c.contains('DBA Task – Interface #2')&& string.isblank(oldCase.Tiburon_Task_List__c))
      {
        Task newTask = new Task();
        newTask.subject = 'DBA Task – Interface #2';
        newTask.Description = 'DBA Task – Interface #2';
        newTask.whatId = c.Id;
        newTask.Type = 'Project';
        //newTask.Account_Name__c = acct[0].Name;
        newTask.ownerId = [select id from user where name = :ass3].id;
        newTask.ActivityDate = c.createdDate.date() + 30;
        
        insertTask.add(newTask);
      }
      }
    }
    }
  }  
  if(insertTask.size() > 0)
	insert insertTask;	
}