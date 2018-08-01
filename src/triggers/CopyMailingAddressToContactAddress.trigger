// ==================================================================================
//   Object: CopyMailingAddressToContactAddress
//  Company: Tritech
//   Author: Mohan Kumar
// Comments: When the contact address is left blank then copy the Account mailing/billing
//			 address to contact address.
// ==================================================================================
//  Changes: 2013-03-04 Initial version.
// ==================================================================================

trigger CopyMailingAddressToContactAddress on Contact (before insert, before update) {
	Set<Id> accntIds = new Set<Id>();
	for(Contact c : trigger.new) {
		if((c.MailingStreet == null || c.MailingStreet == '') 
			&& (c.MailingCity == null || c.MailingCity == '')
			&& (c.MailingState == null || c.MailingState == '')
			&& (c.MailingPostalCode == null || c.MailingPostalCode == '')
			&& (c.MailingCountry == null || c.MailingCountry == '')) {
			//collect the account IDs to pull the Mailing/Billing address info
			if(c.AccountId != null) accntIds.add(c.AccountId);
		}
	}
	//get all the account mailing/billing address
	Map<Id, Account> accntMap = new Map<Id, Account>([Select Id, Mailing_Billing_Street_WMP__c, 
														Mailing_Billing_City_WMP__c, 
														Mailing_Billing_State_WMP__c, 
														Mailing_Billing_Zip_Postal_Code_WMP__c, 
														Mailing_Billing_Country_WMP__c From Account
														Where Id IN: accntIds]);
	for(Contact c : trigger.new) {
		if((c.MailingStreet == null || c.MailingStreet == '') 
			&& (c.MailingCity == null || c.MailingCity == '')
			&& (c.MailingState == null || c.MailingState == '')
			&& (c.MailingPostalCode == null || c.MailingPostalCode == '')
			&& (c.MailingCountry == null || c.MailingCountry == '')) {
			//get the account Mailing/Billing address info using accntMap
			Account a = accntMap.get(c.AccountId);
			if(a != null) {
				c.MailingStreet = a.Mailing_Billing_Street_WMP__c;
				c.MailingCity = a.Mailing_Billing_City_WMP__c;
				c.MailingState = a.Mailing_Billing_State_WMP__c;
				c.MailingPostalCode = a.Mailing_Billing_Zip_Postal_Code_WMP__c;
				c.MailingCountry = a.Mailing_Billing_Country_WMP__c;
			}
		}
	}
}