<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <alerts>
        <fullName>Demo_Team_Change</fullName>
        <description>Demo Team Change</description>
        <protected>false</protected>
        <recipients>
            <recipient>denelle.reiners@tritech.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>nikki.britto@tritech.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>tcthomas@tritech.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Sales_and_Quote_Email_Templates/Demo_Request_Demo_Start_End_time_Change</template>
    </alerts>
    <alerts>
        <fullName>EA_AV_Request_for_Demos</fullName>
        <description>EA - AV Request for Demos</description>
        <protected>false</protected>
        <recipients>
            <recipient>denelle.reiners@tritech.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>nicole.kuy@tritech.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Sales_and_Quote_Email_Templates/AV_Request</template>
    </alerts>
    <alerts>
        <fullName>EA_Demo_Assignment_cc_to_Owner_and_Manager</fullName>
        <description>EA - Demo Assignment cc to Owner and Manager</description>
        <protected>false</protected>
        <recipients>
            <type>creator</type>
        </recipients>
        <recipients>
            <field>Manager_Email__c</field>
            <type>email</type>
        </recipients>
        <recipients>
            <recipient>denelle.reiners@tritech.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>nicole.kuy@tritech.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>nikki.britto@tritech.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>robert.mabe@tritech.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>tcthomas@tritech.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Sales_and_Quote_Email_Templates/Demo_Request_Team_Assignments_Manager_Notification</template>
    </alerts>
    <alerts>
        <fullName>EA_Demo_Request</fullName>
        <description>EA - Demo Request</description>
        <protected>false</protected>
        <recipients>
            <type>creator</type>
        </recipients>
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
            <recipient>denelle.reiners@tritech.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>edbean@tritech.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>nicole.kuy@tritech.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>nikki.britto@tritech.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>robert.mabe@tritech.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>tcthomas@tritech.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Sales_and_Quote_Email_Templates/Demo_Request_Template</template>
    </alerts>
    <alerts>
        <fullName>EA_Demo_Request_7_Days_Prior</fullName>
        <description>EA - Demo Request 7 Days Prior</description>
        <protected>false</protected>
        <recipients>
            <recipient>denelle.reiners@tritech.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>nicole.kuy@tritech.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Sales_and_Quote_Email_Templates/Demo_Request_Template</template>
    </alerts>
    <alerts>
        <fullName>EA_Demo_Request_Additional_Info_Required</fullName>
        <description>EA - Demo Request - Additional Info Required</description>
        <protected>false</protected>
        <recipients>
            <type>creator</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Sales_and_Quote_Email_Templates/Demo_Request_Additional_Info_Required</template>
    </alerts>
    <alerts>
        <fullName>EA_Demo_Request_Zuercher</fullName>
        <description>EA - Demo Request Zuercher</description>
        <protected>false</protected>
        <recipients>
            <type>creator</type>
        </recipients>
        <recipients>
            <recipient>bruce.baartman@tritech.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>jennifer.whitcomb@tritech.com</recipient>
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
        <senderType>CurrentUser</senderType>
        <template>Sales_and_Quote_Email_Templates/Demo_Request_Template_Zuercher</template>
    </alerts>
    <alerts>
        <fullName>EA_Demo_Team_Becca_Webb</fullName>
        <description>EA - Demo Team - Becca Webb</description>
        <protected>false</protected>
        <recipients>
            <recipient>rebecca.webb@tritech.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Sales_and_Quote_Email_Templates/Demo_Request_Demo_Team_Assignment</template>
    </alerts>
    <alerts>
        <fullName>EA_Demo_Team_Catering_Request_Complete_Denelle</fullName>
        <description>EA - Demo Team - Catering Request Complete - Denelle</description>
        <protected>false</protected>
        <recipients>
            <recipient>denelle.reiners@tritech.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Sales_and_Quote_Email_Templates/Demo_Request_Catering_Request_Complete</template>
    </alerts>
    <alerts>
        <fullName>EA_Demo_Team_David_Amaya</fullName>
        <description>EA - Demo Team - David Amaya</description>
        <protected>false</protected>
        <recipients>
            <recipient>david.amaya@tritech.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Sales_and_Quote_Email_Templates/Demo_Request_Demo_Team_Assignment</template>
    </alerts>
    <alerts>
        <fullName>EA_Demo_Team_Karen_Southerland</fullName>
        <description>EA - Demo Team - Karen Southerland</description>
        <protected>false</protected>
        <recipients>
            <recipient>karen.southerland@tritech.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Sales_and_Quote_Email_Templates/Demo_Request_Demo_Team_Assignment</template>
    </alerts>
    <alerts>
        <fullName>EA_Demo_Team_Kelly_Fontes</fullName>
        <description>EA - Demo Team - Kelly Fontes</description>
        <protected>false</protected>
        <recipients>
            <recipient>kelly.fontes@tritech.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Sales_and_Quote_Email_Templates/Demo_Request_Demo_Team_Assignment</template>
    </alerts>
    <alerts>
        <fullName>EA_Demo_Team_Liz_Byers</fullName>
        <description>EA - Demo Team - Liz Byers</description>
        <protected>false</protected>
        <recipients>
            <recipient>liz.byers@tritech.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Sales_and_Quote_Email_Templates/Demo_Request_Demo_Team_Assignment</template>
    </alerts>
    <alerts>
        <fullName>EA_Demo_Team_Matt_Klein</fullName>
        <description>EA - Demo Team - Matt Klein</description>
        <protected>false</protected>
        <recipients>
            <recipient>matt.klein@tritech.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Sales_and_Quote_Email_Templates/Demo_Request_Demo_Team_Assignment</template>
    </alerts>
    <alerts>
        <fullName>EA_Demo_Team_Nikki_Britto</fullName>
        <description>EA - Demo Team - Nikki Britto</description>
        <protected>false</protected>
        <recipients>
            <recipient>nikki.britto@tritech.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Sales_and_Quote_Email_Templates/Demo_Request_Demo_Team_Assignment</template>
    </alerts>
    <alerts>
        <fullName>EA_Demo_Team_Paul_Labriola</fullName>
        <description>EA - Demo Team - Paul Labriola</description>
        <protected>false</protected>
        <recipients>
            <recipient>paul.labriola@zuerchertech.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Sales_and_Quote_Email_Templates/Demo_Request_Demo_Team_Assignment</template>
    </alerts>
    <alerts>
        <fullName>EA_Demo_Team_Sheri_Pender</fullName>
        <description>EA - Demo Team - Sheri Pender</description>
        <protected>false</protected>
        <recipients>
            <recipient>sheri.pender@tritech.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Sales_and_Quote_Email_Templates/Demo_Request_Demo_Team_Assignment</template>
    </alerts>
    <alerts>
        <fullName>EA_Demo_Team_Steve_Angell</fullName>
        <description>EA - Demo Team - Steve Angell</description>
        <protected>false</protected>
        <recipients>
            <recipient>steve.angell@tritech.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Sales_and_Quote_Email_Templates/Demo_Request_Demo_Team_Assignment</template>
    </alerts>
    <alerts>
        <fullName>EA_Demo_Team_TC_Thomas</fullName>
        <description>EA - Demo Team - TC Thomas</description>
        <protected>false</protected>
        <recipients>
            <recipient>tcthomas@tritech.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Sales_and_Quote_Email_Templates/Demo_Request_Demo_Team_Assignment</template>
    </alerts>
    <alerts>
        <fullName>EA_Demo_Team_William_Gray</fullName>
        <description>EA - Demo Team - William Gray</description>
        <protected>false</protected>
        <recipients>
            <recipient>william.gray@tritech.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Sales_and_Quote_Email_Templates/Demo_Request_Demo_Team_Assignment</template>
    </alerts>
    <alerts>
        <fullName>EA_Demo_date_Start_End_change_notification</fullName>
        <description>EA -Demo date Start/End change notification</description>
        <protected>false</protected>
        <recipients>
            <recipient>denelle.reiners@tritech.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>nikki.britto@tritech.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>tcthomas@tritech.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Sales_and_Quote_Email_Templates/Demo_Request_Demo_Start_End_time_Change</template>
    </alerts>
    <alerts>
        <fullName>EA_GIS_Analyst_Required</fullName>
        <description>EA - GIS Analyst Required</description>
        <protected>false</protected>
        <recipients>
            <recipient>kendall.schrodt@tritech.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>nikki.britto@tritech.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Sales_and_Quote_Email_Templates/Demo_Request_GIS_Analyst_Required</template>
    </alerts>
    <alerts>
        <fullName>EA_Marketing_Demo_Request_Template</fullName>
        <description>EA - Marketing Demo Request Template</description>
        <protected>false</protected>
        <recipients>
            <recipient>michelle.mcclellan@tritech.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>samantha.sorrells@tritech.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Sales_and_Quote_Email_Templates/Marketing_Demo_Request_Template</template>
    </alerts>
    <alerts>
        <fullName>EA_Solution_Architect_Darrell_Richards</fullName>
        <description>EA - Solution Architect - Darrell Richards</description>
        <protected>false</protected>
        <recipients>
            <recipient>darrell.richards@tritech.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Sales_and_Quote_Email_Templates/Demo_Request_Solution_Architect_Assignment</template>
    </alerts>
    <alerts>
        <fullName>EA_Solution_Architect_Del_Pullen</fullName>
        <description>EA - Solution Architect - Del Pullen</description>
        <protected>false</protected>
        <recipients>
            <recipient>del.pullen@tritech.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Sales_and_Quote_Email_Templates/Demo_Request_Solution_Architect_Assignment</template>
    </alerts>
    <alerts>
        <fullName>EA_Solution_Architect_Finals_or_Shortlist_Demo_Scheduling</fullName>
        <description>EA - Solution Architect Finals or Shortlist Demo Scheduling</description>
        <protected>false</protected>
        <recipients>
            <recipient>darrell.richards@tritech.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>del.pullen@tritech.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>jeff.thau@tritech.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>keith.singleton@tritech.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>kurt.hallmeyer@tritech.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>mark.catone@tritech.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>matt.manzano@tritech.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>noemi.aguiar@tritech.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>scott.nemetz@tritech.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Sales_and_Quote_Email_Templates/Demo_Request_Solution_Architect_Finals_or_Shortlist_Demo_Scheduling</template>
    </alerts>
    <alerts>
        <fullName>EA_Solution_Architect_Kurt_Hallmeyer</fullName>
        <description>EA - Solution Architect - Kurt Hallmeyer</description>
        <protected>false</protected>
        <recipients>
            <recipient>kurt.hallmeyer@tritech.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Sales_and_Quote_Email_Templates/Demo_Request_Solution_Architect_Assignment</template>
    </alerts>
    <alerts>
        <fullName>EA_Solution_Architect_Matt_Manzano</fullName>
        <description>EA - Solution Architect - Matt Manzano</description>
        <protected>false</protected>
        <recipients>
            <recipient>matt.manzano@tritech.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Sales_and_Quote_Email_Templates/Demo_Request_Solution_Architect_Assignment</template>
    </alerts>
    <alerts>
        <fullName>Solutions_Architect_Change</fullName>
        <description>Solutions Architect Change</description>
        <protected>false</protected>
        <recipients>
            <recipient>denelle.reiners@tritech.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>nikki.britto@tritech.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>tcthomas@tritech.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Sales_and_Quote_Email_Templates/Demo_Request_Solution_Architect_Assignment_Change</template>
    </alerts>
    <fieldUpdates>
        <fullName>FU_AV_Request_Drop_Off_Address</fullName>
        <field>Drop_Off_Address__c</field>
        <formula>Demo_Location__c</formula>
        <name>FU - AV Request Drop Off Address</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>FU_Demo_911</fullName>
        <field>X911__c</field>
        <literalValue>1</literalValue>
        <name>FU - Demo 911</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>FU_Demo_CAD</fullName>
        <field>CAD__c</field>
        <literalValue>1</literalValue>
        <name>FU - Demo CAD</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>FU_Demo_Fire_Records</fullName>
        <field>Fire_Records__c</field>
        <literalValue>1</literalValue>
        <name>FU - Demo Fire Records</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>FU_Demo_IQ_and_Analytics</fullName>
        <field>IQ_and_Analytics__c</field>
        <literalValue>1</literalValue>
        <name>FU - Demo IQ and Analytics</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>FU_Demo_Jail_Records</fullName>
        <field>Jail_Records__c</field>
        <literalValue>1</literalValue>
        <name>FU - Demo Jail Records</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>FU_Demo_Mobile</fullName>
        <field>Mobile__c</field>
        <literalValue>1</literalValue>
        <name>FU - Demo Mobile</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>FU_Demo_Other_3rd_Party</fullName>
        <field>Other_3rd_Party__c</field>
        <literalValue>1</literalValue>
        <name>FU - Demo Other/3rd Party</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>FU_Demo_Records_Management</fullName>
        <field>Records_Management__c</field>
        <literalValue>1</literalValue>
        <name>FU - Demo Records Management</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>FU_Demo_Status_Assigned</fullName>
        <field>Status__c</field>
        <literalValue>Assigned</literalValue>
        <name>FU - Demo Status Assigned</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>FU_Demo_Status_Completed</fullName>
        <field>Status__c</field>
        <literalValue>Completed</literalValue>
        <name>FU - Demo Status Completed</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>FU_Manager_Email</fullName>
        <description>Copies the &quot;Manager Email Formula&quot; field into an email field for use with workflow rules and notifications.</description>
        <field>Manager_Email__c</field>
        <formula>Manager_Email_Formula__c</formula>
        <name>FU - Manager Email</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates>
    <rules>
        <fullName>EA - AV Request for Demos</fullName>
        <actions>
            <name>EA_AV_Request_for_Demos</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Demo_Request__c.AV_REQUEST_COMPLETE__c</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <criteriaItems>
            <field>Demo_Request__c.RecordTypeId</field>
            <operation>equals</operation>
            <value>TriTech Demo Request</value>
        </criteriaItems>
        <description>Workflow to send audio visual request form for Demo</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>EA - Demo Assignment cc to Owner and Manager</fullName>
        <actions>
            <name>EA_Demo_Assignment_cc_to_Owner_and_Manager</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <booleanFilter>(1 OR 2) AND 3</booleanFilter>
        <criteriaItems>
            <field>Demo_Request__c.Demo_Team__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Demo_Request__c.Solution_Architect_s__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Demo_Request__c.RecordTypeId</field>
            <operation>equals</operation>
            <value>TriTech Demo Request</value>
        </criteriaItems>
        <description>Workflow to send demo assignments to the request Owner and their Manager when the Demo Team and Solution Architect(s) form for Demo Requests</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>EA - Demo Request - Additional Info Required</fullName>
        <actions>
            <name>EA_Demo_Request_Additional_Info_Required</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Demo_Request__c.Additional_Information_Required__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Demo_Request__c.RecordTypeId</field>
            <operation>equals</operation>
            <value>TriTech Demo Request</value>
        </criteriaItems>
        <description>Sends an email notification to the creator of the demo request whenever additional information is required.</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>EA - Demo Request - Zuercher</fullName>
        <actions>
            <name>EA_Demo_Request_Zuercher</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Demo_Request__c.RecordTypeId</field>
            <operation>equals</operation>
            <value>Zuercher Demo Request</value>
        </criteriaItems>
        <criteriaItems>
            <field>Demo_Request__c.DEMO_REQUEST_COMPLETE__c</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <description>Workflow to send email notification when a new Demo Request is completed for Zuercher</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>EA - Demo Request Demo Team Change</fullName>
        <actions>
            <name>Demo_Team_Change</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <description>Notification EA on Start Date, End date, SA and Demo team changes to trigger the EA to the Demo team and the SA field and include TC Thomas, Nikki and Danelle.</description>
        <formula>AND(
RecordType.Id  = &apos;01280000000QFmi&apos;,

ISCHANGED(Demo_Team__c))</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>EA - Demo Request Solution Architect Team Change</fullName>
        <actions>
            <name>Solutions_Architect_Change</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <description>Notification EA on Start Date, End date, SA and Demo team changes to trigger the EA to the Demo team and the SA field and include TC Thomas, Nikki and Danelle.</description>
        <formula>AND(
RecordType.Id  = &apos;01280000000QFmi&apos;,

ISCHANGED(Solution_Architect_s__c))</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>EA - Demo Request Start%2FEnd time</fullName>
        <actions>
            <name>EA_Demo_date_Start_End_change_notification</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <description>Notification EA on Start Date, End date, SA and Demo team changes to trigger the EA to the Demo team and the SA field and include TC Thomas, Nikki and Danelle.</description>
        <formula>AND(
RecordType.Id  = &apos;01280000000QFmi&apos;,
OR(
ISCHANGED(Demo_Start_Time__c),
ISCHANGED(Demo_End_Date__c) ))</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>EA - Demo Team - Becca Webb</fullName>
        <actions>
            <name>EA_Demo_Team_Becca_Webb</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <description>Send email to Rebecca Webb when included in the &quot;Demo Team&quot; assignment on the Demo Request Form</description>
        <formula>OR(
AND
	(
		RecordType.Id  = &apos;01280000000QFmi&apos;,includes(Demo_Team__c,&apos;Becca Webb&apos;)
	),
AND
(
	RecordType.Id  = &apos;01280000000QFmi&apos;, 
	OR
	(
		ISCHANGED(Demo_Start_Time__c), ISCHANGED(Demo_End_Date__c),ISCHANGED(Demo_End_Time__c),ISCHANGED(Demo_Start_Date__c)
	)
	, includes(Demo_Team__c,&apos;Becca Webb&apos;)
)

)</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>EA - Demo Team - David Amaya</fullName>
        <actions>
            <name>EA_Demo_Team_David_Amaya</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <description>Send email to David Amaya when included in the &quot;Demo Team&quot; assignment on the Demo Request Form</description>
        <formula>OR(
AND
	(
		RecordType.Id  = &apos;01280000000QFmi&apos;,includes(Demo_Team__c,&apos;David Amaya&apos;)
	),
AND
(
	RecordType.Id  = &apos;01280000000QFmi&apos;, 
	OR
	(
		ISCHANGED(Demo_Start_Time__c), ISCHANGED(Demo_End_Date__c),ISCHANGED(Demo_End_Time__c),ISCHANGED(Demo_Start_Date__c)
	)
	, includes(Demo_Team__c,&apos;David Amaya&apos;)
)

)</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>EA - Demo Team - Denelle Reiners</fullName>
        <actions>
            <name>EA_Demo_Team_Catering_Request_Complete_Denelle</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Demo_Request__c.Catering_Request_Complete__c</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <description>Send email to Denelle Reiners when &apos;CATERING REQUEST COMPLETE&apos; check box is checked.</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>EA - Demo Team - Karen Southerland</fullName>
        <actions>
            <name>EA_Demo_Team_Karen_Southerland</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <description>Send email to Karen Southerland when included in the &quot;Demo Team&quot; assignment on the Demo Request Form</description>
        <formula>OR(
AND
	(
		RecordType.Id  = &apos;01280000000QFmi&apos;,includes(Demo_Team__c,&apos;Karen Southerland&apos;)
	),
AND
(
	RecordType.Id  = &apos;01280000000QFmi&apos;, 
	OR
	(
		ISCHANGED(Demo_Start_Time__c), ISCHANGED(Demo_End_Date__c),ISCHANGED(Demo_End_Time__c),ISCHANGED(Demo_Start_Date__c)
	)
	, includes(Demo_Team__c,&apos;Karen Southerland&apos;)
)

)</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>EA - Demo Team - Kelly Fontes</fullName>
        <actions>
            <name>EA_Demo_Team_Kelly_Fontes</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <description>Send email to Kelly Fontes when included in the &quot;Demo Team&quot; assignment on the Demo Request Form</description>
        <formula>OR(
AND
	(
		RecordType.Id  = &apos;01280000000QFmi&apos;,includes(Demo_Team__c,&apos;Kelly Fontes&apos;)
	),
AND
(
	RecordType.Id  = &apos;01280000000QFmi&apos;, 
	OR
	(
		ISCHANGED(Demo_Start_Time__c), ISCHANGED(Demo_End_Date__c),ISCHANGED(Demo_End_Time__c),ISCHANGED(Demo_Start_Date__c)
	)
	, includes(Demo_Team__c,&apos;Kelly Fontes&apos;)
)

)</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>EA - Demo Team - Liz Byers</fullName>
        <actions>
            <name>EA_Demo_Team_Liz_Byers</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <description>Send email to Liz Byers when included in the &quot;Demo Team&quot; assignment on the Demo Request Form</description>
        <formula>OR(
AND
	(
		RecordType.Id  = &apos;01280000000QFmi&apos;,includes(Demo_Team__c,&apos;Liz Byers&apos;)
	),
AND
(
	RecordType.Id  = &apos;01280000000QFmi&apos;, 
	OR
	(
		ISCHANGED(Demo_Start_Time__c), ISCHANGED(Demo_End_Date__c),ISCHANGED(Demo_End_Time__c),ISCHANGED(Demo_Start_Date__c)
	)
	, includes(Demo_Team__c,&apos;Liz Byers&apos;)
)

)</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>EA - Demo Team - Matt Klein</fullName>
        <actions>
            <name>EA_Demo_Team_Matt_Klein</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <description>Send email to Matt Klein when included in the &quot;Demo Team&quot; assignment on the Demo Request Form</description>
        <formula>OR(
AND
	(
		RecordType.Id  = &apos;01280000000QFmi&apos;,includes(Demo_Team__c,&apos;Matt Klein&apos;)
	),
AND
(
	RecordType.Id  = &apos;01280000000QFmi&apos;, 
	OR
	(
		ISCHANGED(Demo_Start_Time__c), ISCHANGED(Demo_End_Date__c),ISCHANGED(Demo_End_Time__c),ISCHANGED(Demo_Start_Date__c)
	)
	, includes(Demo_Team__c,&apos;Matt Klein&apos;)
)

)</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>EA - Demo Team - Nikki Britto</fullName>
        <actions>
            <name>EA_Demo_Team_Nikki_Britto</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <description>Send email to Nikki Britto when included in the &quot;Demo Team&quot; assignment on the Demo Request Form</description>
        <formula>OR(
AND
	(
		RecordType.Id  = &apos;01280000000QFmi&apos;,includes(Demo_Team__c,&apos;Nikki Britto&apos;)
	),
AND
(
	RecordType.Id  = &apos;01280000000QFmi&apos;, 
	OR
	(
		ISCHANGED(Demo_Start_Time__c), ISCHANGED(Demo_End_Date__c),ISCHANGED(Demo_End_Time__c),ISCHANGED(Demo_Start_Date__c)
	)
	, includes(Demo_Team__c,&apos;Nikki Britto&apos;)
)

)</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>EA - Demo Team - Paul Labriola</fullName>
        <actions>
            <name>EA_Demo_Team_Paul_Labriola</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <description>Send email to Paul Labriola when included in the &quot;Demo Team&quot; assignment on the Demo Request Form</description>
        <formula>OR(
AND
	(
		RecordType.Id  = &apos;01280000000QFmi&apos;,includes(Demo_Team__c,&apos;Paul Labriola&apos;)
	),
AND
(
	RecordType.Id  = &apos;01280000000QFmi&apos;, 
	OR
	(
		ISCHANGED(Demo_Start_Time__c), ISCHANGED(Demo_End_Date__c),ISCHANGED(Demo_End_Time__c),ISCHANGED(Demo_Start_Date__c)
	)
	, includes(Demo_Team__c,&apos;Paul Labriola&apos;)
)

)</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>EA - Demo Team - Robert Mabe</fullName>
        <active>false</active>
        <description>Send email to Robert Mabe when included in the &quot;Demo Team&quot; assignment on the Demo Request Form</description>
        <formula>OR(
AND
	(
		RecordType.Id  = &apos;01280000000QFmi&apos;,includes(Demo_Team__c,&apos;Robert Mabe&apos;)
	),
AND
(
	RecordType.Id  = &apos;01280000000QFmi&apos;, 
	OR
	(
		ISCHANGED(Demo_Start_Time__c), ISCHANGED(Demo_End_Date__c),ISCHANGED(Demo_End_Time__c),ISCHANGED(Demo_Start_Date__c)
	)
	, includes(Demo_Team__c,&apos;Robert Mabe&apos;)
)

)</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>EA - Demo Team - Ruth Cruz</fullName>
        <active>false</active>
        <description>Send email to Ruth Cruz when included in the &quot;Demo Team&quot; assignment on the Demo Request Form</description>
        <formula>AND(
RecordType.Id  = &apos;01280000000QFmi&apos;, ISCHANGED(Demo_Start_Time__c), ISCHANGED(Demo_End_Date__c), includes(Demo_Team__c,&apos;Ruth Cruz&apos;))</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>EA - Demo Team - Sheri Pender</fullName>
        <actions>
            <name>EA_Demo_Team_Sheri_Pender</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <description>Send email to Sheri Pender when included in the &quot;Demo Team&quot; assignment on the Demo Request Form</description>
        <formula>OR(
AND
	(
		RecordType.Id  = &apos;01280000000QFmi&apos;,includes(Demo_Team__c,&apos;Sheri Pender&apos;)
	),
AND
(
	RecordType.Id  = &apos;01280000000QFmi&apos;, 
	OR
	(
		ISCHANGED(Demo_Start_Time__c), ISCHANGED(Demo_End_Date__c),ISCHANGED(Demo_End_Time__c),ISCHANGED(Demo_Start_Date__c)
	)
	, includes(Demo_Team__c,&apos;Sheri Pender&apos;)
)

)</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>EA - Demo Team - TC Thomas</fullName>
        <actions>
            <name>EA_Demo_Team_TC_Thomas</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <description>Send email to TC Thomas when included in the &quot;Demo Team&quot; assignment on the Demo Request Form</description>
        <formula>OR(
AND
	(
		RecordType.Id  = &apos;01280000000QFmi&apos;,includes(Demo_Team__c,&apos;TC Thomas&apos;)
	),
AND
(
	RecordType.Id  = &apos;01280000000QFmi&apos;, 
	OR
	(
		ISCHANGED(Demo_Start_Time__c), ISCHANGED(Demo_End_Date__c),ISCHANGED(Demo_End_Time__c),ISCHANGED(Demo_Start_Date__c)
	)
	, includes(Demo_Team__c,&apos;TC Thomas&apos;)
)

)</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>EA - Demo Team - William Gray</fullName>
        <actions>
            <name>EA_Demo_Team_William_Gray</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <description>Send email to William Gray when included in the &quot;Demo Team&quot; assignment on the Demo Request Form</description>
        <formula>OR(
AND
	(
		RecordType.Id  = &apos;01280000000QFmi&apos;,includes(Demo_Team__c,&apos;William Gray&apos;)
	),
AND
(
	RecordType.Id  = &apos;01280000000QFmi&apos;, 
	OR
	(
		ISCHANGED(Demo_Start_Time__c), ISCHANGED(Demo_End_Date__c),ISCHANGED(Demo_End_Time__c),ISCHANGED(Demo_Start_Date__c)
	)
	, includes(Demo_Team__c,&apos;William Gray&apos;)
)

)</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>EA - GIS Analyst Required</fullName>
        <actions>
            <name>EA_GIS_Analyst_Required</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Demo_Request__c.RecordTypeId</field>
            <operation>equals</operation>
            <value>TriTech Demo Request</value>
        </criteriaItems>
        <criteriaItems>
            <field>Demo_Request__c.GIS_Analyst_Required__c</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <criteriaItems>
            <field>Demo_Request__c.DEMO_REQUEST_COMPLETE__c</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <description>Send email to Kendall Schrodt and Nikki Britto when &quot;GIS Analyst Required&quot; is checked.</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>EA - Marketing Request for Demos</fullName>
        <actions>
            <name>EA_Marketing_Demo_Request_Template</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Demo_Request__c.MARKETING_REQUEST_COMPLETE__c</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <criteriaItems>
            <field>Demo_Request__c.RecordTypeId</field>
            <operation>equals</operation>
            <value>TriTech Demo Request</value>
        </criteriaItems>
        <description>Workflow to send marketing request form for Demo</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>EA - Solution Architect - Darrell Richards</fullName>
        <actions>
            <name>EA_Solution_Architect_Darrell_Richards</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <description>Send email to Darrell Richards when included in the &quot;Solution Architect(s)&quot; assignment on the Demo Request Form</description>
        <formula>OR(
AND
	(
		RecordType.Id  = &apos;01280000000QFmi&apos;,includes(Solution_Architect_s__c,&apos;Darrell Richards&apos;)
	),
AND
(
	RecordType.Id  = &apos;01280000000QFmi&apos;, 
	OR
	(
		ISCHANGED(Demo_Start_Time__c), ISCHANGED(Demo_End_Date__c),ISCHANGED(Demo_End_Time__c),ISCHANGED(Demo_Start_Date__c)
	)
	, includes(Solution_Architect_s__c,&apos;Darrell Richards&apos;)
)

)</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>EA - Solution Architect - Del Pullen</fullName>
        <actions>
            <name>EA_Solution_Architect_Del_Pullen</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <description>Send email to Del Pullen when included in the &quot;Solution Architect(s)&quot; assignment on the Demo Request Form</description>
        <formula>OR(
AND
	(
		RecordType.Id  = &apos;01280000000QFmi&apos;,includes(Solution_Architect_s__c,&apos;Del Pullen&apos;)
	),
AND
(
	RecordType.Id  = &apos;01280000000QFmi&apos;, 
	OR
	(
		ISCHANGED(Demo_Start_Time__c), ISCHANGED(Demo_End_Date__c),ISCHANGED(Demo_End_Time__c),ISCHANGED(Demo_Start_Date__c)
	)
	, includes(Solution_Architect_s__c,&apos;Del Pullen&apos;)
)

)</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>EA - Solution Architect - Kurt Hallmeyer</fullName>
        <actions>
            <name>EA_Solution_Architect_Kurt_Hallmeyer</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <description>Send email to Kurt Hallmeyer when included in the &quot;Solution Architect(s)&quot; assignment on the Demo Request Form</description>
        <formula>OR(
AND
	(
		RecordType.Id  = &apos;01280000000QFmi&apos;,includes(Solution_Architect_s__c,&apos;Kurt Hallmeyer&apos;)
	),
AND
(
	RecordType.Id  = &apos;01280000000QFmi&apos;, 
	OR
	(
		ISCHANGED(Demo_Start_Time__c), ISCHANGED(Demo_End_Date__c),ISCHANGED(Demo_End_Time__c),ISCHANGED(Demo_Start_Date__c)
	)
	, includes(Solution_Architect_s__c,&apos;Kurt Hallmeyer&apos;)
)

)</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>EA - Solution Architect - Matt Manzano</fullName>
        <actions>
            <name>EA_Solution_Architect_Matt_Manzano</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <description>Send email to Matt Manzano when included in the &quot;Solution Architect(s)&quot; assignment on the Demo Request Form</description>
        <formula>OR(
AND
	(
		RecordType.Id  = &apos;01280000000QFmi&apos;,includes(Solution_Architect_s__c,&apos;Matt Manzano&apos;)
	),
AND
(
	RecordType.Id  = &apos;01280000000QFmi&apos;, 
	OR
	(
		ISCHANGED(Demo_Start_Time__c), ISCHANGED(Demo_End_Date__c),ISCHANGED(Demo_End_Time__c),ISCHANGED(Demo_Start_Date__c)
	)
	, includes(Solution_Architect_s__c,&apos;Matt Manzano&apos;)
)

)</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>EA - Solution Architect Finals Non-RFP Demo Scheduling</fullName>
        <actions>
            <name>EA_Solution_Architect_Finals_or_Shortlist_Demo_Scheduling</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <booleanFilter>1 AND 2</booleanFilter>
        <criteriaItems>
            <field>Demo_Request__c.RecordTypeId</field>
            <operation>equals</operation>
            <value>TriTech Demo Request</value>
        </criteriaItems>
        <criteriaItems>
            <field>Demo_Request__c.Demo_Type__c</field>
            <operation>equals</operation>
            <value>Final/Non-RFP</value>
        </criteriaItems>
        <description>Send email to Solution Architect group if Demo Type equals &quot;Finals - Non RFP.&quot;</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>EA - Solution Architect Finals Shortlist Demo Scheduling</fullName>
        <actions>
            <name>EA_Solution_Architect_Finals_or_Shortlist_Demo_Scheduling</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <booleanFilter>1 AND 2</booleanFilter>
        <criteriaItems>
            <field>Demo_Request__c.RecordTypeId</field>
            <operation>equals</operation>
            <value>TriTech Demo Request</value>
        </criteriaItems>
        <criteriaItems>
            <field>Demo_Request__c.Demo_Type__c</field>
            <operation>equals</operation>
            <value>Final_Post_RFP</value>
        </criteriaItems>
        <description>Send email to Solution Architect group if Demo Type equals &quot;Finals - Shortlist.&quot;</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>EA FU - Demo Request - TriTech</fullName>
        <actions>
            <name>EA_Demo_Request</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Demo_Request__c.DEMO_REQUEST_COMPLETE__c</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <criteriaItems>
            <field>Demo_Request__c.RecordTypeId</field>
            <operation>equals</operation>
            <value>TriTech Demo Request</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
        <workflowTimeTriggers>
            <actions>
                <name>EA_Demo_Request_7_Days_Prior</name>
                <type>Alert</type>
            </actions>
            <offsetFromField>Demo_Request__c.Demo_Set_up_Date__c</offsetFromField>
            <timeLength>-7</timeLength>
            <workflowTimeTriggerUnit>Days</workflowTimeTriggerUnit>
        </workflowTimeTriggers>
        <workflowTimeTriggers>
            <actions>
                <name>FU_Demo_Status_Completed</name>
                <type>FieldUpdate</type>
            </actions>
            <offsetFromField>Demo_Request__c.Demo_End_Date__c</offsetFromField>
            <timeLength>1</timeLength>
            <workflowTimeTriggerUnit>Days</workflowTimeTriggerUnit>
        </workflowTimeTriggers>
    </rules>
    <rules>
        <fullName>FU - AV Request Drop Off Address</fullName>
        <actions>
            <name>FU_AV_Request_Drop_Off_Address</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Demo_Request__c.Drop_Off_Address__c</field>
            <operation>equals</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Demo_Request__c.RecordTypeId</field>
            <operation>equals</operation>
            <value>TriTech Demo Request</value>
        </criteriaItems>
        <description>For Drop Off Address field, auto-populate with information from the Demo Location field if the user does not enter information manually.</description>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>FU - Demo 911</fullName>
        <actions>
            <name>FU_Demo_911</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Demo_Request__c.Products_to_be_Demo_d__c</field>
            <operation>includes</operation>
            <value>Inform 911</value>
        </criteriaItems>
        <description>Field Name: 911
