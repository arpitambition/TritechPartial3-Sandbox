trigger IdeaCommentNotification on IdeaComment (before insert) {
	
	// Need to change on deployment
	//string SFDomain = 'https://cs1.salesforce.com'; // Sandbox
	string SFDomain = 'https://na6.salesforce.com'; // Production
	
	Date curDate = Date.today();
	Date weekStartDate = curDate.toStartofWeek();
	Integer dayOfWeek = weekStartDate.daysBetween(curDate);
	
	List<Email_Digest_Log__c> listEmailLog = new List<Email_Digest_Log__c>();
	
	//if(dayOfWeek != 1 || Test.isRunningTest()) {
		
		SET<ID> setIdeaId = new SET<ID>();
		
		for(IdeaComment i : trigger.new ){
			setIdeaId.add(i.IdeaId);
		}
		
		MAP<Id,Idea> mapIdea = new MAP<Id,Idea>([Select Id,Category__c,Sub_Category__c,Title From Idea Where Id IN: setIdeaId]);
		
		
		MAP<Id,string> mapInform_911 = new MAP<Id,string>();
		MAP<Id,string> mapInform_Browser = new MAP<Id,string>();
		MAP<Id,string> mapInform_CAD = new MAP<Id,string>();
		MAP<Id,string> mapInform_FBR = new MAP<Id,string>();
		MAP<Id,string> mapInform_Jail = new MAP<Id,string>();
		MAP<Id,string> mapInform_Mobile = new MAP<Id,string>();
		MAP<Id,string> mapInform_RMS = new MAP<Id,string>();
		MAP<Id,string> mapIQ_and_Analytics = new MAP<Id,string>();
		MAP<Id,string> mapRespond = new MAP<Id,string>();
		MAP<Id,string> mapPerform = new MAP<Id,string>();
		MAP<Id,string> mapRT_Subcategory = new MAP<Id,string>();
		
		MAP<Id,string> mapTiburon_TCCADMobile = new MAP<Id,string>();
		MAP<Id,string> mapTiburon_TCRMS = new MAP<Id,string>();
		MAP<Id,string> mapTiburon_DNCADMobile = new MAP<Id,string>();
		MAP<Id,string> mapTiburon_TERMS = new MAP<Id,string>();
		
		
		SET<Id> setUserId = new SET<ID>();
		
		for(GroupMember gm: [Select g.UserOrGroupId, g.GroupId,g.Group.Name From GroupMember g 
							Where g.Group.Name IN( 'IdeaCommentPosting_Inform_911','IdeaCommentPosting_Inform_Browser','IdeaCommentPosting_Inform_CAD',
							'IdeaCommentPosting_Inform_FBR','IdeaCommentPosting_Inform_Jail','IdeaCommentPosting_Inform_Mobile','IdeaCommentPosting_Inform_RMS',
							'IdeaCommentPosting_IQ_and_Analytics','IdeaCommentPosting_Respond', 'IdeaCommentPosting_Perform', 'IdeaCommentPosting_RT_Subcategory', 
							'IdeaCommentPosting_Tiburon_TCCADMobile','IdeaCommentPosting_Tiburon_TCRMS','IdeaCommentPosting_Tiburon_DNCADMobile','IdeaCommentPosting_Tiburon_TERMS') ]){
			if(gm.Group.Name == 'IdeaCommentPosting_Inform_911'){
				mapInform_911.put(gm.UserOrGroupId, '');
			}
			if(gm.Group.Name == 'IdeaCommentPosting_Inform_Browser'){
				mapInform_Browser.put(gm.UserOrGroupId, '');
			}
			if(gm.Group.Name == 'IdeaCommentPosting_Inform_CAD'){
				mapInform_CAD.put(gm.UserOrGroupId, '');
			}
			if(gm.Group.Name == 'IdeaCommentPosting_Inform_FBR'){
				mapInform_FBR.put(gm.UserOrGroupId, '');
			}
			if(gm.Group.Name == 'IdeaCommentPosting_Inform_Jail'){
				mapInform_Jail.put(gm.UserOrGroupId, '');
			}
			if(gm.Group.Name == 'IdeaCommentPosting_Inform_Mobile'){
				mapInform_Mobile.put(gm.UserOrGroupId, '');
			}
			if(gm.Group.Name == 'IdeaCommentPosting_Inform_RMS'){
				mapInform_RMS.put(gm.UserOrGroupId, '');
			}
			if(gm.Group.Name == 'IdeaCommentPosting_IQ_and_Analytics'){
				mapIQ_and_Analytics.put(gm.UserOrGroupId, '');
			}
			if(gm.Group.Name == 'IdeaCommentPosting_Respond'){
				mapRespond.put(gm.UserOrGroupId, '');
			}
			if(gm.Group.Name == 'IdeaCommentPosting_Perform'){
				mapPerform.put(gm.UserOrGroupId, '');
			}
			if(gm.Group.Name == 'IdeaCommentPosting_RT_Subcategory'){
				mapRT_Subcategory.put(gm.UserOrGroupId, '');
			}
			if(gm.Group.Name == 'IdeaCommentPosting_Tiburon_TCCADMobile'){
				mapTiburon_TCCADMobile.put(gm.UserOrGroupId, '');
			}
			if(gm.Group.Name == 'IdeaCommentPosting_Tiburon_TCRMS'){
				mapTiburon_TCRMS.put(gm.UserOrGroupId, '');
			}
			if(gm.Group.Name == 'IdeaCommentPosting_Tiburon_DNCADMobile'){
				mapTiburon_DNCADMobile.put(gm.UserOrGroupId, '');
			}
			if(gm.Group.Name == 'IdeaCommentPosting_Tiburon_TERMS'){
				mapTiburon_TERMS.put(gm.UserOrGroupId, '');
			}
			
			setUserId.add(gm.UserOrGroupId);
		}
		
		for(User u : [Select Id, Email From User Where Id IN:setUserId ]){
			if(mapInform_911.containsKey(u.Id)){
				mapInform_911.put(u.Id, u.Email);
			}
			if(mapInform_Browser.containsKey(u.Id)){
				mapInform_Browser.put(u.Id, u.Email);
			}
			if(mapInform_CAD.containsKey(u.Id)){
				mapInform_CAD.put(u.Id, u.Email);
			}
			if(mapInform_FBR.containsKey(u.Id)){
				mapInform_FBR.put(u.Id, u.Email);
			}
			if(mapInform_Jail.containsKey(u.Id)){
				mapInform_Jail.put(u.Id, u.Email);
			}
			if(mapInform_Mobile.containsKey(u.Id)){
				mapInform_Mobile.put(u.Id, u.Email);
			}
			if(mapInform_RMS.containsKey(u.Id)){
				mapInform_RMS.put(u.Id, u.Email);
			}
			if(mapIQ_and_Analytics.containsKey(u.Id)){
				mapIQ_and_Analytics.put(u.Id, u.Email);
			}
			if(mapRespond.containsKey(u.Id)){
				mapRespond.put(u.Id, u.Email);
			}
			if(mapPerform.containsKey(u.Id)){
				mapPerform.put(u.Id, u.Email);
			}
			if(mapRT_Subcategory.containsKey(u.Id)){
				mapRT_Subcategory.put(u.Id, u.Email);
			}
			if(mapTiburon_TCCADMobile.containsKey(u.Id)){
				mapTiburon_TCCADMobile.put(u.Id, u.Email);
			}
			if(mapTiburon_TCRMS.containsKey(u.Id)){
				mapTiburon_TCRMS.put(u.Id, u.Email);
			}
			if(mapTiburon_DNCADMobile.containsKey(u.Id)){
				mapTiburon_DNCADMobile.put(u.Id, u.Email);
			}
			if(mapTiburon_TERMS.containsKey(u.Id)){
				mapTiburon_TERMS.put(u.Id, u.Email);
			}
		}
		
		List<Messaging.SingleEmailMessage> listMail = new List<Messaging.SingleEmailMessage>();
		
		for(IdeaComment i : trigger.new ){
			
			if(mapIdea.containsKey(i.IdeaId) ){
				
				Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
				
				List<String> toAddressList = new List<String>();
		             
	            //toAddressList.add('rmajji@collabrain.com');
	            //toAddressList.add('yogesh.rankawat@gmail.com');
	            //toAddressList.add('madan.vishwakarma.developer@gmail.com');
	            
	            if(mapIdea.get(i.IdeaId).Category__c == 'Inform' && mapIdea.get(i.IdeaId).Sub_Category__c == '911'){
		        	toAddressList.addAll(mapInform_911.values() );
		        }   
		        if(mapIdea.get(i.IdeaId).Category__c == 'Inform' && mapIdea.get(i.IdeaId).Sub_Category__c == 'Browser'){
		        	toAddressList.addAll(mapInform_Browser.values() );
		        }
		        if(mapIdea.get(i.IdeaId).Category__c == 'Inform' && mapIdea.get(i.IdeaId).Sub_Category__c == 'CAD'){
		        	toAddressList.addAll(mapInform_CAD.values() );
		        }
		        if(mapIdea.get(i.IdeaId).Category__c == 'Inform' && mapIdea.get(i.IdeaId).Sub_Category__c == 'FBR'){
		        	toAddressList.addAll(mapInform_FBR.values() );
		        }
		        if(mapIdea.get(i.IdeaId).Category__c == 'Inform' && mapIdea.get(i.IdeaId).Sub_Category__c == 'Jail'){
		        	toAddressList.addAll(mapInform_Jail.values() );
		        }
		        if(mapIdea.get(i.IdeaId).Category__c == 'Inform' && mapIdea.get(i.IdeaId).Sub_Category__c == 'Mobile'){
		        	toAddressList.addAll(mapInform_Mobile.values() );
		        }
		        if(mapIdea.get(i.IdeaId).Category__c == 'Inform' && mapIdea.get(i.IdeaId).Sub_Category__c == 'RMS'){
		        	toAddressList.addAll(mapInform_RMS.values() );
		        }
		        if( mapIdea.get(i.IdeaId).Sub_Category__c == 'IQ_and_Analytics'){
		        	toAddressList.addAll(mapIQ_and_Analytics.values() );
		        }
		        if(mapIdea.get(i.IdeaId).Category__c == 'Respond (EMS)' && mapIdea.get(i.IdeaId).Sub_Category__c != 'RoundTable' ){
		        	toAddressList.addAll(mapRespond.values() );
		        } 
		        if(mapIdea.get(i.IdeaId).Category__c == 'Perform' && mapIdea.get(i.IdeaId).Sub_Category__c != 'RoundTable'){
		        	toAddressList.addAll(mapPerform.values() );
		        }
		        if(mapIdea.get(i.IdeaId).Sub_Category__c == 'RoundTable' ){
		        	toAddressList.addAll(mapRT_Subcategory.values() );
		        }
		        if(mapIdea.get(i.IdeaId).Category__c == 'Tiburon' && mapIdea.get(i.IdeaId).Sub_Category__c == 'TC CAD/Mobile' ){
		        	toAddressList.addAll(mapTiburon_TCCADMobile.values() );
		        } 
		        if(mapIdea.get(i.IdeaId).Category__c == 'Tiburon' && mapIdea.get(i.IdeaId).Sub_Category__c == 'TC RMS' ){
		        	toAddressList.addAll(mapTiburon_TCRMS.values() );
		        } 
		        if(mapIdea.get(i.IdeaId).Category__c == 'Tiburon' && mapIdea.get(i.IdeaId).Sub_Category__c == 'DN CAD/Mobile' ){
		        	toAddressList.addAll(mapTiburon_DNCADMobile.values() );
		        } 
		        if(mapIdea.get(i.IdeaId).Category__c == 'Tiburon' && mapIdea.get(i.IdeaId).Sub_Category__c == 'TE RMS' ){
		        	toAddressList.addAll(mapTiburon_TERMS.values() );
		        } 
		        
				mail.setToAddresses(toAddressList);
				
				mail.setSubject('New RoundTable Comment Added: ' + mapIdea.get(i.IdeaId).Category__c + ' / ' + mapIdea.get(i.IdeaId).Sub_Category__c + ' - ' + mapIdea.get(i.IdeaId).Title  );
				
				string strBd = 'A new comment has been added to the RoundTable post: ' + mapIdea.get(i.IdeaId).Category__c + ' / ' + mapIdea.get(i.IdeaId).Sub_Category__c + ' - ' + mapIdea.get(i.IdeaId).Title ;
				strBd = strBd + '<br/><br/>Comment: ' + i.CommentBody;
				strBd = strBd + '<br/><br/>Posted by: ' + UserInfo.getName();
				strBd = strBd + '<br/>Posted date: ' + system.now().format('MM/dd/yyyy');
				strBd = strBd + '<br/><br/>You can review the post here: ' + SFDomain + '/apex/ideaView?id=' + mapIdea.get(i.IdeaId).Id;
				
				mail.setHTMLBody(strBd);
				
				if(toAddressList.size() > 0){
					listMail.add(mail);
					
					for(string strTo : toAddressList){
						
						// Email Log
			            Email_Digest_Log__c emailLog = new Email_Digest_Log__c(); 
			            emailLog.Type__c = mapIdea.get(i.IdeaId).Category__c;
			            emailLog.To_Address__c = strTo;
			            emailLog.Email_Subject__c = 'Idea Comment Notification';
			            emailLog.Email_Body__c = strBd;
			            listEmailLog.add(emailLog);
					}
				}
			}
			
		}
		
		if(listMail.size() > 0){
			
			Messaging.sendEmail(listMail);
			
			if(listEmailLog.size() > 0){
				
				insert listEmailLog;
			}
		}
		
	//}
}