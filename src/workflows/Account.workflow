<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <alerts>
        <fullName>EA</fullName>
        <description>EA - CJIS - Inactive Account</description>
        <protected>false</protected>
        <recipients>
            <recipient>CJIS_Administration</recipient>
            <type>group</type>
        </recipients>
        <recipients>
            <recipient>jen.vansant@tritech.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Internal_Templates/CJIS_Inactive_Account</template>
    </alerts>
    <alerts>
        <fullName>EA_Account_Score_Director_Approval</fullName>
        <description>EA - Account Score Director Approval</description>
        <protected>false</protected>
        <recipients>
            <field>Manager_Email__c</field>
            <type>email</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Sales_and_Quote_Email_Templates/Account_Score_Approval</template>
    </alerts>
    <alerts>
        <fullName>EA_Hierarchy_Update_Director_Approval</fullName>
        <description>EA - Hierarchy Update Director Approval</description>
        <protected>false</protected>
        <recipients>
            <field>Hierarchy_Completed_by_Manager_Email__c</field>
            <type>email</type>
        </recipients>
        <recipients>
            <field>Hierarchy_Completed_by__c</field>
            <type>userLookup</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Sales_and_Quote_Email_Templates/Hierarchy_Update_Director_Approval</template>
    </alerts>
    <alerts>
        <fullName>EA_VisiNet_Account_Service_Type_Change</fullName>
        <ccEmails>CS-TechServices@TRITECH.com</ccEmails>
        <ccEmails>Engineering-Managers@TRITECH.com</ccEmails>
        <ccEmails>pm-all@tritech.com</ccEmails>
        <description>EA - VisiNet Account Service Type Change</description>
        <protected>false</protected>
        <senderType>CurrentUser</senderType>
        <template>Support/TA_VisiNet_Account_Service_Type_Change</template>
    </alerts>
    <fieldUpdates>
        <fullName>Assigned_PM_2_Email</fullName>
        <field>PM_2_Email__c</field>
        <formula>Assigned_PM_2__r.Email</formula>
        <name>Assigned PM 2 Email</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Assigned_PM_Email</fullName>
        <field>PM_1_Email__c</field>
        <formula>Assigned_PM__r.Email</formula>
        <name>Assigned PM Email</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>CAD_BA_Email</fullName>
        <field>CAD_BA_Email__c</field>
        <formula>Assigned_BA_1__r.Email</formula>
        <name>CAD BA Email</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>FBR_BA_Email</fullName>
        <field>FBR_BA_Email__c</field>
        <formula>Assigned_BA_4__r.Email</formula>
        <name>FBR BA Email</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>FU_Account_Banding1000</fullName>
        <field>Number_of_Sworn_Officers_Band__c</field>
        <literalValue>1000+</literalValue>
        <name>FU - Account Banding1000+</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>FU_Account_Banding100_249</fullName>
        <field>Number_of_Sworn_Officers_Band__c</field>
        <literalValue>100-249</literalValue>
        <name>FU - Account Banding100-249</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>FU_Account_Banding10_99</fullName>
        <field>Number_of_Sworn_Officers_Band__c</field>
        <literalValue>10-99</literalValue>
        <name>FU - Account Banding10-99</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>FU_Account_Banding250_999</fullName>
        <field>Number_of_Sworn_Officers_Band__c</field>
        <literalValue>250-999</literalValue>
        <name>FU - Account Banding250-999</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>FU_Account_Banding_CAD100_249</fullName>
        <field>CAD_Parent_Sworn_Officer_Band__c</field>
        <literalValue>100-249</literalValue>
        <name>FU - Account Banding CAD100-249</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>FU_Account_Banding_CAD10_99</fullName>
        <field>CAD_Parent_Sworn_Officer_Band__c</field>
        <literalValue>10-99</literalValue>
        <name>FU - Account Banding CAD10-99</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>FU_Account_Banding_CAD1_9</fullName>
        <field>CAD_Parent_Sworn_Officer_Band__c</field>
        <literalValue>1-9</literalValue>
        <name>FU - Account Banding CAD1-9</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>FU_Account_Banding_CAD250_999</fullName>
        <field>CAD_Parent_Sworn_Officer_Band__c</field>
        <literalValue>250-999</literalValue>
        <name>FU - Account Banding CAD250-999</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>FU_Account_Banding_CAD_1000</fullName>
        <field>CAD_Parent_Sworn_Officer_Band__c</field>
        <literalValue>1000+</literalValue>
        <name>FU - Account Banding CAD1000+</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>FU_Account_Owner_Manager_Email</fullName>
        <description>Updates the Manager Email field on the account with the account owner&apos;s manager&apos;s email address for workflow purposes</description>
        <field>Manager_Email__c</field>
        <formula>Owner.Manager_Email__c</formula>
        <name>FU - Account Owner Manager Email</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>FU_Hierarchy_Completed_by_Mgr_Email</fullName>
        <description>Updates the Hierarchy Completed by Manager field on the account with the Hierachy Completed by&apos;s manager&apos;s email address for workflow purposes</description>
        <field>Hierarchy_Completed_by_Manager_Email__c</field>
        <formula>Hierarchy_Completed_by_Manager_Email__c</formula>
        <name>FU - Hierarchy Completed by Mgr Email</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>FU_Parent_Active_Client_Product_Famili</fullName>
        <field>Parent_Active_Client_Product_Families__c</field>
        <formula>Parent.Active_Client_Product_Families__c</formula>
        <name>FU - Parent Active Client Product Famili</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>FU_Parent_Active_Contract_Types</fullName>
        <field>Parent_Active_Contract_Types__c</field>
        <formula>Parent.Contract_Types__c</formula>
        <name>FU - Parent Active Contract Types</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>FU_Sworn_Officers1_9</fullName>
        <field>Number_of_Sworn_Officers_Band__c</field>
        <literalValue>1-9</literalValue>
        <name>FU-Sworn Officers1-9</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Hierarchy_Director_Approved_Last_Modifie</fullName>
        <description>Updates the Hierarchy Updated Last Modified field on the Account (http://na6.salesforce.com/00N800000005eJte)</description>
        <field>Hierarchy_Director_Approved_Last_Modifie__c</field>
        <formula>LastModifiedDate</formula>
        <name>FU HierarchyDirectorApprovedLast Modifie</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Hierarchy_Updated_Last_Modified</fullName>
        <field>Hierarchy_Updated_Last_Modified__c</field>
        <formula>LastModifiedDate</formula>
        <name>FU Hierarchy Updated Last Modified</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Mobile_BA_Email</fullName>
        <field>Mobile_BA_Email__c</field>
        <formula>Assigned_BA_2__r.Email</formula>
        <name>Mobile BA Email</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>RMS_BA_Email</fullName>
        <field>RMS_BA_Email__c</field>
        <formula>Assigned_BA_3__r.Email</formula>
        <name>RMS BA Email</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>ResetAccountTypeClient</fullName>
        <field>Type</field>
        <name>ResetAccountTypeClient</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>SetAccountTypeClient</fullName>
        <field>Type</field>
        <literalValue>Client</literalValue>
        <name>SetAccountTypeClient</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_Last_Modified_Actions</fullName>
        <field>Last_Modified_Actions__c</field>
        <formula>&quot;Last Modified by &quot; &amp;LastModifiedBy.FirstName&amp;&quot; &quot;&amp; LastModifiedBy.LastName&amp; &quot; on &quot; &amp;  Text(MONTH(DATEVALUE(LastModifiedDate)))&amp;&quot;/&quot;&amp;Text(DAY(DATEVALUE(LastModifiedDate)))&amp;&quot;/&quot;&amp;Text(YEAR(DATEVALUE(LastModifiedDate)))</formula>
        <name>Update Last Modified (Actions)</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_Last_Modified_At_Risk</fullName>
        <field>Last_Modified_At_Risk__c</field>
        <formula>&quot;Last Modified by &quot; &amp;LastModifiedBy.FirstName&amp;&quot; &quot;&amp; LastModifiedBy.LastName&amp; &quot; on &quot; &amp;  Text(MONTH(DATEVALUE(LastModifiedDate)))&amp;&quot;/&quot;&amp;Text(DAY(DATEVALUE(LastModifiedDate)))&amp;&quot;/&quot;&amp;Text(YEAR(DATEVALUE(LastModifiedDate)))</formula>
        <name>Update Last Modified At Risk</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_Last_Modified_Issues</fullName>
        <field>Last_Modified_Issues__c</field>
        <formula>&quot;Last Modified by &quot; &amp;LastModifiedBy.FirstName&amp;&quot; &quot;&amp; LastModifiedBy.LastName&amp; &quot; on &quot; &amp;  Text(MONTH(DATEVALUE(LastModifiedDate)))&amp;&quot;/&quot;&amp;Text(DAY(DATEVALUE(LastModifiedDate)))&amp;&quot;/&quot;&amp;Text(YEAR(DATEVALUE(LastModifiedDate)))</formula>
        <name>Update Last Modified (Issues)</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_Last_Modified_Last_Modified_Comm</fullName>
        <field>Last_Modified_Comments__c</field>
        <formula>&quot;Last Modified by &quot; &amp;LastModifiedBy.FirstName&amp;&quot; &quot;&amp; LastModifiedBy.LastName&amp; &quot; on &quot; &amp;  Text(MONTH(DATEVALUE(LastModifiedDate)))&amp;&quot;/&quot;&amp;Text(DAY(DATEVALUE(LastModifiedDate)))&amp;&quot;/&quot;&amp;Text(YEAR(DATEVALUE(LastModifiedDate)))</formula>
        <name>Update Last Modified Last Modified Comm</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <rules>
        <fullName>EA - Account Score Director Approval</fullName>
        <actions>
            <name>EA_Account_Score_Director_Approval</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Account.Account_Score_Complete__c</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <criteriaItems>
            <field>Account.Account_Score_Director_Approved__c</field>
            <operation>equals</operation>
            <value>False</value>
        </criteriaItems>
        <criteriaItems>
            <field>Account.Manager_Email__c</field>
            <operation>notEqual</operation>
            <value>jeff.tange@tritech.com</value>
        </criteriaItems>
        <description>Email to account owner&apos;s manager when the account scoring section has been completed</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>EA - CJIS - Inactive Account</fullName>
        <actions>
            <name>EA</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <description>Client account is inactivated by the Client checkbox being removed
Send notification to:  CJISAdmin@tritech.com</description>
        <formula>AND(ISCHANGED( Active__c ),Active__c == False)</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>EA - Hierachy Updated Director Approval Needed</fullName>
        <actions>
            <name>EA_Hierarchy_Update_Director_Approval</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Account.Hierarchy_Updated__c</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <criteriaItems>
            <field>Account.Hierarchy_Director_Approved__c</field>
            <operation>equals</operation>
            <value>False</value>
        </criteriaItems>
        <description>Sends an email to user in the &quot;Hierarchy Completed by&quot; field and their manager to notify them that the hierarchy has been updated and requires approval.</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>FU - Account At Risk Change</fullName>
        <actions>
            <name>Update_Last_Modified_At_Risk</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <formula>ISCHANGED(Account_At_Risk__c)</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>FU - Account Banding 1-9</fullName>
        <actions>
            <name>FU_Sworn_Officers1_9</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Account.Number_of_Sworn_Personnel_WMP__c</field>
            <operation>greaterThan</operation>
            <value>0</value>
        </criteriaItems>
        <criteriaItems>
            <field>Account.Number_of_Sworn_Personnel_WMP__c</field>
            <operation>lessOrEqual</operation>
            <value>9</value>
        </criteriaItems>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>FU - Account Banding 10-99</fullName>
        <actions>
            <name>FU_Account_Banding10_99</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Account.Number_of_Sworn_Personnel_WMP__c</field>
            <operation>greaterOrEqual</operation>
            <value>10</value>
        </criteriaItems>
        <criteriaItems>
            <field>Account.Number_of_Sworn_Personnel_WMP__c</field>
            <operation>lessOrEqual</operation>
            <value>99</value>
        </criteriaItems>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>FU - Account Banding 100-249</fullName>
        <actions>
            <name>FU_Account_Banding100_249</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Account.Number_of_Sworn_Personnel_WMP__c</field>
            <operation>greaterOrEqual</operation>
            <value>100</value>
        </criteriaItems>
        <criteriaItems>
            <field>Account.Number_of_Sworn_Personnel_WMP__c</field>
            <operation>lessOrEqual</operation>
            <value>249</value>
        </criteriaItems>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>FU - Account Banding 1000%2B</fullName>
        <actions>
            <name>FU_Account_Banding1000</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Account.Number_of_Sworn_Personnel_WMP__c</field>
            <operation>greaterOrEqual</operation>
            <value>1000</value>
        </criteriaItems>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>FU - Account Banding 250-999</fullName>
        <actions>
            <name>FU_Account_Banding250_999</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Account.Number_of_Sworn_Personnel_WMP__c</field>
            <operation>greaterOrEqual</operation>
            <value>250</value>
        </criteriaItems>
        <criteriaItems>
            <field>Account.Number_of_Sworn_Personnel_WMP__c</field>
            <operation>lessOrEqual</operation>
            <value>999</value>
        </criteriaItems>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>FU - Account Banding CAD 1-9</fullName>
        <actions>
            <name>FU_Account_Banding_CAD1_9</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Account.CAD_Parent_Total_Sworn_Officers__c</field>
            <operation>greaterOrEqual</operation>
            <value>1</value>
        </criteriaItems>
        <criteriaItems>
            <field>Account.CAD_Parent_Total_Sworn_Officers__c</field>
            <operation>lessOrEqual</operation>
            <value>9</value>
        </criteriaItems>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>FU - Account Banding CAD 10-99</fullName>
        <actions>
            <name>FU_Account_Banding_CAD10_99</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Account.CAD_Parent_Total_Sworn_Officers__c</field>
            <operation>greaterOrEqual</operation>
            <value>10</value>
        </criteriaItems>
        <criteriaItems>
            <field>Account.CAD_Parent_Total_Sworn_Officers__c</field>
            <operation>lessOrEqual</operation>
            <value>99</value>
        </criteriaItems>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>FU - Account Banding CAD 100-249</fullName>
        <actions>
            <name>FU_Account_Banding_CAD100_249</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Account.CAD_Parent_Total_Sworn_Officers__c</field>
            <operation>greaterOrEqual</operation>
            <value>100</value>
        </criteriaItems>
        <criteriaItems>
            <field>Account.CAD_Parent_Total_Sworn_Officers__c</field>
            <operation>lessOrEqual</operation>
            <value>249</value>
        </criteriaItems>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>FU - Account Banding CAD 1000%2B</fullName>
        <actions>
            <name>FU_Account_Banding_CAD_1000</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Account.CAD_Parent_Total_Sworn_Officers__c</field>
            <operation>greaterOrEqual</operation>
            <value>1000</value>
        </criteriaItems>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>FU - Account Banding CAD 250-999</fullName>
        <actions>
            <name>FU_Account_Banding_CAD250_999</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Account.CAD_Parent_Total_Sworn_Officers__c</field>
            <operation>greaterOrEqual</operation>
            <value>250</value>
        </criteriaItems>
        <criteriaItems>
            <field>Account.CAD_Parent_Total_Sworn_Officers__c</field>
            <operation>lessOrEqual</operation>
            <value>999</value>
        </criteriaItems>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>FU - Account Last Modified %28Actions%29</fullName>
        <actions>
            <name>Update_Last_Modified_Actions</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <formula>ISCHANGED( Actions_Taken_Required__c )</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>FU - Account Last Modified %28Comments%29</fullName>
        <actions>
            <name>Update_Last_Modified_Last_Modified_Comm</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <formula>ISCHANGED(Comments__c)</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>FU - Account Last Modified %28Issues%29</fullName>
        <actions>
            <name>Update_Last_Modified_Issues</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <formula>ISCHANGED(Issues_Problems__c)</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>FU - Account Owner Manager Email</fullName>
        <actions>
            <name>FU_Account_Owner_Manager_Email</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Account.OwnerId</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <description>Field update to Manager Email field from account owner&apos;s user setup for notification purposes</description>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>FU - Assigned PM 2 Email</fullName>
        <actions>
            <name>Assigned_PM_2_Email</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Account.Assigned_PM_2__c</field>
            <operation>notEqual</operation>
            <value>NULL</value>
        </criteriaItems>
        <description>Adds user email address associated to the Assigned PM #2 field.</description>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>FU - Assigned PM Email</fullName>
        <actions>
            <name>Assigned_PM_Email</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Account.Assigned_PM__c</field>
            <operation>notEqual</operation>
            <value>NULL</value>
        </criteriaItems>
        <description>Adds user email address associated to the Assigned PM field.</description>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>FU - FBR BA Email</fullName>
        <actions>
            <name>FBR_BA_Email</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Account.Assigned_BA_4__c</field>
            <operation>notEqual</operation>
            <value>NULL</value>
        </criteriaItems>
        <description>Adds user email address associated to the Assigned FBR BA field.</description>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>FU - Hierarchy Completed by Manager Email</fullName>
        <actions>
            <name>FU_Hierarchy_Completed_by_Mgr_Email</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Account.Hierarchy_Completed_by__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <description>Field update to Hierarchy Completed by Manager Email field from Hierarchy Completed by&apos;s user setup for notification purposes</description>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>FU - Hierarchy Director Approved Last Modified</fullName>
        <actions>
            <name>Hierarchy_Director_Approved_Last_Modifie</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <description>Updates the Hierarchy Director Approved LastModified field on the Account (https://na6.salesforce.com/00N80000005eJtt)</description>
        <formula>ISCHANGED(  Hierarchy_Director_Approved__c  )</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>FU - Hierarchy Updated Last Modified</fullName>
        <actions>
            <name>Hierarchy_Updated_Last_Modified</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <description>Updates the Hierarchy Updated Last Modified field on the Account (https://na6.salesforce.com/00N80000005eJte)</description>
        <formula>ISCHANGED( Hierarchy_Updated__c )</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>FU - Mobile Email Update</fullName>
        <actions>
            <name>Mobile_BA_Email</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Account.Assigned_BA_2__c</field>
            <operation>notEqual</operation>
            <value>NULL</value>
        </criteriaItems>
        <description>Adds user email address associated to the Assigned Mobile BA field.</description>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>FU - Parent Active Client Product Families</fullName>
        <actions>
            <name>FU_Parent_Active_Client_Product_Famili</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <description>Update Child Account with the Parent Account active client product families</description>
        <formula>len(ParentId) &gt; 0</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>FU - Parent Active Contract Types</fullName>
        <actions>
            <name>FU_Parent_Active_Contract_Types</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <description>Update child account with the active contract types of the parent account.</description>
        <formula>len(ParentId) &gt; 0</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>FU - RMS BA Email</fullName>
        <actions>
            <name>RMS_BA_Email</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Account.Assigned_BA_3__c</field>
            <operation>notEqual</operation>
            <value>NULL</value>
        </criteriaItems>
        <description>Adds user email address associated to the Assigned RMS BA field.</description>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>FU - ResetAccountTypeClient</fullName>
        <actions>
            <name>ResetAccountTypeClient</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Account.Client__c</field>
            <operation>equals</operation>
            <value>False</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>FU - SetAccountTypeClient</fullName>
        <actions>
            <name>SetAccountTypeClient</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Account.Client__c</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>FU - Update CAD BA Email</fullName>
        <actions>
            <name>CAD_BA_Email</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <booleanFilter>1</booleanFilter>
        <criteriaItems>
            <field>Account.Assigned_BA_1__c</field>
            <operation>notEqual</operation>
            <value>NULL</value>
        </criteriaItems>
        <description>Adds user email address associated to the Assigned CAD BA field.</description>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>WF - VisiNet Account Service Type Change</fullName>
        <actions>
            <name>EA_VisiNet_Account_Service_Type_Change</name>
            <type>Alert</type>
        </actions>
        <active>false</active>
        <booleanFilter>(1 OR 2 OR 3) AND 4 AND 5</booleanFilter>
        <criteriaItems>
            <field>Account.Service_Type__c</field>
            <operation>includes</operation>
            <value>Police</value>
        </criteriaItems>
        <criteriaItems>
            <field>Account.Service_Type__c</field>
            <operation>includes</operation>
            <value>Sheriff</value>
        </criteriaItems>
        <criteriaItems>
            <field>Account.Service_Type__c</field>
            <operation>includes</operation>
            <value>Military</value>
        </criteriaItems>
        <criteriaItems>
            <field>Account.Product_Family_WMP__c</field>
            <operation>includes</operation>
            <value>VisiNet</value>
        </criteriaItems>
        <criteriaItems>
            <field>Account.EMS_Customer_Number_WMP__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <description>Email trigger when a VisiNet account&apos;s Service Type field contains Police, Sheriff, Military</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
</Workflow>
