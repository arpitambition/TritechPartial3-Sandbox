<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <alerts>
        <fullName>EA_Registered_Campaign</fullName>
        <description>EA - Registered Campaign</description>
        <protected>false</protected>
        <recipients>
            <recipient>jennifer.gerrietts@tritech.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>jennifer.whitcomb@tritech.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>jeromy.johnson@tritech.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>kerry.lovell@zuerchertech.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>krista.palmer@tritech.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>melanie.mitzel@tritech.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>samantha.sorrells@tritech.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Internal_Templates/Registered_Campaign</template>
    </alerts>
    <rules>
        <fullName>EA - Registered Campaign</fullName>
        <actions>
            <name>EA_Registered_Campaign</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Campaign.Status</field>
            <operation>equals</operation>
            <value>Registered</value>
        </criteriaItems>
        <description>When the “Status” drop down is set to “Registered”, send email to Melanie Mitzel, Jennifer Gerrietts, Krista Palmer, Samantha Sorrells, and Jeromy Johnson with campaign name, start and end date, booth reps, and a link to the campaign</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
</Workflow>
