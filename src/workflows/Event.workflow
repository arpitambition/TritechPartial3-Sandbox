<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <fieldUpdates>
        <fullName>FU_Comments_Summary</fullName>
        <description>Field update to the Comments Summary field, which is essentially a preview of the Comments field of up to the first 80 characters.</description>
        <field>Comments_Summary__c</field>
        <formula>left(Description,80)</formula>
        <name>FU - Comments Summary</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>FU_Reporting_on_EVENT_type</fullName>
        <description>Field update Activity Type_For Reporting for use in reporting functionality</description>
        <field>Activity_Type_For_Reporting__c</field>
        <formula>TEXT( Type )</formula>
        <name>FU_Reporting on EVENT type</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates>
    <rules>
        <fullName>FU - Comments Summary for Events</fullName>
        <actions>
            <name>FU_Comments_Summary</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <description>Workflow that triggers a field update to the Comments Summary field, which is essentially a preview of the Comments field of up to the first 80 characters.</description>
        <formula>and(!ispickval(Type,&apos;Email&apos;),
OR(ISNEW(), ISCHANGED( Description ),ISCHANGED(Type)))</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>FU - Reporting on EVENT type</fullName>
        <actions>
            <name>FU_Reporting_on_EVENT_type</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Event.Type</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <description>When creating a Custom Report Type (CRT) using activities you will lose the ability to report on Type - Using &quot;Activity Type_For Reporting&quot; custom field to report with.</description>
        <triggerType>onAllChanges</triggerType>
    </rules>
</Workflow>
