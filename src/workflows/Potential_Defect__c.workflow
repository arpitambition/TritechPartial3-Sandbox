<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <alerts>
        <fullName>EA_Internal_Defect_Ticket_Status_Update_VA1</fullName>
        <description>EA - Internal Defect Ticket Status Update VA1</description>
        <protected>false</protected>
        <recipients>
            <recipient>charles.leonard@tritech.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Support/TA_Internal_Defect_Ticket_Status_Update</template>
    </alerts>
    <alerts>
        <fullName>EA_Internal_Defect_Ticket_Status_Update_VA2</fullName>
        <description>EA - Internal Defect Ticket Status Update VA2</description>
        <protected>false</protected>
        <recipients>
            <recipient>jonathan.lewis@tritech.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Support/TA_Internal_Defect_Ticket_Status_Update</template>
    </alerts>
    <alerts>
        <fullName>EA_Internal_Defect_Ticket_Status_Update_VA3</fullName>
        <description>EA - Internal Defect Ticket Status Update VA3</description>
        <protected>false</protected>
        <recipients>
            <recipient>charles.leonard@tritech.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>jonathan.lewis@tritech.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Support/TA_Internal_Defect_Ticket_Status_Update</template>
    </alerts>
    <alerts>
        <fullName>EA_Perform_Potential_Defect_Ticket_Created</fullName>
        <description>EA - Perform Potential Defect Ticket Created</description>
        <protected>false</protected>
        <recipients>
            <recipient>dan.christian@zuerchertech.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>patricia.ceccacci@zuerchertech.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Support/TA_Perform_Potential_Defect_Ticket_Created</template>
    </alerts>
    <alerts>
        <fullName>EA_Planned_Release_Field_Completed_Internal_Notification</fullName>
        <description>EA - Planned Release Field Completed Internal Notification</description>
        <protected>false</protected>
        <recipients>
            <type>owner</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Support/EA_Planned_Release_Field_Notification_Internal</template>
    </alerts>
    <alerts>
        <fullName>EA_VisiNet_Enhancement_Ticket_Status_Progression_Status_Assessing_Issue</fullName>
        <ccEmails>PdMVIsinet@tritech.com</ccEmails>
        <description>EA - VisiNet Enhancement Ticket Status Progression Status Assessing Issue</description>
        <protected>false</protected>
        <senderType>CurrentUser</senderType>
        <template>Support/TA_VisiNet_Enhancement_Ticket_Status_Progression</template>
    </alerts>
    <alerts>
        <fullName>EA_VisiNet_Enhancement_Ticket_Status_Progression_Status_Closed_Fix_ready_for_Rel</fullName>
        <ccEmails>PdMVIsinet@tritech.com</ccEmails>
        <description>EA - VisiNet Enhancement Ticket Status Progression Status Closed - Fix ready for Release</description>
        <protected>false</protected>
        <senderType>CurrentUser</senderType>
        <template>Support/TA_VisiNet_Enhancement_Ticket_Status_Progression</template>
    </alerts>
    <alerts>
        <fullName>EA_VisiNet_Enhancement_Ticket_Status_Progression_Status_Fix_for_Release_in_Progr</fullName>
        <ccEmails>PdMVIsinet@tritech.com</ccEmails>
        <description>EA - VisiNet Enhancement Ticket Status Progression Status Fix for Release in Progress</description>
        <protected>false</protected>
        <senderType>CurrentUser</senderType>
        <template>Support/TA_VisiNet_Enhancement_Ticket_Status_Progression</template>
    </alerts>
    <alerts>
        <fullName>EA_VisiNet_Enhancement_Ticket_Status_Progression_Status_QA_complete_Release</fullName>
        <ccEmails>PdMVIsinet@tritech.com</ccEmails>
        <description>EA - VisiNet Enhancement Ticket Status Progression Status QA complete - Release</description>
        <protected>false</protected>
        <senderType>CurrentUser</senderType>
        <template>Support/TA_VisiNet_Enhancement_Ticket_Status_Progression</template>
    </alerts>
    <alerts>
        <fullName>EA_VisiNet_Enhancement_Ticket_Status_Progression_Status_Rejected</fullName>
        <ccEmails>PdMVIsinet@tritech.com</ccEmails>
        <description>EA - VisiNet Enhancement Ticket Status Progression Status Rejected</description>
        <protected>false</protected>
        <senderType>CurrentUser</senderType>
        <template>Support/TA_VisiNet_Enhancement_Ticket_Status_Progression</template>
    </alerts>
    <alerts>
        <fullName>EA_VisiNet_Enhancement_Ticket_Status_Progression_Status_Targeted_for_Future_Rele</fullName>
        <ccEmails>PdMVIsinet@tritech.com</ccEmails>
        <description>EA - VisiNet Enhancement Ticket Status Progression Status Targeted for Future Release</description>
        <protected>false</protected>
        <senderType>CurrentUser</senderType>
        <template>Support/TA_VisiNet_Enhancement_Ticket_Status_Progression</template>
    </alerts>
    <fieldUpdates>
        <fullName>Copy_Ticket_Owner_Email</fullName>
        <field>Case_Owner_Email__c</field>
        <formula>CreatedBy.Email</formula>
        <name>Copy Ticket Owner Email</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>TFS_Status_Update_for_Accepted</fullName>
        <field>Ticket_Status__c</field>
        <literalValue>Targeted for Future Release</literalValue>
        <name>TFS Status Update for Accepted</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>TFS_Status_Update_for_Rejected</fullName>
        <field>Ticket_Status__c</field>
        <literalValue>Rejected</literalValue>
        <name>TFS Status Update for Rejected</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <outboundMessages>
        <fullName>PotDefectChange_SanD_TFS</fullName>
        <apiVersion>27.0</apiVersion>
        <description>Potential Defect Change message for TFS</description>
        <endpointUrl>http://74.11.191.2/Salesforce2Tfs/SfListener/notificationport.svc</endpointUrl>
        <fields>Accepted__c</fields>
        <fields>Account_Name__c</fields>
        <fields>Anticipated_Delivery_Date__c</fields>
        <fields>Area_Path__c</fields>
        <fields>Billable_Hours__c</fields>
        <fields>Billable__c</fields>
        <fields>Black_Box_Collected__c</fields>
        <fields>CCB_Notes__c</fields>
        <fields>Contact__c</fields>
        <fields>CreatedById</fields>
        <fields>CreatedDate</fields>
        <fields>CustomerLookup__c</fields>
        <fields>CustomerNumberLookup__c</fields>
        <fields>Customer_Contact_Date_Time__c</fields>
        <fields>Customer_Priority__c</fields>
        <fields>Defect_Ticket_ID__c</fields>
        <fields>Description__c</fields>
        <fields>Dummyrecordtouchfield__c</fields>
        <fields>Environment_Type__c</fields>
        <fields>Fixed_in_Build__c</fields>
        <fields>Found_in_Build__c</fields>
        <fields>Id</fields>
        <fields>Internal_Steps_to_Recreate_Issue__c</fields>
        <fields>IsDeleted</fields>
        <fields>Known_Issues_Description__c</fields>
        <fields>LastActivityDate</fields>
        <fields>LastModifiedById</fields>
        <fields>LastModifiedDate</fields>
        <fields>LastViewedDate</fields>
        <fields>Legacy_Defect_Ticket_Number__c</fields>
        <fields>MOL_Score__c</fields>
        <fields>Name</fields>
        <fields>Occurred_After_Upgrade__c</fields>
        <fields>Occurrence__c</fields>
        <fields>Original_Contact__c</fields>
        <fields>Original_Customer__c</fields>
        <fields>Original_Service_Contract__c</fields>
        <fields>OwnerId</fields>
        <fields>Patch_Release_Branch__c</fields>
        <fields>Patch_Status_Comments__c</fields>
        <fields>Patch_Status__c</fields>
        <fields>Planned_Release__c</fields>
        <fields>PotentialDefectURL__c</fields>
        <fields>Priority__c</fields>
        <fields>Product_Family__c</fields>
        <fields>Product_Group_1__c</fields>
        <fields>Product_Sub_Module__c</fields>
        <fields>Product_Type__c</fields>
        <fields>Product__c</fields>
        <fields>Public_Notes__c</fields>
        <fields>ROID__c</fields>
        <fields>RecordTypeId</fields>
        <fields>Rejected__c</fields>
        <fields>Released_In__c</fields>
        <fields>Reported_Major_Version__c</fields>
        <fields>Reported_Minor_Version__c</fields>
        <fields>Reported_Patch__c</fields>
        <fields>Reproducible__c</fields>
        <fields>Resolution_Notes__c</fields>
        <fields>Service_Contract__c</fields>
        <fields>Severity__c</fields>
        <fields>Short_Issue_Summary__c</fields>
        <fields>Steps_to_Recreate_Issue__c</fields>
        <fields>SystemModstamp</fields>
        <fields>TFS_Area_Path__c</fields>
        <fields>TFS_Collection__c</fields>
        <fields>TFS_Comments__c</fields>
        <fields>TFS_Work_Item__c</fields>
        <fields>Target_Patch_Release_Date__c</fields>
        <fields>Ticket_Origin__c</fields>
        <fields>Ticket_Status__c</fields>
        <includeSessionId>true</includeSessionId>
        <integrationUser>roger.jackson@tritech.com</integrationUser>
        <name>PotDefectChange_SanD</name>
        <protected>false</protected>
        <useDeadLetterQueue>false</useDeadLetterQueue>
    </outboundMessages>
    <outboundMessages>
        <fullName>PotDefectChange_SanD_TFS_Inform911</fullName>
        <apiVersion>31.0</apiVersion>
        <description>Potential Defect Change message for TFS</description>
        <endpointUrl>http://74.11.191.2/Salesforce2Tfs/SfListener/notificationport.svc</endpointUrl>
        <fields>Accepted__c</fields>
        <fields>Account_Name__c</fields>
        <fields>Anticipated_Delivery_Date__c</fields>
        <fields>Area_Path__c</fields>
        <fields>Billable_Hours__c</fields>
        <fields>Billable__c</fields>
        <fields>Black_Box_Collected__c</fields>
        <fields>CCB_Notes__c</fields>
        <fields>Contact__c</fields>
        <fields>CreatedById</fields>
        <fields>CreatedDate</fields>
        <fields>CustomerLookup__c</fields>
        <fields>CustomerNumberLookup__c</fields>
        <fields>Customer_Contact_Date_Time__c</fields>
        <fields>Customer_Priority__c</fields>
        <fields>Defect_Ticket_ID__c</fields>
        <fields>Description__c</fields>
        <fields>Dummyrecordtouchfield__c</fields>
        <fields>Environment_Type__c</fields>
        <fields>Fixed_in_Build__c</fields>
        <fields>Found_in_Build__c</fields>
        <fields>Id</fields>
        <fields>Internal_Steps_to_Recreate_Issue__c</fields>
        <fields>IsDeleted</fields>
        <fields>Known_Issues_Description__c</fields>
        <fields>LastActivityDate</fields>
        <fields>LastModifiedById</fields>
        <fields>LastModifiedDate</fields>
        <fields>LastReferencedDate</fields>
        <fields>LastViewedDate</fields>
        <fields>Legacy_Defect_Ticket_Number__c</fields>
        <fields>MOL_Score__c</fields>
        <fields>Name</fields>
        <fields>Occurred_After_Upgrade__c</fields>
        <fields>Occurrence__c</fields>
        <fields>Original_Contact__c</fields>
        <fields>Original_Customer__c</fields>
        <fields>Original_Service_Contract__c</fields>
        <fields>OwnerId</fields>
        <fields>Patch_Release_Branch__c</fields>
        <fields>Patch_Status_Comments__c</fields>
        <fields>Patch_Status__c</fields>
        <fields>Planned_Release__c</fields>
        <fields>PotentialDefectURL__c</fields>
        <fields>Priority__c</fields>
        <fields>Product_Family__c</fields>
        <fields>Product_Group_1__c</fields>
        <fields>Product_Sub_Module__c</fields>
        <fields>Product_Type__c</fields>
        <fields>Product__c</fields>
        <fields>Public_Notes__c</fields>
        <fields>ROID__c</fields>
        <fields>RecordTypeId</fields>
        <fields>Rejected__c</fields>
        <fields>Released_In__c</fields>
        <fields>Reported_Major_Version__c</fields>
        <fields>Reported_Minor_Version__c</fields>
        <fields>Reported_Patch__c</fields>
        <fields>Reproducible__c</fields>
        <fields>Resolution_Notes__c</fields>
        <fields>Service_Contract__c</fields>
        <fields>Severity__c</fields>
        <fields>Short_Issue_Summary__c</fields>
        <fields>Steps_to_Recreate_Issue__c</fields>
        <fields>SystemModstamp</fields>
        <fields>TFS_Area_Path__c</fields>
        <fields>TFS_Collection__c</fields>
        <fields>TFS_Comments__c</fields>
        <fields>TFS_Work_Item__c</fields>
        <fields>Target_Patch_Release_Date__c</fields>
        <fields>Ticket_Origin__c</fields>
        <fields>Ticket_Status__c</fields>
        <includeSessionId>true</includeSessionId>
        <integrationUser>roger.jackson@tritech.com</integrationUser>
        <name>PotDefectChange_SanD_Inform911</name>
        <protected>false</protected>
        <useDeadLetterQueue>false</useDeadLetterQueue>
    </outboundMessages>
    <outboundMessages>
        <fullName>PotDefectChange_VAIR_TFS</fullName>
        <apiVersion>27.0</apiVersion>
        <description>Potential Defect Change message for TFS</description>
        <endpointUrl>http://70.63.87.194/SFListener/NotificationPort.svc</endpointUrl>
        <fields>Accepted__c</fields>
        <fields>Account_Name__c</fields>
        <fields>Anticipated_Delivery_Date__c</fields>
        <fields>Area_Path__c</fields>
        <fields>Billable_Hours__c</fields>
        <fields>Billable__c</fields>
        <fields>Black_Box_Collected__c</fields>
        <fields>CCB_Notes__c</fields>
        <fields>Contact__c</fields>
        <fields>CreatedById</fields>
        <fields>CreatedDate</fields>
        <fields>CustomerLookup__c</fields>
        <fields>CustomerNumberLookup__c</fields>
        <fields>Customer_Contact_Date_Time__c</fields>
        <fields>Customer_Priority__c</fields>
        <fields>Defect_Ticket_ID__c</fields>
        <fields>Description__c</fields>
        <fields>Dummyrecordtouchfield__c</fields>
        <fields>Environment_Type__c</fields>
        <fields>Fixed_in_Build__c</fields>
        <fields>Found_in_Build__c</fields>
        <fields>Id</fields>
        <fields>Internal_Steps_to_Recreate_Issue__c</fields>
        <fields>IsDeleted</fields>
        <fields>Known_Issues_Description__c</fields>
        <fields>LastActivityDate</fields>
        <fields>LastModifiedById</fields>
        <fields>LastModifiedDate</fields>
        <fields>LastViewedDate</fields>
        <fields>Legacy_Defect_Ticket_Number__c</fields>
        <fields>MOL_Score__c</fields>
        <fields>Name</fields>
        <fields>Occurred_After_Upgrade__c</fields>
        <fields>Occurrence__c</fields>
        <fields>Original_Contact__c</fields>
        <fields>Original_Customer__c</fields>
        <fields>Original_Service_Contract__c</fields>
        <fields>OwnerId</fields>
        <fields>Patch_Release_Branch__c</fields>
        <fields>Patch_Status_Comments__c</fields>
        <fields>Patch_Status__c</fields>
        <fields>Planned_Release__c</fields>
        <fields>PotentialDefectURL__c</fields>
        <fields>Priority__c</fields>
        <fields>Product_Family__c</fields>
        <fields>Product_Group_1__c</fields>
        <fields>Product_Sub_Module__c</fields>
        <fields>Product_Type__c</fields>
        <fields>Product__c</fields>
        <fields>Public_Notes__c</fields>
        <fields>ROID__c</fields>
        <fields>RecordTypeId</fields>
        <fields>Rejected__c</fields>
        <fields>Released_In__c</fields>
        <fields>Reported_Major_Version__c</fields>
        <fields>Reported_Minor_Version__c</fields>
        <fields>Reported_Patch__c</fields>
        <fields>Reproducible__c</fields>
        <fields>Resolution_Notes__c</fields>
        <fields>Service_Contract__c</fields>
        <fields>Severity__c</fields>
        <fields>Short_Issue_Summary__c</fields>
        <fields>Steps_to_Recreate_Issue__c</fields>
        <fields>SystemModstamp</fields>
        <fields>TFS_Area_Path__c</fields>
        <fields>TFS_Collection__c</fields>
        <fields>TFS_Comments__c</fields>
        <fields>TFS_Work_Item__c</fields>
        <fields>Target_Patch_Release_Date__c</fields>
        <fields>Ticket_Origin__c</fields>
        <fields>Ticket_Status__c</fields>
        <includeSessionId>true</includeSessionId>
        <integrationUser>ttsync@tritech.com</integrationUser>
        <name>PotDefectChange_VAIR</name>
        <protected>false</protected>
        <useDeadLetterQueue>false</useDeadLetterQueue>
    </outboundMessages>
    <outboundMessages>
        <fullName>RogerTest</fullName>
        <apiVersion>37.0</apiVersion>
        <description>roger test</description>
        <endpointUrl>http://70.63.87.189/SFListener/NotificationPort.svc</endpointUrl>
        <fields>Accepted__c</fields>
        <fields>Account_Name__c</fields>
        <fields>Anticipated_Delivery_Date__c</fields>
        <fields>Area_Path__c</fields>
        <fields>Billable_Hours__c</fields>
        <fields>Billable__c</fields>
        <fields>Black_Box_Collected__c</fields>
        <fields>Blitz__c</fields>
        <fields>CCB_Notes__c</fields>
        <fields>Case_Owner_Email__c</fields>
        <fields>Contact__c</fields>
        <fields>CreatedById</fields>
        <fields>CreatedDate</fields>
        <fields>CustomerLookup__c</fields>
        <fields>CustomerNumberLookup__c</fields>
        <fields>Customer_Contact_Date_Time__c</fields>
        <fields>Customer_Priority__c</fields>
        <fields>Defect_Close_Date__c</fields>
        <fields>Defect_Ticket_ID__c</fields>
        <fields>Description__c</fields>
        <fields>Dummyrecordtouchfield__c</fields>
        <fields>Environment_Type__c</fields>
        <fields>Fixed_in_Build__c</fields>
        <fields>Found_in_Build__c</fields>
        <fields>Id</fields>
        <fields>Internal_Steps_to_Recreate_Issue__c</fields>
        <fields>IsDeleted</fields>
        <fields>Known_Issues_Description__c</fields>
        <fields>LastActivityDate</fields>
        <fields>LastModifiedById</fields>
        <fields>LastModifiedDate</fields>
        <fields>LastReferencedDate</fields>
        <fields>LastViewedDate</fields>
        <fields>Legacy_Defect_Ticket_Number__c</fields>
        <fields>MOL_Score__c</fields>
        <fields>Name</fields>
        <fields>Occurred_After_Upgrade__c</fields>
        <fields>Occurrence__c</fields>
        <fields>Original_Contact__c</fields>
        <fields>Original_Customer__c</fields>
        <fields>Original_Service_Contract__c</fields>
        <fields>OwnerId</fields>
        <fields>Patch_Release_Branch__c</fields>
        <fields>Patch_Status_Comments__c</fields>
        <fields>Patch_Status__c</fields>
        <fields>Planned_Release__c</fields>
        <fields>PotentialDefectURL__c</fields>
        <fields>Priority__c</fields>
        <fields>Product_Family__c</fields>
        <fields>Product_Group_1__c</fields>
        <fields>Product_Sub_Module__c</fields>
        <fields>Product_Type__c</fields>
        <fields>Product__c</fields>
        <fields>Public_Notes__c</fields>
        <fields>ROID__c</fields>
        <fields>RecordTypeId</fields>
        <fields>Rejected__c</fields>
        <fields>Released_In__c</fields>
        <fields>Reported_Major_Version__c</fields>
        <fields>Reported_Minor_Version__c</fields>
        <fields>Reported_Patch__c</fields>
        <fields>Reproducible__c</fields>
        <fields>Resolution_Notes__c</fields>
        <fields>Service_Contract__c</fields>
        <fields>Severity__c</fields>
        <fields>Short_Issue_Summary__c</fields>
        <fields>Steps_to_Recreate_Issue__c</fields>
        <fields>Support_Ticket_Owner_Email__c</fields>
        <fields>SystemModstamp</fields>
        <fields>TFS_Area_Path__c</fields>
        <fields>TFS_Collection__c</fields>
        <fields>TFS_Comments__c</fields>
        <fields>TFS_Work_Item__c</fields>
        <fields>Target_Patch_Release_Date__c</fields>
        <fields>Ticket_Origin__c</fields>
        <fields>Ticket_Status__c</fields>
        <includeSessionId>false</includeSessionId>
        <integrationUser>roger.jackson@tritech.com</integrationUser>
        <name>RogerTest</name>
        <protected>false</protected>
        <useDeadLetterQueue>false</useDeadLetterQueue>
    </outboundMessages>
    <rules>
        <fullName>EA - Internal Defect Ticket Status Update VA1</fullName>
        <actions>
            <name>EA_Internal_Defect_Ticket_Status_Update_VA1</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Potential_Defect__c.Ticket_Status__c</field>
            <operation>notEqual</operation>
            <value>Assessing Issue</value>
        </criteriaItems>
        <criteriaItems>
            <field>Potential_Defect__c.TFS_Collection__c</field>
            <operation>equals</operation>
            <value>VisionAIR</value>
        </criteriaItems>
        <criteriaItems>
            <field>Potential_Defect__c.Area_Path__c</field>
            <operation>equals</operation>
            <value>Inform 5,VisionCAD MOBILE MOL</value>
        </criteriaItems>
        <description>Status not equal to Assessing Issue
