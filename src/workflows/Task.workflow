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
        <fullName>FU_Reporting_on_TASK_type</fullName>
        <description>Field update Activity Type_For Reporting for use in reporting functionality</description>
        <field>Activity_Type_For_Reporting__c</field>
        <formula>TEXT( Type )</formula>
        <name>FU_Reporting on TASK type</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Task_Type_Update_Call</fullName>
        <field>Type</field>
        <literalValue>Call</literalValue>
        <name>Task Type Update = Call</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Task_Type_Update_Email</fullName>
        <field>Type</field>
        <literalValue>Email</literalValue>
        <name>Task Type Update = Email</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Type_Email</fullName>
        <description>Change the Type to Email</description>
        <field>Type</field>
        <literalValue>Email</literalValue>
        <name>Type Email</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates>
    <rules>
        <fullName>FU - Comments Summary for Tasks</fullName>
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
        <fullName>FU - Reporting on TASK type</fullName>
        <actions>
            <name>FU_Reporting_on_TASK_type</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Task.Type</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <description>When creating a Custom Report Type (CRT) using activities you will lose the ability to report on Type - Using &quot;Activity Type_For Reporting&quot; custom field to report with.</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>FU - Task Type Field Update %3D Call</fullName>
        <actions>
            <name>Task_Type_Update_Call</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Task.Subject</field>
            <operation>contains</operation>
            <value>Call</value>
        </criteriaItems>
        <description>If a task is created that includes &quot;Call&quot; in the subject, then task type = Call</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>FU - Task Type Field Update %3D Email</fullName>
        <actions>
            <name>Task_Type_Update_Email</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <booleanFilter>1 OR 2</booleanFilter>
        <criteriaItems>
            <field>Task.Subject</field>
            <operation>startsWith</operation>
            <value>Email</value>
        </criteriaItems>
        <criteriaItems>
            <field>Task.Subject</field>
            <operation>contains</operation>
            <value>email</value>
        </criteriaItems>
        <description>If a task is created that includes &quot;Email&quot; in the subject, then task type = Email</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
</Workflow>
