trigger UpdateEmailDate on EmailMessage (after insert, after delete, after update) {

    if(Trigger.isInsert){
            try {
                for (EmailMessage co : Trigger.new){
                    Case po = [SELECT Id, EmailDate__c  FROM Case WHERE Id = :co.ParentID];
                    
                    List<EmailMessage> l_co = [SELECT ParentID,CreatedDate FROM EmailMessage WHERE ParentId = :po.Id AND (Status = '2' or Status = '3') ORDER BY CreatedDate ASC NULLS FIRST LIMIT 1];
                    for(EmailMessage am_co : l_co) {
                        po.EmailDate__c = am_co.CreatedDate;  
                    }
                     

                    update po;
                }
            } catch (Exception e) {
                System.debug(e);
            }
        }
     }