TFS Collection = VisionAIR
TFS Project = VisionCAD MOBILE MOL
OR
TFS Project = Inform 5
Send to Chuck Leonard</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>EA - Internal Defect Ticket Status Update VA2</fullName>
        <actions>
            <name>EA_Internal_Defect_Ticket_Status_Update_VA2</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Potential_Defect__c.Ticket_Status__c</field>
            <operation>notEqual</operation>
            <value>Assessing Issue</value>
        </criteriaItems>
        <criteriaItems>
            <field>Potential_Defect__c.TFS_Collection__c</field>
            <operation>equals</operation>
            <value>VisionAIR</value>
        </criteriaItems>
        <criteriaItems>
            <field>Potential_Defect__c.Area_Path__c</field>
            <operation>equals</operation>
            <value>Integrated Solutions,Evolution,VisionRMSJAILFBRFIRE MOL</value>
        </criteriaItems>
        <description>Status not equal to Assessing Issue
TFS Collection = VisionAIR
TFS Project = VisionRMSJAILFBRFIRE MOL
OR
TFS Project = Integrated Solutions
OR
TFS Project = Evolution
Send to Jonathan Lewis</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>EA - Internal Defect Ticket Status Update VA3</fullName>
        <actions>
            <name>EA_Internal_Defect_Ticket_Status_Update_VA3</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Potential_Defect__c.Ticket_Status__c</field>
            <operation>notEqual</operation>
            <value>Assessing Issue</value>
        </criteriaItems>
        <criteriaItems>
            <field>Potential_Defect__c.TFS_Collection__c</field>
            <operation>equals</operation>
            <value>VisionAIR</value>
        </criteriaItems>
        <criteriaItems>
            <field>Potential_Defect__c.Area_Path__c</field>
            <operation>equals</operation>
            <value>VisionAIR_Publisher,VisionMEDIA</value>
        </criteriaItems>
        <description>Status not equal to Assessing Issue
