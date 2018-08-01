/*********************************************************************************
* {Type} Class: {ScheduleBatchVerifyPictureDocument}
* Created by {Madan Vishwakarma}, Navivo, {DateCreated 03/31/2014}
----------------------------------------------------------------------------------
* Purpose/Methods:
* - {Call BatchVerifyPictureDocument from this class.}
----------------------------------------------------------------------------------
* Unit Test: {TestScheduleBatchVerifyPictureDocument}
----------------------------------------------------------------------------------
* History:
* - VERSION DEVELOPER NAME DATE DETAIL FEATURES
1.0 Madan Vishwakarma 03/31/2014 INITIAL DEVELOPMENT
2.0 Name MM/DD/YYYY UDAC WIRE FRAME CHANGES
*********************************************************************************/

global class ScheduleBatchVerifyPictureDocument implements Schedulable {
	global void execute(SchedulableContext context) {
	  	          
	  	// call batch apex  
	  	      
	    BatchVerifyPictureDocument batchObj = new BatchVerifyPictureDocument();
	        
	    ID batchprocessid = Database.executeBatch(batchObj, 10 );
	    
	  }   
}