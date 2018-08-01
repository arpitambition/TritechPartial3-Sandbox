/* Trigger:   SCAfterUpdate 
   * Purpose:   This trigger fire on ServiceContract After update trigger event.
   *            It will calculate GIS Maintenace hours based Tickets with to respect to Service Contract
   * CreatedBy: Cloudely
   * Date:      9/06/2016
   */
trigger SCAfterUpdate on ServiceContract (after update) {   
    
    public Map<Id,String> mapOfSCNumber = new Map<Id,String>(); 
    
    for(ServiceContract objSC : Trigger.new) {      
        if( (objSC.Z_Contracted_GIS_Maintenance_Hours__c != Trigger.oldMap.get(objSC.Id).Z_Contracted_GIS_Maintenance_Hours__c) ||
            (objSC.EndDate != Trigger.oldMap.get(objSC.Id).EndDate)){
            mapOfSCNumber.put(objSC.Id,objSC.ContractNumber);           
        }
    }
    if(!mapOfSCNumber.isEmpty() && CLDY_GISHoursCalculation.executeOnceFlag){
        CLDY_GISHoursCalculation.scGISHoursLogic(mapOfSCNumber);
    }
}