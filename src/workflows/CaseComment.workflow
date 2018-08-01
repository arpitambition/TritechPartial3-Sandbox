<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <fieldUpdates>
        <fullName>Ticket_Comment_Added_Date_Time_Update</fullName>
        <field>Ticket_Comment_Added_Date_Time_Update__c</field>
        <formula>NOW()</formula>
        <name>Ticket Comment Added Date/Time Update</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <targetObject>ParentId</targetObject>
    </fieldUpdates>
    <rules>
        <fullName>EA - Tiburon - Public Comment</fullName>
        <active>false</active>
        <criteriaItems>
            <field>Case.Account_Support_Team__c</field>
            <operation>equals</operation>
            <value>Tiburon</value>
        </criteriaItems>
        <criteriaItems>
            <field>CaseComment.IsPublished</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>FU - Ticket Comment Added Date%2FTime Update</fullName>
        <actions>
            <name>Ticket_Comment_Added_Date_Time_Update</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <description>Update the Ticket field: Ticket Comment Added Date/Time Update when a new ticket comment is added.  This will update the last modified date automatically whenever a new comment is added.</description>
        <formula>True</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
</Workflow>