TFS Collection = VisionAIR
TFS Project = VisionAIR_Publisher
OR
TFS Project = VisionMEDIA
Send to Chuck Leonard and Jonathan Lewis</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>EA - Perform Potential Defect Ticket Created</fullName>
        <actions>
            <name>EA_Perform_Potential_Defect_Ticket_Created</name>
            <type>Alert</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Potential_Defect__c.Product_Group_1__c</field>
            <operation>equals</operation>
            <value>Perform</value>
        </criteriaItems>
        <criteriaItems>
            <field>Potential_Defect__c.Ticket_Status__c</field>
            <operation>equals</operation>
            <value>Assessing Issue</value>
        </criteriaItems>
        <description>Perform product group email trigger alert upon creation of a potential defect ticket (Dan)</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>EA - VisiNet Enhancement Ticket Status Progression Status Assessing Issue</fullName>
        <actions>
            <name>EA_VisiNet_Enhancement_Ticket_Status_Progression_Status_Assessing_Issue</name>
            <type>Alert</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Potential_Defect__c.Ticket_Status__c</field>
            <operation>equals</operation>
            <value>Assessing Issue</value>
        </criteriaItems>
        <criteriaItems>
            <field>Potential_Defect__c.Product_Family__c</field>
            <operation>equals</operation>
            <value>VisiNet</value>
        </criteriaItems>
        <criteriaItems>
            <field>Potential_Defect__c.RecordTypeId</field>
            <operation>equals</operation>
            <value>Enhancement</value>
        </criteriaItems>
        <description>Workflow alert when Enhancement Ticket Status = Assessing Issue</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>EA - VisiNet Enhancement Ticket Status Progression Status Closed - Fix ready for Release</fullName>
        <actions>
            <name>EA_VisiNet_Enhancement_Ticket_Status_Progression_Status_Closed_Fix_ready_for_Rel</name>
            <type>Alert</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Potential_Defect__c.Ticket_Status__c</field>
            <operation>equals</operation>
            <value>Closed - Fix ready for Release</value>
        </criteriaItems>
        <criteriaItems>
            <field>Potential_Defect__c.RecordTypeId</field>
            <operation>equals</operation>
            <value>Enhancement</value>
        </criteriaItems>
        <criteriaItems>
            <field>Potential_Defect__c.Product_Family__c</field>
            <operation>equals</operation>
            <value>VisiNet</value>
        </criteriaItems>
        <description>Workflow alert when Enhancement Ticket Status = Closed - Fix ready for Release</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>EA - VisiNet Enhancement Ticket Status Progression Status Fix for Release in Progress</fullName>
        <actions>
            <name>EA_VisiNet_Enhancement_Ticket_Status_Progression_Status_Fix_for_Release_in_Progr</name>
            <type>Alert</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Potential_Defect__c.Ticket_Status__c</field>
            <operation>equals</operation>
            <value>Fix for Release in Progress</value>
        </criteriaItems>
        <criteriaItems>
            <field>Potential_Defect__c.RecordTypeId</field>
            <operation>equals</operation>
            <value>Enhancement</value>
        </criteriaItems>
        <criteriaItems>
            <field>Potential_Defect__c.Product_Family__c</field>
            <operation>equals</operation>
            <value>VisiNet</value>
        </criteriaItems>
        <description>Workflow alert when Enhancement Ticket Status = Fix for Release in Progres</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>EA - VisiNet Enhancement Ticket Status Progression Status QA complete - Release</fullName>
        <actions>
            <name>EA_VisiNet_Enhancement_Ticket_Status_Progression_Status_QA_complete_Release</name>
            <type>Alert</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Potential_Defect__c.Ticket_Status__c</field>
            <operation>equals</operation>
            <value>QA complete - Release</value>
        </criteriaItems>
        <criteriaItems>
            <field>Potential_Defect__c.RecordTypeId</field>
            <operation>equals</operation>
            <value>Enhancement</value>
        </criteriaItems>
        <criteriaItems>
            <field>Potential_Defect__c.Product_Family__c</field>
            <operation>equals</operation>
            <value>VisiNet</value>
        </criteriaItems>
        <description>Workflow alert when Enhancement Ticket Status = QA complete - Release</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>EA - VisiNet Enhancement Ticket Status Progression Status Rejected</fullName>
        <actions>
            <name>EA_VisiNet_Enhancement_Ticket_Status_Progression_Status_Rejected</name>
            <type>Alert</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Potential_Defect__c.Ticket_Status__c</field>
            <operation>equals</operation>
            <value>Rejected</value>
        </criteriaItems>
        <criteriaItems>
            <field>Potential_Defect__c.RecordTypeId</field>
            <operation>equals</operation>
            <value>Enhancement</value>
        </criteriaItems>
        <criteriaItems>
            <field>Potential_Defect__c.Product_Family__c</field>
            <operation>equals</operation>
            <value>VisiNet</value>
        </criteriaItems>
        <description>Workflow alert when Enhancement Ticket Status = Rejected</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>EA - VisiNet Enhancement Ticket Status Progression Status Targeted for Future Release</fullName>
        <actions>
            <name>EA_VisiNet_Enhancement_Ticket_Status_Progression_Status_Targeted_for_Future_Rele</name>
            <type>Alert</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Potential_Defect__c.Ticket_Status__c</field>
            <operation>equals</operation>
            <value>Targeted for Future Release</value>
        </criteriaItems>
        <criteriaItems>
            <field>Potential_Defect__c.RecordTypeId</field>
            <operation>equals</operation>
            <value>Enhancement</value>
        </criteriaItems>
        <criteriaItems>
            <field>Potential_Defect__c.Product_Family__c</field>
            <operation>equals</operation>
            <value>VisiNet</value>
        </criteriaItems>
        <description>Workflow alert when Enhancement Ticket Status = Targeted for Future Release</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>FU - Copy Support Owner Email to PD</fullName>
        <actions>
            <name>Copy_Ticket_Owner_Email</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Potential_Defect__c.CreatedDate</field>
            <operation>notEqual</operation>
            <value>12/31/1998 11:00 PM</value>
        </criteriaItems>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>FU - Potential Defect Ticket Status Update on Accepted</fullName>
        <actions>
            <name>TFS_Status_Update_for_Accepted</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Potential_Defect__c.Accepted__c</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <description>Automated update to Defect status when Accepted checkbox is checked. Status update becomes &quot;Targeted for Future Release&quot;</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>FU - Potential Defect Ticket Status Update on Rejected</fullName>
        <actions>
            <name>TFS_Status_Update_for_Rejected</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>Potential_Defect__c.Rejected__c</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <description>Automated update to Defect status when Rejected checkbox is checked. Status update becomes &quot;Rejected&quot;</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>TFS_CSChgDefect_SanD</fullName>
        <actions>
            <name>PotDefectChange_SanD_TFS</name>
            <type>OutboundMessage</type>
        </actions>
        <active>false</active>
        <booleanFilter>(1 OR 2 OR 3) AND 4 AND 5</booleanFilter>
        <criteriaItems>
            <field>Potential_Defect__c.TFS_Collection__c</field>
            <operation>equals</operation>
            <value>VisiNet</value>
        </criteriaItems>
        <criteriaItems>
            <field>Potential_Defect__c.TFS_Collection__c</field>
            <operation>equals</operation>
            <value>EMS</value>
        </criteriaItems>
        <criteriaItems>
            <field>Potential_Defect__c.TFS_Collection__c</field>
            <operation>equals</operation>
            <value>Sandbox</value>
        </criteriaItems>
        <criteriaItems>
            <field>Potential_Defect__c.Area_Path__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Potential_Defect__c.Accepted__c</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <description>San Diego Business Unit Potential Defect changed to Accepted Create Defect Trigger</description>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>TFS_CSChgDefect_SanD_Inform911</fullName>
        <actions>
            <name>PotDefectChange_SanD_TFS_Inform911</name>
            <type>OutboundMessage</type>
        </actions>
        <active>true</active>
        <booleanFilter>((1 OR 2) AND 3) AND 4</booleanFilter>
        <criteriaItems>
            <field>Potential_Defect__c.TFS_Collection__c</field>
            <operation>equals</operation>
            <value>TriTech</value>
        </criteriaItems>
        <criteriaItems>
            <field>Potential_Defect__c.TFS_Collection__c</field>
            <operation>equals</operation>
            <value>VisionAIR</value>
        </criteriaItems>
        <criteriaItems>
            <field>Potential_Defect__c.Area_Path__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Potential_Defect__c.Accepted__c</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <description>San Diego Business Unit Potential Defect changed to Accepted Create Defect Trigger</description>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>TFS_CSChgDefect_VisionAIR</fullName>
        <actions>
            <name>PotDefectChange_VAIR_TFS</name>
            <type>OutboundMessage</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Potential_Defect__c.TFS_Collection__c</field>
            <operation>equals</operation>
            <value>VisionAIR</value>
        </criteriaItems>
        <criteriaItems>
            <field>Potential_Defect__c.Area_Path__c</field>
            <operation>notEqual</operation>
        </criteriaItems>
        <criteriaItems>
            <field>Potential_Defect__c.Accepted__c</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <description>VisionAIR Business Unit Potential Defect changed to Accepted Create Defect Trigger</description>
        <triggerType>onAllChanges</triggerType>
    </rules>
</Workflow>
