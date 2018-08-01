trigger DeleteOldKBSearch on KB_Search_Result__c(after insert)
{
	list<kb_search_Result__c> kbs = [select id from kb_search_Result__c where createddate < :(Date.Today() - 365) limit 999]; 
	if(kbs.size()>0)
		delete kbs; 
		
	//list<kb_search_tracking__c> kbst = [select id from kb_search_tracking__c where createddate < :(Date.Today() - 365) limit 500]; 
	//if(kbst.size()>0)
	//	delete kbst; 	
}