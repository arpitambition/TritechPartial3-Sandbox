public without sharing class BomgarSessions {
	
	public list <CustomSession> sessions {get; set;}
	
	private list <BGIntegration__BomgarSession__c> bomgarSessions {get; set;}
	
	
	public BomgarSessions(Case c){
		setBomgarSessions(c);
		
	}
	
	private void setBomgarSessions(Case c){
		bomgarSessions = [Select b.Name, b.BGIntegration__Start_Time__c, b.BGIntegration__Primary_Representative__c, b.BGIntegration__Primary_Customer__c, b.BGIntegration__End_Time__c, b.BGIntegration__Duration__c From BGIntegration__BomgarSession__c b where Case__c = :c.Id limit 5];
	}
	
	private void setSessions(){
		for(BGIntegration__BomgarSession__c bs: bomgarSessions){
			CustomSession cs = new CustomSession();
			cs.Name = bs.Name;
			cs.Start_Time = bs.BGIntegration__Start_Time__c;
			cs.Primary_Representative = bs.BGIntegration__Primary_Representative__c;
			cs.Primary_Customer = bs.BGIntegration__Primary_Customer__c;
			cs.End_Time = bs.BGIntegration__End_Time__c;
			cs.Duration = bs.BGIntegration__Duration__c;
			
			Sessions.add(cs);
		}
	}
	
	public class CustomSession{
		public string Name {get; set;}
		public datetime Start_Time {get; set;}
		public string Primary_Representative {get; set;}
		public string Primary_Customer {get; set;}
		public datetime End_Time {get; set;}
		public string Duration {get; set;}
	}
    
}