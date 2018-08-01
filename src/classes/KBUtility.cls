/*********************************************************************************
* Test Class: {KBUtility}
* Created by {Madan Vishwakarma}, Navivo, {DateCreated 08/26/2014}
----------------------------------------------------------------------------------
* Purpose/Methods:
* - {This utility class are created to provide all tooles which are helpfull in KB report generation.}
----------------------------------------------------------------------------------
* Utility Test Data: {}
----------------------------------------------------------------------------------
* History:
* - VERSION DEVELOPER NAME DATE DETAIL FEATURES
1.0 Madan 08/26/2014 INITIAL DEVELOPMENT
2.0 Name MM/DD/YYYY UDAC WIRE FRAME CHANGES
*********************************************************************************/

public with sharing class KBUtility {
	
	//save all data which are used to filter search result
	public static String saveSearchTracking(String keyword, Boolean isSuccess, String emsFilter, String imcFilter, String visiNetFilter, String visionAIRFilter, Boolean defectSearch, Boolean howtoSearch, Boolean techAdvisorySearch, Boolean ticketSolutionsSearch, Boolean faqSearch, Boolean releaseNotesSearch, Boolean techTipsSearch, Boolean userManualsSearch, Boolean videoSearch){
		try{
			KB_Search_Tracking__c kbSearchTracking = new KB_Search_Tracking__c();
			kbSearchTracking.Keyword__c = keyword;
			kbSearchTracking.Search_Date__c = datetime.now();
			kbSearchTracking.Search_Success__c = isSuccess;
			kbSearchTracking.EMS_Filter__c = emsFilter;
			kbSearchTracking.IMC_Filter__c = imcFilter;
			kbSearchTracking.VisiNet_Filter__c = visiNetFilter;
			kbSearchTracking.VisionAIR_Filter__c = visionAIRFilter;
			kbSearchTracking.Channel__c = '';
			kbSearchTracking.User__c = Userinfo.getUserId();
			
			for(User u : [Select Id,Contact.Account.Product_Family_WMP__c From User Where Id = : kbSearchTracking.User__c AND Contact.Account.Product_Family_WMP__c != null Limit 1]){
				kbSearchTracking.Customer_Product_Family__c = u.Contact.Account.Product_Family_WMP__c;
			}
			
			//------------------------------------------------------------------------
			String articleTypes = '';
			
			if(defectSearch){
				if(articleTypes != '' && articleTypes != null) articleTypes += '; Defect';
				else articleTypes += 'Defect';
			}
			if(howtoSearch){
				if(articleTypes != '' && articleTypes != null) articleTypes += '; How To';
				else articleTypes += 'How To';
			}
			if(techAdvisorySearch){
				if(articleTypes != '' && articleTypes != null) articleTypes += '; Tech Advisory';
				else articleTypes += 'Tech Advisory';
			}
			if(ticketSolutionsSearch){
				if(articleTypes != '' && articleTypes != null) articleTypes += '; Ticket Solutions';
				else articleTypes += 'Ticket Solutions';
			}
			if(videoSearch){
				if(articleTypes != '' && articleTypes != null) articleTypes += '; Video';
				else articleTypes += 'Video';
			}
			if(faqSearch){
				if(articleTypes != '' && articleTypes != null) articleTypes += '; FAQ';
				else articleTypes += 'FAQ';
			}
			if(releaseNotesSearch){
				if(articleTypes != '' && articleTypes != null) articleTypes += '; Release Notes';
				else articleTypes += 'Release Notes';
			}
			if(techTipsSearch){
				if(articleTypes != '' && articleTypes != null) articleTypes += '; Tech Tips';
				else articleTypes += 'Tech Tips';
			}
			if(userManualsSearch){
				if(articleTypes != '' && articleTypes != null) articleTypes += '; User Manuals';
				else articleTypes += 'User Manuals';
			}
			
			kbSearchTracking.Search_In_Article_Types__c = articleTypes;
			
			//--------------------------------------------------------------------
			for(User u : [Select id, ContactId, UserType from User where id =: Userinfo.getUserId()]){
				if(u.ContactId != null && u.UserType == 'PowerPartner') kbSearchTracking.Channel__c = 'Partner';
				else if(u.ContactId != null) kbSearchTracking.Channel__c = 'Customer';
				else kbSearchTracking.Channel__c = 'Internal App';
			}
			
			//Insert Search Article Details
			insert kbSearchTracking;
			return kbSearchTracking.Id;
		}
		catch(Exception ex){
			return null;
		}
	}
	
	//Save serach results.
	public static void saveSearchResult(String searchTrackingId, List<ArticleWrapper> lstSearchResult){
		try{
			if(lstSearchResult.size() > 0 && searchTrackingId != null){
				List<KB_Search_Result__c> lstKBSearchResult = new List<KB_Search_Result__c>();
				KB_Search_Result__c kbSearchResultRecord;
				for(ArticleWrapper record:lstSearchResult){
					kbSearchResultRecord = new KB_Search_Result__c();
					
					kbSearchResultRecord.Article_ID__c = record.articleId;
					kbSearchResultRecord.Article_Published_Date__c = record.articlePublishDate;
					kbSearchResultRecord.Article_Title__c = record.articleTitle;
					kbSearchResultRecord.Article_Type__c = record.articleType;
					kbSearchResultRecord.Article_Author__c = record.createdById;
					kbSearchResultRecord.Category_Group__c = record.categoryGroups;
					kbSearchResultRecord.KB_Search_Tracking__c = searchTrackingId;
					
					lstKBSearchResult.add(kbSearchResultRecord);
				}
				if(lstKBSearchResult.size() > 0) insert lstKBSearchResult;
			}	
		}
		catch(Exception ex){
			//add message here
		}
	}
	
	//Update filed when customer click any search article.
	public static void updateArticleViewed(String articleId, String searchTrackingId){
		try{
			List<KB_Search_Result__c> lstUpdateSearchResult = new List<KB_Search_Result__c>();
			for(KB_Search_Result__c sResult : [select id, Article_Viewed__c from KB_Search_Result__c where Article_ID__c =: articleId and KB_Search_Tracking__c =: searchTrackingId]){
				sResult.Article_Viewed__c = true;
				lstUpdateSearchResult.add(sResult);
			}
			if(lstUpdateSearchResult.size() > 0) update lstUpdateSearchResult;
		}
		catch(Exception ex){
			//add message here
		}
	}
	
	public static Integer keywordMatched(String searchWords, String artTitle) {
		Integer matchCount = 0;
		searchWords = searchWords.toLowerCase();
		artTitle = (artTitle != null ? artTitle.toLowerCase() : '');
		for(String s: searchWords.split(' ')) {
			if(artTitle.contains(s)) {
				matchCount++;
			}
		}
		return matchCount;
	}
}