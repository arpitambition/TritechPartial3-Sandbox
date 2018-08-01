/* Class:     CLDY_GISHoursCalculation 
   * Purpose:   This class call from Case and ServiceContract After update trigger.
   *            It will calculate GIS Maintenace hours based Tickets with to respect to Service Contract
   * CreatedBy: Cloudely
   * Date:      9/05/2016
   */   
public with sharing class CLDY_GISHoursCalculation {
    
    static public Id zuercherRecordType = Schema.SObjectType.Case.getRecordTypeInfosByName().get('Zuercher Customer Support Ticket').getRecordTypeId();
    static public Boolean executeOnceFlag = true;
  /* Method:    scGISHoursCalculation 
   * Param:     Map<Id,String>
   * Return:    None
   * Purpose:   This method calculate GIS Maintenace hours and apply to respected Service Contract
   * CreatedBy: Cloudely
   * Date:      9/05/2016
   */   
    public static void scGISHoursLogic(Map<Id,String> mapOfSCNumber){       
        Decimal totalTicketHrs;
        Map<Id,Decimal> mapofSCHrs = new Map<Id,Decimal>();
        List<ServiceContract> listOfSC = new List<ServiceContract>();   
        Boolean noValidTicket = true;
        if(!mapOfSCNumber.isEmpty()){
            for(Case objTick : [Select Id,ClosedDate,SC_Number__c,Service_Contract_WMP__c,Service_Contract_WMP__r.Id,Service_Contract_WMP__r.Z_Remaining_GIS_Maintenance_Hours__c,
                                Service_Contract_WMP__r.Z_Contracted_GIS_Maintenance_Hours__c,Service_Contract_WMP__r.EndDate,Service_Contract_WMP__r.StartDate,Z_GIS_Maintenance_Hours__c
                                FROM Case
                                WHERE Service_Contract_WMP__c IN: mapOfSCNumber.KeySet()                                
                                AND Z_GIS_Maintenance_Hours__c != null 
                                AND RecordTypeId =: zuercherRecordType
                                AND ClosedDate != null]){
                System.debug('**objTick=>'+objTick);
                if(objTick.ClosedDate < objTick.Service_Contract_WMP__r.EndDate && 
                   objTick.ClosedDate > objTick.Service_Contract_WMP__r.StartDate && 
                   objTick.SC_Number__c == mapOfSCNumber.get(objTick.Service_Contract_WMP__r.Id)){
                   noValidTicket = false;    
                    if(totalTicketHrs == null){
                        totalTicketHrs = objTick.Z_GIS_Maintenance_Hours__c;
                        mapofSCHrs.put(objTick.Service_Contract_WMP__c,totalTicketHrs);
                    }else{
                        totalTicketHrs = totalTicketHrs + objTick.Z_GIS_Maintenance_Hours__c;
                        mapofSCHrs.put(objTick.Service_Contract_WMP__c,totalTicketHrs);
                    }                   
                }
             }           
          if(!mapOfSCNumber.isEmpty()){
                for(ServiceContract objSC : [Select Id,Z_Contracted_GIS_Maintenance_Hours__c, Z_Remaining_GIS_Maintenance_Hours__c
                                             FROM ServiceContract
                                             WHERE Id IN: mapOfSCNumber.keySet()]){
                    if(!mapOfSCNumber.isEmpty() && mapofSCHrs.containsKey(objSC.Id) && objSC.Z_Contracted_GIS_Maintenance_Hours__c == null){
                        objSC.Z_Remaining_GIS_Maintenance_Hours__c = 0 - mapofSCHrs.get(objSC.Id);
                        listOfSC.add(objSC);
                    }else if(!mapOfSCNumber.isEmpty() && mapofSCHrs.containsKey(objSC.Id)){                  
                        objSC.Z_Remaining_GIS_Maintenance_Hours__c = objSC.Z_Contracted_GIS_Maintenance_Hours__c - mapofSCHrs.get(objSC.Id);
                        listOfSC.add(objSC);
                    }
                    System.debug('MaoOSSCHR==>'+!mapofSCHrs.containsKey(objSC.Id));
                    System.debug('noValidTicket==>'+noValidTicket);
                    System.debug('objSC==>'+objSC);
                   if(noValidTicket && !mapofSCHrs.containsKey(objSC.Id) && objSC.Z_Remaining_GIS_Maintenance_Hours__c != objSC.Z_Contracted_GIS_Maintenance_Hours__c){
                  		System.debug('objSC=>'+objSC);
                        objSC.Z_Remaining_GIS_Maintenance_Hours__c = objSC.Z_Contracted_GIS_Maintenance_Hours__c;
                        listOfSC.add(objSC);
                   }
                }  
            }
        try{
             System.debug('**listOfSC=>'+listOfSC);
             if (listOfSC.size()>0){
               executeOnceFlag = false;
               Database.saveResult [] srList = Database.update(listOfSC,false); 
             }
           }catch(Exception e){
                System.debug('****Design FinalDesign Update Failed==>'+e);
           }
        }  
    }
}