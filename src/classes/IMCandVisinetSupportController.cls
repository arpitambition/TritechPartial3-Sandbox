// ==================================================================================
//   Object: IMCandVisinetSupportController
//  Company: TriTech
// Comments: Supporting class to check the IMC or Visinet contract is active or not.
//			 If not redirect the user home page.
// ==================================================================================
//  Changes: 2012-11-25 Initial version.
// ==================================================================================

public without sharing class IMCandVisinetSupportController {
	
	public TabPermissions TabPermission {get; set;}
	
	public IMCandVisinetSupportController(){
		setTabPermission();
	}
	public Pagereference autoCheckIMC() {
		List<Boolean> resultTab = hideTabController_CP.hideTabMethod_CP();
		if(resultTab.size() == 3) {
			if(!resultTab[2]) {
				return new Pagereference('/home/home.jsp');
			}
		}
		return null;
	}
	
	public Pagereference autoCheckVisinet() {
		List<Boolean> resultTab = hideTabController_CP.hideTabMethod_CP();
		if(resultTab.size() == 3) {
			if(!resultTab[1]) {
				return new Pagereference('/home/home.jsp');
			}
		}
		return null;
	}
	
    private void setTabPermission(){
    	TabPermission = new TabPermissions();
    }
}