@isTest
private class EmailDateTest {
        static testMethod void UpdateEmailDate() {
           EmailMessage b = new EmailMessage(Subject='Behind the Cloud');
           System.debug('Price before inserting new book: ' + b.Subject);
           // Insert book
           insert b;
       // Retrieve the new book

           b = [SELECT Subject FROM EmailMessage WHERE Id =:b.Id];

           System.debug('Price after trigger fired: ' + b.Subject);

     

           // Test that the trigger correctly updated the price

           System.assertEquals('Behind the Cloud', b.Subject);

        }

    }