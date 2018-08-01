trigger WOAssignment on Case (after update) 
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
          && (c.Work_Order_Type__c == 'Project - New Build' 
          	|| c.Work_Order_Type__c == 'SE Task') 
          && c.Status == 'Approved - Assigned' 
          && c.status != oldCase.Status 
          && c.SE_Task_List__c == oldCase.SE_Task_List__c 
          && c.owner == oldCase.owner
          ) || 
        //this is for cases with an existing status of approved - Assigned but have updated the SE or CIS list values
        (c.RecordTypeId == Schema.SObjectType.Case.getRecordTypeInfosByName().get('Work Order Ticket').getRecordTypeId() 
        	&& c.Account_Support_Team__c.startsWith('Inform') 
        	&& (c.Work_Order_Type__c == 'Project - New Build' 
        		|| c.Work_Order_Type__c == 'SE Task' ) 
        	&& c.Status == 'Approved - Assigned' 
        	&& c.SE_Task_List__c != oldCase.SE_Task_List__c  
        	&& c.owner == oldCase.owner)
        )
    {
      
      //second step logic to see what tasks need to be created.
      //the !oldCase looks at the previous data to verify that the value has been added and only creates tasks when changes are made to the SE and CIS lists.
      If(c.SE_Task_List__c != '')
      {
      Account[] acct = [Select Name from account where id = :c.AccountId];  
      if(!string.isblank(c.SE_Task_List__c))
      {
      if(c.SE_Task_List__c.contains('AFR') && !string.isblank(oldCase.SE_Task_List__c) )
      {
        if(c.SE_Task_List__c.contains('AFR') && !oldCase.SE_Task_List__c.contains('AFR'))
        {
        Task newTask = new Task();
        newTask.subject = 'SE Task - STD Interface Implementation - AFR';
        newTask.Description = 'New implementation of AFR.';
        newTask.ownerId = [select id from user where name = :ass1].id;
        newTask.whatId = c.Id;
        newTask.Type = 'Project';
        //newTask.Account_Name__c = acct[0].Name;
        newTask.ActivityDate = c.createdDate.date() + 30;
        
        insertTask.add(newTask);
      }
      }
      if(c.SE_Task_List__c.contains('AFR') && string.isblank(oldCase.SE_Task_List__c) )
      {
        Task newTask = new Task();
        newTask.subject = 'SE Task - STD Interface Implementation - AFR';
        newTask.Description = 'New implementation of AFR.';
        newTask.ownerId = [select id from user where name = :ass1].id;
        newTask.whatId = c.Id;
        newTask.Type = 'Project';
        //newTask.Account_Name__c = acct[0].Name;
        newTask.ActivityDate = c.createdDate.date() + 30;
        
        insertTask.add(newTask);
      }
       
      
      if(c.SE_Task_List__c.contains('STD Interface CAD to CAD #2') && !string.isblank(oldCase.SE_Task_List__c) )
      {
    if(c.SE_Task_List__c.contains('STD Interface CAD to CAD #2') && !oldCase.SE_Task_List__c.contains('STD Interface CAD to CAD #2'))
    {
        Task newTask = new Task();
    newTask.subject = 'SE Task - STD Interface CAD to CAD #2';
    newTask.Description = 'SE Task - STD Interface CAD to CAD #2';
    newTask.ownerId = [select id from user where name = :ass1].id;
    newTask.whatId = c.Id;
    newTask.Type = 'Project';
    //newTask.Account_Name__c = acct[0].Name;
        newTask.ActivityDate = c.createdDate.date() + 30;
      
    insertTask.add(newTask);
      }
      }
      if(c.SE_Task_List__c.contains('STD Interface CAD to CAD #2') && string.isblank(oldCase.SE_Task_List__c) )
      {
    Task newTask = new Task();
    newTask.subject = 'SE Task - STD Interface CAD to CAD #2';
    newTask.Description = 'SE Task - STD Interface CAD to CAD #2';
    newTask.ownerId = [select id from user where name = :ass1].id;
    newTask.whatId = c.Id;
    newTask.Type = 'Project';
    //newTask.Account_Name__c = acct[0].Name;
        newTask.ActivityDate = c.createdDate.date() + 30;
      
    insertTask.add(newTask);
      }


      if(c.SE_Task_List__c.contains('STD Interface CAD to CAD #3') && !string.isblank(oldCase.SE_Task_List__c) )
      {
    if(c.SE_Task_List__c.contains('STD Interface CAD to CAD #3') && !oldCase.SE_Task_List__c.contains('STD Interface CAD to CAD #3'))
    {
        Task newTask = new Task();
    newTask.subject = 'SE Task - STD Interface CAD to CAD #3';
    newTask.Description = 'SE Task - STD Interface CAD to CAD #3';
    newTask.ownerId = [select id from user where name = :ass1].id;
    newTask.whatId = c.Id;
    newTask.Type = 'Project';
    //newTask.Account_Name__c = acct[0].Name;
        newTask.ActivityDate = c.createdDate.date() + 30;
      
    insertTask.add(newTask);
      }
      }
      if(c.SE_Task_List__c.contains('STD Interface CAD to CAD #3') && string.isblank(oldCase.SE_Task_List__c) )
      {
    Task newTask = new Task();
    newTask.subject = 'SE Task - STD Interface CAD to CAD #3';
    newTask.Description = 'SE Task - STD Interface CAD to CAD #3';
    newTask.ownerId = [select id from user where name = :ass1].id;
    newTask.whatId = c.Id;
    newTask.Type = 'Project';
    //newTask.Account_Name__c = acct[0].Name;
        newTask.ActivityDate = c.createdDate.date() + 30;
      
    insertTask.add(newTask);
      }



      if(c.SE_Task_List__c.contains('STD Interface CAD to Ext #2') && !string.isblank(oldCase.SE_Task_List__c) )
      {
    if(c.SE_Task_List__c.contains('STD Interface CAD to Ext #2') && !oldCase.SE_Task_List__c.contains('STD Interface CAD to Ext #2'))
    {
        Task newTask = new Task();
    newTask.subject = 'SE Task - STD Interface CAD to Ext #2';
    newTask.Description = 'SE Task - STD Interface CAD to Ext #2';
    newTask.ownerId = [select id from user where name = :ass1].id;
    newTask.whatId = c.Id;
    newTask.Type = 'Project';
    //newTask.Account_Name__c = acct[0].Name;
        newTask.ActivityDate = c.createdDate.date() + 30;
      
    insertTask.add(newTask);
      }
      }
      if(c.SE_Task_List__c.contains('STD Interface CAD to Ext #2') && string.isblank(oldCase.SE_Task_List__c) )
      {
    Task newTask = new Task();
    newTask.subject = 'SE Task - STD Interface CAD to Ext #2';
    newTask.Description = 'SE Task - STD Interface CAD to Ext #2';
    newTask.ownerId = [select id from user where name = :ass1].id;
    newTask.whatId = c.Id;
    newTask.Type = 'Project';
    //newTask.Account_Name__c = acct[0].Name;
        newTask.ActivityDate = c.createdDate.date() + 30;
      
    insertTask.add(newTask);
      }

      if(c.SE_Task_List__c.contains('STD Interface CAD to Ext #3') && !string.isblank(oldCase.SE_Task_List__c) )
      {
    if(c.SE_Task_List__c.contains('STD Interface CAD to Ext #3') && !oldCase.SE_Task_List__c.contains('STD Interface CAD to Ext #3'))
    {
        Task newTask = new Task();
    newTask.subject = 'SE Task - STD Interface CAD to Ext #3';
    newTask.Description = 'SE Task - STD Interface CAD to Ext #3';
    newTask.ownerId = [select id from user where name = :ass1].id;
    newTask.whatId = c.Id;
    newTask.Type = 'Project';
    //newTask.Account_Name__c = acct[0].Name;
        newTask.ActivityDate = c.createdDate.date() + 30;
      
    insertTask.add(newTask);
      }
      }
      if(c.SE_Task_List__c.contains('STD Interface CAD to Ext #3') && string.isblank(oldCase.SE_Task_List__c) )
      {
    Task newTask = new Task();
    newTask.subject = 'SE Task - STD Interface CAD to Ext #3';
    newTask.Description = 'SE Task - STD Interface CAD to Ext #3';
    newTask.ownerId = [select id from user where name = :ass1].id;
    newTask.whatId = c.Id;
    newTask.Type = 'Project';
    //newTask.Account_Name__c = acct[0].Name;
        newTask.ActivityDate = c.createdDate.date() + 30;
      
    insertTask.add(newTask);
      }


      if(c.SE_Task_List__c.contains('STD Interface CAD to Ext #4') && !string.isblank(oldCase.SE_Task_List__c) )
      {
    if(c.SE_Task_List__c.contains('STD Interface CAD to Ext #4') && !oldCase.SE_Task_List__c.contains('STD Interface CAD to Ext #4'))
    {
        Task newTask = new Task();
    newTask.subject = 'SE Task - STD Interface CAD to Ext #4';
    newTask.Description = 'SE Task - STD Interface CAD to Ext #4';
    newTask.ownerId = [select id from user where name = :ass1].id;
    newTask.whatId = c.Id;
    newTask.Type = 'Project';
    //newTask.Account_Name__c = acct[0].Name;
        newTask.ActivityDate = c.createdDate.date() + 30;
      
    insertTask.add(newTask);
      }
      }
      if(c.SE_Task_List__c.contains('STD Interface CAD to Ext #4') && string.isblank(oldCase.SE_Task_List__c) )
      {
    Task newTask = new Task();
    newTask.subject = 'SE Task - STD Interface CAD to Ext #4';
    newTask.Description = 'SE Task - STD Interface CAD to Ext #4';
    newTask.ownerId = [select id from user where name = :ass1].id;
    newTask.whatId = c.Id;
    newTask.Type = 'Project';
    //newTask.Account_Name__c = acct[0].Name;
        newTask.ActivityDate = c.createdDate.date() + 30;
      
    insertTask.add(newTask);
      }

      if(c.SE_Task_List__c.contains('STD Intefrace Station Alerting #2') && !string.isblank(oldCase.SE_Task_List__c) )
      {
    if(c.SE_Task_List__c.contains('STD Intefrace Station Alerting #2') && !oldCase.SE_Task_List__c.contains('STD Intefrace Station Alerting #2'))
    {
        Task newTask = new Task();
    newTask.subject = 'SE Task - STD Intefrace Station Alerting #2';
    newTask.Description = 'SE Task - STD Intefrace Station Alerting #2';
    newTask.ownerId = [select id from user where name = :ass1].id;
    newTask.whatId = c.Id;
    newTask.Type = 'Project';
    //newTask.Account_Name__c = acct[0].Name;
        newTask.ActivityDate = c.createdDate.date() + 30;
      
    insertTask.add(newTask);
      }
      }
      if(c.SE_Task_List__c.contains('STD Intefrace Station Alerting #2') && string.isblank(oldCase.SE_Task_List__c) )
      {
    Task newTask = new Task();
    newTask.subject = 'SE Task - STD Intefrace Station Alerting #2';
    newTask.Description = 'SE Task - STD Intefrace Station Alerting #2';
    newTask.ownerId = [select id from user where name = :ass1].id;
    newTask.whatId = c.Id;
    newTask.Type = 'Project';
    //newTask.Account_Name__c = acct[0].Name;
        newTask.ActivityDate = c.createdDate.date() + 30;
      
    insertTask.add(newTask);
      }
      if(c.SE_Task_List__c.contains('ANI/ALI')&& !string.isblank(oldCase.SE_Task_List__c))
      {
        if(c.SE_Task_List__c.contains('ANI/ALI')&& !oldCase.SE_Task_List__c.contains('ANI/ALI'))
        {
        Task newTask = new Task();
        newTask.subject = 'SE Task - STD Interface Implementation - ANI/ALI';
        newTask.Description = 'New implementation of Standard ANI/ALI.';
        newTask.whatId = c.Id;
        newTask.Type = 'Project';
        //newTask.Account_Name__c = acct[0].Name;
        newTask.ownerId = [select id from user where name = :ass1].id;
        newTask.ActivityDate = c.createdDate.date() + 30;
        
        insertTask.add(newTask);
        }
      }
      if(c.SE_Task_List__c.contains('ANI/ALI')&& string.isblank(oldCase.SE_Task_List__c))
      {
        Task newTask = new Task();
        newTask.subject = 'SE Task - STD Interface Implementation - ANI/ALI';
        newTask.Description = 'New implementation of Standard ANI/ALI.';
        newTask.whatId = c.Id;
        newTask.Type = 'Project';
        //newTask.Account_Name__c = acct[0].Name;
        newTask.ownerId = [select id from user where name = :ass1].id;
        newTask.ActivityDate = c.createdDate.date() + 30;
        
        insertTask.add(newTask);
        
      }
      
      if(c.SE_Task_List__c.contains('ASAP')&& !string.isblank(oldCase.SE_Task_List__c))
      
      {
        if(c.SE_Task_List__c.contains('ASAP')&& !oldCase.SE_Task_List__c.contains('ASAP'))
        {
        Task newTask = new Task();
        newTask.subject = 'SE Task - STD Interface Implementation - ASAP';
        newTask.Description = 'New implementation of ASAP';
        newTask.whatId = c.Id;
        newTask.Type = 'Project';
        //newTask.Account_Name__c = acct[0].Name;
        newTask.ownerId = [select id from user where name = :ass1].id;
        newTask.ActivityDate = c.createdDate.date() + 30;
        
        insertTask.add(newTask);
        }
      }
      if(c.SE_Task_List__c.contains('ASAP')&& string.isblank(oldCase.SE_Task_List__c))
      
      {
        Task newTask = new Task();
        newTask.subject = 'SE Task - STD Interface Implementation - ASAP';
        newTask.Description = 'New implementation of ASAP';
        newTask.whatId = c.Id;
        newTask.Type = 'Project';
        //newTask.Account_Name__c = acct[0].Name;
        newTask.ownerId = [select id from user where name = :ass1].id;
        newTask.ActivityDate = c.createdDate.date() + 30;
        
        insertTask.add(newTask);
      }
      if(c.SE_Task_List__c.contains('CAD to CAD')&& !string.isblank(oldCase.SE_Task_List__c))
      {
        if(c.SE_Task_List__c.contains('CAD to CAD')&& !oldCase.SE_Task_List__c.contains('CAD to CAD'))
        {
        Task newTask = new Task();
        newTask.subject = 'SE Task  - STD Interface Implementation - CAD to CAD';
        newTask.Description = 'New implementation of the Standard CAD to CAD Interface.';
        newTask.whatId = c.Id;
        newTask.Type = 'Project';
        //newTask.Account_Name__c = acct[0].Name;
        newTask.ownerId = [select id from user where name = :ass1].id;
        newTask.ActivityDate = c.createdDate.date() + 30;
        
        insertTask.add(newTask);
        }
      }
      if(c.SE_Task_List__c.contains('CAD to CAD')&& string.isblank(oldCase.SE_Task_List__c))
      {
        Task newTask = new Task();
        newTask.subject = 'SE Task  - STD Interface Implementation - CAD to CAD';
        newTask.Description = 'New implementation of the Standard CAD to CAD Interface.';
        newTask.whatId = c.Id;
        newTask.Type = 'Project';
        //newTask.Account_Name__c = acct[0].Name;
        newTask.ownerId = [select id from user where name = :ass1].id;
        newTask.ActivityDate = c.createdDate.date() + 30;
        
        insertTask.add(newTask);
        
      }
      if(c.SE_Task_List__c.contains('CAD to Ext')&& !string.isblank(oldCase.SE_Task_List__c))
      {
        if(c.SE_Task_List__c.contains('CAD to Ext')&& !oldCase.SE_Task_List__c.contains('CAD to Ext'))
        {
        Task newTask = new Task();
        newTask.subject = 'SE Task  - STD Interface Implementation - CAD to Ext';
        newTask.Description = 'New implementation of the Standard CAD to External System Data Transfer Interface.';
        newTask.whatId = c.Id;
        newTask.Type = 'Project';
        //newTask.Account_Name__c = acct[0].Name;
        newTask.ownerId = [select id from user where name = :ass1].id;
        newTask.ActivityDate = c.createdDate.date() + 30;
        
        insertTask.add(newTask);
        }
      }
      if(c.SE_Task_List__c.contains('CAD to Ext')&& string.isblank(oldCase.SE_Task_List__c))
      {
        
        Task newTask = new Task();
        newTask.subject = 'SE Task  - STD Interface Implementation - CAD to Ext';
        newTask.Description = 'New implementation of the Standard CAD to External System Data Transfer Interface.';
        newTask.whatId = c.Id;
        newTask.Type = 'Project';
        //newTask.Account_Name__c = acct[0].Name;
        newTask.ownerId = [select id from user where name = :ass1].id;
        newTask.ActivityDate = c.createdDate.date() + 30;
        
        insertTask.add(newTask);
        
      }
      if(c.SE_Task_List__c.contains('CFS.')&& !string.isEmpty(oldCase.SE_Task_List__c))
      {
        if(c.SE_Task_List__c.contains('CFS.')&& !oldCase.SE_Task_List__c.contains('CFS.'))
        {
        Task newTask = new Task();
        newTask.subject = 'SE Task  - Integration - CFS';
        newTask.Description = 'SE Task  - Integration - CFS.';
        newTask.whatId = c.Id;
        newTask.Type = 'Project';
        //newTask.Account_Name__c = acct[0].Name;
        newTask.ownerId = [select id from user where name = :ass1].id;
        newTask.ActivityDate = c.createdDate.date() + 30;
        
        insertTask.add(newTask);
        }
      }
      if(c.SE_Task_List__c.contains('CFS.')&& string.isEmpty(oldCase.SE_Task_List__c))
      {
        Task newTask = new Task();
        newTask.subject = 'SE Task  - Integration - CFS';
        newTask.Description = 'SE Task  - Integration - CFS.';
        newTask.whatId = c.Id;
        newTask.Type = 'Project';
        //newTask.Account_Name__c = acct[0].Name;
        newTask.ownerId = [select id from user where name = :ass1].id;
        newTask.ActivityDate = c.createdDate.date() + 30;
        
        insertTask.add(newTask);
      }
      if(c.SE_Task_List__c.contains('CFS Test')&& !string.isblank(oldCase.SE_Task_List__c))
      {
        if(c.SE_Task_List__c.contains('CFS Test')&& !oldCase.SE_Task_List__c.contains('CFS Test'))
        {
        Task newTask = new Task();
        newTask.subject = 'SE Task  - Integration - CFS Test';
        newTask.Description = 'SE Task  - Integration - CFS Test.';
        newTask.whatId = c.Id;
        newTask.Type = 'Project';
        //newTask.Account_Name__c = acct[0].Name;
        newTask.ownerId = [select id from user where name = :ass1].id;
        newTask.ActivityDate = c.createdDate.date() + 30;
        
        insertTask.add(newTask);
        }
      }
      if(c.SE_Task_List__c.contains('CFS Test')&& string.isblank(oldCase.SE_Task_List__c))
      {
        Task newTask = new Task();
        newTask.subject = 'SE Task  - Integration - CFS Test';
        newTask.Description = 'SE Task  - Integration - CFS Test.';
        newTask.whatId = c.Id;
        newTask.Type = 'Project';
        //newTask.Account_Name__c = acct[0].Name;
        newTask.ownerId = [select id from user where name = :ass1].id;
        newTask.ActivityDate = c.createdDate.date() + 30;
        
        insertTask.add(newTask);
      }
      if(c.SE_Task_List__c.contains('CFS Training')&& !string.isblank(oldCase.SE_Task_List__c))
      {
        if(c.SE_Task_List__c.contains('CFS Training')&& !oldCase.SE_Task_List__c.contains('CFS Training'))
        {
        Task newTask = new Task();
        newTask.subject = 'SE Task  - Integration - CFS Training';
        newTask.Description = 'SE Task  - Integration - CFS Training.';
        newTask.whatId = c.Id;
        newTask.Type = 'Project';
        //newTask.Account_Name__c = acct[0].Name;
        newTask.ownerId = [select id from user where name = :ass1].id;
        newTask.ActivityDate = c.createdDate.date() + 30;
        
        insertTask.add(newTask);
        }
      }
      if(c.SE_Task_List__c.contains('CFS Training')&& string.isblank(oldCase.SE_Task_List__c))
      {
        Task newTask = new Task();
        newTask.subject = 'SE Task  - Integration - CFS Training';
        newTask.Description = 'SE Task  - Integration - CFS Training.';
        newTask.whatId = c.Id;
        newTask.Type = 'Project';
        //newTask.Account_Name__c = acct[0].Name;
        newTask.ownerId = [select id from user where name = :ass1].id;
        newTask.ActivityDate = c.createdDate.date() + 30;
        
        insertTask.add(newTask);
      }
      if(c.SE_Task_List__c.contains('CIM.')&& !string.isblank(oldCase.SE_Task_List__c))
      {
        if(c.SE_Task_List__c.contains('CIM.')&& !oldCase.SE_Task_List__c.contains('CIM.'))
        {
        Task newTask = new Task();
        newTask.subject = 'SE Task  - Integration - CIM';
        newTask.Description = 'SE Task  - Integration - CIM.';
        newTask.whatId = c.Id;
        newTask.Type = 'Project';
        //newTask.Account_Name__c = acct[0].Name;
        newTask.ownerId = [select id from user where name = :ass1].id;
        newTask.ActivityDate = c.createdDate.date() + 30;
        
        insertTask.add(newTask);
        }
      }
      if(c.SE_Task_List__c.contains('CIM.')&& string.isblank(oldCase.SE_Task_List__c))
      {
        
        Task newTask = new Task();
        newTask.subject = 'SE Task  - Integration - CIM';
        newTask.Description = 'SE Task  - Integration - CIM.';
        newTask.whatId = c.Id;
        newTask.Type = 'Project';
        //newTask.Account_Name__c = acct[0].Name;
        newTask.ownerId = [select id from user where name = :ass1].id;
        newTask.ActivityDate = c.createdDate.date() + 30;
        
        insertTask.add(newTask);
        
      }
      if(c.SE_Task_List__c.contains('CIM Test')&& !string.isblank(oldCase.SE_Task_List__c))
      {
        if(c.SE_Task_List__c.contains('CIM Test')&& !oldCase.SE_Task_List__c.contains('CIM Test'))
        {
        Task newTask = new Task();
        newTask.subject = 'SE Task  - Integration - CIM Test';
        newTask.Description = 'SE Task  - Integration - CIM Test.';
        newTask.whatId = c.Id;
        newTask.Type = 'Project';
        //newTask.Account_Name__c = acct[0].Name;
        newTask.ownerId = [select id from user where name = :ass1].id;
        newTask.ActivityDate = c.createdDate.date() + 30;
        
        insertTask.add(newTask);
        }
      }
      if(c.SE_Task_List__c.contains('CIM Test')&& string.isblank(oldCase.SE_Task_List__c))
      {
        Task newTask = new Task();
        newTask.subject = 'SE Task  - Integration - CIM Test';
        newTask.Description = 'SE Task  - Integration - CIM Test.';
        newTask.whatId = c.Id;
        newTask.Type = 'Project';
        //newTask.Account_Name__c = acct[0].Name;
        newTask.ownerId = [select id from user where name = :ass1].id;
        newTask.ActivityDate = c.createdDate.date() + 30;
        
        insertTask.add(newTask);
      }
      if(c.SE_Task_List__c.contains('CIM Training')&& !string.isblank(oldCase.SE_Task_List__c))
      {
        if(c.SE_Task_List__c.contains('CIM Training')&& !oldCase.SE_Task_List__c.contains('CIM Training'))
        {
        Task newTask = new Task();
        newTask.subject = 'SE Task  - Integration - CIM Training';
        newTask.Description = 'SE Task  - Integration - CIM Training.';
        newTask.whatId = c.Id;
        newTask.Type = 'Project';
        //newTask.Account_Name__c = acct[0].Name;
        newTask.ownerId = [select id from user where name = :ass1].id;
        newTask.ActivityDate = c.createdDate.date() + 30;
        
        insertTask.add(newTask);
        }
      }
      if(c.SE_Task_List__c.contains('CIM Training')&& string.isblank(oldCase.SE_Task_List__c))
      {
        Task newTask = new Task();
        newTask.subject = 'SE Task  - Integration - CIM Training';
        newTask.Description = 'SE Task  - Integration - CIM Training.';
        newTask.whatId = c.Id;
        newTask.Type = 'Project';
        //newTask.Account_Name__c = acct[0].Name;
        newTask.ownerId = [select id from user where name = :ass1].id;
        newTask.ActivityDate = c.createdDate.date() + 30;
        
        insertTask.add(newTask);
      }
      if(c.SE_Task_List__c.contains('DR')&& !string.isblank(oldCase.SE_Task_List__c))
      {
        if(c.SE_Task_List__c.contains('DR')&& !oldCase.SE_Task_List__c.contains('DR'))
        {
        Task newTask = new Task();
        newTask.subject = 'SE Task  - DR';
        newTask.Description = 'SE Task  - DR.';
        newTask.whatId = c.Id;
        newTask.Type = 'Project';
        //newTask.Account_Name__c = acct[0].Name;
        newTask.ownerId = [select id from user where name = :ass1].id;
        newTask.ActivityDate = c.createdDate.date() + 30;
        
        insertTask.add(newTask);
        }
      }
      if(c.SE_Task_List__c.contains('DR')&& string.isblank(oldCase.SE_Task_List__c))
      {
        Task newTask = new Task();
        newTask.subject = 'SE Task  - DR';
        newTask.Description = 'SE Task  - DR.';
        newTask.whatId = c.Id;
        newTask.Type = 'Project';
        //newTask.Account_Name__c = acct[0].Name;
        newTask.ownerId = [select id from user where name = :ass1].id;
        newTask.ActivityDate = c.createdDate.date() + 30;
        
        insertTask.add(newTask);
      }
      if(c.SE_Task_List__c.contains('Ext to CAD')&& !string.isblank(oldCase.SE_Task_List__c))
      {
        if(c.SE_Task_List__c.contains('Ext to CAD')&& !oldCase.SE_Task_List__c.contains('Ext to CAD'))
        {
        Task newTask = new Task();
        newTask.subject = 'SE Task - STD Interface Implementation - Ext to CAD';
        newTask.Description = 'New implementation of the Standard External System Data Transfer to CAD Interface.';
        newTask.whatId = c.Id;
        newTask.Type = 'Project';
        //newTask.Account_Name__c = acct[0].Name;
        newTask.ownerId = [select id from user where name = :ass1].id;
        newTask.ActivityDate = c.createdDate.date() + 30;
        
        insertTask.add(newTask);
        }
      }
      if(c.SE_Task_List__c.contains('Ext to CAD')&& string.isblank(oldCase.SE_Task_List__c))
      {
        Task newTask = new Task();
        newTask.subject = 'SE Task - STD Interface Implementation - Ext to CAD';
        newTask.Description = 'New implementation of the Standard External System Data Transfer to CAD Interface.';
        newTask.whatId = c.Id;
        newTask.Type = 'Project';
        //newTask.Account_Name__c = acct[0].Name;
        newTask.ownerId = [select id from user where name = :ass1].id;
        newTask.ActivityDate = c.createdDate.date() + 30;
        
        insertTask.add(newTask);
      }
      if(c.SE_Task_List__c.contains('GIS Validation.')&& !string.isblank(oldCase.SE_Task_List__c))
      {
        if(c.SE_Task_List__c.contains('GIS Validation.')&& !oldCase.SE_Task_List__c.contains('GIS Validation.'))
        {
        Task newTask = new Task();
        newTask.subject = 'SE Task - Integration - GIS Validation';
        newTask.Description = 'SE Task - Integration - GIS Validation.';
        newTask.whatId = c.Id;
        newTask.Type = 'Project';
        //newTask.Account_Name__c = acct[0].Name;
        newTask.ownerId = [select id from user where name = :ass1].id;
        newTask.ActivityDate = c.createdDate.date() + 30;
        
        insertTask.add(newTask);
        }
      }
      if(c.SE_Task_List__c.contains('GIS Validation.')&& string.isblank(oldCase.SE_Task_List__c))
      {
        Task newTask = new Task();
        newTask.subject = 'SE Task - Integration - GIS Validation';
        newTask.Description = 'SE Task - Integration - GIS Validation.';
        newTask.whatId = c.Id;
        newTask.Type = 'Project';
        //newTask.Account_Name__c = acct[0].Name;
        newTask.ownerId = [select id from user where name = :ass1].id;
        newTask.ActivityDate = c.createdDate.date() + 30;
        
        insertTask.add(newTask);
       }
      if(c.SE_Task_List__c.contains('GIS Validation Test')&& !string.isblank(oldCase.SE_Task_List__c))
      {
        if(c.SE_Task_List__c.contains('GIS Validation Test')&& !oldCase.SE_Task_List__c.contains('GIS Validation Test'))
        {
        Task newTask = new Task();
        newTask.subject = 'SE Task - Integration - GIS Validation Test';
        newTask.Description = 'SE Task - Integration - GIS Validation Test.';
        newTask.whatId = c.Id;
        newTask.Type = 'Project';
        //newTask.Account_Name__c = acct[0].Name;
        newTask.ownerId = [select id from user where name = :ass1].id;
        newTask.ActivityDate = c.createdDate.date() + 30;
        
        insertTask.add(newTask);
        }
      }
      if(c.SE_Task_List__c.contains('GIS Validation Test')&& string.isblank(oldCase.SE_Task_List__c))
      {
        Task newTask = new Task();
        newTask.subject = 'SE Task - Integration - GIS Validation Test';
        newTask.Description = 'SE Task - Integration - GIS Validation Test.';
        newTask.whatId = c.Id;
        newTask.Type = 'Project';
        //newTask.Account_Name__c = acct[0].Name;
        newTask.ownerId = [select id from user where name = :ass1].id;
        newTask.ActivityDate = c.createdDate.date() + 30;
        
        insertTask.add(newTask);
      }
      if(c.SE_Task_List__c.contains('GIS Validation Training')&& !string.isblank(oldCase.SE_Task_List__c))
      {
        if(c.SE_Task_List__c.contains('GIS Validation Training')&& !oldCase.SE_Task_List__c.contains('GIS Validation Training'))
        {
        Task newTask = new Task();
        newTask.subject = 'SE Task - Integration - GIS Validation Training';
        newTask.Description = 'SE Task - Integration - GIS Validation Training.';
        newTask.whatId = c.Id;
        newTask.Type = 'Project';
        //newTask.Account_Name__c = acct[0].Name;
        newTask.ownerId = [select id from user where name = :ass1].id;
        newTask.ActivityDate = c.createdDate.date() + 30;
        
        insertTask.add(newTask);
        }
      }
      if(c.SE_Task_List__c.contains('GIS Validation Training')&& string.isblank(oldCase.SE_Task_List__c))
      {
        Task newTask = new Task();
        newTask.subject = 'SE Task - Integration - GIS Validation Training';
        newTask.Description = 'SE Task - Integration - GIS Validation Training.';
        newTask.whatId = c.Id;
        newTask.Type = 'Project';
        //newTask.Account_Name__c = acct[0].Name;
        newTask.ownerId = [select id from user where name = :ass1].id;
        newTask.ActivityDate = c.createdDate.date() + 30;
        
        insertTask.add(newTask);
      }
      if(c.SE_Task_List__c.contains('Incident Data Conversion')&& !string.isblank(oldCase.SE_Task_List__c))
      {
        if(c.SE_Task_List__c.contains('Incident Data Conversion')&& !oldCase.SE_Task_List__c.contains('Incident Data Conversion'))
        {
        Task newTask = new Task();
        newTask.subject = 'SE Task - Incident Data Conversion';
        newTask.Description = 'SE Task - Incident Data Conversion.';
        newTask.whatId = c.Id;
        newTask.Type = 'Project';
        //newTask.Account_Name__c = acct[0].Name;
        newTask.ownerId = [select id from user where name = :ass1].id;
        newTask.ActivityDate = c.createdDate.date() + 30;
        
        insertTask.add(newTask);
        }
      }
      if(c.SE_Task_List__c.contains('Incident Data Conversion')&& string.isblank(oldCase.SE_Task_List__c))
      {
        Task newTask = new Task();
        newTask.subject = 'SE Task - Incident Data Conversion';
        newTask.Description = 'SE Task - Incident Data Conversion.';
        newTask.whatId = c.Id;
        newTask.Type = 'Project';
        //newTask.Account_Name__c = acct[0].Name;
        newTask.ownerId = [select id from user where name = :ass1].id;
        newTask.ActivityDate = c.createdDate.date() + 30;
        
        insertTask.add(newTask);
      }
      if(c.SE_Task_List__c.contains('Jail/RMS.')&& !string.isblank(oldCase.SE_Task_List__c))
      {
        if(c.SE_Task_List__c.contains('Jail/RMS.')&& !oldCase.SE_Task_List__c.contains('Jail/RMS.'))
        {
        Task newTask = new Task();
        newTask.subject = 'SE Task - Integration - Jail/RMS';
        newTask.Description = 'SE Task - Integration - Jail/RMS.';
        newTask.whatId = c.Id;
        newTask.Type = 'Project';
        //newTask.Account_Name__c = acct[0].Name;
        newTask.ownerId = [select id from user where name = :ass1].id;
        newTask.ActivityDate = c.createdDate.date() + 30;
        
        insertTask.add(newTask);
        }
      }
      if(c.SE_Task_List__c.contains('Jail/RMS.')&& string.isblank(oldCase.SE_Task_List__c))
      {
        Task newTask = new Task();
        newTask.subject = 'SE Task - Integration - Jail/RMS';
        newTask.Description = 'SE Task - Integration - Jail/RMS.';
        newTask.whatId = c.Id;
        newTask.Type = 'Project';
        //newTask.Account_Name__c = acct[0].Name;
        newTask.ownerId = [select id from user where name = :ass1].id;
        newTask.ActivityDate = c.createdDate.date() + 30;
        
        insertTask.add(newTask);
      }
      if(c.SE_Task_List__c.contains('Jail/RMS Test')&& !string.isblank(oldCase.SE_Task_List__c))
      {
        if(c.SE_Task_List__c.contains('Jail/RMS Test')&& !oldCase.SE_Task_List__c.contains('Jail/RMS Test'))
        {
        Task newTask = new Task();
        newTask.subject = 'SE Task - Integration - Jail/RMS Test';
        newTask.Description = 'SE Task - Integration - Jail/RMS Test.';
        newTask.whatId = c.Id;
        newTask.Type = 'Project';
        //newTask.Account_Name__c = acct[0].Name;
        newTask.ownerId = [select id from user where name = :ass1].id;
        newTask.ActivityDate = c.createdDate.date() + 30;
        
        insertTask.add(newTask);
        }
      }
      if(c.SE_Task_List__c.contains('Jail/RMS Test')&& string.isblank(oldCase.SE_Task_List__c))
      {
        Task newTask = new Task();
        newTask.subject = 'SE Task - Integration - Jail/RMS Test';
        newTask.Description = 'SE Task - Integration - Jail/RMS Test.';
        newTask.whatId = c.Id;
        newTask.Type = 'Project';
        //newTask.Account_Name__c = acct[0].Name;
        newTask.ownerId = [select id from user where name = :ass1].id;
        newTask.ActivityDate = c.createdDate.date() + 30;
        
        insertTask.add(newTask);
      }
      if(c.SE_Task_List__c.contains('Jail/RMS Training')&& !string.isblank(oldCase.SE_Task_List__c))
      {
        if(c.SE_Task_List__c.contains('Jail/RMS Training')&& !oldCase.SE_Task_List__c.contains('Jail/RMS Training'))
        {
        Task newTask = new Task();
        newTask.subject = 'SE Task - Integration - Jail/RMS Training';
        newTask.Description = 'SE Task - Integration - Jail/RMS Training.';
        newTask.whatId = c.Id;
        newTask.Type = 'Project';
        //newTask.Account_Name__c = acct[0].Name;
        newTask.ownerId = [select id from user where name = :ass1].id;
        newTask.ActivityDate = c.createdDate.date() + 30;
        
        insertTask.add(newTask);
        }
      }
      if(c.SE_Task_List__c.contains('Jail/RMS Training')&& string.isblank(oldCase.SE_Task_List__c))
      {
        Task newTask = new Task();
        newTask.subject = 'SE Task - Integration - Jail/RMS Training';
        newTask.Description = 'SE Task - Integration - Jail/RMS Training.';
        newTask.whatId = c.Id;
        newTask.Type = 'Project';
        //newTask.Account_Name__c = acct[0].Name;
        newTask.ownerId = [select id from user where name = :ass1].id;
        newTask.ActivityDate = c.createdDate.date() + 30;
        
        insertTask.add(newTask);
      }
      if(c.SE_Task_List__c.contains('MCC7500')&& !string.isblank(oldCase.SE_Task_List__c))
      {
        if(c.SE_Task_List__c.contains('MCC7500')&& !oldCase.SE_Task_List__c.contains('MCC7500'))
        {
        Task newTask = new Task();
        newTask.subject = 'SE Task - STD Interface Implementation - MCC7500';
        newTask.Description = 'New implementation of the Standard MCC7500 Interface.';
        newTask.whatId = c.Id;
        newTask.Type = 'Project';
        //newTask.Account_Name__c = acct[0].Name;
        newTask.ownerId = [select id from user where name = :ass1].id;
        newTask.ActivityDate = c.createdDate.date() + 30;
        
        insertTask.add(newTask);
        }
      }
      if(c.SE_Task_List__c.contains('MCC7500')&& string.isblank(oldCase.SE_Task_List__c))
      {
        Task newTask = new Task();
        newTask.subject = 'SE Task - STD Interface Implementation - MCC7500';
        newTask.Description = 'New implementation of the Standard MCC7500 Interface.';
        newTask.whatId = c.Id;
        newTask.Type = 'Project';
        //newTask.Account_Name__c = acct[0].Name;
        newTask.ownerId = [select id from user where name = :ass1].id;
        newTask.ActivityDate = c.createdDate.date() + 30;
        
        insertTask.add(newTask);
      }
      if(c.SE_Task_List__c.contains('Paging')&& !string.isblank(oldCase.SE_Task_List__c))
      {
        if(c.SE_Task_List__c.contains('Paging')&& !oldCase.SE_Task_List__c.contains('Paging'))
        {
        Task newTask = new Task();
        newTask.subject = 'SE Task - STD Interface Implementation - Paging';
        newTask.Description = 'New implementation of the Standard Paging Interface.';
        newTask.whatId = c.Id;
        newTask.Type = 'Project';
        //newTask.Account_Name__c = acct[0].Name;
        newTask.ownerId = [select id from user where name = :ass1].id;
        newTask.ActivityDate = c.createdDate.date() + 30;
        
        insertTask.add(newTask);
        }
      }
      if(c.SE_Task_List__c.contains('Paging')&& string.isblank(oldCase.SE_Task_List__c))
      {
        Task newTask = new Task();
        newTask.subject = 'SE Task - STD Interface Implementation - Paging';
        newTask.Description = 'New implementation of the Standard Paging Interface.';
        newTask.whatId = c.Id;
        newTask.Type = 'Project';
        //newTask.Account_Name__c = acct[0].Name;
        newTask.ownerId = [select id from user where name = :ass1].id;
        newTask.ActivityDate = c.createdDate.date() + 30;
        
        insertTask.add(newTask);
      }
      if(c.SE_Task_List__c.contains('Premise Caution Notes Conversion')&& !string.isblank(oldCase.SE_Task_List__c))
      {
        if(c.SE_Task_List__c.contains('Premise Caution Notes Conversion')&& !oldCase.SE_Task_List__c.contains('Premise Caution Notes Conversion'))
        {
        Task newTask = new Task();
        newTask.subject = 'SE Task - Premise Caution Notes Conversion';
        newTask.Description = 'SE Task - Premise Caution Notes Conversion.';
        newTask.whatId = c.Id;
        newTask.Type = 'Project';
        //newTask.Account_Name__c = acct[0].Name;
        newTask.ownerId = [select id from user where name = :ass1].id;
        newTask.ActivityDate = c.createdDate.date() + 30;
        
        insertTask.add(newTask);
        }
      }
      if(c.SE_Task_List__c.contains('Premise Caution Notes Conversion')&& string.isblank(oldCase.SE_Task_List__c))
      {
        Task newTask = new Task();
        newTask.subject = 'SE Task - Premise Caution Notes Conversion';
        newTask.Description = 'SE Task - Premise Caution Notes Conversion.';
        newTask.whatId = c.Id;
        newTask.Type = 'Project';
        //newTask.Account_Name__c = acct[0].Name;
        newTask.ownerId = [select id from user where name = :ass1].id;
        newTask.ActivityDate = c.createdDate.date() + 30;
        
        insertTask.add(newTask);
      }
      if(c.SE_Task_List__c.contains('PTT')&& !string.isblank(oldCase.SE_Task_List__c))
      {
        if(c.SE_Task_List__c.contains('PTT')&& !oldCase.SE_Task_List__c.contains('PTT'))
        {
        Task newTask = new Task();
        newTask.subject = 'SE Task - STD Interface Implementation - PTT';
        newTask.Description = 'New implementation of PTT.';
        newTask.whatId = c.Id;
        newTask.Type = 'Project';
        //newTask.Account_Name__c = acct[0].Name;
        newTask.ownerId = [select id from user where name = :ass1].id;
        newTask.ActivityDate = c.createdDate.date() + 30;
        
        insertTask.add(newTask);
        }
      }
      if(c.SE_Task_List__c.contains('PTT')&& string.isblank(oldCase.SE_Task_List__c))
      {
        Task newTask = new Task();
        newTask.subject = 'SE Task - STD Interface Implementation - PTT';
        newTask.Description = 'New implementation of PTT.';
        newTask.whatId = c.Id;
        newTask.Type = 'Project';
        //newTask.Account_Name__c = acct[0].Name;
        newTask.ownerId = [select id from user where name = :ass1].id;
        newTask.ActivityDate = c.createdDate.date() + 30;
        
        insertTask.add(newTask);
      }
      if(c.SE_Task_List__c.contains('Records Check')&& !string.isblank(oldCase.SE_Task_List__c))
      {
        if(c.SE_Task_List__c.contains('Records Check')&& !oldCase.SE_Task_List__c.contains('Records Check'))
        {
        Task newTask = new Task();
        newTask.subject = 'SE Task - STD Interface Implementation - Records Check';
        newTask.Description = 'New implementation of Records Check.';
        newTask.whatId = c.Id;
        newTask.Type = 'Project';
        //newTask.Account_Name__c = acct[0].Name;
        newTask.ownerId = [select id from user where name = :ass1].id;
        newTask.ActivityDate = c.createdDate.date() + 30;
        
        insertTask.add(newTask);
        }
      }
      if(c.SE_Task_List__c.contains('Records Check')&& string.isblank(oldCase.SE_Task_List__c))
      {
        Task newTask = new Task();
        newTask.subject = 'SE Task - STD Interface Implementation - Records Check';
        newTask.Description = 'New implementation of Records Check.';
        newTask.whatId = c.Id;
        newTask.Type = 'Project';
        //newTask.Account_Name__c = acct[0].Name;
        newTask.ownerId = [select id from user where name = :ass1].id;
        newTask.ActivityDate = c.createdDate.date() + 30;
        
        insertTask.add(newTask);
      }
      if(c.SE_Task_List__c.contains('Station Alerting')&& !string.isblank(oldCase.SE_Task_List__c))
      {
        if(c.SE_Task_List__c.contains('Station Alerting')&& !oldCase.SE_Task_List__c.contains('Station Alerting'))
        {
        Task newTask = new Task();
        newTask.subject = 'SE Task - STD Interface Implementation - Station Alerting';
        newTask.Description = 'SE Task - STD Interface Implementation - Station Alerting.';
        newTask.whatId = c.Id;
        newTask.Type = 'Project';
        //newTask.Account_Name__c = acct[0].Name;
        newTask.ownerId = [select id from user where name = :ass1].id;
        newTask.ActivityDate = c.createdDate.date() + 30;
        
        insertTask.add(newTask);
        }
      }
      if(c.SE_Task_List__c.contains('Station Alerting')&& string.isblank(oldCase.SE_Task_List__c))
      {
        Task newTask = new Task();
        newTask.subject = 'SE Task - STD Interface Implementation - Station Alerting';
        newTask.Description = 'SE Task - STD Interface Implementation - Station Alerting.';
        newTask.whatId = c.Id;
        newTask.Type = 'Project';
        //newTask.Account_Name__c = acct[0].Name;
        newTask.ownerId = [select id from user where name = :ass1].id;
        newTask.ActivityDate = c.createdDate.date() + 30;
        
        insertTask.add(newTask);
      }
      if(c.SE_Task_List__c.contains('Station Printing')&& !string.isblank(oldCase.SE_Task_List__c))
      {
        if(c.SE_Task_List__c.contains('Station Printing')&& !oldCase.SE_Task_List__c.contains('Station Alerting'))
        {
        Task newTask = new Task();
        newTask.subject = 'SE Task - STD Interface Implementation - Station Printing';
        newTask.Description = 'New implementation of the Standard Station Printing Interface.';
        newTask.whatId = c.Id;
        newTask.Type = 'Project';
        //newTask.Account_Name__c = acct[0].Name;
        newTask.ownerId = [select id from user where name = :ass1].id;
        newTask.ActivityDate = c.createdDate.date() + 30;
        
        insertTask.add(newTask);
        }
      }
      if(c.SE_Task_List__c.contains('Station Printing')&& string.isblank(oldCase.SE_Task_List__c))
      {
        Task newTask = new Task();
        newTask.subject = 'SE Task - STD Interface Implementation - Station Printing';
        newTask.Description = 'New implementation of the Standard Station Printing Interface.';
        newTask.whatId = c.Id;
        newTask.Type = 'Project';
        //newTask.Account_Name__c = acct[0].Name;
        newTask.ownerId = [select id from user where name = :ass1].id;
        newTask.ActivityDate = c.createdDate.date() + 30;
        
        insertTask.add(newTask);
      }
      if(c.SE_Task_List__c.contains('Telestaff')&& !string.isblank(oldCase.SE_Task_List__c))
      {
        if(c.SE_Task_List__c.contains('Telestaff')&& !oldCase.SE_Task_List__c.contains('Telestaff'))
        {
        Task newTask = new Task();
        newTask.subject = 'SE Task - STD Interface Implementation - Telestaff';
        newTask.Description = 'New implementation of Telestaff.';
        newTask.whatId = c.Id;
        newTask.Type = 'Project';
        //newTask.Account_Name__c = acct[0].Name;
        newTask.ownerId = [select id from user where name = :ass1].id;
        newTask.ActivityDate = c.createdDate.date() + 30;
        
        insertTask.add(newTask);
        }
      }
      if(c.SE_Task_List__c.contains('Telestaff')&& string.isblank(oldCase.SE_Task_List__c))
      {
        Task newTask = new Task();
        newTask.subject = 'SE Task - STD Interface Implementation - Telestaff';
        newTask.Description = 'New implementation of Telestaff.';
        newTask.whatId = c.Id;
        newTask.Type = 'Project';
        //newTask.Account_Name__c = acct[0].Name;
        newTask.ownerId = [select id from user where name = :ass1].id;
        newTask.ActivityDate = c.createdDate.date() + 30;
        
        insertTask.add(newTask);
      }
      if(c.SE_Task_List__c.contains('TTMS/RMS.')&& !string.isblank(oldCase.SE_Task_List__c))
      {
        if(c.SE_Task_List__c.contains('TTMS/RMS.')&& !oldCase.SE_Task_List__c.contains('TTMS/RMS.'))
        {
        Task newTask = new Task();
        newTask.subject = 'SE Task - Integration - TTMS/RMS';
        newTask.Description = 'Integration - TTMS/RMS.';
        newTask.whatId = c.Id;
        newTask.Type = 'Project';
        //newTask.Account_Name__c = acct[0].Name;
        newTask.ownerId = [select id from user where name = :ass1].id;
        newTask.ActivityDate = c.createdDate.date() + 30;
        
        insertTask.add(newTask);
        }
      }
      if(c.SE_Task_List__c.contains('TTMS/RMS.')&& string.isblank(oldCase.SE_Task_List__c))
      {
        Task newTask = new Task();
        newTask.subject = 'SE Task - Integration - TTMS/RMS';
        newTask.Description = 'Integration - TTMS/RMS.';
        newTask.whatId = c.Id;
        newTask.Type = 'Project';
        //newTask.Account_Name__c = acct[0].Name;
        newTask.ownerId = [select id from user where name = :ass1].id;
        newTask.ActivityDate = c.createdDate.date() + 30;
        
        insertTask.add(newTask);
      }
      if(c.SE_Task_List__c.contains('TTMS/RMS Test')&& !string.isblank(oldCase.SE_Task_List__c))
      {
        if(c.SE_Task_List__c.contains('TTMS/RMS Test')&& !oldCase.SE_Task_List__c.contains('TTMS/RMS Test'))
        {
        Task newTask = new Task();
        newTask.subject = 'SE Task - Integration - TTMS/RMS Test';
        newTask.Description = 'SE Task - Integration - TTMS/RMS Test.';
        newTask.whatId = c.Id;
        newTask.Type = 'Project';
        //newTask.Account_Name__c = acct[0].Name;
        newTask.ownerId = [select id from user where name = :ass1].id;
        newTask.ActivityDate = c.createdDate.date() + 30;
        
        insertTask.add(newTask);
        }
      }
      if(c.SE_Task_List__c.contains('TTMS/RMS Test')&& string.isblank(oldCase.SE_Task_List__c))
      {
        Task newTask = new Task();
        newTask.subject = 'SE Task - Integration - TTMS/RMS Test';
        newTask.Description = 'SE Task - Integration - TTMS/RMS Test.';
        newTask.whatId = c.Id;
        newTask.Type = 'Project';
        //newTask.Account_Name__c = acct[0].Name;
        newTask.ownerId = [select id from user where name = :ass1].id;
        newTask.ActivityDate = c.createdDate.date() + 30;
        
        insertTask.add(newTask);
      }
      if(c.SE_Task_List__c.contains('TTMS/RMS Training')&& !string.isblank(oldCase.SE_Task_List__c))
      {
        if(c.SE_Task_List__c.contains('TTMS/RMS Training')&& !oldCase.SE_Task_List__c.contains('TTMS/RMS Training'))
        {
        Task newTask = new Task();
        newTask.subject = 'SE Task - Integration - TTMS/RMS Training';
        newTask.Description = 'SE Task - Integration - TTMS/RMS Training.';
        newTask.whatId = c.Id;
        newTask.Type = 'Project';
        //newTask.Account_Name__c = acct[0].Name;
        newTask.ownerId = [select id from user where name = :ass1].id;
        newTask.ActivityDate = c.createdDate.date() + 30;
        
        insertTask.add(newTask);
        }
      }
      if(c.SE_Task_List__c.contains('TTMS/RMS Training')&& string.isblank(oldCase.SE_Task_List__c))
      {
        Task newTask = new Task();
        newTask.subject = 'SE Task - Integration - TTMS/RMS Training';
        newTask.Description = 'SE Task - Integration - TTMS/RMS Training.';
        newTask.whatId = c.Id;
        newTask.Type = 'Project';
        //newTask.Account_Name__c = acct[0].Name;
        newTask.ownerId = [select id from user where name = :ass1].id;
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