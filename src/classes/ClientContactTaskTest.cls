@isTest
private class ClientContactTaskTest {
        static testMethod void ClientContactTask() {
         Account acct = new Account();
         acct.name = 'Test Acct';
         acct.Z_Completed_Yearly_Contacts__c = 1;
         acct.Z_Last_Yearly_Contact_Date__c = System.Today() - 30;
         acct.Z_Last_Yearly_Contact_Type__c = 'Call';
         acct.Last_Yearly_Contact_Customer_Risk_Level__c = 'Low';
         insert acct;
         
         Event evt = new Event();
         evt.WhatId = acct.id;
         evt.Z_Logged_Client_Relations_Contact__c = true;
         evt.ActivityDateTime = System.Now();
       
         evt.Type = 'Client Relations - Call';
         evt.DurationInMinutes = 120;
         insert evt;
         evt.DurationInMinutes = 100;
         upsert evt;
         
         Task tsk = new Task();
         tsk.WhatId = acct.id;
         tsk.Type = 'Client Relations - Call';
         tsk.ActivityDate = System.today() - 10;
         tsk.Customer_Risk_Level__c = 'Low';
         tsk.Z_Logged_Client_Relations_Contact__c = true;
		 insert tsk;
		 tsk.Customer_Risk_Level__c = 'High';
		 upsert tsk;
		 
		 tsk.ActivityDate = System.today();
         upsert tsk;
		 evt.ActivityDateTime = System.Now() - 10;
         upsert evt;
         
         
		 
        }

    }