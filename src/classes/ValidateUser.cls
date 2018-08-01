@isTest
private class ValidateUser {

    static testMethod void validateUser() {
    	Id userRole = UserInfo.getUserRoleId();
    	Id userProfile = UserInfo.getProfileId();
    	
        Profile p = [SELECT Id FROM Profile WHERE Name='Standard User']; 
        User u = new User(Alias = 'standt', Email='test@test.com', 
            EmailEncodingKey='UTF-8', LastName='Testing', LanguageLocaleKey='en_US', 
            LocaleSidKey='en_US', ProfileId = p.Id, 
            TimeZoneSidKey='America/Los_Angeles', UserName='ken.becker@tritech.bomgar.test.com',
            CompanyName = 'Katch Consulting');
        
        
        //User u = new User(
        	//username = 'test@test.com',
        	//email = 'test@test.com',
        	//ProfileId = UserInfo.getProfileId(),
        	//UserRole = userRole
        	//);
        insert u;
        
    }
}