<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <alerts>
        <fullName>EA_Completed_Pricing_Request_Form</fullName>
        <description>EA - Completed Pricing Request Form</description>
        <protected>false</protected>
        <recipients>
            <type>owner</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Sales_and_Quote_Email_Templates/Pricing_Request_Form_Complete</template>
    </alerts>
    <alerts>
        <fullName>EA_New_Pricing_Request_Form</fullName>
        <description>EA - New Pricing Request Form (Large)</description>
        <protected>false</protected>
        <recipients>
            <type>owner</type>
        </recipients>
        <recipients>
            <recipient>jazmin.merriweather@tritech.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>shawn.carpenter@tritech.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>victoria.lindsay@tritech.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Sales_and_Quote_Email_Templates/Pricing_Request_Form_New</template>
    </alerts>
    <alerts>
        <fullName>EA_New_Pricing_Request_Form_Assigned_CSL</fullName>
        <description>EA - New Pricing Request Form - Assigned CSL</description>
        <protected>false</protected>
        <recipients>
            <type>owner</type>
        </recipients>
        <recipients>
            <field>Assigned_CSL__c</field>
            <type>userLookup</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Sales_and_Quote_Email_Templates/New_Pricing_Request_Assigned</template>
    </alerts>
    <alerts>
        <fullName>EA_New_Pricing_Request_Form_Assigned_Pricing_Manager</fullName>
        <description>EA - New Pricing Request Form - Assigned Pricing Manager</description>
        <protected>false</protected>
        <recipients>
            <type>owner</type>
        </recipients>
        <recipients>
            <field>Assigned_Pricing_Manager__c</field>
            <type>userLookup</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Sales_and_Quote_Email_Templates/New_Pricing_Request_Assigned</template>
    </alerts>
    <alerts>
        <fullName>EA_New_Pricing_Request_Form_Assigned_Proposal_Manager</fullName>
        <description>EA - New Pricing Request Form - Assigned Proposal Manager</description>
        <protected>false</protected>
        <recipients>
            <type>owner</type>
        </recipients>
        <recipients>
            <field>Assigned_Proposal_Manager__c</field>
            <type>userLookup</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Sales_and_Quote_Email_Templates/New_Pricing_Request_Assigned</template>
    </alerts>
    <alerts>
        <fullName>EA_New_Pricing_Request_Form_Mananger_Andy_Dean</fullName>
        <description>EA - New Pricing Request Form_Mananger Andy Dean</description>
        <protected>false</protected>
        <recipients>
            <recipient>andrew.dean@tritech.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Sales_and_Quote_Email_Templates/Pricing_Request_Form_New</template>
    </alerts>
    <alerts>
        <fullName>EA_New_Pricing_Request_Form_Mananger_Bob_Brown</fullName>
        <description>EA - New Pricing Request Form_Mananger Bob Brown</description>
        <protected>false</protected>
        <recipients>
            <recipient>bob.brown@tritech.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Sales_and_Quote_Email_Templates/Pricing_Request_Form_New</template>
    </alerts>
    <alerts>
        <fullName>EA_New_Pricing_Request_Form_Mananger_Bob_Koenig</fullName>
        <description>EA - New Pricing Request Form_Mananger Bob Koenig</description>
        <protected>false</protected>
        <recipients>
            <recipient>bob.koenig@tritech.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Sales_and_Quote_Email_Templates/Pricing_Request_Form_New</template>
    </alerts>
    <alerts>
        <fullName>EA_New_Pricing_Request_Form_Mananger_Ed_Bean</fullName>
        <description>EA - New Pricing Request Form_Mananger Ed Bean</description>
        <protected>false</protected>
        <recipients>
            <recipient>edbean@tritech.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Sales_and_Quote_Email_Templates/Pricing_Request_Form_New</template>
    </alerts>
    <alerts>
        <fullName>EA_New_Pricing_Request_Form_Mananger_Robert_McGrath</fullName>
        <description>EA - New Pricing Request Form_Mananger Robert McGrath</description>
        <protected>false</protected>
        <recipients>
            <recipient>robert.mcgrath@tritech.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Sales_and_Quote_Email_Templates/Pricing_Request_Form_New</template>
    </alerts>
    <alerts>
        <fullName>EA_New_Pricing_Request_Form_Non_Large_AM_EAST</fullName>
        <description>EA - New Pricing Request Form (Non-Large) - AM EAST</description>
        <protected>false</protected>
        <recipients>
            <type>owner</type>
        </recipients>
        <recipients>
            <recipient>edbean@tritech.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Sales_and_Quote_Email_Templates/Pricing_Request_Form_New</template>
    </alerts>
    <alerts>
        <fullName>EA_New_Pricing_Request_Form_Non_Large_AM_WEST</fullName>
        <description>EA - New Pricing Request Form (Non-Large) - AM WEST</description>
        <protected>false</protected>
        <recipients>
            <type>owner</type>
        </recipients>
        <recipients>
            <recipient>bob.brown@tritech.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Sales_and_Quote_Email_Templates/Pricing_Request_Form_New</template>
    </alerts>
    <alerts>
        <fullName>EA_Rejected_Pricing_Request_Form</fullName>
        <description>EA - Rejected Pricing Request Form</description>
        <protected>false</protected>
        <recipients>
            <type>owner</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Sales_and_Quote_Email_Templates/Pricing_Request_Form_Rejected</template>
    </alerts>
    <alerts>
        <fullName>EA_Zuercher_New_Proposal_Request_Form</fullName>
        <ccEmails>proposals@zuerchertech.com</ccEmails>
        <description>EA - Zuercher New Proposal Request Form</description>
        <protected>false</protected>
        <recipients>
            <type>owner</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Sales_and_Quote_Email_Templates/Zuercher_Proposal_Request_Form_New</template>
    </alerts>
    <alerts>
        <fullName>EA_Zuercher_New_Proposal_Request_Form_Assigned</fullName>
        <description>EA - Zuercher New Proposal Request Form Assigned</description>
        <protected>false</protected>
        <recipients>
            <field>Z_Assigned_To__c</field>
            <type>userLookup</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Sales_and_Quote_Email_Templates/Zuercher_Proposal_Request_Form_New</template>
    </alerts>
    <fieldUpdates>
        <fullName>FU_Completed_By</fullName>
        <field>Quote_Completed_By__c</field>
        <formula>$User.FirstName + &quot; &quot; +$User.LastName</formula>
        <name>FU - Completed By</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>FU_Date_Completed</fullName>
        <field>Date_Completed__c</field>
        <formula>TODAY()</formula>
        <name>FU - Date Completed</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>FU_PRF_Completed</fullName>
        <field>Request_Status__c</field>
        <literalValue>Complete</literalValue>
        <name>FU - PRF Completed</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>FU_PRF_In_Progress</fullName>
        <description>Field update to the &quot;Request Status&quot; field to In Progress when an &quot;Assigned Pricing Manager&quot; is selected.</description>
        <field>Request_Status__c</field>
        <literalValue>In Progress</literalValue>
        <name>FU - PRF In Progress</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>FU_PRF_Submitted</fullName>
        <description>Field update to the &quot;Request Status&quot; field to Submitted when a pricing/proposal request form is submitted by a user</description>
        <field>Request_Status__c</field>
        <literalValue>Submitted</literalValue>
        <name>FU - PRF Submitted</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>FU_Quote_Completed_By</fullName>
        <description>Field update to the &quot;Completed By&quot; field to show the user who completed the pricing for the PRF</description>
        <field>Quote_Completed_By__c</field>
        <formula>$User.FirstName + &quot; &quot; + $User.LastName</formula>
        <name>FU Quote Completed By</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <rules>
        <fullName>EA - Completed Pricing Request Form</fullName>
        <actions>
            <name>EA_Completed_Pricing_Request_Form</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Pricing_Request_Form__c.QUOTE_COMPLETE__c</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <description>Email notification to owner of the PRF when it is completed</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>EA - Rejected Pricing Request Form</fullName>
        <actions>
            <name>EA_Rejected_Pricing_Request_Form</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Pricing_Request_Form__c.Request_Status__c</field>
            <operation>equals</operation>
            <value>Rejected</value>
        </criteriaItems>
        <description>Email notification to owner of the PRF when it is rejected.</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>EA - TriTech New Pricing Request Assigned_Large Quotes</fullName>
        <actions>
            <name>EA_New_Pricing_Request_Form_Assigned_Pricing_Manager</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Pricing_Request_Form__c.Assigned_Pricing_Manager__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Pricing_Request_Form__c.RecordTypeId</field>
            <operation>equals</operation>
            <value>TriTech Pricing Request Form</value>
        </criteriaItems>
        <description>Email notification to the Pricing Manager and the owner of the PRF when a Pricing Manager is assigned</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>EA - TriTech New Pricing Request Form %28Non-Large%29 - AM EAST</fullName>
        <actions>
            <name>EA_New_Pricing_Request_Form_Non_Large_AM_EAST</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Pricing_Request_Form__c.SUBMIT_PRICING_REQUEST__c</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <criteriaItems>
            <field>Pricing_Request_Form__c.Large_Quote_Projected_Value_250K__c</field>
            <operation>equals</operation>
            <value>False</value>
        </criteriaItems>
        <criteriaItems>
            <field>Pricing_Request_Form__c.Sales_Team__c</field>
            <operation>equals</operation>
            <value>Inform AM East</value>
        </criteriaItems>
        <criteriaItems>
            <field>Pricing_Request_Form__c.RecordTypeId</field>
            <operation>equals</operation>
            <value>TriTech Pricing Request Form</value>
        </criteriaItems>
        <description>Email notification when a non-large quote PRF (&lt;250K) is submitted. Specific to users who are in the Inform AM East sales team.</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>EA - TriTech New Pricing Request Form %28Non-Large%29 - AM WEST</fullName>
        <actions>
            <name>EA_New_Pricing_Request_Form_Non_Large_AM_WEST</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Pricing_Request_Form__c.SUBMIT_PRICING_REQUEST__c</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <criteriaItems>
            <field>Pricing_Request_Form__c.Large_Quote_Projected_Value_250K__c</field>
            <operation>equals</operation>
            <value>False</value>
        </criteriaItems>
        <criteriaItems>
            <field>Pricing_Request_Form__c.Sales_Team__c</field>
            <operation>equals</operation>
            <value>Inform AM West</value>
        </criteriaItems>
        <criteriaItems>
            <field>Pricing_Request_Form__c.RecordTypeId</field>
            <operation>equals</operation>
            <value>TriTech Pricing Request Form</value>
        </criteriaItems>
        <description>Email notification when a non-large quote PRF (&lt;250K) is submitted. Specific to users who are in the Inform AM West sales team.</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>EA - TriTech New Pricing Request Form - CSL Assigned</fullName>
        <actions>
            <name>EA_New_Pricing_Request_Form_Assigned_CSL</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Pricing_Request_Form__c.SUBMIT_PRICING_REQUEST__c</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <criteriaItems>
            <field>Pricing_Request_Form__c.Assigned_CSL__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Pricing_Request_Form__c.RecordTypeId</field>
            <operation>equals</operation>
            <value>TriTech Pricing Request Form</value>
        </criteriaItems>
        <description>Email notification to the associated CSL and the owner of the PRF when a CSL is assigned</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>EA - TriTech New Pricing Request Form - Large</fullName>
        <actions>
            <name>EA_New_Pricing_Request_Form</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Pricing_Request_Form__c.SUBMIT_PRICING_REQUEST__c</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <criteriaItems>
            <field>Pricing_Request_Form__c.Large_Quote_Projected_Value_250K__c</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <criteriaItems>
            <field>Pricing_Request_Form__c.RecordTypeId</field>
            <operation>equals</operation>
            <value>TriTech Pricing Request Form</value>
        </criteriaItems>
        <description>Email notification when a large quote PRF (&gt;250K) is submitted.  Notification to assign appropriate staff.</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>EA - TriTech New Pricing Request Form_Manager Andy Dean</fullName>
        <actions>
            <name>EA_New_Pricing_Request_Form_Mananger_Andy_Dean</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Pricing_Request_Form__c.SUBMIT_PRICING_REQUEST__c</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <criteriaItems>
            <field>User.ManagerId</field>
            <operation>equals</operation>
            <value>Andy Dean</value>
        </criteriaItems>
        <description>Email notification to PRF owner&apos;s manager when a new PRF is submitted for pricing.  Manager = Andy Dean</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>EA - TriTech New Pricing Request Form_Manager Bob Brown</fullName>
        <actions>
            <name>EA_New_Pricing_Request_Form_Mananger_Bob_Brown</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Pricing_Request_Form__c.SUBMIT_PRICING_REQUEST__c</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <criteriaItems>
            <field>User.ManagerId</field>
            <operation>equals</operation>
            <value>Bob Brown</value>
        </criteriaItems>
        <description>Email notification to PRF owner&apos;s manager when a new PRF is submitted for pricing.  Manager = Bob Brown</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>EA - TriTech New Pricing Request Form_Manager Bob Koenig</fullName>
        <actions>
            <name>EA_New_Pricing_Request_Form_Mananger_Bob_Koenig</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Pricing_Request_Form__c.SUBMIT_PRICING_REQUEST__c</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <criteriaItems>
            <field>User.ManagerId</field>
            <operation>equals</operation>
            <value>Bob Koenig</value>
        </criteriaItems>
        <description>Email notification to PRF owner&apos;s manager when a new PRF is submitted for pricing.  Manager = Bob Koenig</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>EA - TriTech New Pricing Request Form_Manager Ed Bean</fullName>
        <actions>
            <name>EA_New_Pricing_Request_Form_Mananger_Ed_Bean</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Pricing_Request_Form__c.SUBMIT_PRICING_REQUEST__c</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <criteriaItems>
            <field>User.ManagerId</field>
            <operation>equals</operation>
            <value>Ed Bean</value>
        </criteriaItems>
        <description>Email notification to PRF owner&apos;s manager when a new PRF is submitted for pricing.  Manager = Ed Bean</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>EA - TriTech New Pricing Request Form_Manager Robert McGrath</fullName>
        <actions>
            <name>EA_New_Pricing_Request_Form_Mananger_Robert_McGrath</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Pricing_Request_Form__c.SUBMIT_PRICING_REQUEST__c</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <criteriaItems>
            <field>User.ManagerId</field>
            <operation>equals</operation>
            <value>Robert McGrath</value>
        </criteriaItems>
        <description>Email notification to PRF owner&apos;s manager when a new PRF is submitted for pricing.  Manager = Robert McGrath</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>EA - TriTech New Pricing Request Proposal Manager Assigned_Large Quotes</fullName>
        <actions>
            <name>EA_New_Pricing_Request_Form_Assigned_Proposal_Manager</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Pricing_Request_Form__c.Assigned_Proposal_Manager__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Pricing_Request_Form__c.RecordTypeId</field>
            <operation>equals</operation>
            <value>TriTech Pricing Request Form</value>
        </criteriaItems>
        <description>Email notification to the Proposal Manager and the owner of the PRF when a Proposal Manager is assigned</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>EA - Zuercher New Pricing Request Assigned</fullName>
        <active>false</active>
        <criteriaItems>
            <field>Pricing_Request_Form__c.Z_Assigned_To__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Pricing_Request_Form__c.RecordTypeId</field>
            <operation>equals</operation>
            <value>Zuercher Proposal Request Form</value>
        </criteriaItems>
        <description>Automated tak to the assigned to user when the proposal request is assigned</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>EA - Zuercher New Proposal Request Form</fullName>
        <actions>
            <name>EA_Zuercher_New_Proposal_Request_Form</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Pricing_Request_Form__c.SUBMIT_PRICING_REQUEST__c</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <criteriaItems>
            <field>Pricing_Request_Form__c.RecordTypeId</field>
            <operation>equals</operation>
            <value>Zuercher Proposal Request Form</value>
        </criteriaItems>
        <description>Email notification when a PRF is submitted.  Notification to Zuercher proposal&apos;s team.</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>EA - Zuercher Proposal Request Form Assigned</fullName>
        <actions>
            <name>EA_Zuercher_New_Proposal_Request_Form_Assigned</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Pricing_Request_Form__c.Z_Assigned_To__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Pricing_Request_Form__c.RecordTypeId</field>
            <operation>equals</operation>
            <value>Zuercher Proposal Request Form</value>
        </criteriaItems>
        <description>Send email to assigned user for proposal request forms for Zuercher</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>FU - Pricing Request Status Completed</fullName>
        <actions>
            <name>FU_PRF_Completed</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Pricing_Request_Form__c.QUOTE_COMPLETE__c</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <description>Field update to the &quot;Request Status&quot; field to Completed when a pricing request form is complete</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>FU - Quote Completed By</fullName>
        <actions>
            <name>FU_Quote_Completed_By</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Pricing_Request_Form__c.QUOTE_COMPLETE__c</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <description>Field update to the &quot;Completed By&quot; field to show the user who completed the pricing for the PRF</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>FU - TriTech Pricing Request Date Completed</fullName>
        <actions>
            <name>FU_Date_Completed</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Pricing_Request_Form__c.RecordTypeId</field>
            <operation>equals</operation>
            <value>TriTech Pricing Request Form</value>
        </criteriaItems>
        <criteriaItems>
            <field>Pricing_Request_Form__c.QUOTE_COMPLETE__c</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <description>Auto populates the Date Completed when &quot;QUOTE COMPLETE&quot; is checked.</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>FU - TriTech Pricing Request Status In Progress</fullName>
        <actions>
            <name>FU_PRF_In_Progress</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Pricing_Request_Form__c.RecordTypeId</field>
            <operation>equals</operation>
            <value>TriTech Pricing Request Form</value>
        </criteriaItems>
        <criteriaItems>
            <field>Pricing_Request_Form__c.SUBMIT_PRICING_REQUEST__c</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <criteriaItems>
            <field>Pricing_Request_Form__c.Assigned_Pricing_Manager__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <description>Field update to the &quot;Request Status&quot; field to In Progress when an &quot;Assigned Pricing Manager&quot; is selected.</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>FU - TriTech Pricing Request Status Submitted</fullName>
        <actions>
            <name>FU_PRF_Submitted</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Pricing_Request_Form__c.RecordTypeId</field>
            <operation>equals</operation>
            <value>TriTech Pricing Request Form</value>
        </criteriaItems>
        <criteriaItems>
            <field>Pricing_Request_Form__c.SUBMIT_PRICING_REQUEST__c</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <criteriaItems>
            <field>Pricing_Request_Form__c.Assigned_Pricing_Manager__c</field>
            <operation>equals</operation>
        </criteriaItems>
        <description>Field update to the &quot;Request Status&quot; field to Submitted when a pricing request form is submitted by a user but the &quot;Assigned Pricing Manager&quot; field is blank.</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>FU - Zuercher Proposal Request Form Completed</fullName>
        <actions>
            <name>FU_Completed_By</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>FU_Date_Completed</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Pricing_Request_Form__c.RecordTypeId</field>
            <operation>equals</operation>
            <value>Zuercher Proposal Request Form</value>
        </criteriaItems>
        <criteriaItems>
            <field>Pricing_Request_Form__c.Z_Status__c</field>
            <operation>equals</operation>
            <value>Completed</value>
        </criteriaItems>
        <description>Field updates to the Date Completed and Completed By fields when the &quot;Status&quot; field equals &quot;Completed.&quot;</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>FU - Zuercher Proposal Request Status Submitted</fullName>
        <actions>
            <name>FU_PRF_Submitted</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Pricing_Request_Form__c.RecordTypeId</field>
            <operation>equals</operation>
            <value>Zuercher Proposal Request Form</value>
        </criteriaItems>
        <criteriaItems>
            <field>Pricing_Request_Form__c.SUBMIT_PRICING_REQUEST__c</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <description>Field update to the &quot;Request Status&quot; field to Submitted when a proposal request form is submitted by a user.</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
</Workflow>
