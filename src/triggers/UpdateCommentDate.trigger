trigger UpdateCommentDate on CaseComment (after insert, after delete, after update) {

    if(Trigger.isInsert){
            try {
                for (CaseComment co : Trigger.new){
                    Case po = [SELECT Id, CommentDate__c  FROM Case WHERE Id = :co.ParentID];
                    
                    List<CaseComment> l_co = [SELECT ParentID,CreatedDate FROM  CaseComment WHERE ParentId = :po.Id ORDER BY CreatedDate ASC NULLS FIRST LIMIT 1];
                    for(CaseComment am_co : l_co) {
                        po.CommentDate__c = am_co.CreatedDate;  
                    }
                     

                    update po;
                }
            } catch (Exception e) {
                System.debug(e);
            }
        }
     }