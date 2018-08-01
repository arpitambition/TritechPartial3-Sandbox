// ==================================================================================
//   Object: ContactViewController
//  Company: Tritech
//   Author: Mohan Kumar (Sales Optimizer)
// Comments: Created a custom view page for the portal users to remove the account name from the layout.
// ==================================================================================
//  Changes: 2012-12-01 Initial version.
// ==================================================================================

public with sharing class ContactViewController {
	public Contact cont {get;set;}
	public String contId {get;set;}
	public String address {get;set;}
	
	public ContactViewController(Apexpages.Standardcontroller sc) {
		contId = sc.getId();
		cont = new Contact();
		cont = [Select Id, Name, Title, Role_WMP__c, Primary_Contact_WMP__c, Phone, OptIn_VisionRMS__c, OptIn_VisionMOBILE__c, 
					OptIn_VisionLMS__c, OptIn_VisionJAIL__c, OptIn_VisionINFORM__c, OptIn_VisionFORCE__c, OptIn_VisionFIRE__c, 
					OptIn_VisionFBR__c, OptIn_VisionCAD__c, OptIn_Sales_Promos_Training__c, MobilePhone, MailingStreet, MailingState, 
					MailingPostalCode, MailingCountry, MailingCity, Inactive_Contact__c, HomePhone, Fax, Email, 
					CSC_Portal_Access_Request__c, After_Hours_Contact_WMP__c, HasOptedOutOfEmail 
				From Contact Where Id =: contId];
		if(cont.MailingStreet != null) {
			address = cont.MailingStreet + '</br>';
		}
		if(cont.MailingCity != null) {
			address += cont.MailingCity;
		}
		if(cont.MailingState != null) {
			if(cont.MailingCity != null) {
				address += ', ';
			}
			address += cont.MailingState;
		}
		if(cont.MailingPostalCode != null) {
			address += ' ' + cont.MailingPostalCode;
		}
		if(cont.MailingCountry != null) {
			address += '</br>' + cont.MailingCountry;
		}
	}
	public Pagereference autoRun() {
		List<User> userList = [Select u.Name, u.IsPortalEnabled, u.ContactId From User u Where IsPortalEnabled = true and Id =: Userinfo.getUserId()];
		if(userList.size() > 0) {
			return null;
		}
		return new Pagereference('/' + contId + '?nooverride=1');
	}
	
	public Pagereference editContact() {
		//return new Pagereference('/' + contId + '/e?clone=1&retURL=/' + contId);
		return new Pagereference('/apex/ContactEdit?id=' + contId + '&retURL=/' + contId);
	}
	
	public Pagereference cloneContact() {
		//return new Pagereference('/' + contId + '/e?clone=1&retURL=/' + contId);
		return new Pagereference('/apex/ContactEdit?id=' + contId + '&clone=1&retURL=/' + contId);
	}
}