// ==================================================================================
//   Object: TicketViewController
//  Company: Tritech
//   Author: Mohan Kumar (Sales Optimizer)
// Comments: Validates if the user is portal and if the ticket is closed then show the 
//           show the record as read only using vf page.
// ==================================================================================
//  Changes: 2012-11-20 Initial version.
//           2018-02-16 Mohan Kumar
//           Changed the filter logic to indentify the closed ticket by IsClosed field
//           instead of hardcoding the Status values.
// ==================================================================================

public with sharing class TicketViewController {
    public String ticketId {get;set;}
    public Case curTicket {get;set;}
    public list <BGIntegration__BomgarSession__c> bomgarSessions {get; set;}
    //public list <BomgarSessions.CustomSession> bomgarSessions {get; set;}
    
    public TicketViewController(Apexpages.standardController sc) {
        ticketId = sc.getId();
        curTicket = new Case();
        
        for( Case cs : [Select Id, CaseNumber, Status, IsClosed From Case Where Id =: ticketId]){
            curTicket = cs;
        }
        
        bomgarSessions = [select Id,name,BGIntegration__Primary_Customer__c,BGIntegration__Primary_Representative__c,BGIntegration__Start_Time__c,BGIntegration__End_Time__c,BGIntegration__Duration__c from BGIntegration__BomgarSession__c where Id = :sc.getId()];
        //setBomgarSessions(curTicket);
    }
    
    public Pagereference autoRun() {
        List<User> userList = [Select u.Name, u.IsPortalEnabled, u.ContactId, u.profile.name From User u Where IsPortalEnabled = true and Id =: Userinfo.getUserId() limit 1];
        if(userList.size() > 0) {
            if(curTicket != null && (curTicket.IsClosed 
                || (userList[0].profile.name.contains('Read') && userList[0].profile.Name.contains('Only')))) {
                return null;
            }
        }
        return new Pagereference('/' + ticketId + '?nooverride=1');
    }
    
    public Pagereference autoRunToClose() {
        return new Pagereference('/' + ticketId + '/s?retURL=/' + ticketId + '&nooverride=1');
    }
    
    public void customSave(){
        
    }
    
    //private void setBomgarSessions(Case c){
    //  BomgarSessions bs = new BomgarSessions(c);
    //  bomgarSessions = bs.sessions;
    //}
}