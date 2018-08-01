<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <alerts>
        <fullName>Welcome_Message_for_Portal_Users</fullName>
        <ccEmails>ken.becker@katchconsulting.com</ccEmails>
        <description>Welcome Message for Portal Users</description>
        <protected>false</protected>
        <recipients>
            <field>Email</field>
            <type>email</type>
        </recipients>
        <senderType>DefaultWorkflowUser</senderType>
        <template>unfiled$public/TriTech_New_Portal_User_Notification</template>
    </alerts>
    <rules>
        <fullName>EA - Welcome email for portal users</fullName>
        <actions>
            <name>Welcome_Message_for_Portal_Users</name>
            <type>Alert</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>User.IsPortalEnabled</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <criteriaItems>
            <field>User.CreatedById</field>
            <operation>equals</operation>
            <value>Ken Becker</value>
        </criteriaItems>
        <triggerType>onCreateOnly</triggerType>
    </rules>
    <rules>
        <fullName>FU - Update Portal User Checkbox</fullName>
        <active>false</active>
        <criteriaItems>
            <field>User.ProfileId</field>
            <operation>contains</operation>
            <value>Portal</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
</Workflow>
