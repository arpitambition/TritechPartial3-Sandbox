<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <alerts>
        <fullName>BANT_Notifications</fullName>
        <description>BANT Notifications</description>
        <protected>false</protected>
        <recipients>
            <recipient>bob.koenig@tritech.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>jenni.hastie@tritech.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Sales_and_Quote_Email_Templates/BANT_Notifications</template>
    </alerts>
    <alerts>
        <fullName>EA_SAR_Meeting_Required</fullName>
        <description>EA - SAR Meeting Required</description>
        <protected>false</protected>
        <recipients>
            <field>Contract_Capture_Manager__c</field>
            <type>userLookup</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Sales_and_Quote_Email_Templates/SAR_Meeting_Required</template>
    </alerts>
    <alerts>
        <fullName>EA_Send_Email_CPQ_Quote_Opp_Approved_TT_or_Z</fullName>
        <description>EA - Send Email CPQ Quote/Opp Approved (TT or Z)</description>
        <protected>false</protected>
        <recipients>
            <field>Associate_Account_Manager_Email__c</field>
            <type>email</type>
        </recipients>
        <recipients>
            <type>owner</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Sales_and_Quote_Email_Templates/CPQ_Quote_Opp_Approved</template>
    </alerts>
    <alerts>
        <fullName>EA_Send_Email_CPQ_Quote_Opp_Rejected_TT911_Only</fullName>
        <description>EA - Send Email CPQ Quote/Opp Rejected (TT911 Only)</description>
        <protected>false</protected>
        <recipients>
            <type>owner</type>
        </recipients>
        <recipients>
            <recipient>brian.fluegeman@zuerchertech.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>jen.vansant@tritech.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>scott.key@tritech.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>tiffany.lienhard@tritech.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>tyler.harman@tritech.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Sales_and_Quote_Email_Templates/CPQ_Quote_Opp_Rejected</template>
    </alerts>
    <alerts>
        <fullName>EA_Send_Email_CPQ_Quote_Opp_Rejected_TT_or_Z</fullName>
        <description>EA - Send Email CPQ Quote/Opp Rejected (TT or Z)</description>
        <protected>false</protected>
        <recipients>
            <type>owner</type>
        </recipients>
        <recipients>
            <recipient>jen.vansant@tritech.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>scott.key@tritech.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>tiffany.lienhard@tritech.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>tyler.harman@tritech.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Sales_and_Quote_Email_Templates/CPQ_Quote_Opp_Rejected</template>
    </alerts>
    <alerts>
        <fullName>EA_Send_Email_EndeavorCPQ_Quote_Approved</fullName>
        <description>EA - Send Email EndeavorCPQ Quote Approved</description>
        <protected>false</protected>
        <recipients>
            <type>owner</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Sales_and_Quote_Email_Templates/CPQ_Quote_Approved_Email_Template</template>
    </alerts>
    <alerts>
        <fullName>EA_Send_Email_EndeavorCPQ_Quote_Rejected</fullName>
        <description>EA - Send Email EndeavorCPQ Quote Rejected</description>
        <protected>false</protected>
        <recipients>
            <type>owner</type>
        </recipients>
        <recipients>
            <recipient>jen.vansant@tritech.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>scott.key@tritech.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Sales_and_Quote_Email_Templates/CPQ_Quote_Rejection_Email_Template</template>
    </alerts>
    <alerts>
        <fullName>EA_Send_Email_Z_Opportunity_Approved</fullName>
        <description>EA - Send Email Z Opportunity Approved</description>
        <protected>false</protected>
        <recipients>
            <type>owner</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Sales_and_Quote_Email_Templates/Z_Opp_Quote_Approved_Email_Template</template>
    </alerts>
    <alerts>
        <fullName>EA_Send_Email_Z_Opportunity_Rejected</fullName>
        <description>EA - Send Email Z Opportunity Rejected</description>
        <protected>false</protected>
        <recipients>
            <type>owner</type>
        </recipients>
        <recipients>
            <recipient>jen.vansant@tritech.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>melanie.mitzel@tritech.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Sales_and_Quote_Email_Templates/Z_Opp_Quote_Rejected_Email_Template</template>
    </alerts>
    <alerts>
        <fullName>EA_TriTech_Closed_Won_Change_Orders_KH_Only</fullName>
        <description>EA - TriTech Closed Won Change Orders KH Only</description>
        <protected>false</protected>
        <recipients>
            <recipient>karla.hageman@tritech.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Sales_and_Quote_Email_Templates/Opportunity_Won_Notice_TriTech</template>
    </alerts>
    <alerts>
        <fullName>EA_TriTech_Lost_Opportunities</fullName>
        <ccEmails>pdm@tritech.com</ccEmails>
        <description>EA - TriTech Lost Opportunities</description>
        <protected>false</protected>
        <recipients>
            <recipient>beth.harwood@zuerchertech.com</recipient>
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
            <recipient>chris.maloney@tritech.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>edbean@tritech.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>josie.donnelly@tritech.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>karla.hageman@tritech.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>robert.mcgrath@tritech.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>scott.macdonald@tritech.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Sales_and_Quote_Email_Templates/Opportunity_Lost_Notice</template>
    </alerts>
    <alerts>
        <fullName>EA_TriTech_Opportunity_Booked</fullName>
        <ccEmails>sf_oppwon@tritech.com</ccEmails>
        <ccEmails>sales-contracts@tritech.com</ccEmails>
        <ccEmails>productmanagement@tritech.com</ccEmails>
        <ccEmails>tritechquotes@tritech.com</ccEmails>
        <description>EA - TriTech Opportunity Booked</description>
        <protected>false</protected>
        <recipients>
            <type>owner</type>
        </recipients>
        <recipients>
            <recipient>beth.harwood@zuerchertech.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>jen.vansant@tritech.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>tyler.harman@tritech.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Sales_and_Quote_Email_Templates/Opportunity_Booked_Notice_TriTech</template>
    </alerts>
    <alerts>
        <fullName>EA_TriTech_Opportunity_Selected</fullName>
        <ccEmails>Sales-Visinet@tritech.com</ccEmails>
        <ccEmails>Sales-SR@tritech.com</ccEmails>
        <ccEmails>salescastlehayne@tritech.com</ccEmails>
        <ccEmails>salessupport-dl@tritech.com</ccEmails>
        <ccEmails>Sales-RFP@tritech.com</ccEmails>
        <description>EA - TriTech Opportunity Selected</description>
        <protected>false</protected>
        <recipients>
            <recipient>beth.harwood@zuerchertech.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>nasim.golzadeh@tritech.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>scott.macdonald@tritech.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Sales_and_Quote_Email_Templates/Opportunity_Selected_Notice</template>
    </alerts>
    <alerts>
        <fullName>EA_TriTech_Opportunity_Shortlisted</fullName>
        <ccEmails>Sales-Visinet@tritech.com</ccEmails>
        <ccEmails>Sales-SR@tritech.com</ccEmails>
        <ccEmails>salescastlehayne@tritech.com</ccEmails>
        <ccEmails>salessupport-dl@tritech.com</ccEmails>
        <ccEmails>Sales-RFP@tritech.com</ccEmails>
        <description>EA - TriTech Opportunity Shortlisted</description>
        <protected>false</protected>
        <recipients>
            <recipient>beth.harwood@zuerchertech.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>nasim.golzadeh@tritech.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>scott.macdonald@tritech.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Sales_and_Quote_Email_Templates/Opportunity_Shortlisted_Notice</template>
    </alerts>
    <alerts>
        <fullName>EA_TriTech_Opportunity_Won</fullName>
        <ccEmails>tritechquotes@tritech.com</ccEmails>
        <description>EA - TriTech Opportunity Won</description>
        <protected>false</protected>
        <recipients>
            <type>owner</type>
        </recipients>
        <recipients>
            <recipient>jen.vansant@tritech.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Sales_and_Quote_Email_Templates/Opportunity_Won_Notice_TriTech</template>
    </alerts>
    <alerts>
        <fullName>EA_Zuercher_Lost_Opportunities</fullName>
        <ccEmails>proposals@zuerchertech.com</ccEmails>
        <description>EA - Zuercher Lost Opportunities</description>
        <protected>false</protected>
        <recipients>
            <type>owner</type>
        </recipients>
        <recipients>
            <recipient>anthony.owens@zuerchertech.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>beth.harwood@zuerchertech.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>brady.jacobsen@zuerchertech.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>brian.fluegeman@zuerchertech.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>bruce.baartman@tritech.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>jen.vansant@tritech.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>melanie.mitzel@tritech.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>michael.zuercher@tritech.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>phil.everhart@tritech.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>phil.sisk@zuerchertech.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>scott.macdonald@tritech.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>zac.bradish@tritech.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Sales_and_Quote_Email_Templates/Opportunity_Lost_Notice</template>
    </alerts>
    <alerts>
        <fullName>EA_Zuercher_Opportunity_Booked</fullName>
        <ccEmails>proposals@zuerchertech.com</ccEmails>
        <description>EA - Zuercher Opportunity Booked</description>
        <protected>false</protected>
        <recipients>
            <type>owner</type>
        </recipients>
        <recipients>
            <recipient>adam.ormesher@tritech.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>anthony.owens@zuerchertech.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>beth.harwood@zuerchertech.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>brady.jacobsen@zuerchertech.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>brenda.stiehl@tritech.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>darrinm@tritech.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>jen.vansant@tritech.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>jennifer.gerrietts@tritech.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>libby@zuerchertech.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>melanie.mitzel@tritech.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>michael.zuercher@tritech.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>phil.everhart@tritech.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>phil.sisk@zuerchertech.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>zac.bradish@tritech.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Sales_and_Quote_Email_Templates/Opportunity_Booked_Notice_Zuercher</template>
    </alerts>
    <alerts>
        <fullName>EA_Zuercher_Opportunity_Won</fullName>
        <description>EA - Zuercher Opportunity Won</description>
        <protected>false</protected>
        <recipients>
            <type>owner</type>
        </recipients>
        <recipients>
            <recipient>adam.ormesher@tritech.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>becky.wall@zuerchertech.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>brian.fluegeman@zuerchertech.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>bruce.baartman@tritech.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>darrinm@tritech.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>hannah.krause@zuerchertech.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>jen.vansant@tritech.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>jennifer.whitcomb@tritech.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>jessica.olson@zuerchertech.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>libby@zuerchertech.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>melanie.mitzel@tritech.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>natalie.gates@zuerchertech.com</recipient>
            <type>user</type>
        </recipients>
        <recipients>
            <recipient>nicole.audette@zuerchertech.com</recipient>
            <type>user</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>Sales_and_Quote_Email_Templates/Opportunity_Won_Notice_Zuercher</template>
    </alerts>
    <fieldUpdates>
        <fullName>Approval_Level_CFO_CEO</fullName>
        <field>Most_Recent_Approval_Level__c</field>
        <literalValue>CFO/CEO Approved</literalValue>
        <name>Approval Level_CFO/CEO</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Approval_Level_COO</fullName>
        <field>Most_Recent_Approval_Level__c</field>
        <literalValue>COO Approved</literalValue>
        <name>Approval Level_COO</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Approval_Level_COO_CFO_CEO_Approved</fullName>
        <field>Most_Recent_Approval_Level__c</field>
        <literalValue>COO/CFO/CEO Approved</literalValue>
        <name>Approval Level_COO CFO CEO Approved</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Approval_Level_Finance_Approved</fullName>
        <field>Most_Recent_Approval_Level__c</field>
        <literalValue>Finance Approved</literalValue>
        <name>Approval Level_Finance Approved</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Approval_Level_Green_Team_Approved</fullName>
        <field>Most_Recent_Approval_Level__c</field>
        <literalValue>Green Team Approved</literalValue>
        <name>Approval Level_Green Team Approved</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Approval_Level_Hardware_Approved</fullName>
        <field>Most_Recent_Approval_Level__c</field>
        <literalValue>Hardware and 3rd Party Approved</literalValue>
        <name>Approval Level_Hardware Approved</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Approval_Level_Operations_Approved</fullName>
        <field>Most_Recent_Approval_Level__c</field>
        <literalValue>Operations Approved</literalValue>
        <name>Approval Level_Operations Approved</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Approval_Level_PdM_Approved</fullName>
        <field>Most_Recent_Approval_Level__c</field>
        <literalValue>PdM Approved</literalValue>
        <name>Approval Level _PdM Approved</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Approval_Level_Pending_Approval</fullName>
        <field>Most_Recent_Approval_Level__c</field>
        <literalValue>Pending Approval</literalValue>
        <name>Approval Level_Pending Approval</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Approval_Level_Professional_Services</fullName>
        <field>Most_Recent_Approval_Level__c</field>
        <literalValue>Professional Services</literalValue>
        <name>Approval Level_Professional Services</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Approval_Level_Quote_Approved</fullName>
        <description>Edit Approval Level field to = &quot;Quote Approved - Final&quot;</description>
        <field>Most_Recent_Approval_Level__c</field>
        <literalValue>Quote Approved - Final</literalValue>
        <name>Approval Level_Quote Approved</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Approval_Level_Recalled</fullName>
        <field>Most_Recent_Approval_Level__c</field>
        <literalValue>Recalled</literalValue>
        <name>Approval Level_Recalled</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Approval_Level_Rejected</fullName>
        <field>Most_Recent_Approval_Level__c</field>
        <literalValue>Quote Rejected</literalValue>
        <name>Approval Level_Rejected</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Approval_Level_Sales_Director_Approved</fullName>
        <field>Most_Recent_Approval_Level__c</field>
        <literalValue>Sales Director Approved</literalValue>
        <name>Approval Level_Sales Director Approved</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Approval_Level_Sales_Support</fullName>
        <field>Most_Recent_Approval_Level__c</field>
        <literalValue>Sales Support</literalValue>
        <name>Approval Level_Sales Support</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Approval_Level_Sr_VP_of_Sales_Approved</fullName>
        <field>Most_Recent_Approval_Level__c</field>
        <literalValue>Sr. VP of Sales Approved</literalValue>
        <name>Approval Level_Sr VP of Sales Approved</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Approval_Level_VP_of_Sales_Approved</fullName>
        <field>Most_Recent_Approval_Level__c</field>
        <literalValue>VP of Sales Approved</literalValue>
        <name>Approval Level_VP of Sales Approved</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Check_Reached_Forecast_Field</fullName>
        <field>Opportunity_Reached_Forcast__c</field>
        <literalValue>1</literalValue>
        <name>Check Reached Forecast Field</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
        <reevaluateOnChange>true</reevaluateOnChange>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Close_Date_WMP</fullName>
        <field>CloseDate</field>
        <formula>Today()</formula>
        <name>Close Date</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Executive_Summary_Last_Modified_Date</fullName>
        <description>Updated field when the Executive Summary (Description) field is modified</description>
        <field>Executive_Summary_Modifed_Date__c</field>
        <formula>&quot;Last Modified by &quot; &amp;LastModifiedBy.FirstName&amp;&quot; &quot;&amp; LastModifiedBy.LastName&amp; &quot; on &quot; &amp; Text(MONTH(DATEVALUE(LastModifiedDate)))&amp;&quot;/&quot;&amp;Text(DAY(DATEVALUE(LastModifiedDate)))&amp;&quot;/&quot;&amp;Text(YEAR(DATEVALUE(LastModifiedDate)))</formula>
        <name>Executive Summary Last Modified Date</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>FU_Associate_Account_Manager_Email</fullName>
        <field>Associate_Account_Manager_Email__c</field>
        <formula>Associate_Account_Manager__r.Email</formula>
        <name>FU - Associate Account Manager Email</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>FU_BANT_Completed_Date</fullName>
        <description>Enters the date when the BANT Complete box is checked on an opportunity.</description>
        <field>BANT_Completed_Date__c</field>
        <formula>TODAY()</formula>
        <name>FU - BANT Completed Date</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>FU_Next_Steps_Completed_Date</fullName>
        <description>Field update to show the date in which the Next Steps field was last updated</description>
        <field>Next_Steps_Synopsis_Modified_Date__c</field>
        <formula>TODAY()</formula>
        <name>FU - Next Steps Completed Date</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>FU_Next_Steps_Synopsis_Modified_By</fullName>
        <description>Updates Next Steps/Synopsis Last Modified by user</description>
        <field>Next_Steps_Synopsis_Modified_By__c</field>
        <formula>LastModifiedBy.FirstName &amp; &quot; &quot; &amp;  LastModifiedBy.LastName</formula>
        <name>FU - Next Steps/Synopsis Modified By</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>FU_Update_TriTech_Selected</fullName>
        <description>When Stage = Selected, change &quot;TriTech Selected?&quot; to Yes</description>
        <field>TriTech_Selected__c</field>
        <literalValue>Yes</literalValue>
        <name>FU Update TriTech Selected</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>FU_Update_TriTech_Shortlisted</fullName>
        <description>Updated to checked when Opp stage = Shortlisted, Selected, or Contract Negotiation</description>
        <field>TriTech_Shortlisted__c</field>
        <literalValue>Yes</literalValue>
        <name>FU Update TriTech Shortlisted</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>FU_Z_Forecast_Category_Closed</fullName>
        <field>Z_Forecast_Category__c</field>
        <literalValue>Closed</literalValue>
        <name>FU - Z Forecast Category Closed</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Last_Approval_Date_Update</fullName>
        <field>Last_Approval_Date__c</field>
        <formula>Today()</formula>
        <name>Last Approval Date Update</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Last_Rejection_Date_Update</fullName>
        <field>Last_Rejection_Date__c</field>
        <formula>Today()</formula>
        <name>Last Rejection Date Update</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Reset_Return_to_Approval_Step</fullName>
        <field>Return_to_Approval_Step__c</field>
        <name>Reset Return to Approval Step</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Return_to_Step_10_Rejection</fullName>
        <field>Return_to_Approval_Step__c</field>
        <literalValue>Return to Step 10</literalValue>
        <name>Return to Step 10 - Rejection</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Return_to_Step_11_Rejection</fullName>
        <field>Return_to_Approval_Step__c</field>
        <literalValue>Return to Step 11</literalValue>
        <name>Return to Step 11 - Rejection</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Return_to_Step_12_Rejection</fullName>
        <field>Return_to_Approval_Step__c</field>
        <literalValue>Return to Step 12</literalValue>
        <name>Return to Step 12 - Rejection</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Return_to_Step_13_Rejection</fullName>
        <field>Return_to_Approval_Step__c</field>
        <literalValue>Return to Step 13</literalValue>
        <name>Return to Step 13 - Rejection</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Return_to_Step_14_Rejection</fullName>
        <field>Return_to_Approval_Step__c</field>
        <literalValue>Return to Step 14</literalValue>
        <name>Return to Step 14 - Rejection</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Return_to_Step_15_Rejection</fullName>
        <field>Return_to_Approval_Step__c</field>
        <literalValue>Return to Step 15</literalValue>
        <name>Return to Step 15 - Rejection</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Return_to_Step_16_Rejection</fullName>
        <field>Return_to_Approval_Step__c</field>
        <literalValue>Return to Step 16</literalValue>
        <name>Return to Step 16 - Rejection</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Return_to_Step_17_Rejection</fullName>
        <field>Return_to_Approval_Step__c</field>
        <literalValue>Return to Step 17</literalValue>
        <name>Return to Step 17 - Rejection</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Return_to_Step_18_Rejection</fullName>
        <field>Return_to_Approval_Step__c</field>
        <literalValue>Return to Step 18</literalValue>
        <name>Return to Step 18 - Rejection</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Return_to_Step_19_Rejection</fullName>
        <field>Return_to_Approval_Step__c</field>
        <literalValue>Return to Step 19</literalValue>
        <name>Return to Step 19 - Rejection</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Return_to_Step_20_Rejection</fullName>
        <field>Return_to_Approval_Step__c</field>
        <literalValue>Return to Step 20</literalValue>
        <name>Return to Step 20 - Rejection</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Return_to_Step_21_Rejection</fullName>
        <field>Return_to_Approval_Step__c</field>
        <literalValue>Return to Step 21</literalValue>
        <name>Return to Step 21 - Rejection</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Return_to_Step_22_Rejection</fullName>
        <field>Return_to_Approval_Step__c</field>
        <literalValue>Return to Step 22</literalValue>
        <name>Return to Step 22 - Rejection</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Return_to_Step_23_Rejection</fullName>
        <field>Return_to_Approval_Step__c</field>
        <literalValue>Return to Step 23</literalValue>
        <name>Return to Step 23 - Rejection</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Return_to_Step_24_Rejection</fullName>
        <field>Return_to_Approval_Step__c</field>
        <literalValue>Return to Step 24</literalValue>
        <name>Return to Step 24 - Rejection</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Return_to_Step_25_Rejection</fullName>
        <field>Return_to_Approval_Step__c</field>
        <literalValue>Return to Step 25</literalValue>
        <name>Return to Step 25 - Rejection</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Return_to_Step_26_Rejection</fullName>
        <field>Return_to_Approval_Step__c</field>
        <literalValue>Return to Step 26</literalValue>
        <name>Return to Step 26 - Rejection</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Return_to_Step_27_Rejection</fullName>
        <field>Return_to_Approval_Step__c</field>
        <literalValue>Return to Step 27</literalValue>
        <name>Return to Step 27 - Rejection</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Return_to_Step_28_Rejection</fullName>
        <field>Return_to_Approval_Step__c</field>
        <literalValue>Return to Step 28</literalValue>
        <name>Return to Step 28 - Rejection</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Return_to_Step_29_Rejection</fullName>
        <field>Return_to_Approval_Step__c</field>
        <literalValue>Return to Step 29</literalValue>
        <name>Return to Step 29 - Rejection</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Return_to_Step_2_Rejection</fullName>
        <field>Return_to_Approval_Step__c</field>
        <literalValue>Return to Step 2</literalValue>
        <name>Return to Step 2 - Rejection</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Return_to_Step_30_Rejection</fullName>
        <field>Return_to_Approval_Step__c</field>
        <literalValue>Return to Step 30</literalValue>
        <name>Return to Step 30 - Rejection</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Return_to_Step_3_Rejection</fullName>
        <field>Return_to_Approval_Step__c</field>
        <literalValue>Return to Step 3</literalValue>
        <name>Return to Step 3 - Rejection</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Return_to_Step_4_Rejection</fullName>
        <field>Return_to_Approval_Step__c</field>
        <literalValue>Return to Step 4</literalValue>
        <name>Return to Step 4 - Rejection</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Return_to_Step_5_Rejection</fullName>
        <field>Return_to_Approval_Step__c</field>
        <literalValue>Return to Step 5</literalValue>
        <name>Return to Step 5 - Rejection</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Return_to_Step_6_Rejection</fullName>
        <field>Return_to_Approval_Step__c</field>
        <literalValue>Return to Step 6</literalValue>
        <name>Return to Step 6 - Rejection</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Return_to_Step_7_Rejection</fullName>
        <field>Return_to_Approval_Step__c</field>
        <literalValue>Return to Step 7</literalValue>
        <name>Return to Step 7 - Rejection</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Return_to_Step_8_Rejection</fullName>
        <field>Return_to_Approval_Step__c</field>
        <literalValue>Return to Step 8</literalValue>
        <name>Return to Step 8 - Rejection</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Return_to_Step_9_Rejection</fullName>
        <field>Return_to_Approval_Step__c</field>
        <literalValue>Return to Step 9</literalValue>
        <name>Return to Step 9 - Rejection</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Literal</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Set_Quote</fullName>
        <description>If Quote Number is null, set to CPQ Quote Number</description>
        <field>Quote_Number__c</field>
        <formula>CPQ_Quote_Number__c</formula>
        <name>Set Quote #</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_Booked_Date_to_Today</fullName>
        <field>Booked_Date__c</field>
        <formula>today()</formula>
        <name>Update Booked Date to Today</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <fieldUpdates>
        <fullName>Update_Last_Modified_Target_Opportunity</fullName>
        <field>Last_Modified_Target_Opportunity__c</field>
        <formula>&quot;Last Modified by &quot; &amp;LastModifiedBy.FirstName&amp;&quot; &quot;&amp; LastModifiedBy.LastName&amp; &quot; on &quot; &amp;  Text(MONTH(DATEVALUE(LastModifiedDate)))&amp;&quot;/&quot;&amp;Text(DAY(DATEVALUE(LastModifiedDate)))&amp;&quot;/&quot;&amp;Text(YEAR(DATEVALUE(LastModifiedDate)))</formula>
        <name>Update Last Modified Target Opportunity</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>Formula</operation>
        <protected>false</protected>
    </fieldUpdates>
    <outboundMessages>
        <fullName>ISOppStageCh_CH_New</fullName>
        <apiVersion>32.0</apiVersion>
        <description>IS Opportunity Stage Change Message for CastleHayne</description>
        <endpointUrl>http://70.63.87.194/SFOpportunityListener/NotificationPort.svc</endpointUrl>
        <fields>Id</fields>
        <fields>Name</fields>
        <fields>Product_Family_WMP__c</fields>
        <fields>StageName</fields>
        <fields>Type</fields>
        <includeSessionId>true</includeSessionId>
        <integrationUser>roger.jackson@tritech.com</integrationUser>
        <name>ISOppStageCh_CH_New</name>
        <protected>false</protected>
        <useDeadLetterQueue>false</useDeadLetterQueue>
    </outboundMessages>
    <rules>
        <fullName>EA - BANT Notifications</fullName>
        <actions>
            <name>BANT_Notifications</name>
            <type>Alert</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Opportunity.BANT_Complete__c</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <description>Send email notification when BANT is checked on an opportunity</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>EA - SAR Meeting Required Email Notification</fullName>
        <actions>
            <name>EA_SAR_Meeting_Required</name>
            <type>Alert</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Opportunity.SAR_Meeting_Required__c</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <description>Sends email notification to the Contract Capture Manager reminding them to setup the SAR meeting for an opportunity</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>EA - TriTech Booked Opportunities</fullName>
        <actions>
            <name>EA_TriTech_Opportunity_Booked</name>
            <type>Alert</type>
        </actions>
        <active>false</active>
        <description>EA -- This sends email notifications when an opportunity is Booked.</description>
        <formula>and(
ischanged( StageName ),
ispickval(StageName,&apos;Booked&apos;),
!contains( Account_Name__c ,&apos;Test&apos;),
!contains( Account_Name__c ,&apos;Tritech&apos;),
and(or(ispickval( Product_Family_WMP__c ,&apos;Inform&apos;),
ispickval( Product_Family_WMP__c ,&apos;Respond&apos;),
ispickval( Product_Family_WMP__c ,&apos;Tiburon&apos;),
ispickval( Product_Family_WMP__c ,&apos;VisionAIR&apos;)),
or(
RecordTypeId = &apos;01280000000QFZ0&apos;,
RecordTypeId = &apos;01280000000QFZ5&apos;,
RecordTypeId = &apos;01280000000GJ0c&apos;)
),

or(
and(
or
(
$UserRole.Name = &apos;TriTech Account Manager&apos;,
$UserRole.Name = &apos;TriTech Account Executive&apos;,
$UserRole.Name = &apos;TriTech Sales Support&apos;
),
Actual_Opportunity_Value__c &gt;= 50000
),
and
(
or
(
includes(Products_Required__c ,&apos;IQ/Analytics&apos;),
includes(Products_Required__c ,&apos;Respond&apos;)
),
Actual_Opportunity_Value__c &gt;= 10000
)
)



)</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>EA - TriTech Closed Won Change Orders KH Only</fullName>
        <actions>
            <name>EA_TriTech_Closed_Won_Change_Orders_KH_Only</name>
            <type>Alert</type>
        </actions>
        <active>false</active>
        <description>EA -- This sends email notification to Karla Hageman for all TT Won Change Orders</description>
        <formula>AND(
ispickval(StageName,&apos;Closed Won&apos;),
RecordTypeId = &apos;01280000000GJ0c&apos;, 
OR(ispickval(Product_Family_WMP__c,&apos;Respond&apos;),
ispickval(Product_Family_WMP__c,&apos;Inform&apos;),
ispickval(Product_Family_WMP__c,&apos;Tiburon&apos;),
ispickval(Product_Family_WMP__c,&apos;VisionAIR&apos;)),
!CONTAINS(Account_Name__c,&apos;Test&apos;),
!CONTAINS(Account_Name__c,&apos;Tritech&apos;),
ischanged(StageName))</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>EA - TriTech Closed Won Opportunities</fullName>
        <actions>
            <name>EA_TriTech_Opportunity_Won</name>
            <type>Alert</type>
        </actions>
        <active>false</active>
        <description>EA -- This sends email notifications to Accounting when an opportunity is won.</description>
        <formula>AND(
ispickval(StageName,&apos;Closed Won&apos;),
OR(ispickval(Product_Family_WMP__c,&apos;Respond&apos;),
ispickval(Product_Family_WMP__c,&apos;Inform&apos;),
ispickval(Product_Family_WMP__c,&apos;Tiburon&apos;),
ispickval(Product_Family_WMP__c,&apos;VisionAIR&apos;)),
!CONTAINS(Account_Name__c,&apos;Test&apos;),
!CONTAINS(Account_Name__c,&apos;Tritech&apos;),
ischanged(StageName))</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>EA - TriTech Lost Opportunities</fullName>
        <actions>
            <name>EA_TriTech_Lost_Opportunities</name>
            <type>Alert</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Opportunity.StageName</field>
            <operation>equals</operation>
            <value>Closed Lost,Closed Lost - Other,Closed Lost - No Bid</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.Product_Family_WMP__c</field>
            <operation>equals</operation>
            <value>Inform,VisiNet,VisionAIR,911</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.Account_Name__c</field>
            <operation>notContain</operation>
            <value>Test,TriTech</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.RecordTypeId</field>
            <operation>notContain</operation>
            <value>Zuercher Competitve,Zuercher Non-Competitive</value>
        </criteriaItems>
        <description>EA -- This sends email notifications when an opportunity is lost</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>EA - TriTech Selected Opportunities</fullName>
        <actions>
            <name>EA_TriTech_Opportunity_Selected</name>
            <type>Alert</type>
        </actions>
        <active>false</active>
        <booleanFilter>1 AND 2 AND 3 AND 4 AND 5 AND 6</booleanFilter>
        <criteriaItems>
            <field>Opportunity.StageName</field>
            <operation>equals</operation>
            <value>Selected</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.Deal_Type__c</field>
            <operation>equals</operation>
            <value>New Major System</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.Product_Family_WMP__c</field>
            <operation>equals</operation>
            <value>Inform</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.Account_Name__c</field>
            <operation>notContain</operation>
            <value>Test,TriTech</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.RecordTypeId</field>
            <operation>equals</operation>
            <value>TriTech Competitive,TriTech Non-Competitive</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.Actual_Opportunity_Value__c</field>
            <operation>greaterOrEqual</operation>
            <value>500000</value>
        </criteriaItems>
        <description>EA -- This sends email notifications when an opportunity is selected with the opportunity type of &quot;New Major System&quot;</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>EA - TriTech Shortlisted Opportunities</fullName>
        <actions>
            <name>EA_TriTech_Opportunity_Shortlisted</name>
            <type>Alert</type>
        </actions>
        <active>false</active>
        <booleanFilter>1 AND 2 AND 3 AND 4 AND 5 AND 6</booleanFilter>
        <criteriaItems>
            <field>Opportunity.StageName</field>
            <operation>equals</operation>
            <value>Shortlisted</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.Deal_Type__c</field>
            <operation>equals</operation>
            <value>New Major System</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.Product_Family_WMP__c</field>
            <operation>equals</operation>
            <value>Inform</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.Account_Name__c</field>
            <operation>notContain</operation>
            <value>Test,TriTech</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.RecordTypeId</field>
            <operation>equals</operation>
            <value>TriTech Competitive,TriTech Non-Competitive</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.Actual_Opportunity_Value__c</field>
            <operation>greaterOrEqual</operation>
            <value>500000</value>
        </criteriaItems>
        <description>EA -- This sends email notifications when an opportunity is shortlisted with the opportunity type of &quot;New Major Deal&quot;</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>EA - Zuercher Booked Opportunities</fullName>
        <actions>
            <name>EA_Zuercher_Opportunity_Booked</name>
            <type>Alert</type>
        </actions>
        <active>false</active>
        <description>EA -- This sends email notifications when an opportunity is Booked</description>
        <formula>and(
ischanged( StageName ),
ispickval(StageName,&apos;Booked&apos;),
!contains( Account_Name__c ,&apos;Test&apos;),
!contains( Account_Name__c ,&apos;Tritech&apos;),
or(ispickval( Product_Family_WMP__c ,&apos;Perform&apos;),
ispickval( Product_Family_WMP__c ,&apos;Zuercher&apos;),
ispickval( Product_Family_WMP__c ,&apos;ETI Hosted&apos;),
ispickval( Product_Family_WMP__c ,&apos;ETI On Premise&apos;),
ispickval( Product_Family_WMP__c ,&apos;Insight&apos;),
ispickval( Product_Family_WMP__c ,&apos;IP911&apos;),
ispickval( Product_Family_WMP__c ,&apos;LETG&apos;),
ispickval( Product_Family_WMP__c ,&apos;Impact&apos;),
ispickval( Product_Family_WMP__c ,&apos;TT911&apos;)
),
or( RecordTypeId = &apos;01280000000QFZA&apos;,
RecordTypeId = &apos;01280000000GJ0h&apos;, 
RecordTypeId = &apos;01280000000QFZF&apos;)


)</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>EA - Zuercher Lost Opportunities</fullName>
        <actions>
            <name>EA_Zuercher_Lost_Opportunities</name>
            <type>Alert</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Opportunity.StageName</field>
            <operation>equals</operation>
            <value>Closed Lost,Closed Lost - Other,Closed Lost - No Bid</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.Product_Family_WMP__c</field>
            <operation>equals</operation>
            <value>ETI Hosted,ETI On Premise,Insight,IP911,LETG,Perform,TT911,Zuercher,Impact</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.Account_Name__c</field>
            <operation>notContain</operation>
            <value>Test,TriTech</value>
        </criteriaItems>
        <description>EA -- This sends email notifications when an opportunity is lost</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>EA - Zuercher Won Opportunities</fullName>
        <actions>
            <name>EA_Zuercher_Opportunity_Won</name>
            <type>Alert</type>
        </actions>
        <active>false</active>
        <description>EA -- This sends email notifications to Accounting when an opportunity is won.</description>
        <formula>and(
ischanged( StageName ),
ispickval(StageName,&apos;Closed Won&apos;),
!contains( Account_Name__c ,&apos;Test&apos;),
!contains( Account_Name__c ,&apos;Tritech&apos;),
or(ispickval( Product_Family_WMP__c ,&apos;Perform&apos;),
ispickval( Product_Family_WMP__c ,&apos;Zuercher&apos;),
ispickval( Product_Family_WMP__c ,&apos;ETI Hosted&apos;),
ispickval( Product_Family_WMP__c ,&apos;ETI On Premise&apos;),
ispickval( Product_Family_WMP__c ,&apos;Insight&apos;),
ispickval( Product_Family_WMP__c ,&apos;IP911&apos;),
ispickval( Product_Family_WMP__c ,&apos;LETG&apos;),
ispickval( Product_Family_WMP__c ,&apos;Impact&apos;),
ispickval( Product_Family_WMP__c ,&apos;TT911&apos;)
),
or( RecordTypeId = &apos;01280000000QFZA&apos;,
RecordTypeId = &apos;01280000000GJ0h&apos;,
RecordTypeId = &apos;01280000000QFZF&apos;)


)</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>FU - Associate Account Manager Email</fullName>
        <actions>
            <name>FU_Associate_Account_Manager_Email</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Opportunity.Associate_Account_Manager__c</field>
            <operation>notEqual</operation>
            <value>NULL</value>
        </criteriaItems>
        <description>Adds user email address associated to the Associate Account Manager Email field.</description>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>FU - BANT Completed Date</fullName>
        <actions>
            <name>FU_BANT_Completed_Date</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Opportunity.BANT_Complete__c</field>
            <operation>equals</operation>
            <value>True</value>
        </criteriaItems>
        <description>Enters the date when the BANT Complete box is checked on an opportunity.</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>FU - Check That Opp reached  Forecast</fullName>
        <actions>
            <name>Check_Reached_Forecast_Field</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Opportunity.Probability</field>
            <operation>greaterOrEqual</operation>
            <value>0.40</value>
        </criteriaItems>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>FU - Closed Date Updated</fullName>
        <actions>
            <name>Close_Date_WMP</name>
            <type>FieldUpdate</type>
        </actions>
        <active>true</active>
        <description>Updates &quot;Estimated Close Date&quot; date to TODAY when opp is closed</description>
        <formula>and(contains(text(StageName),&apos;Closed&apos;),
NOT(contains(text(Priorvalue(StageName)),&quot;Closed&quot;)))</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>FU - Executive Summary Modified Date</fullName>
        <actions>
            <name>Executive_Summary_Last_Modified_Date</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <description>Field update to show user/date/time Executive Summary field was last updated</description>
        <formula>ISCHANGED( Description )</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>FU - Last Modified %28Target Opportunity%29</fullName>
        <actions>
            <name>Update_Last_Modified_Target_Opportunity</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <description>Update to Last Modified (Target Opportunity) field on the Opportunity Object when Target Opportunity is checked.</description>
        <formula>ISCHANGED(Target_Opportunity__c)</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>FU - Next Steps%2FSynopsis Modified By</fullName>
        <actions>
            <name>FU_Next_Steps_Synopsis_Modified_By</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <description>Field update to show user who last updated the Next Steps field</description>
        <formula>or(!ISBLANK(NextStep),ISCHANGED( NextStep ))</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>FU - Next Steps%2FSynopsis Modified Date</fullName>
        <actions>
            <name>FU_Next_Steps_Completed_Date</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <description>Field update to show the date in which the Next Steps field was last updated</description>
        <formula>or(!ISBLANK(NextStep),ISCHANGED( NextStep ))</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>FU - Set Booked date to Current</fullName>
        <actions>
            <name>Update_Booked_Date_to_Today</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <description>Set Booked date when the opp first hits Booked</description>
        <formula>and(
ischanged(StageName),
!ispickval(priorvalue(StageName),&apos;Booked&apos;),
 text(Booked_Date__c) = &apos;&apos;,
Text(StageName) = &apos;Booked&apos;)</formula>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>FU - Set Quote %23</fullName>
        <actions>
            <name>Set_Quote</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Opportunity.Quote_Number__c</field>
            <operation>equals</operation>
        </criteriaItems>
        <description>If Quote Number field is null, set it to CPQ Quote Number</description>
        <triggerType>onAllChanges</triggerType>
    </rules>
    <rules>
        <fullName>FU - Z Forecast Category Closed</fullName>
        <actions>
            <name>FU_Z_Forecast_Category_Closed</name>
            <type>FieldUpdate</type>
        </actions>
        <active>false</active>
        <criteriaItems>
            <field>Opportunity.StageName</field>
            <operation>equals</operation>
            <value>Closed Won</value>
        </criteriaItems>
        <description>Updates Z Forecast Category to &quot;Closed&quot; when an opportunity is &quot;Closed Won.&quot;</description>
        <triggerType>onCreateOrTriggeringUpdate</triggerType>
    </rules>
    <rules>
        <fullName>TFS_ISOppStageChg_CastleHayne</fullName>
        <actions>
            <name>ISOppStageCh_CH_New</name>
            <type>OutboundMessage</type>
        </actions>
        <active>false</active>
        <booleanFilter>(1 or 2 or 3 or 4 or 5)</booleanFilter>
        <criteriaItems>
            <field>Opportunity.StageName</field>
            <operation>equals</operation>
            <value>Selected</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.StageName</field>
            <operation>equals</operation>
            <value>Closed Won</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.StageName</field>
            <operation>equals</operation>
            <value>Closed Lost</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.StageName</field>
            <operation>equals</operation>
            <value>Shortlisted</value>
        </criteriaItems>
        <criteriaItems>
            <field>Opportunity.StageName</field>
            <operation>equals</operation>
            <value>Contract Negotiation</value>
        </criteriaItems>
        <description>Stage Change in the Opportunity object for Integrated Solutions</description>
        <triggerType>onAllChanges</triggerType>
    </rules>
</Workflow>
