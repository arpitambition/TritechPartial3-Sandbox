trigger PreventEditClosedCase on Case (before update) {

	boolean isTriTechPortal = false;
	
	for(User u : [Select Id From User Where Id = : UserInfo.getUserId() 
				AND Profile.Name IN ('TriTech Portal Manager','TriTech Portal Standard User','TriTech Portal Read-Only User') Limit 1]){
	
	   isTriTechPortal = true;
	}
	
	for(Case c : trigger.new){
		
		if(trigger.oldmap.get(c.Id).IsClosed == true && isTriTechPortal == true ){
			
			c.addError('You are not authorized to edit closed tickets. Please contact your TriTech Support Team.');
			
		}
	}
	
}