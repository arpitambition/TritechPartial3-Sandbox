<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <alerts>
        <fullName>Contact_Portal_Request_Alert</fullName>
        <description>Contact Portal Request Alert</description>
        <protected>false</protected>
        <recipients>
            <recipient>jen.vansant@tritech.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>tiffany.lienhard@tritech.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>tyler.harman@tritech.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/Contact_Portal_Request_Email</template>
    </alerts>
    <alerts>
        <fullName>EA_Inactive_Contact_Notification</fullName>
        <ccEmails>proposals@zuerchertech.com</ccEmails>
        <description>EA - Inactive Contact Notification - proposals@zuerchertech.com</description>
        <protected>false</protected>
        <senderType>CurrentUser</senderType>
        <template>Internal_Templates/Z_Inactive_Contacts_Check</template>
    </alerts>
    <fieldUpdates>
        <fullName>FU_Inactive_Contact</fullName>
        <field>Primary_Contact_WMP__c</field>
        <literalValue>0</literalValue>
        <name>FU - Inactive Contact</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>sctest</fullName>
        <field>Customer_Portal_User__c</field>
        <literalValue>0</literalValue>
        <name>sctes</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates>
    <rules>
        <fullName>EA - Contact Portal Request_Existing Contact Changes</fullName>
        <actions>
            <name>Contact_Portal_Request_Alert</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <description>Sends an email to SF Admin team when the CSC Portal Access Request field is edited on existing contacts.</description>
        <formula>ISCHANGED( CSC_Portal_Access_Request__c )</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>EA - Contact Portal Request_New Contact Requests</fullName>
        <actions>
            <name>Contact_Portal_Request_Alert</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Contact.CreatedDate</field>
            <operation>equals</operation>
            <value>TODAY</value>
        </criteriaItems>
        <criteriaItems>
            <field>Contact.CSC_Portal_Access_Request__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <description>Sends an email to SF Admin team when the CSC Portal Access Request field is not blank on any new contact creation</description>
        <triggerType>onCreateOnly</triggerType>
    </rules>
    <rules>
        <fullName>EA - Z Inactive Contacts</fullName>
        <actions>
            <name>EA_Inactive_Contact_Notification</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <description>When the &quot;inactive contact&quot; box is checked on a contact, an email is sent to proposals@zuerchertech.com</description>
        <formula>AND(ISCHANGED( Inactive_Contact__c ), OR ( CONTAINS( Account.Active_Client_Product_Families__c,&apos;ETI&apos;), CONTAINS( Account.Active_Client_Product_Families__c,&apos;LETG&apos;), CONTAINS( Account.Active_Client_Product_Families__c,&apos;IMPACT&apos;), CONTAINS( Account.Active_Client_Product_Families__c,&apos;IMC&apos;), CONTAINS( Account.Active_Client_Product_Families__c,&apos;Zuercher&apos;)), Inactive_Contact__c = TRUE)</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>FU - Z Active Contacts Check</fullName>
        <actions>
            <name>FU_Inactive_Contact</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Contact.Inactive_Contact__c</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <criteriaItems>
            <field>Contact.Primary_Contact_WMP__c</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
</Workflow>
