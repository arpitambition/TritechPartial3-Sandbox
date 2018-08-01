<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <alerts>
        <fullName>EA_Additional_Information_Required</fullName>
        <description>EA - Additional Information Required</description>
        <protected>false</protected>
        <recipients>
            <type>creator</type>
        </recipients>
        <recipients>
            <field>Assigned_To__c</field>
            <type>userLookup</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Internal_Templates/Additional_Info_Needed_Helpdesk_Ticket</template>
    </alerts>
    <alerts>
        <fullName>EA_Helpdesk_Ticket_Completed</fullName>
        <description>EA - Helpdesk Ticket Completed</description>
        <protected>false</protected>
        <recipients>
            <type>owner</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Internal_Templates/Completed_Helpdesk_Ticket</template>
    </alerts>
    <alerts>
        <fullName>EA_Helpdesk_Ticket_Submitted</fullName>
        <description>EA - Helpdesk Ticket Submitted</description>
        <protected>false</protected>
        <recipients>
            <recipient>Sys_Admin_Helpdesk</recipient>
            <type>group</type>
        </recipients>
        <recipients>
            <type>owner</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Internal_Templates/New_Helpdesk_Ticket</template>
    </alerts>
    <alerts>
        <fullName>EA_Helpdesk_Ticket_Submitted_Hierarchy_Change_or_Sworn_Officer_Update</fullName>
        <description>EA - Helpdesk Ticket Submitted (Hierarchy Change or Sworn Officer Update)</description>
        <protected>false</protected>
        <recipients>
            <type>owner</type>
        </recipients>
        <recipients>
            <recipient>jenni.hastie@tritech.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Internal_Templates/New_Helpdesk_Ticket</template>
    </alerts>
    <alerts>
        <fullName>EA_Marketing_Request_Assigned</fullName>
        <description>EA - Marketing Request Assigned</description>
        <protected>false</protected>
        <recipients>
            <field>Assigned_To__c</field>
            <type>userLookup</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Internal_Templates/New_Marketing_Request_Assigned</template>
    </alerts>
    <alerts>
        <fullName>EA_Marketing_Request_Completed</fullName>
        <description>EA - Marketing Request Completed</description>
        <protected>false</protected>
        <recipients>
            <type>owner</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Internal_Templates/Completed_Marketing_Request</template>
    </alerts>
    <alerts>
        <fullName>EA_Marketing_Request_Rejected</fullName>
        <description>EA - Marketing Request Rejected</description>
        <protected>false</protected>
        <recipients>
            <type>owner</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Internal_Templates/Rejected_Marketing_Request</template>
    </alerts>
    <alerts>
        <fullName>EA_Marketing_Request_Submitted</fullName>
        <description>EA - Marketing Request Submitted</description>
        <protected>false</protected>
        <recipients>
            <type>owner</type>
        </recipients>
        <recipients>
            <recipient>cheri.lane@tritech.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>kris.assel@tritech.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>laura.weinhofer@tritech.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Internal_Templates/New_Marketing_Request</template>
    </alerts>
    <alerts>
        <fullName>EA_Pricing_Committee_Mtg_Scheduled</fullName>
        <description>EA - Pricing Committee Mtg Scheduled</description>
        <protected>false</protected>
        <recipients>
            <type>owner</type>
        </recipients>
        <recipients>
            <recipient>sam.perkins@tritech.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Internal_Templates/Pricing_Committee_Mtg_Scheduled</template>
    </alerts>
    <alerts>
        <fullName>EA_Pricing_Committee_Request_Approved</fullName>
        <description>EA - Pricing Committee Request Approved</description>
        <protected>false</protected>
        <recipients>
            <recipient>jen.vansant@tritech.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Inform_Customer_Support_Notifications/Pricing_Committee_Request_Approved</template>
    </alerts>
    <alerts>
        <fullName>EA_Pricing_Committee_Request_Completed</fullName>
        <description>EA - Pricing Committee Request Completed</description>
        <protected>false</protected>
        <recipients>
            <type>owner</type>
        </recipients>
        <recipients>
            <recipient>jen.vansant@tritech.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Internal_Templates/Completed_Pricing_Committee_Request</template>
    </alerts>
    <alerts>
        <fullName>EA_Pricing_Committee_Request_Submitted</fullName>
        <description>EA - Pricing Committee Request Submitted</description>
        <protected>false</protected>
        <recipients>
            <type>owner</type>
        </recipients>
        <recipients>
            <recipient>jen.vansant@tritech.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>sam.perkins@tritech.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>shawn.carpenter@tritech.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Internal_Templates/New_Pricing_Committee_Request</template>
    </alerts>
    <alerts>
        <fullName>EA_Send_Email_Request_Approved</fullName>
        <description>EA - Send Email Request Approved</description>
        <protected>false</protected>
        <recipients>
            <field>Assigned_To__c</field>
            <type>userLookup</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Internal_Templates/Change_Management_Approved</template>
    </alerts>
    <alerts>
        <fullName>EA_Send_Email_Request_Rejected</fullName>
        <description>EA - Send Email Request Rejected</description>
        <protected>false</protected>
        <recipients>
            <field>Assigned_To__c</field>
            <type>userLookup</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Internal_Templates/Change_Management_Rejected</template>
    </alerts>
    <alerts>
        <fullName>EA_Test</fullName>
        <description>EA - Test</description>
        <protected>false</protected>
        <recipients>
            <recipient>scott.key@tritech.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Internal_Templates/New_Helpdesk_Ticket</template>
    </alerts>
    <fieldUpdates>
        <fullName>Approval_Level_Pending_Approval</fullName>
        <field>Approval_Level__c</field>
        <literalValue>Pending Approval</literalValue>
        <name>Approval Level_Pending Approval</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Approval_Level_Recalled</fullName>
        <field>Approval_Level__c</field>
        <literalValue>Request Recalled</literalValue>
        <name>Approval Level_Recalled</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Approval_Level_Rejected</fullName>
        <field>Approval_Level__c</field>
        <literalValue>Request Rejected</literalValue>
        <name>Approval Level_Rejected</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Approval_Level_Request_Approved</fullName>
        <field>Approval_Level__c</field>
        <literalValue>Request Approved</literalValue>
        <name>Approval Level_Request Approved</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Approval_Level_TriTech_Sales</fullName>
        <field>Approval_Level__c</field>
        <literalValue>TriTech Sales Approved</literalValue>
        <name>Approval Level_TriTech Sales</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Approval_Level_TriTech_Support</fullName>
        <field>Approval_Level__c</field>
        <literalValue>TriTech Support Approved</literalValue>
        <name>Approval Level_TriTech Support</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Approval_Level_Zuercher_Sales</fullName>
        <field>Approval_Level__c</field>
        <literalValue>Zuercher Sales Approved</literalValue>
        <name>Approval Level_Zuercher Sales</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Approval_Level_Zuercher_Support</fullName>
        <field>Approval_Level__c</field>
        <literalValue>Zuercher Support Approved</literalValue>
        <name>Approval Level_Zuercher Support</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>FU_Additional_Information_Required</fullName>
        <description>Auto-update status to Additional Information Required when the field is not null.</description>
        <field>Request_Status__c</field>
        <literalValue>Additional Information Required</literalValue>
        <name>FU - Additional Information Required</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>FU_Assign_to_Jenni_Hastie</fullName>
        <description>Assign to Jenni Hastie when the ticket is a request type of Hierarchy Change or Sworn Officer Update.</description>
        <field>Assigned_To__c</field>
        <lookupValue>jenni.hastie@tritech.com</lookupValue>
        <lookupValueType>User</lookupValueType>
        <name>FU - Assign to Jenni Hastie</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>LookupValue</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>FU_Assigned</fullName>
        <field>Request_Status__c</field>
        <literalValue>In Process</literalValue>
        <name>FU - Assigned</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>FU_Completed</fullName>
        <field>Request_Status__c</field>
        <literalValue>Completed</literalValue>
        <name>FU - Completed</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>FU_Completed_Date</fullName>
        <field>Date_Completed__c</field>
        <formula>TODAY()</formula>
        <name>FU - Completed Date</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>FU_Manager_Approved</fullName>
        <field>Approval_Level__c</field>
        <literalValue>Manager Approved</literalValue>
        <name>FU - Manager Approved</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>FU_Marketing_Request_Assigned</fullName>
        <field>Request_Status__c</field>
        <literalValue>In Process</literalValue>
        <name>FU - Marketing Request Assigned</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>FU_Marketing_Request_Completed</fullName>
        <field>Request_Status__c</field>
        <literalValue>Completed</literalValue>
        <name>FU - Marketing Request Completed</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>FU_Marketing_Request_Rejected</fullName>
        <field>Request_Status__c</field>
        <literalValue>Rejected</literalValue>
        <name>FU - Marketing Request Rejected</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>FU_Marketing_Request_Submitted</fullName>
        <field>Request_Status__c</field>
        <literalValue>Submitted</literalValue>
        <name>FU - Marketing Request Submitted</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>FU_Pricing_Committee_Approved</fullName>
        <field>Request_Status__c</field>
        <literalValue>Approved</literalValue>
        <name>FU - Pricing Committee Approved</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>FU_Pricing_Committee_Rejected</fullName>
        <field>Request_Status__c</field>
        <literalValue>Rejected</literalValue>
        <name>FU - Pricing Committee Rejected</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>FU_Pricing_Committee_Request_Assigned</fullName>
        <field>Request_Status__c</field>
        <literalValue>In Process</literalValue>
        <name>FU - Pricing Committee Request Assigned</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>FU_Pricing_Committee_Request_Completed</fullName>
        <field>Request_Status__c</field>
        <literalValue>Completed</literalValue>
        <name>FU - Pricing Committee Request Completed</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>FU_Pricing_Committee_Request_Submitted</fullName>
        <field>Request_Status__c</field>
        <literalValue>Submitted</literalValue>
        <name>FU - Pricing Committee Request Submitted</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>FU_Submitted</fullName>
        <field>Request_Status__c</field>
        <literalValue>Submitted</literalValue>
        <name>FU - Submitted</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Last_Approval_Date_Update</fullName>
        <field>Last_Approval_Date__c</field>
        <formula>Today()</formula>
        <name>Last Approval Date Update</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Last_Rejection_Date_Update</fullName>
        <field>Last_Rejection_Date__c</field>
        <formula>Today()</formula>
        <name>Last Rejection Date Update</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <rules>
        <fullName>EA - Marketing Request Assigned</fullName>
        <actions>
            <name>EA_Marketing_Request_Assigned</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>SalesForce_Helpdesk__c.Assigned_To__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <criteriaItems>
            <field>SalesForce_Helpdesk__c.RecordTypeId</field>
            <operation>equals</operation>
            <value>Marketing Request</value>
        </criteriaItems>
        <description>When a marketing request is assigned, send email notification to the Assigned To user</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>EA - Marketing Request Rejected</fullName>
        <actions>
            <name>EA_Marketing_Request_Rejected</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>SalesForce_Helpdesk__c.Request_Status__c</field>
            <operation>equals</operation>
            <value>Rejected</value>
        </criteriaItems>
        <criteriaItems>
            <field>SalesForce_Helpdesk__c.RecordTypeId</field>
            <operation>equals</operation>
            <value>Marketing Request</value>
        </criteriaItems>
        <description>When a marketing request is rejected, send an email to the requester.</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>EA - Pricing Committee Mtg Scheduled</fullName>
        <actions>
            <name>EA_Pricing_Committee_Mtg_Scheduled</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>SalesForce_Helpdesk__c.Date_of_PC_Meeting__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <description>Email alert to the requestor of a pricing committee request when the submitted request has been assigned a Date of PC Meeting</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>EA FU - Additional Information Required</fullName>
        <actions>
            <name>EA_Additional_Information_Required</name>
            <type>Alert</type>
        </actions>
        <actions>
            <name>FU_Additional_Information_Required</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <description>Email notification to requestor when additional information is required and update the request status to &quot;Additional Information Required.&quot;</description>
        <formula>ISCHANGED( Additional_Information_Required__c )</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>EA FU - Helpdesk Ticket Completed</fullName>
        <actions>
            <name>EA_Helpdesk_Ticket_Completed</name>
            <type>Alert</type>
        </actions>
        <actions>
            <name>FU_Completed</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>SalesForce_Helpdesk__c.REQUEST_COMPLETE__c</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <criteriaItems>
            <field>SalesForce_Helpdesk__c.RecordTypeId</field>
            <operation>equals</operation>
            <value>SalesForce Request</value>
        </criteriaItems>
        <criteriaItems>
            <field>User.Email</field>
            <operation>notEqual</operation>
            <value>support@zuerchertech.com</value>
        </criteriaItems>
        <description>When a ticket is completed, alert the ticket owner and update the request status to &quot;Completed.&quot;</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>EA FU - Helpdesk Ticket Submitted</fullName>
        <actions>
            <name>EA_Helpdesk_Ticket_Submitted</name>
            <type>Alert</type>
        </actions>
        <actions>
            <name>FU_Submitted</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>SalesForce_Helpdesk__c.RecordTypeId</field>
            <operation>equals</operation>
            <value>SalesForce Request</value>
        </criteriaItems>
        <criteriaItems>
            <field>SalesForce_Helpdesk__c.SUBMIT_REQUEST__c</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <description>When a ticket is submitted, update the request status to &quot;Submitted.&quot;</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>EA FU - Marketing Request Completed</fullName>
        <actions>
            <name>EA_Marketing_Request_Completed</name>
            <type>Alert</type>
        </actions>
        <actions>
            <name>FU_Marketing_Request_Completed</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>SalesForce_Helpdesk__c.REQUEST_COMPLETE__c</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <criteriaItems>
            <field>SalesForce_Helpdesk__c.RecordTypeId</field>
            <operation>equals</operation>
            <value>Marketing Request</value>
        </criteriaItems>
        <description>When a marketing request is completed, update the request status to &quot;Completed.&quot;</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>EA FU - Marketing Request Submitted</fullName>
        <actions>
            <name>EA_Marketing_Request_Submitted</name>
            <type>Alert</type>
        </actions>
        <actions>
            <name>FU_Marketing_Request_Submitted</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>SalesForce_Helpdesk__c.SUBMIT_REQUEST__c</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <criteriaItems>
            <field>SalesForce_Helpdesk__c.RecordTypeId</field>
            <operation>equals</operation>
            <value>Marketing Request</value>
        </criteriaItems>
        <description>When a marketing request is submitted, update the request status to &quot;Submitted.&quot;</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>EA FU - Pricing Committee Request Completed</fullName>
        <actions>
            <name>EA_Pricing_Committee_Request_Completed</name>
            <type>Alert</type>
        </actions>
        <actions>
            <name>FU_Pricing_Committee_Request_Completed</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>SalesForce_Helpdesk__c.Request_Status__c</field>
            <operation>equals</operation>
            <value>Completed</value>
        </criteriaItems>
        <criteriaItems>
            <field>SalesForce_Helpdesk__c.RecordTypeId</field>
            <operation>equals</operation>
            <value>Pricing Committee Request</value>
        </criteriaItems>
        <description>When a pricing committee request is completed, update the request status to &quot;Completed.&quot;</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>EA FU - Pricing Committee Request Submitted</fullName>
        <actions>
            <name>EA_Pricing_Committee_Request_Submitted</name>
            <type>Alert</type>
        </actions>
        <actions>
            <name>FU_Pricing_Committee_Request_Submitted</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>SalesForce_Helpdesk__c.SUBMIT_REQUEST__c</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <criteriaItems>
            <field>SalesForce_Helpdesk__c.RecordTypeId</field>
            <operation>equals</operation>
            <value>Pricing Committee Request</value>
        </criteriaItems>
        <description>When a pricing committee request is submitted, update the request status to &quot;Submitted.&quot;</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>FU - Completed Date</fullName>
        <actions>
            <name>FU_Completed_Date</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <booleanFilter>1 OR 2</booleanFilter>
        <criteriaItems>
            <field>SalesForce_Helpdesk__c.REQUEST_COMPLETE__c</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <criteriaItems>
            <field>SalesForce_Helpdesk__c.Request_Status__c</field>
            <operation>equals</operation>
            <value>Completed</value>
        </criteriaItems>
        <description>Auto populates the completed date when &quot;Request Complete&quot; is done.</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>FU - Helpdesk Ticket Assigned</fullName>
        <actions>
            <name>FU_Assigned</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>SalesForce_Helpdesk__c.Assigned_To__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <criteriaItems>
            <field>SalesForce_Helpdesk__c.RecordTypeId</field>
            <operation>equals</operation>
            <value>SalesForce Request</value>
        </criteriaItems>
        <criteriaItems>
            <field>SalesForce_Helpdesk__c.REQUEST_COMPLETE__c</field>
            <operation>equals</operation>
            <value>False</value>
        </criteriaItems>
        <description>When a ticket is assigned, update the request status to &quot;In Process.&quot;</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>FU - Marketing Request Assigned</fullName>
        <actions>
            <name>FU_Marketing_Request_Assigned</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>SalesForce_Helpdesk__c.Assigned_To__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <criteriaItems>
            <field>SalesForce_Helpdesk__c.RecordTypeId</field>
            <operation>equals</operation>
            <value>Marketing Request</value>
        </criteriaItems>
        <description>When a marketing request is assigned, update the request status to &quot;In Process.&quot;</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>FU - Pricing Committee Approved</fullName>
        <actions>
            <name>EA_Pricing_Committee_Request_Approved</name>
            <type>Alert</type>
        </actions>
        <actions>
            <name>FU_Pricing_Committee_Approved</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>SalesForce_Helpdesk__c.Approved__c</field>
            <operation>equals</operation>
            <value>Yes</value>
        </criteriaItems>
        <criteriaItems>
            <field>SalesForce_Helpdesk__c.RecordTypeId</field>
            <operation>equals</operation>
            <value>Pricing Committee Request</value>
        </criteriaItems>
        <description>When a pricing committee request is approved, update the request status to &quot;Approved.&quot;</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>FU - Pricing Committee Rejected</fullName>
        <actions>
            <name>FU_Pricing_Committee_Rejected</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>SalesForce_Helpdesk__c.Approved__c</field>
            <operation>equals</operation>
            <value>No</value>
        </criteriaItems>
        <criteriaItems>
            <field>SalesForce_Helpdesk__c.RecordTypeId</field>
            <operation>equals</operation>
            <value>Pricing Committee Request</value>
        </criteriaItems>
        <description>When a pricing committee request is rejected, update the request status to &quot;Rejected.&quot;</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>FU - Pricing Committee Request Assigned</fullName>
        <actions>
            <name>FU_Pricing_Committee_Request_Assigned</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>SalesForce_Helpdesk__c.Assigned_To__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <criteriaItems>
            <field>SalesForce_Helpdesk__c.RecordTypeId</field>
            <operation>equals</operation>
            <value>Pricing Committee Request</value>
        </criteriaItems>
        <description>When a pricing committee request is assigned, update the request status to &quot;In Process.&quot;</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
</Workflow>
