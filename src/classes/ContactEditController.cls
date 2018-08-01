// ==================================================================================
//   Object: ContactEditController
//  Company: Tritech
// Comments: Created a custom edit page for the portal users to remove the notification title from the layout.
// ==================================================================================
//  Changes: 2012-12-05 Initial version.
// ==================================================================================

public with sharing class ContactEditController {
    public Contact cont {get;set;}
    public String contId {get;set;}
    public String contName {get;set;}
    
    private Boolean isClone = false;
    
    public ContactEditController(Apexpages.standardController sc) {
        cont = new Contact();
        contId = sc.getId();
        contName = 'New Contact';
        String clone = Apexpages.currentPage().getParameters().get('clone');
        if(clone != null && clone == '1') {
            isClone = true;
            contId = Apexpages.currentPage().getParameters().get('id');
            //contId = contId.replace('/', '');
        }
        if(contId != null && contId != '') {
            cont = [Select Id, Name, AccountId, Account.Name, Title, Role_WMP__c, Primary_Contact_WMP__c, Phone, OtherPhone, OptIn_VisionRMS__c, OptIn_VisionMOBILE__c, 
                        OptIn_VisionLMS__c, OptIn_VisionJAIL__c, OptIn_VisionINFORM__c, OptIn_VisionFORCE__c, OptIn_VisionFIRE__c, 
                        OptIn_VisionFBR__c, OptIn_VisionCAD__c, OptIn_Sales_Promos_Training__c, MobilePhone, MailingStreet, MailingState, 
                        MailingPostalCode, MailingCountry, MailingCity, Inactive_Contact__c, HomePhone, Fax, Email, 
                        CSC_Portal_Access_Request__c, After_Hours_Contact_WMP__c, Salutation, FirstName, LastName, HasOptedOutOfEmail, Primary_Support_Contact__c,
                        Support_Contact__c, IT_Contact__c, NIBRS_Contact__c, Executive_Contact__c, Upgrade_Contact__c, Newsletter_Contact__c, GIS_Contact__c, 
                        Marketing_Contact__c, Opt_In_IQ_Analytics__c 
                    From Contact Where Id =: contId];
            if(!isClone) contName = cont.Name;
            
        }
        
    }
    
    public Pagereference autoRun() {
        List<User> userList = [Select u.Name, u.IsPortalEnabled, u.ContactId, u.Contact.AccountId From User u Where IsPortalEnabled = true and Id =: Userinfo.getUserId()];
        if(userList.size() > 0) {
            if(cont.Id == null) cont.AccountId = userList[0].Contact.AccountId;
            return null;
        }
        if(contId != null && contId != '') return new Pagereference('/' + contId + '/e?nooverride=1&retURL=' + contId);
        
        //https://c.cs3.visual.force.com/apex/ContactEdit?retURL=https%3A%2F%2Fcs3.salesforce.com%2F003Q000000ZoiAJ&save_new=1&sfdc.override=1
        String saveAndNew = Apexpages.currentPage().getParameters().get('save_new');
        if(saveAndNew == '1') {
            String url = Apexpages.currentPage().getParameters().get('retURL');
            System.debug('url: '+url);
            return new Pagereference('/003/e?nooverride=1&retURL=' + url);
        }
        //return new Pagereference('/003/e?nooverride=1');
        return null;
    }
    
    public Pagereference doSave() {
        try {
            if(isClone) {
                Contact temp = cont;
                cont = new Contact();
                cont = temp.clone(false, true);
                /*cont.AccountId = temp.;
                cont.Title = temp.;
                cont.Role_WMP__c = temp.;
                cont.Primary_Contact_WMP__c = temp.;
                cont.Phone = temp.;
                cont.OptIn_VisionRMS__c = temp.;
                cont.OptIn_VisionMOBILE__c = temp.;
                cont.OptIn_VisionLMS__c = temp.;
                cont.OptIn_VisionJAIL__c = temp.;
                cont.OptIn_VisionINFORM__c = temp.;
                cont.OptIn_VisionFORCE__c = temp.;
                cont.OptIn_VisionFIRE__c = temp.;
                cont.OptIn_VisionFBR__c = temp.;
                cont.OptIn_VisionCAD__c = temp.;
                cont.OptIn_Sales_Promos_Training__c = temp.;
                cont.MobilePhone = temp.;
                cont.MailingStreet = temp.;
                cont.MailingState = temp.;
                cont.MailingPostalCode = temp.;
                cont.MailingCountry = temp.;
                cont.MailingCity = temp.;
                cont.Inactive_Contact__c = temp.;
                cont.HomePhone = temp.;
                cont.Fax = temp.;
                cont.Email = temp.;
                cont.CSC_Portal_Access_Request__c = temp.;
                cont.After_Hours_Contact_WMP__c = temp.;
                cont.Salutation = temp.;
                cont.FirstName = temp.;
                cont.LastName = temp.;
                cont.HasOptedOutOfEmail = temp.;*/
            }
            upsert cont;
            return new Pagereference('/' + cont.Id);
        } catch(Exception ex) { ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.ERROR, ex.getMessage())); }
        return null;
    }
    
    public Pagereference saveAndNew() {
        Pagereference pr = doSave();
        String cId = cont.Id;
        if(pr != null) {
            cont = new Contact();
        }
        if(isClone) {
            //return new Pagereference('/003/e?retURL=/' + cId);
            return new Pagereference('apex/ContactListView?sfdc.tabName=01r80000000Q7Ol&vfRetURLInSFX=%2Fhome%2Fhome.jsp');
        }
        return null;
    }
}