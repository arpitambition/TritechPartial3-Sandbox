<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <alerts>
        <fullName>EA_EMS_Service_Contract_Inactive</fullName>
        <description>EA - EMS Service Contract Inactive</description>
        <protected>false</protected>
        <recipients>
            <type>accountOwner</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Support/TA_EMS_Service_Contract_Inactive</template>
    </alerts>
    <alerts>
        <fullName>EA_EMS_Service_Contract_Suspended</fullName>
        <description>EA - EMS Service Contract Suspended</description>
        <protected>false</protected>
        <recipients>
            <type>accountOwner</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Support/TA_EMS_Service_Contract_Suspended</template>
    </alerts>
    <alerts>
        <fullName>EA_VisiNet_Service_Contract_Active</fullName>
        <ccEmails>CS-TechServices@TRITECH.com</ccEmails>
        <ccEmails>Engineering-Managers-Leads@TRITECH.com</ccEmails>
        <ccEmails>pm-all@tritech.com</ccEmails>
        <description>EA - VisiNet Service Contract Active</description>
        <protected>false</protected>
        <senderType>CurrentUser</senderType>
        <template>Support/TA_VisiNet_Service_Contract_Active</template>
    </alerts>
    <alerts>
        <fullName>EA_VisiNet_Service_Contract_Emergency_Support_Only</fullName>
        <ccEmails>CS-TechServices@TRITECH.com</ccEmails>
        <ccEmails>Engineering-Managers-Leads@TRITECH.com</ccEmails>
        <ccEmails>pm-all@tritech.com</ccEmails>
        <description>EA - VisiNet Service Contract Emergency Support Only</description>
        <protected>false</protected>
        <senderType>CurrentUser</senderType>
        <template>Support/TA_VisiNet_Service_Contract_Emergency_Support_Only</template>
    </alerts>
    <alerts>
        <fullName>EA_VisiNet_Service_Contract_Inactive</fullName>
        <ccEmails>CS-TechServices@TRITECH.com</ccEmails>
        <ccEmails>Engineering-Managers-Leads@TRITECH.com</ccEmails>
        <ccEmails>pm-all@tritech.com</ccEmails>
        <description>EA - VisiNet Service Contract Inactive</description>
        <protected>false</protected>
        <senderType>CurrentUser</senderType>
        <template>Support/TA_VisiNet_Service_Contract_Inactive</template>
    </alerts>
    <alerts>
        <fullName>EA_VisiNet_Service_Contract_Suspended</fullName>
        <ccEmails>CS-TechServices@TRITECH.com</ccEmails>
        <ccEmails>Engineering-Managers-Leads@TRITECH.com</ccEmails>
        <ccEmails>pm-all@tritech.com</ccEmails>
        <description>EA - VisiNet Service Contract Suspended</description>
        <protected>false</protected>
        <senderType>CurrentUser</senderType>
        <template>Support/TA_VisiNet_Service_Contract_Suspended</template>
    </alerts>
    <alerts>
        <fullName>test</fullName>
        <description>test</description>
        <protected>false</protected>
        <recipients>
            <recipient>jen.vansant@tritech.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>scott.key@tritech.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/Contact_Portal_Request_Email</template>
    </alerts>
    <fieldUpdates>
        <fullName>Contract_Status_Inactive</fullName>
        <description>Field update to the service contract status field to reflect &quot;Inactive&quot; when the end date has passed</description>
        <field>Contract_Status_WMP__c</field>
        <literalValue>Inactive</literalValue>
        <name>Contract Status - Inactive</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>FU_Contract_Status_Update</fullName>
        <field>ActivationDate</field>
        <name>FU - Contract Status Update</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>No_HW_Support_SW_Only</fullName>
        <description>Status Field update to: “No HW Support, Software ONLY” which is an active status type and allows continued access to the portal</description>
        <field>Contract_Status_WMP__c</field>
        <literalValue>No HW Support, Software Only</literalValue>
        <name>No HW Support SW Only</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Pending_Renewal</fullName>
        <description>Change Contract Status to &quot;Pending Renewal&quot; which is an INACTIVE status</description>
        <field>Contract_Status_WMP__c</field>
        <literalValue>Pending Renewal</literalValue>
        <name>Pending Renewal</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Renewal_Due</fullName>
        <description>Change Contract Status to Renewal Due which is an ACTIVE status</description>
        <field>Contract_Status_WMP__c</field>
        <literalValue>Renewal Due</literalValue>
        <name>Renewal Due</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Scot_Test</fullName>
        <field>Contract_Status_WMP__c</field>
        <literalValue>No HW Support, Software Only</literalValue>
        <name>Scot Test</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <rules>
        <fullName>FU - Service Contract%3A EMS</fullName>
        <active>true</active>
        <criteriaItems>
            <field>ServiceContract.Product_Family_WMP__c</field>
            <operation>equals</operation>
            <value>EMS</value>
        </criteriaItems>
        <criteriaItems>
            <field>ServiceContract.Contract_Status_WMP__c</field>
            <operation>equals</operation>
            <value>Active</value>
        </criteriaItems>
        <description>Day 1 after Contract End Date:  Status Field update to: “Pending Renewal” which is an inactive status type and removes access to the portal.</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
        <workflowTimeTriggers>
            <actions>
                <name>Pending_Renewal</name>
                <type>FieldUpdate</type>
            </actions>
            <offsetFromField>ServiceContract.EndDate</offsetFromField>
            <timeLength>1</timeLength>
            <workflowTimeTriggerUnit>Days</workflowTimeTriggerUnit>
        </workflowTimeTriggers>
    </rules>
    <rules>
        <fullName>FU - Service Contracts%3A 911 %28Day 1 after End Date%29</fullName>
        <active>true</active>
        <criteriaItems>
            <field>ServiceContract.Product_Family_WMP__c</field>
            <operation>equals</operation>
            <value>911</value>
        </criteriaItems>
        <criteriaItems>
            <field>ServiceContract.Contract_Status_WMP__c</field>
            <operation>equals</operation>
            <value>Active</value>
        </criteriaItems>
        <description>Day 1 after Contract End Date: Status Field update to: “No HW Support, Software ONLY” which is an active status type and allows continued access to the portal</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
        <workflowTimeTriggers>
            <actions>
                <name>No_HW_Support_SW_Only</name>
                <type>FieldUpdate</type>
            </actions>
            <offsetFromField>ServiceContract.EndDate</offsetFromField>
            <timeLength>1</timeLength>
            <workflowTimeTriggerUnit>Days</workflowTimeTriggerUnit>
        </workflowTimeTriggers>
    </rules>
    <rules>
        <fullName>FU - Service Contracts%3A 911 %28Day 61%29</fullName>
        <active>true</active>
        <criteriaItems>
            <field>ServiceContract.Product_Family_WMP__c</field>
            <operation>equals</operation>
            <value>911</value>
        </criteriaItems>
        <criteriaItems>
            <field>ServiceContract.Contract_Status_WMP__c</field>
            <operation>equals</operation>
            <value>&quot;No HW Support, Software Only&quot;,Active</value>
        </criteriaItems>
        <description>Day 61 after Contract End Date: Status Field update to “Pending Renewal” which is an inactive</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
        <workflowTimeTriggers>
            <actions>
                <name>Pending_Renewal</name>
                <type>FieldUpdate</type>
            </actions>
            <offsetFromField>ServiceContract.EndDate</offsetFromField>
            <timeLength>61</timeLength>
            <workflowTimeTriggerUnit>Days</workflowTimeTriggerUnit>
        </workflowTimeTriggers>
    </rules>
    <rules>
        <fullName>FU - Service Contracts%3A VisiNet IMC VisionAIR Inform %28Day 1 after End Date%29</fullName>
        <active>true</active>
        <criteriaItems>
            <field>ServiceContract.Product_Family_WMP__c</field>
            <operation>equals</operation>
            <value>Inform,IMC,VisiNet,VisionAIR,IQ,Tiburon</value>
        </criteriaItems>
        <criteriaItems>
            <field>ServiceContract.Contract_Status_WMP__c</field>
            <operation>equals</operation>
            <value>Active</value>
        </criteriaItems>
        <description>Day 1 after Contract End Date:  Status Field update to: “Renewal Due” which is an active status type and allows continued access to the portal</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
        <workflowTimeTriggers>
            <actions>
                <name>Renewal_Due</name>
                <type>FieldUpdate</type>
            </actions>
            <offsetFromField>ServiceContract.EndDate</offsetFromField>
            <timeLength>1</timeLength>
            <workflowTimeTriggerUnit>Days</workflowTimeTriggerUnit>
        </workflowTimeTriggers>
    </rules>
    <rules>
        <fullName>FU - Service Contracts%3A VisiNet IMC VisionAIR Inform %28Day 91 after End Date%29</fullName>
        <active>true</active>
        <criteriaItems>
            <field>ServiceContract.Product_Family_WMP__c</field>
            <operation>equals</operation>
            <value>Inform,IMC,VisiNet,VisionAIR,IQ,Tiburon</value>
        </criteriaItems>
        <criteriaItems>
            <field>ServiceContract.Contract_Status_WMP__c</field>
            <operation>equals</operation>
            <value>Active,Pending Renewal</value>
        </criteriaItems>
        <description>Day 91 after Contract End Date:  Status Field update to: “Pending Renewal” which is an inactive status type</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
        <workflowTimeTriggers>
            <actions>
                <name>Pending_Renewal</name>
                <type>FieldUpdate</type>
            </actions>
            <offsetFromField>ServiceContract.EndDate</offsetFromField>
            <timeLength>91</timeLength>
            <workflowTimeTriggerUnit>Days</workflowTimeTriggerUnit>
        </workflowTimeTriggers>
    </rules>
    <rules>
        <fullName>FU - Service Contracts%3A VisiNet IMC VisionAIR Inform Tiburon</fullName>
        <active>false</active>
        <criteriaItems>
            <field>ServiceContract.Product_Family_WMP__c</field>
            <operation>equals</operation>
            <value>Inform,IMC,VisiNet,VisionAIR,Tiburon,IQ</value>
        </criteriaItems>
        <criteriaItems>
            <field>ServiceContract.Contract_Status_WMP__c</field>
            <operation>equals</operation>
            <value>Active</value>
        </criteriaItems>
        <criteriaItems>
            <field>ServiceContract.EndDate</field>
            <operation>lessThan</operation>
            <value>TODAY</value>
        </criteriaItems>
        <description>Day 1 after Contract End Date:  Status Field update to: “Renewal Due” which is an active status type and allows continued access to the portal

Day 91 after Contract End Date:  Status Field update to: “Pending Renewal” which is an inactive status type</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
        <workflowTimeTriggers>
            <actions>
                <name>Renewal_Due</name>
                <type>FieldUpdate</type>
            </actions>
            <offsetFromField>ServiceContract.EndDate</offsetFromField>
            <timeLength>1</timeLength>
            <workflowTimeTriggerUnit>Days</workflowTimeTriggerUnit>
        </workflowTimeTriggers>
        <workflowTimeTriggers>
            <actions>
                <name>Pending_Renewal</name>
                <type>FieldUpdate</type>
            </actions>
            <offsetFromField>ServiceContract.EndDate</offsetFromField>
            <timeLength>91</timeLength>
            <workflowTimeTriggerUnit>Days</workflowTimeTriggerUnit>
        </workflowTimeTriggers>
    </rules>
</Workflow>
