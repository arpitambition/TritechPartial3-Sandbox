// ==================================================================================
//   Object: CopyMailingAddressToShipping
//  Company: Tritech
//   Author: Mohan Kumar
// Comments: When the shipping address is left blank then copy the mailing/billing
//           address to as shipping address.
// ==================================================================================
//  Changes: 2013-03-04 Initial version.
//			 2016-04-11 update te code sync the mailing address to billing address
// ==================================================================================

trigger CopyMailingAddressToShipping on Account (before insert, before update) {
    for(Account a : trigger.new) {
        System.debug('a: '+a);
        if((a.Shipping_Street_WMP__c == null || a.Shipping_Street_WMP__c == '') 
            && (a.Shipping_City_WMP__c == null || a.Shipping_City_WMP__c == '')
            && (a.Shipping_State_WMP__c == null || a.Shipping_State_WMP__c == '')
            && (a.Shipping_Zip_Postal_Code__c == null || a.Shipping_Zip_Postal_Code__c == '')
            && (a.Shipping_Country_WMP__c == null || a.Shipping_Country_WMP__c == '')) {
            
            //copy mailing/billing address
            a.Shipping_Street_WMP__c = a.Mailing_Billing_Street_WMP__c;
            a.Shipping_City_WMP__c = a.Mailing_Billing_City_WMP__c;
            a.Shipping_State_WMP__c = a.Mailing_Billing_State_WMP__c;
            a.Shipping_Zip_Postal_Code__c = a.Mailing_Billing_Zip_Postal_Code_WMP__c;
            a.Shipping_Country_WMP__c = a.Mailing_Billing_Country_WMP__c;
        }
        //MK 2016-04-11 update te code sync the mailing address to billing address
        Boolean isBillingBlank = false;
        if ((a.BillingStreet == null || a.BillingStreet == '') 
            && (a.BillingCity == null || a.BillingCity == '')
            && (a.BillingState == null || a.BillingState == '')
            && (a.BillingPostalCode == null || a.BillingPostalCode == '')
            && (a.BillingCountry == null || a.BillingCountry  == '')) {
        	isBillingBlank = true;
        }
        if ((Trigger.isInsert && isBillingBlank) || (Trigger.isUpdate && (isBillingBlank 
        																|| a.Mailing_Billing_Street_WMP__c != trigger.oldMap.get(a.Id).Mailing_Billing_Street_WMP__c
        																|| a.Mailing_Billing_City_WMP__c != trigger.oldMap.get(a.Id).Mailing_Billing_City_WMP__c
        																|| a.Mailing_Billing_State_WMP__c != trigger.oldMap.get(a.Id).Mailing_Billing_State_WMP__c
        																|| a.Mailing_Billing_Zip_Postal_Code_WMP__c != trigger.oldMap.get(a.Id).Mailing_Billing_Zip_Postal_Code_WMP__c
        																|| a.Mailing_Billing_Country_WMP__c != trigger.oldMap.get(a.Id).Mailing_Billing_Country_WMP__c))) {
            
            //copy mailing/billing address
            a.BillingStreet = a.Mailing_Billing_Street_WMP__c;
            a.BillingCity = a.Mailing_Billing_City_WMP__c;
            a.BillingState = a.Mailing_Billing_State_WMP__c;
            a.BillingPostalCode = a.Mailing_Billing_Zip_Postal_Code_WMP__c;
            a.BillingCountry  = a.Mailing_Billing_Country_WMP__c;
    }}
}