Field Rule: Checkbox = True If Products to be Demo’d includes Inform 911</description>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>FU - Demo CAD</fullName>
        <actions>
            <name>FU_Demo_CAD</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Demo_Request__c.Products_to_be_Demo_d__c</field>
            <operation>includes</operation>
            <value>Inform CAD,TC CAD</value>
        </criteriaItems>
        <description>Field Name: CAD
Field Rule: Checkbox = True If Products to be Demo’d includes Inform CAD and/or TC CAD</description>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>FU - Demo Fire Records</fullName>
        <actions>
            <name>FU_Demo_Fire_Records</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Demo_Request__c.Products_to_be_Demo_d__c</field>
            <operation>includes</operation>
            <value>FireRecords</value>
        </criteriaItems>
        <description>Field Name: Fire Records
Field Rule: Checkbox = True If Products to be Demo’d includes FireRecords</description>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>FU - Demo IQ and Analytics</fullName>
        <actions>
            <name>FU_Demo_IQ_and_Analytics</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Demo_Request__c.Products_to_be_Demo_d__c</field>
            <operation>includes</operation>
            <value>Inform IQ/Analytics</value>
        </criteriaItems>
        <description>Field Name: IQ and Analytics
Field Rule: Checkbox = True If Products to be Demo’d includes Inform IQ/Analytics</description>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>FU - Demo Jail Records</fullName>
        <actions>
            <name>FU_Demo_Jail_Records</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Demo_Request__c.Products_to_be_Demo_d__c</field>
            <operation>includes</operation>
            <value>Inform Jail</value>
        </criteriaItems>
        <description>Field Name: Jail Records
