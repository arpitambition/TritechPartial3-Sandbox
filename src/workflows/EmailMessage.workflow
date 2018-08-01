<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <fieldUpdates>
        <fullName>FU_Zuercher_Email_add</fullName>
        <field>Email_Added_Date_Time_Update__c</field>
        <formula>NOW()</formula>
        <name>FU - Zuercher Email add</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <targetObject>ParentId</targetObject>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>LETG_Case_Assignment</fullName>
        <field>OwnerId</field>
        <lookupValue>LETG_Support_Queue</lookupValue>
        <lookupValueType>Queue</lookupValueType>
        <name>LETG Case Assignment</name>
        <notifyAssignee>true</notifyAssignee>
        <operation>LookupValue</operation>
        <protected>false</protected>
        <targetObject>ParentId</targetObject>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Zuercher_Case_Assignment</fullName>
        <field>OwnerId</field>
        <lookupValue>Zuercher_Support_Queue</lookupValue>
        <lookupValueType>Queue</lookupValueType>
        <name>Zuercher Case Assignment</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>LookupValue</operation>
        <protected>false</protected>
        <targetObject>ParentId</targetObject>
    </fieldUpdates>
    <rules>
        <fullName>FU - LETG Assignment</fullName>
        <actions>
            <name>LETG_Case_Assignment</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <formula>AND(
 OR(
   CONTAINS(Headers,&quot;letg.com&quot;),
   CONTAINS(Headers,&quot;letgsupport@zuerchertech.com&quot;)
    ),
 Parent.Owner:User.Username = &quot;jen.vansant@tritech.com&quot;
)</formula>
        <triggerType>onCreateOnly</triggerType>
    </rules>
    <rules>
        <fullName>FU - Update Ticket with Date Recvd</fullName>
        <actions>
            <name>FU_Zuercher_Email_add</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>EmailMessage.CreatedDate</field>
            <operation>notEqual</operation>
            <value>12/31/1899 11:00 PM</value>
        </criteriaItems>
        <triggerType>onCreateOnly</triggerType>
    </rules>
    <rules>
        <fullName>FU - Zuercher Assignment</fullName>
        <actions>
            <name>Zuercher_Case_Assignment</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <formula>AND(
 CONTAINS(Headers,&quot;zuerchertech.com&quot;),
 Parent.Owner:User.Username = &quot;jen.vansant@tritech.com&quot;
)</formula>
        <triggerType>onCreateOnly</triggerType>
    </rules>
</Workflow>
