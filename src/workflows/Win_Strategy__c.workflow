<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <alerts>
        <fullName>EA_Send_Win_Strategy_Form</fullName>
        <ccEmails>proposals@tritech.com</ccEmails>
        <description>EA - Send Win Strategy Form</description>
        <protected>false</protected>
        <recipients>
            <type>creator</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Sales_and_Quote_Email_Templates/Win_Strategy_Template</template>
    </alerts>
    <fieldUpdates>
        <fullName>FU_Executive_Summary_Update</fullName>
        <description>Pulls in the Executive Summary information from the Opportunity if the field is null on the Win Strategy form.</description>
        <field>Executive_Summary__c</field>
        <formula>Opportunity__r.Description</formula>
        <name>FU - Executive Summary Update</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates>
    <rules>
        <fullName>EA - Send Win Strategy Form</fullName>
        <actions>
            <name>EA_Send_Win_Strategy_Form</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Win_Strategy__c.COMPLETE_SEND__c</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <description>Sends win strategy form when Complete &amp; Send is checked</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>FU - Executive Summary Update</fullName>
        <actions>
            <name>FU_Executive_Summary_Update</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Win_Strategy__c.Executive_Summary__c</field>
            <operation>equals</operation>
        </criteriaItems>
        <description>Pulls the executive summary from the Opp if empty</description>
        <triggerType>onAllChanges</triggerType>
    </rules>
</Workflow>