Field Rule: Checkbox = True If Products to be Demo’d includes Inform Jail</description>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>FU - Demo Mobile</fullName>
        <actions>
            <name>FU_Demo_Mobile</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Demo_Request__c.Products_to_be_Demo_d__c</field>
            <operation>includes</operation>
            <value>Inform Mobile,Inform ME</value>
        </criteriaItems>
        <description>Field Name: Mobile
Field Rule: Checkbox = True If Products to be Demo’d includes Inform ME and/or Inform Mobile</description>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>FU - Demo Other%2F3rd Party</fullName>
        <actions>
            <name>FU_Demo_Other_3rd_Party</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Demo_Request__c.Products_to_be_Demo_d__c</field>
            <operation>includes</operation>
            <value>TC RMS,TE RMS,DN CAD/Mobile,Other/3rd Party</value>
        </criteriaItems>
        <description>Field Name: Other/3rd Party
Field Rule: Checkbox = True If Products to be Demo’d includes TC RMS, TE RMS, DN CAD/Mobile and/or Other/3rd Party</description>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>FU - Demo Records Management</fullName>
        <actions>
            <name>FU_Demo_Records_Management</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Demo_Request__c.Products_to_be_Demo_d__c</field>
            <operation>includes</operation>
            <value>Inform RMS</value>
        </criteriaItems>
        <description>Field Name: Records Management
Field Rule: Checkbox = True If Products to be Demo’d includes Inform RMS</description>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>FU - Demo Status Assigned</fullName>
        <actions>
            <name>FU_Demo_Status_Assigned</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <booleanFilter>(1 AND 2) Or (2 AND 3)</booleanFilter>
        <criteriaItems>
            <field>Demo_Request__c.Demo_Team__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Demo_Request__c.RecordTypeId</field>
            <operation>equals</operation>
            <value>TriTech Demo Request</value>
        </criteriaItems>
        <criteriaItems>
            <field>Demo_Request__c.Solution_Architect_s__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <description>Workflow to update the status field to Assigned</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>FU - Manager Email</fullName>
        <actions>
            <name>FU_Manager_Email</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Demo_Request__c.Name</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <description>Workflow to populate the &quot;Manager Email&quot; field from the &quot;Manager Email Formula&quot; field for email alert usage</description>
        <triggerType>onAllChanges</triggerType>
    </rules>
</Workflow>
