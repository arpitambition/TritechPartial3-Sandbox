/* Trigger:   TicketAfterUpdate 
   * Purpose:   This trigger fire on Case After update trigger event.
   *            It will calculate GIS Maintenace hours based Tickets with to respect to Service Contract
   * CreatedBy: Cloudely
   * Date:      9/05/2016
   */
trigger TicketAfterUpdate on Case (after update) {
    
    Map<Id,String> mapOfSCNumber = new Map<Id,String>();        
    for(Case objTicket : Trigger.new) { 
        System.debug('**objTicket=>'+objTicket); 
        if( (objTicket.Z_GIS_Maintenance_Hours__c != Trigger.oldMap.get(objTicket.Id).Z_GIS_Maintenance_Hours__c ||
             objTicket.ClosedDate != Trigger.oldMap.get(objTicket.Id).ClosedDate) &&
             objTicket.RecordTypeId == CLDY_GISHoursCalculation.zuercherRecordType &&
             objTicket.Service_Contract_WMP__c != null){
                mapOfSCNumber.put(objTicket.Service_Contract_WMP__c,objTicket.SC_Number__c);            
        }
    }   
    System.debug('**mapOfSCNumber=>'+mapOfSCNumber);        
    if(!mapOfSCNumber.isEmpty() && CLDY_GISHoursCalculation.executeOnceFlag){
        CLDY_GISHoursCalculation.scGISHoursLogic(mapOfSCNumber);
    } 
}