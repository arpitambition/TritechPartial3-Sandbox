@istest
private class TestStateEDI {
	
	public static testmethod void getEncryptedString(){
		try{
			
			StateEDI cls = new StateEDI();
			User u1 = [Select Id, AccountId from User where IsPortalEnabled = true LIMIT 1];
	        List<ServiceContract> scList = new List<ServiceContract>();
	        ServiceContract sc1 = new ServiceContract(Name = 'SC1',Contract_Type__c = 'EMS', Contract_Status_WMP__c = 'Active', AccountId = u1.AccountId);
	        scList.add(sc1);
	        ServiceContract sc2 = new ServiceContract(Name = 'SC2',Product_Family_WMP__c = 'VisiNet',Contract_Status_WMP__c = 'Active', AccountId = u1.AccountId);
	        scList.add(sc2);
	        ServiceContract sc3 = new ServiceContract(Name = 'SC3',Product_Family_WMP__c = 'IMC',Contract_Status_WMP__c = 'Active', AccountId = u1.AccountId);
	        scList.add(sc3);
	        insert scList;
	        cls.autoRun();
		}
		catch(Exception ex){
			system.debug(ex.getMessage());
		}
	}
	 
}