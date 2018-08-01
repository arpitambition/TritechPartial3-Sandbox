public without sharing class StateEDI {
	
	public string encryptedString {get;set;}
	public TabPermissions TabPermission {get; set;}
	
	public StateEDI(){
		setTabPermission();
		
		string Useraname = UserInfo.getUserName();
		
		encryptedString = CryptoEncryption.getEncryptedString(Useraname);
			
	}
	
	public Pagereference autoRun() {
		List<Boolean> resultTab = hideTabController_CP.hideTabMethod_CP();
		if(resultTab.size() == 3) {
			if(!resultTab[0]) {
				return new Pagereference('/home/home.jsp');
			}
		}
		return null;
	}
	
    private void setTabPermission(){
    	TabPermission = new TabPermissions();
    }
}