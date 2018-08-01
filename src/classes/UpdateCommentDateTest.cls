@isTest
private class UpdateCommentDateTest{
        static testMethod void UpdateCommentDate() {
        Case caseObj = new Case(
            Status = 'Working',
            Origin = 'Phone');
        insert caseObj;
            caseObj = [select id from case where id = : caseObj.id];
           CaseComment b = new CaseComment(ParentId= caseObj.id,CommentBody='Behind the Cloud');
           System.debug('Price before inserting new book: ' + b.CommentBody);
           // Insert book
           insert b;
       // Retrieve the new book

           b = [SELECT CommentBody FROM CaseComment WHERE Id =:b.Id];

           System.debug('Price after trigger fired: ' + b.CommentBody);

     

           // Test that the trigger correctly updated the price

           System.assertEquals('Behind the Cloud', b.CommentBody);

        }

    }