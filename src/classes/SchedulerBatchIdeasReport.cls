global class SchedulerBatchIdeasReport implements Schedulable {
	  
  global void execute(SchedulableContext context) {
  	          
  	// call batch apex  
  	        
    BatchIdeasReport batchObj = new BatchIdeasReport();
        
    ID batchprocessid = Database.executeBatch(batchObj, 10 );
    
  }   
    
}