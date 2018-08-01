global class BatchIdeasReport implements Database.Batchable<SObject>, Database.AllowsCallouts{
      
    global database.Querylocator start(Database.BatchableContext BC){
        if(Test.isRunningTest()){
            
            return Database.getQueryLocator([Select u.IsPortalEnabled, u.IsActive, u.Email, u.ContactId, u.Contact.AccountId From User u Where UserName like 'testBatchIdeasReport%' Limit 1]);
        }
         
        return Database.getQueryLocator([Select u.IsPortalEnabled, u.IsActive, u.Email, u.ContactId, u.Contact.AccountId From User u 
        								Where u.IsPortalEnabled = true AND u.IsActive = true AND Contact.Unsubscribe_Email_Digest__c != true]);
    }
  
    global void execute(Database.BatchableContext BC,Sobject[] scope){
        
      try{
        
        List<Messaging.SingleEmailMessage> emails = new List<Messaging.SingleEmailMessage>();
         
        List<Email_Digest_Log__c> listEmailLog = new List<Email_Digest_Log__c>();
          
        for(sobject s : scope){
        	User portalUser = (User)s;
            
            
	            boolean isRespond = false;
	            boolean isInform = false;
	            boolean isPerform = false;
	            boolean isTiburon = false;
	            
	            for(ServiceContract sc : [Select Id,Product_Family_WMP__c From ServiceContract Where AccountId = : portalUser.Contact.AccountId  ]){
	            	
	            	
	            	if(sc.Product_Family_WMP__c == 'Inform' || sc.Product_Family_WMP__c == 'VisiNet' || sc.Product_Family_WMP__c == 'VisionAIR' || sc.Product_Family_WMP__c == '911'){
	            		isInform = true;
	            	}
	            	
	            	if(sc.Product_Family_WMP__c == 'EMS' || sc.Product_Family_WMP__c == 'Respond (EMS)' || sc.Product_Family_WMP__c == 'Respond'){
	            		isRespond = true;
	            	}
	            	
	            	if(sc.Product_Family_WMP__c == 'IMC'){
	            		isPerform = true;
	            	}
	            	
	            	if(sc.Product_Family_WMP__c == 'Tiburon'){
	            		isTiburon = true;
	            	}
	            	
	            }
	             
	            if(isInform == true){
		            string htmlBody = IdeasReportEmailDigest.getInformEmailBody(portalUser.ContactId);
		             
		            Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
		            
		            //List<String> toAddressList = new List<String>();  
		            //toAddressList.add('yogesh.rankawat@gmail.com'); 
		            //mail.setToAddresses(toAddressList); 
		            
		            mail.setTargetObjectId(portalUser.Id);
		            mail.setSaveAsActivity(false);
		            
		            mail.setSubject('TriTech RoundTable Weekly Report');
		            mail.setHtmlBody(htmlBody);
		            
		            mail.setSenderDisplayName('Tritech RoundTable');
		            mail.setReplyTo('jen.vansant@tritech.com');
		            
		            emails.add(mail);
		            
		            // Email Log
		            Email_Digest_Log__c emailLog = new Email_Digest_Log__c();
		            emailLog.Contact__c = portalUser.ContactId;
		            emailLog.Type__c = 'Inform';
		            emailLog.To_Address__c = portalUser.Email;
		            emailLog.Email_Subject__c = 'TriTech RoundTable Weekly Report';
		            emailLog.Email_Body__c = htmlBody;
		            listEmailLog.add(emailLog);
	            }
	             
	            if(isRespond == true){
		            string htmlBody = IdeasReportEmailDigest.getRespondEmailBody(portalUser.ContactId);
		             
		            Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
		            
		            //List<String> toAddressList = new List<String>();  
		            //toAddressList.add('yogesh.rankawat@gmail.com'); 
		            //mail.setToAddresses(toAddressList);
		            
		            mail.setTargetObjectId(portalUser.Id);
		            mail.setSaveAsActivity(false);
		            
		            mail.setSubject('TriTech RoundTable Weekly Report');
		            mail.setHtmlBody(htmlBody);
		            
		            mail.setSenderDisplayName('Tritech RoundTable');
		            mail.setReplyTo('jen.vansant@tritech.com');
		            
		            emails.add(mail);
		             
		            // Email Log
		            Email_Digest_Log__c emailLog = new Email_Digest_Log__c();
		            emailLog.Contact__c = portalUser.ContactId;
		            emailLog.Type__c = 'Respond';
		            emailLog.To_Address__c = portalUser.Email;
		            emailLog.Email_Subject__c = 'TriTech RoundTable Weekly Report';
		            emailLog.Email_Body__c = htmlBody;
		            listEmailLog.add(emailLog);
	            }
	            
	            if(isPerform == true){
		            string htmlBody = IdeasReportEmailDigest.getPerformEmailBody(portalUser.ContactId);
		             
		            Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
		            
		            //List<String> toAddressList = new List<String>(); 
		            //toAddressList.add('yogesh.rankawat@gmail.com'); 
		            //mail.setToAddresses(toAddressList);
		            
		            mail.setTargetObjectId(portalUser.Id);
		            mail.setSaveAsActivity(false);
		            
		            mail.setSubject('TriTech RoundTable Weekly Report');
		            mail.setHtmlBody(htmlBody);
		            
		            mail.setSenderDisplayName('Tritech RoundTable');
		            mail.setReplyTo('jen.vansant@tritech.com');
		            
		            emails.add(mail);
		            
		            // Email Log
		            Email_Digest_Log__c emailLog = new Email_Digest_Log__c();
		            emailLog.Contact__c = portalUser.ContactId;
		            emailLog.Type__c = 'Perform';
		            emailLog.To_Address__c = portalUser.Email;
		            emailLog.Email_Subject__c = 'TriTech RoundTable Weekly Report';
		            emailLog.Email_Body__c = htmlBody;
		            listEmailLog.add(emailLog);
	            }
	            
	            if(isTiburon == true) {
	            	
		            string htmlBody = IdeasReportEmailDigest.getTiburonEmailBody(portalUser.ContactId);
		             
		            Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
		            
		            //List<String> toAddressList = new List<String>(); 
		            //toAddressList.add('yogesh.rankawat@gmail.com'); 
		            //mail.setToAddresses(toAddressList);
		            
		            mail.setTargetObjectId(portalUser.Id);
		            mail.setSaveAsActivity(false);
		            
		            mail.setSubject('TriTech RoundTable Weekly Report');
		            mail.setHtmlBody(htmlBody);
		            
		            mail.setSenderDisplayName('Tritech RoundTable');
		            mail.setReplyTo('jen.vansant@tritech.com');
		            
		            emails.add(mail);
		            
		            // Email Log
		            Email_Digest_Log__c emailLog = new Email_Digest_Log__c();
		            emailLog.Contact__c = portalUser.ContactId;
		            emailLog.Type__c = 'Tiburon';
		            emailLog.To_Address__c = portalUser.Email;
		            emailLog.Email_Subject__c = 'TriTech RoundTable Weekly Report';
		            emailLog.Email_Body__c = htmlBody;
		            listEmailLog.add(emailLog);
	            
	            }
             
	    }
	     
	    if(emails.size() > 0){
	    	
        	List<Messaging.Sendemailresult> results = Messaging.sendEmail(emails , true);
        	
        	if(listEmailLog.size() > 0){
        		
        		insert listEmailLog;
        	}
        }
	    
      }
      catch(Exception ex){
        system.debug(ex.getMessage());
      } 
      
    }
  
    global void finish(Database.BatchableContext BC){

    }
}