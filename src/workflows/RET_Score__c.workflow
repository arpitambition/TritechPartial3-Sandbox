<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <alerts>
        <fullName>EA_RET_Score_Status_Approved</fullName>
        <description>EA - RET Score Status Approved</description>
        <protected>false</protected>
        <recipients>
            <type>creator</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Sales_and_Quote_Email_Templates/Pricing_Meeting_Account_Info_Needed</template>
    </alerts>
    <alerts>
        <fullName>EA_Send_RET_Score_Email</fullName>
        <ccEmails>RFPReceived@tritech.com</ccEmails>
        <description>EA - Send RET Score Email</description>
        <protected>false</protected>
        <recipients>
            <recipient>andrew.dean@tritech.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>bob.brown@tritech.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>bob.koenig@tritech.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>edbean@tritech.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>josie.donnelly@tritech.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>robert.mcgrath@tritech.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Sales_and_Quote_Email_Templates/RET_Approved_Template</template>
    </alerts>
    <alerts>
        <fullName>EA_Send_RET_Score_Email_for_Approval</fullName>
        <description>EA - Send RET Score Email for Approval BobK</description>
        <protected>false</protected>
        <recipients>
            <type>creator</type>
        </recipients>
        <recipients>
            <recipient>bob.koenig@tritech.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Sales_and_Quote_Email_Templates/RET_Approval_Required_Template</template>
    </alerts>
    <alerts>
        <fullName>EA_Send_RET_Score_Email_for_Approval_AndyDean</fullName>
        <description>EA - Send RET Score Email for Approval AndyDean</description>
        <protected>false</protected>
        <recipients>
            <type>creator</type>
        </recipients>
        <recipients>
            <recipient>andrew.dean@tritech.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Sales_and_Quote_Email_Templates/RET_Approval_Required_Template</template>
    </alerts>
    <alerts>
        <fullName>EA_Send_RET_Score_Email_for_Approval_BobB</fullName>
        <description>EA - Send RET Score Email for Approval BobB</description>
        <protected>false</protected>
        <recipients>
            <type>creator</type>
        </recipients>
        <recipients>
            <recipient>bob.brown@tritech.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Sales_and_Quote_Email_Templates/RET_Approval_Required_Template</template>
    </alerts>
    <alerts>
        <fullName>EA_Send_RET_Score_Email_for_Approval_EdB</fullName>
        <description>EA - Send RET Score Email for Approval EdB</description>
        <protected>false</protected>
        <recipients>
            <type>creator</type>
        </recipients>
        <recipients>
            <recipient>edbean@tritech.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Sales_and_Quote_Email_Templates/RET_Approval_Required_Template</template>
    </alerts>
    <alerts>
        <fullName>EA_Send_RET_Score_Email_for_Approval_KarlaH</fullName>
        <description>EA - Send RET Score Email for Approval KarlaH</description>
        <protected>false</protected>
        <recipients>
            <type>creator</type>
        </recipients>
        <recipients>
            <recipient>karla.hageman@tritech.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Sales_and_Quote_Email_Templates/RET_Approval_Required_Template</template>
    </alerts>
    <alerts>
        <fullName>EA_Send_RET_Score_Email_for_Approval_RobertM</fullName>
        <description>EA - Send RET Score Email for Approval RobertM</description>
        <protected>false</protected>
        <recipients>
            <type>creator</type>
        </recipients>
        <recipients>
            <recipient>robert.mcgrath@tritech.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Sales_and_Quote_Email_Templates/RET_Approval_Required_Template</template>
    </alerts>
    <fieldUpdates>
        <fullName>FU_Bid_No_Bid_Decision_Date</fullName>
        <field>Bid_No_Bid_Decision_Date__c</field>
        <formula>LastModifiedDate</formula>
        <name>FU - Bid/No Bid Decision Date</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <targetObject>Opportunity__c</targetObject>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>FU_RET_Manager_Approved_By</fullName>
        <description>Updates the &quot;Manager Approved By&quot; field on the RET Score object when &quot;MANAGER APPROVED&quot; field is checked</description>
        <field>Manager_Approved_Date_Time__c</field>
        <formula>&quot;Approved by &quot; &amp;LastModifiedBy.FirstName&amp;&quot; &quot;&amp; LastModifiedBy.LastName&amp; &quot; on &quot; &amp;  Text(MONTH(DATEVALUE(LastModifiedDate)))&amp;&quot;/&quot;&amp;Text(DAY(DATEVALUE(LastModifiedDate)))&amp;&quot;/&quot;&amp;Text(YEAR(DATEVALUE(LastModifiedDate)))</formula>
        <name>FU - RET Manager Approved By</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>FU_RET_Status_Approved</fullName>
        <field>Status__c</field>
        <literalValue>Approved</literalValue>
        <name>FU - RET Status Approved</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <rules>
        <fullName>EA - RET Score Status Approved</fullName>
        <actions>
            <name>EA_RET_Score_Status_Approved</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>RET_Score__c.Status__c</field>
            <operation>equals</operation>
            <value>Approved</value>
        </criteriaItems>
        <description>When RET Score Status equals approved, email the RET creator.</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>EA - Send RET Score Email after Approval</fullName>
        <actions>
            <name>EA_Send_RET_Score_Email</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>RET_Score__c.MANAGER_APPROVED__c</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.Account_Name__c</field>
            <operation>notContain</operation>
            <value>Test</value>
        </criteriaItems>
        <description>When the &quot;MANAGER APPROVED&quot; checkbox is checked, an email is sent to the *RFP Received email group</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>EA - Send RET Score Email for Manager Approval AndyD</fullName>
        <actions>
            <name>EA_Send_RET_Score_Email_for_Approval_AndyDean</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>RET_Score__c.COMPLETE_SEND_TO_MANAGER__c</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <criteriaItems>
            <field>RET_Score__c.Approval_Manager__c</field>
            <operation>equals</operation>
            <value>Andy Dean</value>
        </criteriaItems>
        <description>When the &quot;Complete &amp; Send to Manager&quot; checkbox is checked, an email is sent to the the user&apos;s manager for approval (Andy Dean)</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>EA - Send RET Score Email for Manager Approval BobB</fullName>
        <actions>
            <name>EA_Send_RET_Score_Email_for_Approval_BobB</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>RET_Score__c.COMPLETE_SEND_TO_MANAGER__c</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <criteriaItems>
            <field>RET_Score__c.Approval_Manager__c</field>
            <operation>equals</operation>
            <value>Bob Brown</value>
        </criteriaItems>
        <description>When the &quot;Complete &amp; Send to Manager&quot; checkbox is checked, an email is sent to the the user&apos;s manager for approval (Bob Brown)</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>EA - Send RET Score Email for Manager Approval BobK</fullName>
        <actions>
            <name>EA_Send_RET_Score_Email_for_Approval</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>RET_Score__c.COMPLETE_SEND_TO_MANAGER__c</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <criteriaItems>
            <field>RET_Score__c.Approval_Manager__c</field>
            <operation>equals</operation>
            <value>Bob Koenig</value>
        </criteriaItems>
        <description>When the &quot;Complete &amp; Send to Manager&quot; checkbox is checked, an email is sent to the the user&apos;s manager for approval (Bob Koenig)</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>EA - Send RET Score Email for Manager Approval EdB</fullName>
        <actions>
            <name>EA_Send_RET_Score_Email_for_Approval_EdB</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>RET_Score__c.COMPLETE_SEND_TO_MANAGER__c</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <criteriaItems>
            <field>RET_Score__c.Approval_Manager__c</field>
            <operation>equals</operation>
            <value>Ed Bean</value>
        </criteriaItems>
        <description>When the &quot;Complete &amp; Send to Manager&quot; checkbox is checked, an email is sent to the the user&apos;s manager for approval (Ed Bean)</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>EA - Send RET Score Email for Manager Approval KarlaH</fullName>
        <actions>
            <name>EA_Send_RET_Score_Email_for_Approval_KarlaH</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>RET_Score__c.COMPLETE_SEND_TO_MANAGER__c</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <criteriaItems>
            <field>RET_Score__c.Approval_Manager__c</field>
            <operation>equals</operation>
            <value>Karla Hageman</value>
        </criteriaItems>
        <description>When the &quot;Complete &amp; Send to Manager&quot; checkbox is checked, an email is sent to the the user&apos;s manager for approval (Karla H)</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>EA - Send RET Score Email for Manager Approval RobertM</fullName>
        <actions>
            <name>EA_Send_RET_Score_Email_for_Approval_RobertM</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>RET_Score__c.COMPLETE_SEND_TO_MANAGER__c</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <criteriaItems>
            <field>RET_Score__c.Approval_Manager__c</field>
            <operation>equals</operation>
            <value>Robert McGrath</value>
        </criteriaItems>
        <description>When the &quot;Complete &amp; Send to Manager&quot; checkbox is checked, an email is sent to the the user&apos;s manager for approval (Robert McGrath)</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>FU - Manager Approved Date and Time</fullName>
        <actions>
            <name>FU_Bid_No_Bid_Decision_Date</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>FU_RET_Manager_Approved_By</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <description>Updates the RET Approved By: field when the manager checks the &quot;MANAGER APPROVED&quot; checkbox.</description>
        <formula>MANAGER_APPROVED__c = True</formula>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>FU - RET Status Approved</fullName>
        <actions>
            <name>FU_RET_Status_Approved</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>RET_Score__c.MANAGER_APPROVED__c</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <description>When &quot;MANAGER APPROVED&quot; is true, update the RET Status to &quot;Approved&quot;</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
</Workflow>
