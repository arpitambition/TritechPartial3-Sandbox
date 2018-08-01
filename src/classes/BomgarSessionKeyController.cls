public without sharing class BomgarSessionKeyController {
    public String appliance {get;set;}
    private String recordId;
    public String sessionKey {get;set;}
    public String sessionKeyUrl {get;set;}
    private String mailSubject {get;set;}
    private String mailBody {get;set;}
    
    public PageReference generateSessionKey() {
        recordId = ApexPages.currentPage().getParameters().get('record_id');
        Map<String,String> customAttributeMap = new Map<String,String>();
        customAttributeMap.put('session.custom.external_key', recordId);
        String repUsername = getRepUsername();
        if (repUsername == null) {
        	ApexPages.addmessage(new ApexPages.message(ApexPages.severity.FATAL,'No username or email address found. Ensure that your email address or Bomgar username is set for your Salesforce User account and try again.'));
        	return null;
        }
        String queue = 'rep_username:' + repUsername;
        DOM.Document document = generateSessionKey(queue, customAttributeMap);
        parseDocument(document);
        return null;
    }
    
    private String getRepUsername() {
    	User user = [select id, Bomgar_Username__c, Email from User where id = :Userinfo.getUserId()];
    	String bomgarUsername = user.Bomgar_Username__c;
    	if (bomgarUsername == null || bomgarUsername.length() == 0) {
    		String emailAddress = user.Email;
    		if (emailAddress == null || emailAddress.length() == 0) {
    			return null;
    		}
    		return emailAddress.substring(0, emailAddress.indexOf('@'));
    	} else {
    		return bomgarUsername;
    	}
    }
    
    private Boolean parseDocument(DOM.Document doc) {
		DOM.XmlNode rootElement = doc.getRootElement();
        if ('error'.equalsIgnoreCase(rootElement.getName())){
        	ApexPages.addmessage(new ApexPages.message(ApexPages.severity.FATAL,'Bomgar API Error: '+rootElement.getText()));
        	return false;
        }
        List<DOM.XmlNode> nodeList = rootElement.getChildElements();
		for(DOM.XmlNode node: nodeList){
			if ('error'.equalsIgnoreCase(node.getName())){
            	ApexPages.addmessage(new ApexPages.message(ApexPages.severity.FATAL,'Bomgar API Error: '+node.getText()));
            	return false;
       	 	}
       	 	if ('short_key' == node.getName()){
       	 		sessionKey = node.getText();
       	 	} else if ('key_url' == node.getName()) {
       	 		sessionKeyUrl = node.getText();
       	 	} else if ('mail_subject' == node.getName()) {
       	 		mailSubject = node.getText();
       	 	} else if ('mail_body' == node.getName()) {
       	 		mailBody = node.getText();
       	 	}
		}
		return true;
    }
    
    private Dom.Document generateSessionKey(String queue, Map<String,String> customAttributeMap){
        if(appliance == null){
            appliance = 'Default';
        }
        if(Test.isRunningTest()){
            DOM.Document xmlData = new DOM.Document();
            xmlData.load('<?xml version="1.0" encoding="UTF-8"?><session_key xmlns="http://www.bomgar.com/namespaces/API/command"><type>support</type><expires>1416070626</expires><queue available="0">rep</queue><queue_id>1</queue_id><short_key>8283692</short_key><key_url>https://example.bomgar.com/?ak=0f0619388a4094786ba89247599a9c78</key_url><mail_subject>Remote Support Invitation</mail_subject><mail_body>Click on the link below and follow the directions. https://example.bomgar.com/?ak=0f0619388a4094786ba89247599a9c78 Bomgar(TM) enables a support representative to view your screen in order to assist you. Session traffic is fully encrypted to protect your system\'s data. Once a session has begun, you will be able to end it at any time</mail_body></session_key>');
            return xmlData;
        }
        BGIntegration.BomgarApiService apiService = new BGIntegration.BomgarApiService(appliance);
        return apiService.generateSessionKey(queue, customAttributeMap);
        
    }
    public PageReference emailSessionKey() {
        Case currentCase = null;
        try {
            currentCase = [Select Id, CaseNumber, Subject, Description, ContactId from Case where Id = :recordId];    
        } catch (Exception e) {
            log('Error emailing session key', 'Could not find case with record id of [' + recordId + ']');
            currentCase = null;
        }
        if (currentCase != null) {
            Contact contact = null;
            try {
                contact = [Select Id, Email, FirstName from Contact where Id = :currentCase.ContactId];    
            } catch (Exception e) {
                log('Error emailing session key', 'Could not find contact with contact id of [' + currentCase.ContactId + ']');
                contact = null;
            }
            
            if (contact != null) {
                String[] recipients = new List<String>();
                recipients.add(contact.Email);
             
                EmailTemplate template = [Select Id, Subject, Body, HtmlValue from EmailTemplate where name = 'Bomgar Session Key Template'];
                
                String subject = template.Subject;
                subject = subject.replace('{!Case.CaseNumber}', currentCase.CaseNumber);
                
                String body = template.Body;
                body = body.replace('{!sessionKeyUrl}', sessionKeyUrl);
                
                Messaging.SingleEmailMessage email = new Messaging.SingleEmailMessage();
                email.setSubject(subject);
                email.setHtmlBody(body);
                email.setToAddresses(recipients);
                List<Messaging.SendEmailResult> results = Messaging.sendEmail(new Messaging.SingleEmailMessage[] {email});
                
                String emailErrors = '';
                Boolean success = false;
                for (Messaging.SendEmailResult result : results) {
                    success = result.isSuccess();
                    Messaging.SendEmailError[] errors = result.getErrors();
                    for (Messaging.SendEmailError error : errors) {
                        emailErrors += error.getMessage() + ' <br />';
                    }
                }
                if (success == false && emailErrors.length() > 0) {
                	ApexPages.addmessage(new ApexPages.message(ApexPages.severity.FATAL,'Errors were found: ' + emailErrors));
                } else {
                	ApexPages.addmessage(new ApexPages.message(ApexPages.severity.CONFIRM,'Email sent successfully to ' + contact.Email));
                }
                                
            }
        }

        return null;
    }
    
    public static void log(String message, String details){
        BGIntegration__Error_Log__c log = new BGIntegration__Error_Log__c();
        log.BGIntegration__Message__c = message;
        log.BGIntegration__Details__c = details;
        insert log;
    }
}