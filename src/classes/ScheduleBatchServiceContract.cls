global class ScheduleBatchServiceContract implements Schedulable {
	  
  global void execute(SchedulableContext context) {
  	          
  	// call batch apex  
  	      
    BatchServiceContract batchObj = new BatchServiceContract();
        
    ID batchprocessid = Database.executeBatch(batchObj );
    
  }   
    
}