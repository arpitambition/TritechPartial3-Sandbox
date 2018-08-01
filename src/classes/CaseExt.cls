public class CaseExt {  
    
    public CaseExt(){
        
    }
    
    public void setServiceContract(list<case> cases){
        for(case c : cases){
            c.Service_Contract_WMP__c = c.SCID__c;
        }
    }
    
    public void setRecordType(list<case> cases){
        
        map<string,Id> recordTypes = new map<string,Id>();
        
        for(Support_Ticket_Settings__c rt : Support_Ticket_Settings__c.getAll().values()){
            if(Schema.SObjectType.Case.getRecordTypeInfosByName().containsKey(rt.Record_Type__c)){  
                recordTypes.put(rt.Contract_Type__c,Schema.SObjectType.Case.getRecordTypeInfosByName().get(rt.Record_Type__c).getRecordTypeId());
            }
            else{
                for(case c : cases){
                    c.addError('Invalid Record Type defined. Contact your Salesforce Administrator for assistance');
                    return;
                }
            }
        }
        
        for(case c : cases){
            if(c.Origin != 'Email'){    
                c.RecordTypeId = recordTypes.get(c.SCTY__c);
            }
        }
    }
   
	@future
    public static void emailAlert(set<Id> caseIds){
    	list <case> cases = [select Id,ContactId,CaseNumber,Subject,Status,Description,Email_Sender__c,Email_Template__c,Email_Thread__c from case where Id in :caseIds];
        
        set<Id> contactIds = new set<Id>();
        set<string> emailSenderUserNames = new set<string>();
        set<string> templateDeveloperNames = new set<string>();
        
        for(Case c: cases){
            if(c.ContactId <> null){
                contactIds.add(c.ContactId);
            }
            if(c.Email_Sender__c <> null){
                emailSenderUserNames.add(c.Email_Sender__c);
            }
            if(c.Email_Template__c <> null){
                templateDeveloperNames.add(c.Email_Template__c);
            }
        }
        
        map<Id,Contact> contacts = new map<Id,Contact>([select Id, Name, Email from Contact where Id in :contactIds]);
        map<string,EmailTemplate> templates = new map<string,EmailTemplate>();
        for(EmailTemplate e: [Select Id,DeveloperName,Subject,Body,HTMLValue From EmailTemplate where DeveloperName in:templateDeveloperNames]){
            templates.put(e.DeveloperName,e);
        }
        
        map<string,OrgWideEmailAddress> orgWideEmailAddresses = new map<string,OrgWideEmailAddress>();
        for(OrgWideEmailAddress owa: [Select Id, DisplayName, Address from OrgWideEmailAddress]){
            orgWideEmailAddresses.put(owa.DisplayName,owa);
        }
        

        for(Case cse: cases){
        	
            cse.Send_Email__c = false;
        	Messaging.SingleEmailMessage message = new Messaging.SingleEmailMessage();
        	String subject;
        	String body;
        
        	list<string> toAddresses = new list<string>();
        	if(!contacts.ContainsKey(cse.ContactId)){
        	    system.debug(cse.Contact.Name+' does not have an email to send the alert to');
            	return;
        	}else{
            	toAddresses.add('katchaudit@gmail.com'); //contacts.get(cse.ContactId).Email);
        	}
        	
        	message.setToAddresses(toAddresses);
        	message.setSaveAsActivity(false);
        
        	if(!templates.containsKey(cse.Email_Template__c)){
            	system.debug(cse.Email_Template__c+' not found in Email Templates');
            	return;
        	}else{
            	message.setTemplateId(templates.get(cse.Email_Template__c).Id);
        	}
        
        	if(message.ToAddresses == null){
            	system.debug('There is no related contact with a valid email address to send the message to');
            	return;
        	}
        
        	if(!orgWideEmailAddresses.containsKey(cse.Email_Sender__c)){
            	system.debug('There is no Org Wide Email Address to match the input parameter');
            	return;
        	}else{
            	message.setOrgWideEmailAddressId(orgWideEmailAddresses.get(cse.Email_Sender__c).Id);
        	}
        
        	//message.setTargetObjectId(cse.ContactId);
        	message.setWhatId(cse.Id);
        	string ref = '<MyForceApp.' + cse.Id + '.' + string.valueOf(datetime.now()) +  '@customdomain.my.salesforce.com>';
        	message.setReferences(ref+' '+cse.Id);
        
        	subject = templates.get(cse.Email_Template__c).Subject;
        	subject = subject.replace('{!Case.CaseNumber}', cse.CaseNumber);
        	subject = subject.replace('{!Case.Subject}', cse.Subject);
        	subject = subject.replace('{!Case.Status}', cse.Status);
        	subject = subject.replace('{!Case.Thread_Id}',''); 
        	subject = subject.replace('{!Case.Email_Thread}',''); 
        	subject = subject + ' [ '+cse.Email_Thread__c+' ]';
        
        	body = templates.get(cse.Email_Template__c).HTMLValue;
        	body = body.replace('{!Case.CaseNumber}', cse.CaseNumber);
        	body = body.replace('{!Case.Subject}', cse.Subject);
        	body = body.replace('{!Case.Email_Thread}', cse.Email_Thread__c); 
        	body = body.replace('{!Case.Link}', 'http://'+URL.getSalesforceBaseUrl().getHost()+'/'+cse.Id);
        	body = body.replace('{!Case.Description}',cse.Description==null?'':cse.Description);
        	body = body.replace('{!Case.Thread_Id}','');
        	body = body.replace(']]>','');
        	body = body +' '+cse.Email_Thread__c;
        
        	message.setHTMLBody(body); 
        	message.setSubject(subject);
        	
        	cse.Email_Sender__c = null;
        	cse.Email_Template__c = null;
        	cse.Send_Email__c = false;
        	update cse;
        
        	Messaging.sendEmail(new Messaging.SingleEmailMessage[] {message});
    	} 
    }
}