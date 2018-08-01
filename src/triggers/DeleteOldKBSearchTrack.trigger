trigger DeleteOldKBSearchTrack on KB_Search_Tracking__c(after insert)
{
	list<kb_search_tracking__c> kbst = [select id from kb_search_tracking__c where createddate < :(Date.Today() - 365) limit 999]; 
	if(kbst.size()>0)
		delete kbst; 	
}