public with sharing class IdeasReportEmailDigest {
	
	public static string getInformEmailBody(string PortalContactId){
		
		// ADJUST THESE FOR PRODUCTION DEPLOYMENT
		//string unsubscribeSiteURL = 'http://dev1-tritech.cs1.force.com';
		string unsubscribeSiteURL = 'http://tritech.force.com';
		
		
		//String domainURL = 'https://cs1.salesforce.com/apex/ideaView?id=';
	    //String domainURL = 'https://na6.salesforce.com/apex/ideaView?id=';
	    String domainURL = 'https://na6.salesforce.com/secur/login_portal.jsp?orgId=00D80000000arem&portalId=06080000000QwMW&startURL=/apex/ideaView?id=';
	    
	             
		String htmlBody = '';
		
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
	            
	            Date weekStartDate = date.today().toStartOfWeek();
	            Date weekEndDate = weekStartDate.addDays(6);
	            String day = weekStartDate.day().format();
	            if(day.length() == 1) day = '0' + day;
	            String month = weekStartDate.month().format();
	            if(month.length() == 1) month = '0' + month;
	            String year = weekStartDate.year().format();
	            year = year.subString(2);
	            String weekStart = month + '/' + day + '/' + year;
	            
	            day = weekEndDate.day().format();
	            if(day.length() == 1) day = '0' + day;
	            month = weekEndDate.month().format();
	            if(month.length() == 1) month = '0' + month;
	            year = weekEndDate.year().format();
	            year = year.subString(2);
	            String weekEnd = month + '/' + day + '/' + year;
	             
	            List<Idea> ideas = [Select CreatedBy.Name, CreatedBy.CommunityNickname, VoteTotal, Title, Status, 
	                                    NumComments, LastCommentId, LastCommentDate, Id, CreatedDate, CreatedById, 
	                                    CommunityId, Categories, Body, Category__c, Sub_Category__c From Idea 
	                                    Where Category__c = 'Inform' AND Sub_Category__c != 'RoundTable' AND CreatedDate = LAST_90_DAYS AND Status != 'Archive' order by VoteTotal desc, NumComments desc  ];
	            
	            //fetch new ideas
	            List<Idea> newIdeas = [Select CreatedBy.Name, CreatedBy.CommunityNickname, VoteTotal, Title, Status, 
	                                    NumComments, LastCommentId, LastCommentDate, Id, CreatedDate, CreatedById, 
	                                    CommunityId, Categories, Body, Category__c, Sub_Category__c From Idea 
	                                    Where Category__c = 'Inform' AND Sub_Category__c != 'RoundTable' and Status = 'Public' Order By CreatedDate DESC  ];
	            
	            
	            
	            
	            htmlBody += '<table width="825" cellspacing="0" cellpadding="0" border="0" style="width:495.0pt;background:white">';
	                htmlBody += '<tbody>';
	                    htmlBody += '<tr>';
	                        htmlBody += '<td valign="top" style="padding:7.5pt 7.5pt 7.5pt 7.5pt">';
	                            htmlBody += '<p align="center" style="text-align:center">';
	                                htmlBody += '<img width="275" height="50" alt="TriTech Software Systems" src="https://c.na6.content.force.com/servlet/servlet.ImageServer?id=01580000001j5qi&oid=00D80000000arem">';
	                            htmlBody += '</p>';
	                            htmlBody += '<div >';
	                                htmlBody += '<table width="825" cellspacing="0" cellpadding="0" border="0" style="width:495.0pt">';
	                                    htmlBody += '<tbody>';
	                                        htmlBody += '<tr>';
	                                            htmlBody += '<td style="padding:0in 0in 0in 0in" rowspan="2">';
	                                                htmlBody += '<table width="51" cellspacing="0" cellpadding="0" border="0" style="width:30.75pt">';
	                                                    htmlBody += '<tbody>';
	                                                        htmlBody += '<tr><td style="padding:0in 0in 0in 0in"></td></tr>';
	                                                    htmlBody += '</tbody>';
	                                                htmlBody += '</table>';
	                                            htmlBody += '</td>';
	                                            htmlBody += '<td valign="top" style="background:#034EA2;padding:0in 0in 0in 0in">';
	                                                htmlBody += '<table width="100%" cellspacing="0" cellpadding="0" border="0" style="width:100.0%">';
	                                                    htmlBody += '<tbody>';
	                                                        htmlBody += '<tr>';
	                                                            htmlBody += '<td style="padding:0in 0in 0in 0in">';
	                                                                htmlBody += '<p class="MsoNormal"><img width="13" height="28" src="https://app.marketo.com/images/public-site/email/cornerNW-white.png"><u></u><u></u></p>';
	                                                            htmlBody += '</td>';
	                                                            htmlBody += '<td width="100%" style="width:100.0%;padding:0in 0in 0in 0in">';
	                                                                htmlBody += '<div>';
	                                                                    htmlBody += '<p align="right" style="text-align:center;line-height:12.75pt" class="MsoNormal"><strong><span style="font-size:9.0pt;font-family:&quot;Tahoma&quot;,&quot;sans-serif&quot;;color:white">Your Weekly RoundTable Update</strong><span style="font-size:9.0pt;font-family:&quot;Tahoma&quot;,&quot;sans-serif&quot;;color:white"><u></u><u></u></span></p>';
	                                                                htmlBody += '</div>';
	                                                            htmlBody += '</td>';
	                                                            htmlBody += '<td style="padding:0in 0in 0in 0in">';
	                                                                htmlBody += '<p class="MsoNormal">';
	                                                                    htmlBody += '<img width="12" border="0" height="28" src="https://app.marketo.com/images/public-site/email/cornerNE-white.png"><u></u><u></u>';
	                                                                htmlBody += '</p>';
	                                                            htmlBody += '</td>';
	                                                        htmlBody += '</tr>';
	                                                    htmlBody += '</tbody>';
	                                                htmlBody += '</table>';
	                                            htmlBody += '</td>';
	                                            htmlBody += '<td style="padding:0in 0in 0in 0in" rowspan="2">';
	                                                htmlBody += '<table width="50" cellspacing="0" cellpadding="0" border="0" style="width:30.0pt">';
	                                                    htmlBody += '<tbody>';
	                                                        htmlBody += '<tr><td style="padding:0in 0in 0in 0in"></td></tr>';
	                                                    htmlBody += '</tbody>';
	                                                htmlBody += '</table>';
	                                            htmlBody += '</td>';
	                                        htmlBody += '</tr>';
	                                        htmlBody += '<tr>';
	                                            htmlBody += '<td valign="top" style="padding:0in 0in 0in 0in">';
	                                                htmlBody += '<table width="100%" cellspacing="0" cellpadding="0" border="0" style="width:100.0%">';
	                                                    htmlBody += '<tbody>';
	                                                     /* 
	                                                        htmlBody += '<tr>';
	                                                            htmlBody += '<td valign="top" style="background:#f0f0f0;padding:15.0pt 15.0pt 0pt 15.0pt">';
	                                                                htmlBody += '<div>';
	                                                                    htmlBody += '<p style="line-height:13.5pt"><strong><span style="font-size:9.0pt;font-family:&quot;Tahoma&quot;,&quot;sans-serif&quot;;color:#45555f">POSTED: ' + weekStart + ' - ' + weekEnd + '</span></strong><span style="font-size:9.0pt;font-family:&quot;Tahoma&quot;,&quot;sans-serif&quot;;color:#45555f"><u></u><u></u></span></p>';
	                                                                htmlBody += '</div>';
	                                                            htmlBody += '</td>';
	                                                        htmlBody += '</tr>';
	                                                      */   
	                                                        htmlBody += '<tr>';
	                                                            htmlBody += '<td valign="top" style="background:#f0f0f0;padding:15.0pt 0pt 15.0pt 15.0pt">';
	                                                                htmlBody += '<div>';
	                                                                    htmlBody += '<p >';
	                                                                        // 6/4/2014 changes start-------
	                                                                        //htmlBody += '<p style="text-align: center;"><a href="http://www.tritech.com/news/tricon" target="_blank"><img src="http://info.tritech.com/cdnr/57/acton/attachment/9884/f-0007/1/-/-/-/-/TriCON2014_Email.png" alt="Innovation Award" width="500" /></a></p>';                     
																			
																			htmlBody += '<b><span style="font-size:11.0pt;font-family:&quot;Tahoma&quot;,&quot;sans-serif&quot;;color:#034EA2">Top Trending Ideas</span></b><b><span style="font-size:17.5pt;font-family:&quot;Tahoma&quot;,&quot;sans-serif&quot;;color:#3BB149"><u></u><u></u></span></b>';
	                                                                       // changes end ----------
	                                                                    htmlBody += '</p>';
	                                                                    
	                                                                    SET<string> setSubCat = new SET<string>();
	                                                                     
	                                                                    for(Idea i : ideas) {
	                                                                    	if( setSubCat.contains(i.Category__c + ' ' + i.Sub_Category__c) == false ){
	                                                                    		setSubCat.add(i.Category__c + ' ' + i.Sub_Category__c);
	                                                                    		 
		                                                                        htmlBody += '<p style="text-align:left;">';
		                                                                            htmlBody += '<span style="font-size:9.0pt;font-family:&quot;Tahoma&quot;,&quot;sans-serif&quot;;color:#45555f">';
		                                                                            htmlBody += i.Category__c + ' ' + i.Sub_Category__c;
		                                                                            htmlBody += '</span><br>';
		                                                                            htmlBody += '<b><span style="font-size:10.0pt;font-family:&quot;Tahoma&quot;,&quot;sans-serif&quot;;"><a  style="color:#034EA2" href="' + domainURL + i.Id + '">' + i.Title + '</a></span></b><b><span style="font-size:17.5pt;font-family:&quot;Tahoma&quot;,&quot;sans-serif&quot;;color:#3BB149"><u></u><u></u></span></b>';
		                                                                        htmlBody += '</p>';
		                                                                        
		                                                                        if(setSubCat.size() >= 5 ){
		                                                                        	break;
		                                                                        }
	                                                                    	}
	                                                                    }
	                                                                    htmlBody += '<p >';
	                                                                        htmlBody += '<b><span style="font-size:11.0pt;font-family:&quot;Tahoma&quot;,&quot;sans-serif&quot;;color:#034EA2">New Ideas</span></b><b><span style="font-size:17.5pt;font-family:&quot;Tahoma&quot;,&quot;sans-serif&quot;;color:#3BB149"><u></u><u></u></span></b>';
	                                                                    htmlBody += '</p>';
	                                                                    
	                                                                    setSubCat = new SET<string>();
	                                                                    
	                                                                    for(Idea i : newIdeas) {
	                                                                    	if( setSubCat.contains(i.Category__c + ' ' + i.Sub_Category__c) == false ){
	                                                                    		setSubCat.add(i.Category__c + ' ' + i.Sub_Category__c);
		                                                                    		
		                                                                        htmlBody += '<p style="text-align:left;">';
		                                                                            htmlBody += '<span style="font-size:9.0pt;font-family:&quot;Tahoma&quot;,&quot;sans-serif&quot;;color:#45555f">';
		                                                                            htmlBody += i.Category__c + ' ' + i.Sub_Category__c;
		                                                                            htmlBody += '</span><br>';
		                                                                            htmlBody += '<b><span style="font-size:10.0pt;font-family:&quot;Tahoma&quot;,&quot;sans-serif&quot;;"><a style="color:#034EA2" href="' + domainURL + i.Id + '">' + i.Title + '</a></span></b><b><span style="font-size:17.5pt;font-family:&quot;Tahoma&quot;,&quot;sans-serif&quot;;color:#3BB149"><u></u><u></u></span></b>';
		                                                                        htmlBody += '</p>';
		                                                                        
		                                                                         if(setSubCat.size() >= 5 ){
		                                                                        	break;
		                                                                        }
	                                                                    	}
	                                                                    }
	                                                                    if(newIdeas.size() == 0) {
	                                                                        htmlBody += '<p style="text-align:left;">';
	                                                                            htmlBody += '<span style="font-size:9.0pt;font-family:&quot;Tahoma&quot;,&quot;sans-serif&quot;;color:#45555f">No new post found for this week.</span><br>';
	                                                                        htmlBody += '</p>';
	                                                                    }
	                                                                    htmlBody += '<br><br>';
	                                                                    htmlBody += '<p style="line-height:13.5pt"><span style="font-size:9.0pt;font-family:&quot;Tahoma&quot;,&quot;sans-serif&quot;;color:#45555f">You are subscribed to receive the weekly TriTech Roundtable updates; please log into the Customer Service Center and navigate to the RoundTable tab (far right) to see more detail. If you would like to unsubscribe to these updates, please <a style="color:#034EA2" target="_blank" href="' + unsubscribeSiteURL + '?ContactId=' + PortalContactId + '">click here</a>.<u></u><u></u></span></p>';   
	                                                                htmlBody += '</div>';
	                                                            htmlBody += '</td>';
	                                                        htmlBody += '</tr>';
	                                                    htmlBody += '</tbody>';
	                                                htmlBody += '</table>';
	                                            htmlBody += '</td>';
	                                        htmlBody += '</tr>';
	                                        htmlBody += '<tr>';
	                                            htmlBody += '<td valign="top" style="padding:0in 0in 0in 0in" colspan="3">';
	                                                htmlBody += '<table width="100%" cellspacing="0" cellpadding="0" border="0" style="width:100.0%">';
	                                                    htmlBody += '<tbody>';
	                                                        htmlBody += '<tr>';
	                                                            htmlBody += '<td valign="top" style="padding:0in 0in 0in 0in">';
	                                                                htmlBody += '<p align="center" style="text-align:center;line-height:12.0pt" class="MsoNormal"><span style="font-size:8.5pt;font-family:&quot;Tahoma&quot;,&quot;sans-serif&quot;;color:#45555f"><img width="660" border="0" height="99" src="https://app.marketo.com/images/public-site/email/bottomShadow.png"><br><b>TriTech Software Systems</b> 9477 Waples Street, Suite 100, San Diego, CA 92121 <a style="color:#034EA2" target="_blank" href="mailto:info@tritech.com">info@tritech.com</a><u></u><u></u></span></p>';
	                                                            htmlBody += '</td>';
	                                                        htmlBody += '</tr>';
	                                                    htmlBody += '</tbody>';
	                                                htmlBody += '</table>';
	                                            htmlBody += '</td>';
	                                        htmlBody += '</tr>';
	                                    htmlBody += '</tbody>';
	                                htmlBody += '</table>';
	                            htmlBody += '</div>';
	                        htmlBody += '</td>';
	                    htmlBody += '</tr>';
	                htmlBody += '</tbody>';
	            htmlBody += '</table>';
	            
	            
	            //System.debug('htmlBody: '+htmlBody);
	           
	            
	        } catch(Exception ex) {
	            
	        }
	        
	        return htmlBody;
	}
	
	
	public static string getRespondEmailBody(string PortalContactId){
		
		// ADJUST THESE FOR PRODUCTION DEPLOYMENT
		//string unsubscribeSiteURL = 'http://dev1-tritech.cs1.force.com';
		string unsubscribeSiteURL = 'http://tritech.force.com';
		
		//String domainURL = 'https://cs1.salesforce.com/apex/ideaView?id=';
	    //String domainURL = 'https://na6.salesforce.com/apex/ideaView?id=';
	    String domainURL = 'https://na6.salesforce.com/secur/login_portal.jsp?orgId=00D80000000arem&portalId=06080000000QwMW&startURL=/apex/ideaView?id=';
	    
	            
		String htmlBody = '';
		
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
	            
	            Date weekStartDate = date.today().toStartOfWeek();
	            Date weekEndDate = weekStartDate.addDays(6);
	            String day = weekStartDate.day().format();
	            if(day.length() == 1) day = '0' + day;
	            String month = weekStartDate.month().format();
	            if(month.length() == 1) month = '0' + month;
	            String year = weekStartDate.year().format();
	            year = year.subString(2);
	            String weekStart = month + '/' + day + '/' + year;
	            
	            day = weekEndDate.day().format();
	            if(day.length() == 1) day = '0' + day;
	            month = weekEndDate.month().format();
	            if(month.length() == 1) month = '0' + month;
	            year = weekEndDate.year().format();
	            year = year.subString(2);
	            String weekEnd = month + '/' + day + '/' + year;
	             
	            List<Idea> ideas = [Select CreatedBy.Name, CreatedBy.CommunityNickname, VoteTotal, Title, Status, 
	                                    NumComments, LastCommentId, LastCommentDate, Id, CreatedDate, CreatedById, 
	                                    CommunityId, Categories, Body, Category__c, Sub_Category__c From Idea 
	                                    Where Category__c = 'Respond (EMS)' AND Sub_Category__c != 'RoundTable' AND CreatedDate = LAST_90_DAYS AND Status != 'Archive' order by VoteTotal desc, NumComments desc];
	            
	            //fetch new ideas
	            List<Idea> newIdeas = [Select CreatedBy.Name, CreatedBy.CommunityNickname, VoteTotal, Title, Status, 
	                                    NumComments, LastCommentId, LastCommentDate, Id, CreatedDate, CreatedById, 
	                                    CommunityId, Categories, Body, Category__c, Sub_Category__c From Idea 
	                                    Where Category__c = 'Respond (EMS)' AND Sub_Category__c != 'RoundTable' AND Status = 'Public' Order By CreatedDate DESC ];
	            
	            
	            
	            
	            htmlBody += '<table width="825" cellspacing="0" cellpadding="0" border="0" style="width:495.0pt;background:white">';
	                htmlBody += '<tbody>';
	                    htmlBody += '<tr>';
	                        htmlBody += '<td valign="top" style="padding:7.5pt 7.5pt 7.5pt 7.5pt">';
	                            htmlBody += '<p align="center" style="text-align:center">';
	                                //htmlBody += '<img width="540" height="100" alt="TriTech Software Systems" src="http://offers.tritech.com/rs/tritech/images/TSS_Logo_Banner_660x165.png">';
			 						htmlBody += '<img width="275" height="50" alt="TriTech Software Systems" src="https://c.na6.content.force.com/servlet/servlet.ImageServer?id=01580000001j5qi&oid=00D80000000arem">';
	                            htmlBody += '</p>';
	                            htmlBody += '<div >';
	                                htmlBody += '<table width="825" cellspacing="0" cellpadding="0" border="0" style="width:495.0pt">';
	                                    htmlBody += '<tbody>';
	                                        htmlBody += '<tr>';
	                                            htmlBody += '<td style="padding:0in 0in 0in 0in" rowspan="2">';
	                                                htmlBody += '<table width="51" cellspacing="0" cellpadding="0" border="0" style="width:30.75pt">';
	                                                    htmlBody += '<tbody>';
	                                                        htmlBody += '<tr><td style="padding:0in 0in 0in 0in"></td></tr>';
	                                                    htmlBody += '</tbody>';
	                                                htmlBody += '</table>';
	                                            htmlBody += '</td>';
	                                            htmlBody += '<td valign="top" style="background:#034EA2;padding:0in 0in 0in 0in">';
	                                                htmlBody += '<table width="100%" cellspacing="0" cellpadding="0" border="0" style="width:100.0%">';
	                                                    htmlBody += '<tbody>';
	                                                        htmlBody += '<tr>';
	                                                            htmlBody += '<td style="padding:0in 0in 0in 0in">';
	                                                                htmlBody += '<p class="MsoNormal"><img width="13" height="28" src="https://app.marketo.com/images/public-site/email/cornerNW-white.png"><u></u><u></u></p>';
	                                                            htmlBody += '</td>';
	                                                            htmlBody += '<td width="100%" style="width:100.0%;padding:0in 0in 0in 0in">';
	                                                                htmlBody += '<div>';
	                                                                    htmlBody += '<p align="right" style="text-align:center;line-height:12.75pt" class="MsoNormal"><strong><span style="font-size:9.0pt;font-family:&quot;Tahoma&quot;,&quot;sans-serif&quot;;color:white">Your Weekly RoundTable Update</strong><span style="font-size:9.0pt;font-family:&quot;Tahoma&quot;,&quot;sans-serif&quot;;color:white"><u></u><u></u></span></p>';
	                                                                htmlBody += '</div>';
	                                                            htmlBody += '</td>';
	                                                            htmlBody += '<td style="padding:0in 0in 0in 0in">';
	                                                                htmlBody += '<p class="MsoNormal">';
	                                                                    htmlBody += '<img width="12" border="0" height="28" src="https://app.marketo.com/images/public-site/email/cornerNE-white.png"><u></u><u></u>';
	                                                                htmlBody += '</p>';
	                                                            htmlBody += '</td>';
	                                                        htmlBody += '</tr>';
	                                                    htmlBody += '</tbody>';
	                                                htmlBody += '</table>';
	                                            htmlBody += '</td>';
	                                            htmlBody += '<td style="padding:0in 0in 0in 0in" rowspan="2">';
	                                                htmlBody += '<table width="50" cellspacing="0" cellpadding="0" border="0" style="width:30.0pt">';
	                                                    htmlBody += '<tbody>';
	                                                        htmlBody += '<tr><td style="padding:0in 0in 0in 0in"></td></tr>';
	                                                    htmlBody += '</tbody>';
	                                                htmlBody += '</table>';
	                                            htmlBody += '</td>';
	                                        htmlBody += '</tr>';
	                                        htmlBody += '<tr>';
	                                            htmlBody += '<td valign="top" style="padding:0in 0in 0in 0in">';
	                                                htmlBody += '<table width="100%" cellspacing="0" cellpadding="0" border="0" style="width:100.0%">';
	                                                    htmlBody += '<tbody>';
	                                                    /*
	                                                        htmlBody += '<tr>';
	                                                            htmlBody += '<td valign="top" style="background:#f0f0f0;padding:15.0pt 15.0pt 0pt 15.0pt">';
	                                                                htmlBody += '<div>';
	                                                                    htmlBody += '<p style="line-height:13.5pt"><strong><span style="font-size:9.0pt;font-family:&quot;Tahoma&quot;,&quot;sans-serif&quot;;color:#45555f">POSTED: ' + weekStart + ' - ' + weekEnd + '</span></strong><span style="font-size:9.0pt;font-family:&quot;Tahoma&quot;,&quot;sans-serif&quot;;color:#45555f"><u></u><u></u></span></p>';
	                                                                htmlBody += '</div>';
	                                                            htmlBody += '</td>';
	                                                        htmlBody += '</tr>';
	                                                     */
	                                                        
	                                                        htmlBody += '<tr>';
	                                                            htmlBody += '<td valign="top" style="background:#f0f0f0;padding:15.0pt 0pt 15.0pt 15.0pt">';
	                                                                htmlBody += '<div>';
	                                                                    htmlBody += '<p >';
	                                                                        htmlBody += '<b><span style="font-size:11.0pt;font-family:&quot;Tahoma&quot;,&quot;sans-serif&quot;;color:#034EA2">Top Trending Ideas</span></b><b><span style="font-size:17.5pt;font-family:&quot;Tahoma&quot;,&quot;sans-serif&quot;;color:#3BB149"><u></u><u></u></span></b>';
	                                                                    htmlBody += '</p>';
	                                                                    
	                                                                    SET<string> setSubCat = new SET<string>();
	                                                                    
	                                                                    for(Idea i : ideas) {
	                                                                    	if( setSubCat.contains(i.Category__c + ' ' + i.Sub_Category__c) == false ){
	                                                                    		setSubCat.add(i.Category__c + ' ' + i.Sub_Category__c);
		                                                                    		
		                                                                        htmlBody += '<p style="text-align:left;">';
		                                                                            htmlBody += '<span style="font-size:9.0pt;font-family:&quot;Tahoma&quot;,&quot;sans-serif&quot;;color:#45555f">';
		                                                                            htmlBody += i.Category__c + ' ' + i.Sub_Category__c;
		                                                                            htmlBody += '</span><br>';
		                                                                            htmlBody += '<b><span style="font-size:10.0pt;font-family:&quot;Tahoma&quot;,&quot;sans-serif&quot;;"><a style="color:#034EA2" href="' + domainURL + i.Id + '">' + i.Title + '</a></span></b><b><span style="font-size:17.5pt;font-family:&quot;Tahoma&quot;,&quot;sans-serif&quot;;color:#3BB149"><u></u><u></u></span></b>';
		                                                                        htmlBody += '</p>';
		                                                                        
		                                                                        if(setSubCat.size() >= 5 ){
		                                                                        	break;
		                                                                        }
	                                                                    	}    
	                                                                    }
	                                                                    
	                                                                    htmlBody += '<p >';
	                                                                        htmlBody += '<b><span style="font-size:11.0pt;font-family:&quot;Tahoma&quot;,&quot;sans-serif&quot;;color:#034EA2">New Ideas</span></b><b><span style="font-size:17.5pt;font-family:&quot;Tahoma&quot;,&quot;sans-serif&quot;;color:#3BB149"><u></u><u></u></span></b>';
	                                                                    htmlBody += '</p>';
	                                                                    
	                                                                    setSubCat = new SET<string>();
	                                                                    
	                                                                    for(Idea i : newIdeas) {
	                                                                    	if( setSubCat.contains(i.Category__c + ' ' + i.Sub_Category__c) == false ){
	                                                                    		setSubCat.add(i.Category__c + ' ' + i.Sub_Category__c);
		                                                                    		
		                                                                        htmlBody += '<p style="text-align:left;">';
		                                                                            htmlBody += '<span style="font-size:9.0pt;font-family:&quot;Tahoma&quot;,&quot;sans-serif&quot;;color:#45555f">';
		                                                                            htmlBody += i.Category__c + ' ' + i.Sub_Category__c;
		                                                                            htmlBody += '</span><br>';
		                                                                            htmlBody += '<b><span style="font-size:10.0pt;font-family:&quot;Tahoma&quot;,&quot;sans-serif&quot;;"><a style="color:#034EA2" href="' + domainURL + i.Id + '">' + i.Title + '</a></span></b><b><span style="font-size:17.5pt;font-family:&quot;Tahoma&quot;,&quot;sans-serif&quot;;color:#3BB149"><u></u><u></u></span></b>';
		                                                                        htmlBody += '</p>';
		                                                                       
		                                                                       if(setSubCat.size() >= 5 ){
		                                                                        break;
		                                                                       }
	                                                                    	}       
	                                                                    }
	                                                                    if(newIdeas.size() == 0) {
	                                                                        htmlBody += '<p style="text-align:left;">';
	                                                                            htmlBody += '<span style="font-size:9.0pt;font-family:&quot;Tahoma&quot;,&quot;sans-serif&quot;;color:#45555f">No new post found for this week.</span><br>';
	                                                                        htmlBody += '</p>';
	                                                                    }
	                                                                    htmlBody += '<br><br>';
	                                                                    htmlBody += '<p style="line-height:13.5pt"><span style="font-size:9.0pt;font-family:&quot;Tahoma&quot;,&quot;sans-serif&quot;;color:#45555f">You are subscribed to receive the weekly TriTech Roundtable updates; please log into the Customer Service Center and navigate to the RoundTable tab (far right) to see more detail. If you would like to unsubscribe to these updates, please <a style="color:#034EA2" target="_blank" href="' + unsubscribeSiteURL + '?ContactId=' + PortalContactId + '">click here</a>.<u></u><u></u></span></p>';   
	                                                                htmlBody += '</div>';
	                                                            htmlBody += '</td>';
	                                                        htmlBody += '</tr>';
	                                                    htmlBody += '</tbody>';
	                                                htmlBody += '</table>';
	                                            htmlBody += '</td>';
	                                        htmlBody += '</tr>';
	                                        htmlBody += '<tr>';
	                                            htmlBody += '<td valign="top" style="padding:0in 0in 0in 0in" colspan="3">';
	                                                htmlBody += '<table width="100%" cellspacing="0" cellpadding="0" border="0" style="width:100.0%">';
	                                                    htmlBody += '<tbody>';
	                                                        htmlBody += '<tr>';
	                                                            htmlBody += '<td valign="top" style="padding:0in 0in 0in 0in">';
	                                                                htmlBody += '<p align="center" style="text-align:center;line-height:12.0pt" class="MsoNormal"><span style="font-size:8.5pt;font-family:&quot;Tahoma&quot;,&quot;sans-serif&quot;;color:#45555f"><img width="660" border="0" height="99" src="https://app.marketo.com/images/public-site/email/bottomShadow.png"><br><b>TriTech Software Systems</b> 9477 Waples Street, Suite 100, San Diego, CA 92121 <a style="color:#034EA2" target="_blank" href="mailto:info@tritech.com">info@tritech.com</a><u></u><u></u></span></p>';
	                                                            htmlBody += '</td>';
	                                                        htmlBody += '</tr>';
	                                                    htmlBody += '</tbody>';
	                                                htmlBody += '</table>';
	                                            htmlBody += '</td>';
	                                        htmlBody += '</tr>';
	                                    htmlBody += '</tbody>';
	                                htmlBody += '</table>';
	                            htmlBody += '</div>';
	                        htmlBody += '</td>';
	                    htmlBody += '</tr>';
	                htmlBody += '</tbody>';
	            htmlBody += '</table>';
	            
	            
	            //System.debug('htmlBody: '+htmlBody);
	           
	            
	        } catch(Exception ex) {
	            
	        }
	        
	        return htmlBody;
	}
	
	
	
	public static string getPerformEmailBody(string PortalContactId){
		
		// ADJUST THESE FOR PRODUCTION DEPLOYMENT
		//string unsubscribeSiteURL = 'http://dev1-tritech.cs1.force.com';
		string unsubscribeSiteURL = 'http://tritech.force.com';
		
		//String domainURL = 'https://cs1.salesforce.com/apex/ideaView?id=';
	    //String domainURL = 'https://na6.salesforce.com/apex/ideaView?id=';
	    String domainURL = 'https://na6.salesforce.com/secur/login_portal.jsp?orgId=00D80000000arem&portalId=06080000000QwMW&startURL=/apex/ideaView?id=';
	    
	            
		String htmlBody = '';
		
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
	            
	            Date weekStartDate = date.today().toStartOfWeek();
	            Date weekEndDate = weekStartDate.addDays(6);
	            String day = weekStartDate.day().format();
	            if(day.length() == 1) day = '0' + day;
	            String month = weekStartDate.month().format();
	            if(month.length() == 1) month = '0' + month;
	            String year = weekStartDate.year().format();
	            year = year.subString(2);
	            String weekStart = month + '/' + day + '/' + year;
	            
	            day = weekEndDate.day().format();
	            if(day.length() == 1) day = '0' + day;
	            month = weekEndDate.month().format();
	            if(month.length() == 1) month = '0' + month;
	            year = weekEndDate.year().format();
	            year = year.subString(2);
	            String weekEnd = month + '/' + day + '/' + year;
	             
	            List<Idea> ideas = [Select CreatedBy.Name, CreatedBy.CommunityNickname, VoteTotal, Title, Status, 
	                                    NumComments, LastCommentId, LastCommentDate, Id, CreatedDate, CreatedById, 
	                                    CommunityId, Categories, Body, Category__c, Sub_Category__c From Idea 
	                                    Where Category__c = 'Perform' AND Sub_Category__c != 'RoundTable' AND CreatedDate = LAST_90_DAYS AND Status != 'Archive' order by VoteTotal desc, NumComments desc  ];
	            
	            //fetch new ideas
	            List<Idea> newIdeas = [Select CreatedBy.Name, CreatedBy.CommunityNickname, VoteTotal, Title, Status, 
	                                    NumComments, LastCommentId, LastCommentDate, Id, CreatedDate, CreatedById, 
	                                    CommunityId, Categories, Body, Category__c, Sub_Category__c From Idea 
	                                    Where Category__c = 'Perform'  AND Sub_Category__c != 'RoundTable' and Status = 'Public' Order By CreatedDate DESC  ];
	            
	            
	            
	            
	            htmlBody += '<table width="825" cellspacing="0" cellpadding="0" border="0" style="width:495.0pt;background:white">';
	                htmlBody += '<tbody>';
	                    htmlBody += '<tr>';
	                        htmlBody += '<td valign="top" style="padding:7.5pt 7.5pt 7.5pt 7.5pt">';
	                            htmlBody += '<p align="center" style="text-align:center">';
	                                htmlBody += '<img width="275" height="50" alt="TriTech Software Systems" src="https://c.na6.content.force.com/servlet/servlet.ImageServer?id=01580000001j5qi&oid=00D80000000arem">';
	                            htmlBody += '</p>';
	                            htmlBody += '<div >';
	                                htmlBody += '<table width="825" cellspacing="0" cellpadding="0" border="0" style="width:495.0pt">';
	                                    htmlBody += '<tbody>';
	                                        htmlBody += '<tr>';
	                                            htmlBody += '<td style="padding:0in 0in 0in 0in" rowspan="2">';
	                                                htmlBody += '<table width="51" cellspacing="0" cellpadding="0" border="0" style="width:30.75pt">';
	                                                    htmlBody += '<tbody>';
	                                                        htmlBody += '<tr><td style="padding:0in 0in 0in 0in"></td></tr>';
	                                                    htmlBody += '</tbody>';
	                                                htmlBody += '</table>';
	                                            htmlBody += '</td>';
	                                            htmlBody += '<td valign="top" style="background:#034EA2;padding:0in 0in 0in 0in">';
	                                                htmlBody += '<table width="100%" cellspacing="0" cellpadding="0" border="0" style="width:100.0%">';
	                                                    htmlBody += '<tbody>';
	                                                        htmlBody += '<tr>';
	                                                            htmlBody += '<td style="padding:0in 0in 0in 0in">';
	                                                                htmlBody += '<p class="MsoNormal"><img width="13" height="28" src="https://app.marketo.com/images/public-site/email/cornerNW-white.png"><u></u><u></u></p>';
	                                                            htmlBody += '</td>';
	                                                            htmlBody += '<td width="100%" style="width:100.0%;padding:0in 0in 0in 0in">';
	                                                                htmlBody += '<div>';
	                                                                    htmlBody += '<p align="right" style="text-align:center;line-height:12.75pt" class="MsoNormal"><strong><span style="font-size:9.0pt;font-family:&quot;Tahoma&quot;,&quot;sans-serif&quot;;color:white">Your Weekly RoundTable Update</strong><span style="font-size:9.0pt;font-family:&quot;Tahoma&quot;,&quot;sans-serif&quot;;color:white"><u></u><u></u></span></p>';
	                                                                htmlBody += '</div>';
	                                                            htmlBody += '</td>';
	                                                            htmlBody += '<td style="padding:0in 0in 0in 0in">';
	                                                                htmlBody += '<p class="MsoNormal">';
	                                                                    htmlBody += '<img width="12" border="0" height="28" src="https://app.marketo.com/images/public-site/email/cornerNE-white.png"><u></u><u></u>';
	                                                                htmlBody += '</p>';
	                                                            htmlBody += '</td>';
	                                                        htmlBody += '</tr>';
	                                                    htmlBody += '</tbody>';
	                                                htmlBody += '</table>';
	                                            htmlBody += '</td>';
	                                            htmlBody += '<td style="padding:0in 0in 0in 0in" rowspan="2">';
	                                                htmlBody += '<table width="50" cellspacing="0" cellpadding="0" border="0" style="width:30.0pt">';
	                                                    htmlBody += '<tbody>';
	                                                        htmlBody += '<tr><td style="padding:0in 0in 0in 0in"></td></tr>';
	                                                    htmlBody += '</tbody>';
	                                                htmlBody += '</table>';
	                                            htmlBody += '</td>';
	                                        htmlBody += '</tr>';
	                                        htmlBody += '<tr>';
	                                            htmlBody += '<td valign="top" style="padding:0in 0in 0in 0in">';
	                                                htmlBody += '<table width="100%" cellspacing="0" cellpadding="0" border="0" style="width:100.0%">';
	                                                    htmlBody += '<tbody>';
	                                                     /*
	                                                        htmlBody += '<tr>';
	                                                            htmlBody += '<td valign="top" style="background:#f0f0f0;padding:15.0pt 15.0pt 0pt 15.0pt">';
	                                                                htmlBody += '<div>';
	                                                                    htmlBody += '<p style="line-height:13.5pt"><strong><span style="font-size:9.0pt;font-family:&quot;Tahoma&quot;,&quot;sans-serif&quot;;color:#45555f">POSTED: ' + weekStart + ' - ' + weekEnd + '</span></strong><span style="font-size:9.0pt;font-family:&quot;Tahoma&quot;,&quot;sans-serif&quot;;color:#45555f"><u></u><u></u></span></p>';
	                                                                htmlBody += '</div>';
	                                                            htmlBody += '</td>';
	                                                        htmlBody += '</tr>';
	                                                      */  
	                                                        htmlBody += '<tr>';
	                                                            htmlBody += '<td valign="top" style="background:#f0f0f0;padding:15.0pt 0pt 15.0pt 15.0pt">';
	                                                                htmlBody += '<div>';
	                                                                    htmlBody += '<p >';
	                                                                        htmlBody += '<b><span style="font-size:11.0pt;font-family:&quot;Tahoma&quot;,&quot;sans-serif&quot;;color:#034EA2">Top Trending Ideas</span></b><b><span style="font-size:17.5pt;font-family:&quot;Tahoma&quot;,&quot;sans-serif&quot;;color:#3BB149"><u></u><u></u></span></b>';
	                                                                    htmlBody += '</p>';
	                                                                    
	                                                                    SET<string> setSubCat = new SET<string>();
	                                                                     
	                                                                    for(Idea i : ideas) {
	                                                                    	if( setSubCat.contains(i.Category__c + ' ' + i.Sub_Category__c) == false ){
	                                                                    		setSubCat.add(i.Category__c + ' ' + i.Sub_Category__c);
	                                                                    		 
		                                                                        htmlBody += '<p style="text-align:left;">';
		                                                                            htmlBody += '<span style="font-size:9.0pt;font-family:&quot;Tahoma&quot;,&quot;sans-serif&quot;;color:#45555f">';
		                                                                            htmlBody += i.Category__c + ' ' + i.Sub_Category__c;
		                                                                            htmlBody += '</span><br>';
		                                                                            htmlBody += '<b><span style="font-size:10.0pt;font-family:&quot;Tahoma&quot;,&quot;sans-serif&quot;;"><a  style="color:#034EA2" href="' + domainURL + i.Id + '">' + i.Title + '</a></span></b><b><span style="font-size:17.5pt;font-family:&quot;Tahoma&quot;,&quot;sans-serif&quot;;color:#3BB149"><u></u><u></u></span></b>';
		                                                                        htmlBody += '</p>';
		                                                                        
		                                                                        if(setSubCat.size() >= 5 ){
		                                                                        	break;
		                                                                        }
	                                                                    	}
	                                                                    }
	                                                                    htmlBody += '<p >';
	                                                                        htmlBody += '<b><span style="font-size:11.0pt;font-family:&quot;Tahoma&quot;,&quot;sans-serif&quot;;color:#034EA2">New Ideas</span></b><b><span style="font-size:17.5pt;font-family:&quot;Tahoma&quot;,&quot;sans-serif&quot;;color:#3BB149"><u></u><u></u></span></b>';
	                                                                    htmlBody += '</p>';
	                                                                    
	                                                                    setSubCat = new SET<string>();
	                                                                    
	                                                                    for(Idea i : newIdeas) {
	                                                                    	if( setSubCat.contains(i.Category__c + ' ' + i.Sub_Category__c) == false ){
	                                                                    		setSubCat.add(i.Category__c + ' ' + i.Sub_Category__c);
		                                                                    		
		                                                                        htmlBody += '<p style="text-align:left;">';
		                                                                            htmlBody += '<span style="font-size:9.0pt;font-family:&quot;Tahoma&quot;,&quot;sans-serif&quot;;color:#45555f">';
		                                                                            htmlBody += i.Category__c + ' ' + i.Sub_Category__c;
		                                                                            htmlBody += '</span><br>';
		                                                                            htmlBody += '<b><span style="font-size:10.0pt;font-family:&quot;Tahoma&quot;,&quot;sans-serif&quot;;"><a style="color:#034EA2" href="' + domainURL + i.Id + '">' + i.Title + '</a></span></b><b><span style="font-size:17.5pt;font-family:&quot;Tahoma&quot;,&quot;sans-serif&quot;;color:#3BB149"><u></u><u></u></span></b>';
		                                                                        htmlBody += '</p>';
		                                                                        
		                                                                         if(setSubCat.size() >= 5 ){
		                                                                        	break;
		                                                                        }
	                                                                    	}
	                                                                    }
	                                                                    if(newIdeas.size() == 0) {
	                                                                        htmlBody += '<p style="text-align:left;">';
	                                                                            htmlBody += '<span style="font-size:9.0pt;font-family:&quot;Tahoma&quot;,&quot;sans-serif&quot;;color:#45555f">No new post found for this week.</span><br>';
	                                                                        htmlBody += '</p>';
	                                                                    }
	                                                                    htmlBody += '<br><br>';
	                                                                    htmlBody += '<p style="line-height:13.5pt"><span style="font-size:9.0pt;font-family:&quot;Tahoma&quot;,&quot;sans-serif&quot;;color:#45555f">You are subscribed to receive the weekly TriTech Roundtable updates; please log into the Customer Service Center and navigate to the RoundTable tab (far right) to see more detail. If you would like to unsubscribe to these updates, please <a style="color:#034EA2" target="_blank" href="' + unsubscribeSiteURL + '?ContactId=' + PortalContactId + '">click here</a>.<u></u><u></u></span></p>';   
	                                                                htmlBody += '</div>';
	                                                            htmlBody += '</td>';
	                                                        htmlBody += '</tr>';
	                                                    htmlBody += '</tbody>';
	                                                htmlBody += '</table>';
	                                            htmlBody += '</td>';
	                                        htmlBody += '</tr>';
	                                        htmlBody += '<tr>';
	                                            htmlBody += '<td valign="top" style="padding:0in 0in 0in 0in" colspan="3">';
	                                                htmlBody += '<table width="100%" cellspacing="0" cellpadding="0" border="0" style="width:100.0%">';
	                                                    htmlBody += '<tbody>';
	                                                        htmlBody += '<tr>';
	                                                            htmlBody += '<td valign="top" style="padding:0in 0in 0in 0in">';
	                                                                htmlBody += '<p align="center" style="text-align:center;line-height:12.0pt" class="MsoNormal"><span style="font-size:8.5pt;font-family:&quot;Tahoma&quot;,&quot;sans-serif&quot;;color:#45555f"><img width="660" border="0" height="99" src="https://app.marketo.com/images/public-site/email/bottomShadow.png"><br><b>TriTech Software Systems</b> 9477 Waples Street, Suite 100, San Diego, CA 92121 <a style="color:#034EA2" target="_blank" href="mailto:info@tritech.com">info@tritech.com</a><u></u><u></u></span></p>';
	                                                            htmlBody += '</td>';
	                                                        htmlBody += '</tr>';
	                                                    htmlBody += '</tbody>';
	                                                htmlBody += '</table>';
	                                            htmlBody += '</td>';
	                                        htmlBody += '</tr>';
	                                    htmlBody += '</tbody>';
	                                htmlBody += '</table>';
	                            htmlBody += '</div>';
	                        htmlBody += '</td>';
	                    htmlBody += '</tr>';
	                htmlBody += '</tbody>';
	            htmlBody += '</table>';
	            
	            
	            //System.debug('htmlBody: '+htmlBody);
	            
	            
	        } catch(Exception ex) {
	            
	        }
	        
	        return htmlBody;
	}
	
	public static string getTiburonEmailBody(string PortalContactId){
		
		// ADJUST THESE FOR PRODUCTION DEPLOYMENT
		//string unsubscribeSiteURL = 'http://dev1-tritech.cs1.force.com';
		string unsubscribeSiteURL = 'http://tritech.force.com';
		
		
		//String domainURL = 'https://cs1.salesforce.com/apex/ideaView?id=';
	    //String domainURL = 'https://na6.salesforce.com/apex/ideaView?id=';
	    String domainURL = 'https://na6.salesforce.com/secur/login_portal.jsp?orgId=00D80000000arem&portalId=06080000000QwMW&startURL=/apex/ideaView?id=';
	    
	             
		String htmlBody = '';
		
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
	            
	            Date weekStartDate = date.today().toStartOfWeek();
	            Date weekEndDate = weekStartDate.addDays(6);
	            String day = weekStartDate.day().format();
	            if(day.length() == 1) day = '0' + day;
	            String month = weekStartDate.month().format();
	            if(month.length() == 1) month = '0' + month;
	            String year = weekStartDate.year().format();
	            year = year.subString(2);
	            String weekStart = month + '/' + day + '/' + year;
	            
	            day = weekEndDate.day().format();
	            if(day.length() == 1) day = '0' + day;
	            month = weekEndDate.month().format();
	            if(month.length() == 1) month = '0' + month;
	            year = weekEndDate.year().format();
	            year = year.subString(2);
	            String weekEnd = month + '/' + day + '/' + year;
	             
	            List<Idea> ideas = [Select CreatedBy.Name, CreatedBy.CommunityNickname, VoteTotal, Title, Status, 
	                                    NumComments, LastCommentId, LastCommentDate, Id, CreatedDate, CreatedById, 
	                                    CommunityId, Categories, Body, Category__c, Sub_Category__c From Idea 
	                                    Where Category__c = 'Tiburon' AND CreatedDate = LAST_90_DAYS AND Status != 'Archive' order by VoteTotal desc, NumComments desc  ];
	            
	            //fetch new ideas
	            List<Idea> newIdeas = [Select CreatedBy.Name, CreatedBy.CommunityNickname, VoteTotal, Title, Status, 
	                                    NumComments, LastCommentId, LastCommentDate, Id, CreatedDate, CreatedById, 
	                                    CommunityId, Categories, Body, Category__c, Sub_Category__c From Idea 
	                                    Where Category__c = 'Tiburon' and Status = 'Public' Order By CreatedDate DESC  ];
	            
	            
	            
	            
	            htmlBody += '<table width="825" cellspacing="0" cellpadding="0" border="0" style="width:495.0pt;background:white">';
	                htmlBody += '<tbody>';
	                    htmlBody += '<tr>';
	                        htmlBody += '<td valign="top" style="padding:7.5pt 7.5pt 7.5pt 7.5pt">';
	                            htmlBody += '<p align="center" style="text-align:center">';
	                                htmlBody += '<img width="275" height="50" alt="TriTech Software Systems" src="https://c.na6.content.force.com/servlet/servlet.ImageServer?id=01580000001j5qi&oid=00D80000000arem">';
	                            htmlBody += '</p>';
	                            htmlBody += '<div >';
	                                htmlBody += '<table width="825" cellspacing="0" cellpadding="0" border="0" style="width:495.0pt">';
	                                    htmlBody += '<tbody>';
	                                        htmlBody += '<tr>';
	                                            htmlBody += '<td style="padding:0in 0in 0in 0in" rowspan="2">';
	                                                htmlBody += '<table width="51" cellspacing="0" cellpadding="0" border="0" style="width:30.75pt">';
	                                                    htmlBody += '<tbody>';
	                                                        htmlBody += '<tr><td style="padding:0in 0in 0in 0in"></td></tr>';
	                                                    htmlBody += '</tbody>';
	                                                htmlBody += '</table>';
	                                            htmlBody += '</td>';
	                                            htmlBody += '<td valign="top" style="background:#034EA2;padding:0in 0in 0in 0in">';
	                                                htmlBody += '<table width="100%" cellspacing="0" cellpadding="0" border="0" style="width:100.0%">';
	                                                    htmlBody += '<tbody>';
	                                                        htmlBody += '<tr>';
	                                                            htmlBody += '<td style="padding:0in 0in 0in 0in">';
	                                                                htmlBody += '<p class="MsoNormal"><img width="13" height="28" src="https://app.marketo.com/images/public-site/email/cornerNW-white.png"><u></u><u></u></p>';
	                                                            htmlBody += '</td>';
	                                                            htmlBody += '<td width="100%" style="width:100.0%;padding:0in 0in 0in 0in">';
	                                                                htmlBody += '<div>';
	                                                                    htmlBody += '<p align="right" style="text-align:center;line-height:12.75pt" class="MsoNormal"><strong><span style="font-size:9.0pt;font-family:&quot;Tahoma&quot;,&quot;sans-serif&quot;;color:white">Your Weekly RoundTable Update</strong><span style="font-size:9.0pt;font-family:&quot;Tahoma&quot;,&quot;sans-serif&quot;;color:white"><u></u><u></u></span></p>';
	                                                                htmlBody += '</div>';
	                                                            htmlBody += '</td>';
	                                                            htmlBody += '<td style="padding:0in 0in 0in 0in">';
	                                                                htmlBody += '<p class="MsoNormal">';
	                                                                    htmlBody += '<img width="12" border="0" height="28" src="https://app.marketo.com/images/public-site/email/cornerNE-white.png"><u></u><u></u>';
	                                                                htmlBody += '</p>';
	                                                            htmlBody += '</td>';
	                                                        htmlBody += '</tr>';
	                                                    htmlBody += '</tbody>';
	                                                htmlBody += '</table>';
	                                            htmlBody += '</td>';
	                                            htmlBody += '<td style="padding:0in 0in 0in 0in" rowspan="2">';
	                                                htmlBody += '<table width="50" cellspacing="0" cellpadding="0" border="0" style="width:30.0pt">';
	                                                    htmlBody += '<tbody>';
	                                                        htmlBody += '<tr><td style="padding:0in 0in 0in 0in"></td></tr>';
	                                                    htmlBody += '</tbody>';
	                                                htmlBody += '</table>';
	                                            htmlBody += '</td>';
	                                        htmlBody += '</tr>';
	                                        htmlBody += '<tr>';
	                                            htmlBody += '<td valign="top" style="padding:0in 0in 0in 0in">';
	                                                htmlBody += '<table width="100%" cellspacing="0" cellpadding="0" border="0" style="width:100.0%">';
	                                                    htmlBody += '<tbody>';
	                                                     /* 
	                                                        htmlBody += '<tr>';
	                                                            htmlBody += '<td valign="top" style="background:#f0f0f0;padding:15.0pt 15.0pt 0pt 15.0pt">';
	                                                                htmlBody += '<div>';
	                                                                    htmlBody += '<p style="line-height:13.5pt"><strong><span style="font-size:9.0pt;font-family:&quot;Tahoma&quot;,&quot;sans-serif&quot;;color:#45555f">POSTED: ' + weekStart + ' - ' + weekEnd + '</span></strong><span style="font-size:9.0pt;font-family:&quot;Tahoma&quot;,&quot;sans-serif&quot;;color:#45555f"><u></u><u></u></span></p>';
	                                                                htmlBody += '</div>';
	                                                            htmlBody += '</td>';
	                                                        htmlBody += '</tr>';
	                                                      */   
	                                                        htmlBody += '<tr>';
	                                                            htmlBody += '<td valign="top" style="background:#f0f0f0;padding:15.0pt 0pt 15.0pt 15.0pt">';
	                                                                htmlBody += '<div>';
	                                                                    htmlBody += '<p >';
	                                                                        // 6/4/2014 changes start-------
	                                                                        //htmlBody += '<p style="text-align: center;"><a href="http://www.tritech.com/news/tricon" target="_blank"><img src="http://info.tritech.com/cdnr/57/acton/attachment/9884/f-0007/1/-/-/-/-/TriCON2014_Email.png" alt="Innovation Award" width="500" /></a></p>';                     
																			
																			htmlBody += '<b><span style="font-size:11.0pt;font-family:&quot;Tahoma&quot;,&quot;sans-serif&quot;;color:#034EA2">Top Trending Ideas</span></b><b><span style="font-size:17.5pt;font-family:&quot;Tahoma&quot;,&quot;sans-serif&quot;;color:#3BB149"><u></u><u></u></span></b>';
	                                                                       // changes end ----------
	                                                                    htmlBody += '</p>';
	                                                                    
	                                                                    SET<string> setSubCat = new SET<string>();
	                                                                     
	                                                                    for(Idea i : ideas) {
	                                                                    	if( setSubCat.contains(i.Category__c + ' ' + i.Sub_Category__c) == false ){
	                                                                    		setSubCat.add(i.Category__c + ' ' + i.Sub_Category__c);
	                                                                    		 
		                                                                        htmlBody += '<p style="text-align:left;">';
		                                                                            htmlBody += '<span style="font-size:9.0pt;font-family:&quot;Tahoma&quot;,&quot;sans-serif&quot;;color:#45555f">';
		                                                                            htmlBody += i.Category__c + ' ' + i.Sub_Category__c;
		                                                                            htmlBody += '</span><br>';
		                                                                            htmlBody += '<b><span style="font-size:10.0pt;font-family:&quot;Tahoma&quot;,&quot;sans-serif&quot;;"><a  style="color:#034EA2" href="' + domainURL + i.Id + '">' + i.Title + '</a></span></b><b><span style="font-size:17.5pt;font-family:&quot;Tahoma&quot;,&quot;sans-serif&quot;;color:#3BB149"><u></u><u></u></span></b>';
		                                                                        htmlBody += '</p>';
		                                                                        
		                                                                        if(setSubCat.size() >= 5 ){
		                                                                        	break;
		                                                                        }
	                                                                    	}
	                                                                    }
	                                                                    htmlBody += '<p >';
	                                                                        htmlBody += '<b><span style="font-size:11.0pt;font-family:&quot;Tahoma&quot;,&quot;sans-serif&quot;;color:#034EA2">New Ideas</span></b><b><span style="font-size:17.5pt;font-family:&quot;Tahoma&quot;,&quot;sans-serif&quot;;color:#3BB149"><u></u><u></u></span></b>';
	                                                                    htmlBody += '</p>';
	                                                                    
	                                                                    setSubCat = new SET<string>();
	                                                                    
	                                                                    for(Idea i : newIdeas) {
	                                                                    	if( setSubCat.contains(i.Category__c + ' ' + i.Sub_Category__c) == false ){
	                                                                    		setSubCat.add(i.Category__c + ' ' + i.Sub_Category__c);
		                                                                    		
		                                                                        htmlBody += '<p style="text-align:left;">';
		                                                                            htmlBody += '<span style="font-size:9.0pt;font-family:&quot;Tahoma&quot;,&quot;sans-serif&quot;;color:#45555f">';
		                                                                            htmlBody += i.Category__c + ' ' + i.Sub_Category__c;
		                                                                            htmlBody += '</span><br>';
		                                                                            htmlBody += '<b><span style="font-size:10.0pt;font-family:&quot;Tahoma&quot;,&quot;sans-serif&quot;;"><a style="color:#034EA2" href="' + domainURL + i.Id + '">' + i.Title + '</a></span></b><b><span style="font-size:17.5pt;font-family:&quot;Tahoma&quot;,&quot;sans-serif&quot;;color:#3BB149"><u></u><u></u></span></b>';
		                                                                        htmlBody += '</p>';
		                                                                        
		                                                                         if(setSubCat.size() >= 5 ){
		                                                                        	break;
		                                                                        }
	                                                                    	}
	                                                                    }
	                                                                    if(newIdeas.size() == 0) {
	                                                                        htmlBody += '<p style="text-align:left;">';
	                                                                            htmlBody += '<span style="font-size:9.0pt;font-family:&quot;Tahoma&quot;,&quot;sans-serif&quot;;color:#45555f">No new post found for this week.</span><br>';
	                                                                        htmlBody += '</p>';
	                                                                    }
	                                                                    htmlBody += '<br><br>';
	                                                                    htmlBody += '<p style="line-height:13.5pt"><span style="font-size:9.0pt;font-family:&quot;Tahoma&quot;,&quot;sans-serif&quot;;color:#45555f">You are subscribed to receive the weekly TriTech Roundtable updates; please log into the Customer Service Center and navigate to the RoundTable tab (far right) to see more detail. If you would like to unsubscribe to these updates, please <a style="color:#034EA2" target="_blank" href="' + unsubscribeSiteURL + '?ContactId=' + PortalContactId + '">click here</a>.<u></u><u></u></span></p>';   
	                                                                htmlBody += '</div>';
	                                                            htmlBody += '</td>';
	                                                        htmlBody += '</tr>';
	                                                    htmlBody += '</tbody>';
	                                                htmlBody += '</table>';
	                                            htmlBody += '</td>';
	                                        htmlBody += '</tr>';
	                                        htmlBody += '<tr>';
	                                            htmlBody += '<td valign="top" style="padding:0in 0in 0in 0in" colspan="3">';
	                                                htmlBody += '<table width="100%" cellspacing="0" cellpadding="0" border="0" style="width:100.0%">';
	                                                    htmlBody += '<tbody>';
	                                                        htmlBody += '<tr>';
	                                                            htmlBody += '<td valign="top" style="padding:0in 0in 0in 0in">';
	                                                                htmlBody += '<p align="center" style="text-align:center;line-height:12.0pt" class="MsoNormal"><span style="font-size:8.5pt;font-family:&quot;Tahoma&quot;,&quot;sans-serif&quot;;color:#45555f"><img width="660" border="0" height="99" src="https://app.marketo.com/images/public-site/email/bottomShadow.png"><br><b>TriTech Software Systems</b> 9477 Waples Street, Suite 100, San Diego, CA 92121 <a style="color:#034EA2" target="_blank" href="mailto:info@tritech.com">info@tritech.com</a><u></u><u></u></span></p>';
	                                                            htmlBody += '</td>';
	                                                        htmlBody += '</tr>';
	                                                    htmlBody += '</tbody>';
	                                                htmlBody += '</table>';
	                                            htmlBody += '</td>';
	                                        htmlBody += '</tr>';
	                                    htmlBody += '</tbody>';
	                                htmlBody += '</table>';
	                            htmlBody += '</div>';
	                        htmlBody += '</td>';
	                    htmlBody += '</tr>';
	                htmlBody += '</tbody>';
	            htmlBody += '</table>';
	            
	            
	            //System.debug('htmlBody: '+htmlBody);
	           
	            
	        } catch(Exception ex) {
	            
	        }
	        
	        return htmlBody;
	}
}