//author: Mohan (Navivo)
//created date: 22-09-2013
global class IdeasReportSchedule implements Schedulable {
	
	global void execute(SchedulableContext SC) {
		try {
			Map<Integer, String> monthMap = new Map<Integer, String>();
			monthMap.put(1, 'January');
			monthMap.put(2, 'February');
			monthMap.put(3, 'March');
			monthMap.put(4, 'April');
			monthMap.put(5, 'May');
			monthMap.put(6, 'June');
			monthMap.put(7, 'July');
			monthMap.put(8, 'August');
			monthMap.put(9, 'September');
			monthMap.put(10, 'October');
			monthMap.put(11, 'November');
			monthMap.put(12, 'December');
			List<Idea> ideas = [Select CreatedBy.Name, CreatedBy.CommunityNickname, VoteTotal, Title, Status, 
									NumComments, LastCommentId, LastCommentDate, Id, CreatedDate, CreatedById, 
									CommunityId, Categories, Body, Category__c, Sub_Category__c From Idea Where LastModifiedDate = THIS_WEEK 
									and CreatedDate != THIS_WEEK and LastCommentDate = THIS_WEEK and Status = 'Public'];
			if(test.isRunningTest()) {
				ideas = [Select CreatedBy.Name, CreatedBy.CommunityNickname, VoteTotal, Title, Status, 
							NumComments, LastCommentId, LastCommentDate, Id, CreatedDate, CreatedById, 
							CommunityId, Categories, Body, Category__c, Sub_Category__c From Idea Where LastModifiedDate = THIS_WEEK 
							and LastCommentDate = THIS_WEEK and Status = 'Public'];
			}
			List<IdeaComment> ideaComments = [Select IdeaId, Id, CreatedDate, CreatedBy.Name, CreatedById, CommentBody 
												From IdeaComment Where IdeaId IN :ideas and CreatedDate = THIS_WEEK
												order by CreatedDate desc];
			Map<Id, List<IdeaComment>> ideaCommentsMap = new Map<Id, List<IdeaComment>>();
			for(IdeaComment ic : ideaComments) {
				List<IdeaComment> temp = ideaCommentsMap.get(ic.IdeaId);
				if(temp == null) temp = new List<IdeaComment>();
				temp.add(ic);
				ideaCommentsMap.put(ic.IdeaId, temp);
			}
			
			//fetch new ideas
			List<Idea> newIdeas = [Select CreatedBy.Name, CreatedBy.CommunityNickname, VoteTotal, Title, Status, 
									NumComments, LastCommentId, LastCommentDate, Id, CreatedDate, CreatedById, 
									CommunityId, Categories, Body, Category__c, Sub_Category__c From Idea Where CreatedDate = THIS_WEEK and Status = 'Public'];
			
			//String logoURL = 'https://c.cs1.content.force.com/servlet/servlet.ImageServer?id=015S0000000KrA3&oid=00DS0000002Sd4Y';
			String logoURL = 'https://c.na6.content.force.com/servlet/servlet.ImageServer?id=01580000001MDkf&oid=00D80000000arem';
			String htmlBody = '<html><body style="margin-top:25px;margin-right:25px;margin-left:25px;margin-bottom:25px;">';
			htmlBody += '<div style="border:1px solid #636363">';
			htmlBody += '<div align="center" style="width:100%; text-align:center; font-weight:bolder; margin-top:25px;">TriTech RoundTable Weekly Report</div><br/>';
			htmlBody += '<img src="' + logoURL + '" height="50px" width="220px" style="padding-left:2%"></img>';
			htmlBody += '<div style="padding-left:9%">' + monthMap.get(Date.today().month()) + ' ' + Date.today().day().format() + ', ' + String.valueOf(Date.today().year()) + '</div><br/><br/>';
			htmlBody += '<table align="center"  width="100%" style="background-color:white;margin-left:25px;margin-bottom:25px;">';
			//String domainURL = 'https://' + Apexpages.currentPage().getHeaders().get('host') + '/ideas/viewIdea.apexp?id=';
			//String domainURL = 'https://cs1.salesforce.com/ideas/viewIdea.apexp?id=';
			String domainURL = 'https://na6.salesforce.com/ideas/viewIdea.apexp?id=';
			if(ideas.size() > 0) {
				htmlBody += '<tr><td colSpan="2" align="center" style="font-weight:bold">';
				htmlBody += 'Active Ideas (' + ideas.size().format() + ')';
				htmlBody += '</td></tr>';
				htmlBody += '<tr><td colSpan="2" height="35px"></td></tr>';
				for(Idea i : ideas) {
					List<IdeaComment> temp = ideaCommentsMap.get(i.Id);
					if(temp == null) temp = new List<IdeaComment>();
					
					htmlBody += '<tr>';
					htmlBody += '<td align="center">';
					htmlBody += '<a href="' + domainURL + i.Id + '" style="color: #1865A3; font-weight: bold;">' + i.Title + '</a>';
					htmlBody += '</td>';
					htmlBody += '<td align="center">';
					htmlBody += '<a href="' + domainURL + i.Id + '" style="color: #1865A3; font-weight: bold;">' + temp.size().format() + ' new comments' + '</a>';
					htmlBody += '</td>';
					htmlBody += '</tr>';
					htmlBody += '<tr>';
					htmlBody += '<td align="center">';
					htmlBody += '<span style="font-size: 11px; color:#636363; font-weight: bold;">Posted by ' + i.CreatedBy.Name + '</span>';
					htmlBody += '</td>';
					htmlBody += '<td></td>';
					htmlBody += '</tr>';
					htmlBody += '<tr><td colSpan="2" height="35px"></td></tr>';
					
					String commentBody = temp[0].CommentBody;
					if(commentBody != null && commentBody.length() > 130) {
						commentBody = commentBody.subString(0,130) + '...';
					}
					if(commentBody != null) {
						htmlBody += '<tr>';
						htmlBody += '<td align="center">';
						htmlBody += commentBody;
						if(commentBody.length() > 130) htmlBody += '<a src="' + domainURL + i.Id + '" style="color: #1865A3; font-weight: bold;">more »</a>';
						htmlBody += '<span style="font-size: 11px; color:#636363; font-weight: bold;"> By ' + temp[0].CreatedBy.Name + '</span>';
						htmlBody += '</td>';
						htmlBody += '<td></td>';
						htmlBody += '</tr>';
						htmlBody += '<tr><td colSpan="2" height="35px"></td></tr>';
					}
					
				}
			}
			
			if(newIdeas.size() > 0) {
				htmlBody += '<tr><td colSpan="2" align="center" style="font-weight:bold">';
				htmlBody += 'New Ideas (' + newIdeas.size().format() + ')';
				htmlBody += '</td></tr>';
				htmlBody += '<tr><td colSpan="2" height="35px"></td></tr>';
				for(Idea i : newIdeas) {
					
					htmlBody += '<tr>';
					htmlBody += '<td align="center">';
					htmlBody += '<a href="' + domainURL + i.Id + '" style="color: #1865A3; font-weight: bold;">' + i.Title + '</a>';
					htmlBody += '</td>';
					htmlBody += '<td>';
					htmlBody += '</td>';
					htmlBody += '</tr>';
					htmlBody += '<tr>';
					htmlBody += '<td align="center">';
					htmlBody += '<span style="font-size: 11px; color:#636363; font-weight: bold;">Posted by ' + i.CreatedBy.Name + '</span>';
					htmlBody += '</td>';
					htmlBody += '<td></td>';
					htmlBody += '</tr>';
					htmlBody += '<tr><td colSpan="2" height="35px"></td></tr>';
					
				}
			}
			htmlBody += '</table>';
			htmlBody += '<br/><div style="padding-left:2%; margin-bottom:2%;">Regards,<br/>TriTech</div>';
			htmlBody += '</div>';
			htmlBody += '</body></html>';
			
			
			System.debug('htmlBody: '+htmlBody);
			List<Messaging.SingleEmailMessage> emails = new List<Messaging.SingleEmailMessage>();
			Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
			List<String> toAddressList = new List<String>();
			//toAddressList.add('mkumar@thresholdcs.com');
			//toAddressList.add('mohankumarrhr@gmail.com');
			mail.setToAddresses(toAddressList);
			mail.setSubject('TriTech RoundTable Weekly Report');
			mail.setHtmlBody(htmlBody);
			emails.add(mail);
			List<Messaging.Sendemailresult> results = Messaging.sendEmail(emails , true);
			
		} catch(Exception ex) {
			
		}
	}
}