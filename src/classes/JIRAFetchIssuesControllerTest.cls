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
private class JIRAFetchIssuesControllerTest {
 
    // Tests buildRequest method in JIRAFetchIssuesController.
    static testMethod void buildRequestTest() {
        HttpRequest req = JIRAFetchIssuesController.buildRequest(TestFixture.baseUrl, TestFixture.username,
            TestFixture.password, TestFixture.systemId, TestFixture.objectType, TestFixture.objectId);
        System.assertEquals(req.getMethod(), 'GET');
        System.assertEquals(req.getEndpoint(), 'http://jira.com/rest/customware/connector/1.0/1/Case/1/issue/fetch.json');
    }
 
    // Tests whether the response is fetched successfully when JIRAFetchIssuesController is constructed.
    static testMethod void getIssuesJSONTest() {
        Case c = new Case();
        insert c;
 
        Test.startTest();
        Test.setMock(HttpCalloutMock.class, new MockHttpResponseFetchJIRAIssue());
         
        JIRAFetchIssuesController controller = new JIRAFetchIssuesController(new ApexPages.StandardController(c));
 
        System.assertEquals(TestFixture.jiraIssueResponseBody, controller.getIssuesJSON());
        List<JIRAFetchIssuesController.JIRAIssue> jiraIssues = controller.getIssues();
 
        JIRAFetchIssuesController.JIRAIssue issue1 = jiraIssues[0];
        JIRAFetchIssuesController.JIRAIssue issue2 = jiraIssues[1];
 
        System.assertEquals('Project One', issue1.summary);
        System.assertEquals('project one', issue1.project);
        System.assertEquals('admin@gmail.com', issue1.reporter);
        System.assertEquals('PO-1', issue1.key);
        System.assertEquals('open', issue1.status);
        System.assertEquals('yes', issue1.resolution);
        System.assertEquals('www.google.com', issue1.url);
        System.assertEquals('bug', issue1.type);
        System.assertEquals('admin', issue1.assignee);
        System.assertEquals('issue 1', issue1.description);
        System.assertEquals('high', issue1.priority);
        System.assertEquals('12-12-2015', issue1.due_date);
        System.assertEquals('Project Two', issue2.summary);
        System.assertEquals('project two', issue2.project);
 
        Test.stopTest();       
    }
 
}