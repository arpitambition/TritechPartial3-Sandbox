/*********************************************************************************
* {Type} Class: {BatchVerifyPictureDocument}
* Created by {Madan Vishwakarma}, Navivo, {DateCreated 03/31/2014}
----------------------------------------------------------------------------------
* Purpose/Methods:
* - {Update all Contact's pictId if document found otherwise set pictId__c = null}
----------------------------------------------------------------------------------
* Unit Test: {TestScheduleBatchVerifyPictureDocument}
----------------------------------------------------------------------------------
* History:
* - VERSION DEVELOPER NAME DATE DETAIL FEATURES
1.0 Madan Vishwakarma 03/31/2014 INITIAL DEVELOPMENT
2.0 Name MM/DD/YYYY UDAC WIRE FRAME CHANGES
*********************************************************************************/

global class BatchVerifyPictureDocument implements Database.Batchable<SObject>, Database.AllowsCallouts{
      
    global database.Querylocator start(Database.BatchableContext BC){
        return Database.getQueryLocator([Select c.Id, c.FirstName, c.PictId__c From Contact c where c.PictId__c <> null]);
    }
  
    global void execute(Database.BatchableContext BC,Sobject[] scope){
      try{
      	Set<Id> setDoc = new Set<Id>();
      	//Create List of Contacts retrived from Start Section
      	for(sobject c : scope){
      		Contact cont = (Contact)c;
      		setDoc.add(cont.PictId__c);
      	}
      	
      	
      	Set<Id> setExistingDocIds = new Set<Id>();
      	//Create set of Document Ids
      	for(Document d:([select Id from Document Where Id IN :setDoc])){
      		setExistingDocIds.Add(d.Id);
      	}
      	
      	List<Contact> lstContact = new List<Contact>();
      	//Update Contacts PictId__c = null if PictId__c not exist in SetDoc.
      	for(sobject c : scope){
      		Contact cont = (Contact)c;
      		if( !setExistingDocIds.contains(cont.PictId__c) ) {
      			cont.PictId__c = null;
      			lstContact.add(cont);
      		}
      	}
      	if(lstContact.size() > 0) update lstContact;
      }
      catch(Exception ex){
        system.debug(ex.getMessage());
      } 
      
    }
  
    global void finish(Database.BatchableContext BC){

    }
}