/**
 * This class contains unit tests for validating the behavior of Apex classes
 * and triggers.
 *
 * Unit tests are class methods that verify whether a particular piece
 * of code is working properly. Unit test methods take no arguments,
 * commit no data to the database, and are flagged with the testMethod
 * keyword in the method definition.
 *
 * All test methods in an organization are executed whenever Apex code is deployed
 * to a production organization to confirm correctness, ensure code
 * coverage, and prevent regressions. All Apex classes are
 * required to have at least 75% code coverage in order to be deployed
 * to a production organization. In addition, all triggers must have some code coverage.
 * 
 * The @isTest class annotation indicates this class only contains test
 * methods. Classes defined with the @isTest annotation do not count against
 * the organization size limit for all Apex scripts.
 *
 * See the Apex Language Reference for more information about Testing and Code Coverage.
 */
@isTest
private class SalesOrderTestClass {

    static testMethod void SalesOrderTest() {
    Account testAccount = new Account();
    testAccount.Name='Visinet Test Account';
    insert testAccount;	
    
    Contact cont = new Contact();
    cont.FirstName='Jen';
    cont.LastName='Vansant';
    cont.Accountid=testAccount.id;
    insert cont;
    	
    opportunity opp = new opportunity(name='Visinet Test',
    	Account=testAccount,
    	Contact__c=cont.id,
    	Products_Required__c='RMS',
    	CloseDate=System.today(),
    	Quote_Number__c='QUO-12345-abcd',
    	RecordTypeID='0124D0000008jfP',
    	Description='Executive Summary',
    	StageName='Selected',
    	Probability=95);
    insert opp;	 
        
    }
}