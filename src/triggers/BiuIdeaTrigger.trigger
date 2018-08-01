//Auther: Mohan Kumar (Navivo)
//Description: copy the Category__c value to Categories field
trigger BiuIdeaTrigger on Idea (before insert, before update) {
	
	for(Idea i : trigger.new) {
		i.Categories = i.Category__c;
	}
}