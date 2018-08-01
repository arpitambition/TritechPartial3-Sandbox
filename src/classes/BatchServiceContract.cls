global class BatchServiceContract implements Database.Batchable<SObject>, Database.AllowsCallouts{
      
    global database.Querylocator start(Database.BatchableContext BC){
    	Date dtEndDate = system.today().addDays(-91);
    	
        if(Test.isRunningTest()){
            
            return Database.getQueryLocator([Select Id,Product_Family_WMP__c,EndDate,Contract_Status_WMP__c From ServiceContract Limit 1]);
        }
         
        return Database.getQueryLocator([Select Id,Product_Family_WMP__c,EndDate,Contract_Status_WMP__c From ServiceContract Where EndDate >= : dtEndDate ]);
    }
  
    global void execute(Database.BatchableContext BC,Sobject[] scope){
        
      //try{
        
        List<ServiceContract> listSC = new List<ServiceContract>();
           
        for(sobject s : scope){
        	
        	ServiceContract serCont = (ServiceContract)s;
            
            //Service Contract: EMS
            
            if(serCont.Product_Family_WMP__c == 'EMS' && serCont.Contract_Status_WMP__c == 'Active' && serCont.EndDate == system.today().addDays(-1) ){ serCont.Contract_Status_WMP__c = 'Pending Renewal'; listSC.add(serCont); }
            
            
            //Service Contracts: 911 (Day 61)
            
            else if(serCont.Product_Family_WMP__c == '911' && (serCont.Contract_Status_WMP__c == 'No HW Support, Software Only' || serCont.Contract_Status_WMP__c == 'Active') 
            	&& serCont.EndDate == system.today().addDays(-61) ){ serCont.Contract_Status_WMP__c = 'Pending Renewal'; listSC.add(serCont); }
            
            
            //Service Contracts: 911 (Day 1 after End Date)
            
            else if(serCont.Product_Family_WMP__c == '911' && serCont.Contract_Status_WMP__c == 'Active' && serCont.EndDate == system.today().addDays(-1) ){ serCont.Contract_Status_WMP__c = 'No HW Support, Software Only'; listSC.add(serCont);}
            
            
            //Service Contracts: VisiNet IMC VisionAIR Inform (Day 1 after End Date)
            
            else if((serCont.Product_Family_WMP__c == 'Inform' || serCont.Product_Family_WMP__c == 'IMC' || serCont.Product_Family_WMP__c == 'VisiNet'  || serCont.Product_Family_WMP__c == 'VisionAIR')
            	 && serCont.Contract_Status_WMP__c == 'Active' && serCont.EndDate == system.today().addDays(-1) ){ serCont.Contract_Status_WMP__c = 'Renewal Due'; listSC.add(serCont); }
            
            
            //Service Contracts: VisiNet IMC VisionAIR Inform (Day 91 after End Date)
            
            else if((serCont.Product_Family_WMP__c == 'Inform' || serCont.Product_Family_WMP__c == 'IMC' || serCont.Product_Family_WMP__c == 'VisiNet'  || serCont.Product_Family_WMP__c == 'VisionAIR')
            	 && (serCont.Contract_Status_WMP__c == 'Active' || serCont.Contract_Status_WMP__c == 'Pending Renewal')  && serCont.EndDate == system.today().addDays(-91) ){ serCont.Contract_Status_WMP__c = 'Pending Renewal'; listSC.add(serCont);}
            
             
	    }
	    
	    if(listSC.size() > 0){ update listSC; }
	      
      //}
      //catch(Exception ex){
      //  system.debug(ex.getMessage());
      //} 
      
    }
  
    global void finish(Database.BatchableContext BC){

    }
}