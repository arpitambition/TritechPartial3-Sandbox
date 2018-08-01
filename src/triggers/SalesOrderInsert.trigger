trigger SalesOrderInsert on Sales_Order__c (before insert) {
List<Sales_Order__c> SO = new list<Sales_Order__c>();
set<id> Sales_Order = new set<id>();
Set<String> idStrs = (Set<String>)JSON.deserialize(JSON.serialize(Sales_Order), Set<String>.class);
for(Sales_Order__c SOrec :trigger.new)
{
idStrs.add(SORec.related_Opportunity__c);
string sonumb = String.join(new List<String>(idStrs),',');

//Software
AggregateResult[] ca = [select sum(Extended_Price__c)CAD from OpportunityLineItem where Sales_Order_Category__c = 'Software - CAD' and opportunityId = :sonumb];
  SOrec.CAD_Software__c = (Decimal)ca[0].get('CAD');
AggregateResult[] calist = [select sum(Extended_List__c)CADList from OpportunityLineItem where Sales_Order_Category__c = 'Software - CAD' and opportunityId = :sonumb];
  SOrec.CAD_Software_List__c = (Decimal)calist[0].get('CADList');  
AggregateResult[] rm = [select sum(Extended_Price__c)RMS from OpportunityLineItem where Sales_Order_Category__c = 'Software - RMS' and opportunityId = :sonumb];
  SOrec.RMS_Software__c = (Decimal)rm[0].get('RMS');
AggregateResult[] rmlist = [select sum(Extended_List__c)RMSList from OpportunityLineItem where Sales_Order_Category__c = 'Software - RMS' and opportunityId = :sonumb];
  SOrec.RMS_List__c = (Decimal)rmlist[0].get('RMSList');
AggregateResult[] fb = [select sum(Extended_Price__c)FBR from OpportunityLineItem where Sales_Order_Category__c = 'Software - FBR' and opportunityId = :sonumb ];
  SOrec.FBR_Software__c = (Decimal)fb[0].get('FBR');  
AggregateResult[] fblist = [select sum(Extended_List__c)FBRList from OpportunityLineItem where Sales_Order_Category__c = 'Software - FBR' and opportunityId = :sonumb ];
  SOrec.FBR_List__c = (Decimal)fblist[0].get('FBRList');
AggregateResult[] fi = [select sum(Extended_Price__c)Fire from OpportunityLineItem where Sales_Order_Category__c = 'Software - Fire' and opportunityId = :sonumb ];
  SOrec.Fire_Software__c = (Decimal)fi[0].get('Fire');
AggregateResult[] filist = [select sum(Extended_List__c)FireList from OpportunityLineItem where Sales_Order_Category__c = 'Software - Fire' and opportunityId = :sonumb ];
  SOrec.Fire_List__c = (Decimal)filist[0].get('FireList');
AggregateResult[] ja = [select sum(Extended_Price__c)Jail from OpportunityLineItem where Sales_Order_Category__c = 'Software - Jail' and opportunityId = :sonumb ];
  SOrec.Jail_Software__c = (Decimal)ja[0].get('Jail');
AggregateResult[] jalist = [select sum(Extended_List__c)JailList from OpportunityLineItem where Sales_Order_Category__c = 'Software - Jail' and opportunityId = :sonumb ];
  SOrec.Jail_List__c = (Decimal)jalist[0].get('JailList');
AggregateResult[] mo = [select sum(Extended_Price__c)Mobile from OpportunityLineItem where Sales_Order_Category__c = 'Software - Mobile' and opportunityId = :sonumb ];
  SOrec.Mobile_Software__c = (Decimal)mo[0].get('Mobile');
AggregateResult[] molist = [select sum(Extended_List__c)MobileList from OpportunityLineItem where Sales_Order_Category__c = 'Software - Mobile' and opportunityId = :sonumb ];
  SOrec.Mobile_List__c = (Decimal)molist[0].get('MobileList');
AggregateResult[] noo = [select sum(Extended_Price__c)noone from OpportunityLineItem where Sales_Order_Category__c = 'Software - Telephony 911' and opportunityId = :sonumb ];
  SOrec.Telephony_911__c = (Decimal)noo[0].get('noone');
AggregateResult[] noolist = [select sum(Extended_List__c)noonelist from OpportunityLineItem where Sales_Order_Category__c = 'Software - Telephony 911' and opportunityId = :sonumb ];
  SOrec.Telephony_List__c = (Decimal)noolist[0].get('noonelist');
AggregateResult[] rma = [select sum(Extended_Price__c)RMSA from OpportunityLineItem where Functional_Area__c = 'RMS' and Type__c = 'Software' and Charge_Type__c = 'Annual Subscription' and opportunityId = :sonumb ];
  SOrec.Subscp_RMS_FBR__c = (Decimal)rma[0].get('RMSA');
AggregateResult[] rmalist = [select sum(Extended_List__c)RMSAList from OpportunityLineItem where Functional_Area__c = 'RMS' and Type__c = 'Software' and Charge_Type__c = 'Annual Subscription' and opportunityId = :sonumb ];
  SOrec.Subscription_List__c = (Decimal)rmalist[0].get('RMSAList');
AggregateResult[] iqalist = [select sum(Extended_List__c)IQAList from OpportunityLineItem where Functional_Area__c = 'IQ' and Type__c != 'Software Subscriptions' and Charge_Type__c = 'Annual Subscription' and opportunityId = :sonumb ];
  SOrec.IQ_List__c = (Decimal)iqalist[0].get('IQAList');  
AggregateResult[] cai = [select sum(Extended_Price__c)CAD from OpportunityLineItem where Sales_Order_Category__c = 'Software - Interface CAD/Mobile' and opportunityId = :sonumb];
  SOrec.Interface_CAD_Mobile_Software__c = (Decimal)cai[0].get('CAD');  
AggregateResult[] cailist = [select sum(Extended_List__c)CADList from OpportunityLineItem where Sales_Order_Category__c = 'Software - Interface CAD/Mobile' and opportunityId = :sonumb];
  SOrec.CAD_Interface_List__c = (Decimal)cailist[0].get('CADList');
AggregateResult[] rmsi = [select sum(Extended_Price__c)RMSI from OpportunityLineItem where Sales_Order_Category__c = 'Software - Interface RMS/FBR' and opportunityId = :sonumb];
  SOrec.Interface_RMS_FBR_Jail_Software__c = (Decimal)rmsi[0].get('RMSI');
AggregateResult[] rmsilist = [select sum(Extended_List__c)RMSIList from OpportunityLineItem where Sales_Order_Category__c = 'Software - Interface RMS/FBR' and opportunityId = :sonumb];
  SOrec.RMS_Interface_List__c = (Decimal)rmsilist[0].get('RMSIList');

//Services  
AggregateResult[] pandiserv = [select sum(Extended_Price__c)PandI from OpportunityLineItem where Sales_Order_Category__c = 'Services - Project & Installation' and opportunityId = :sonumb];
  SOrec.PandI_Services__c = (Decimal)pandiserv[0].get('PandI');    
AggregateResult[] pandiservlist = [select sum(Extended_List__c)PandIList from OpportunityLineItem where Sales_Order_Category__c = 'Services - Project & Installation' and opportunityId = :sonumb];
  SOrec.P_I_List__c = (Decimal)pandiservlist[0].get('PandIList');
AggregateResult[] isservlist = [select sum(Extended_List__c)ISServList from OpportunityLineItem where Sales_Order_Category__c = 'Services - Integrated Solutions' and opportunityId = :sonumb];
  SOrec.IS_Services_List__c = (Decimal)isservlist[0].get('ISServList');
AggregateResult[] isserv = [select sum(Extended_Price__c)ISServ from OpportunityLineItem where Sales_Order_Category__c = 'Services - Integrated Solutions' and opportunityId = :sonumb];
  SOrec.IS_Services__c = (Decimal)isserv[0].get('ISServ');
AggregateResult[] serv = [select sum(Extended_Price__c)train from OpportunityLineItem where Sales_Order_Category__c = 'Services - Training' and opportunityId = :sonumb];
  SOrec.Training_Services__c = (Decimal)serv[0].get('train');
AggregateResult[] servlist = [select sum(Extended_List__c)trainlist from OpportunityLineItem where Sales_Order_Category__c = 'Services - Training' and opportunityId = :sonumb];
  SOrec.Training_Services_List__c = (Decimal)servlist[0].get('trainlist');  
AggregateResult[] servlist1 = [select sum(Extended_List__c)trainlist1 from OpportunityLineItem where Sales_Order_Category__c = 'Services - Other Service Revenue' and opportunityId = :sonumb];
  SOrec.Other_Services__c = (Decimal)servlist1[0].get('trainlist1');   
AggregateResult[] Sublist1 = [select sum(Extended_List__c)Sublist1 from OpportunityLineItem where Sales_Order_Category__c = 'Other - Subcontract' and opportunityId = :sonumb];
  SOrec.Subcontract_List__c = (Decimal)Sublist1[0].get('Sublist1');
AggregateResult[] SubSuplist1 = [select sum(Extended_List__c)SubSuplist1 from OpportunityLineItem where Sales_Order_Category__c = 'Other - Subcontract Support' and opportunityId = :sonumb];
  SOrec.Subcontract_Support__c = (Decimal)SubSuplist1[0].get('SubSuplist1');

//Other Left

AggregateResult[] thirdserv = [select sum(Extended_Price__c)ThirdServ from OpportunityLineItem where Sales_Order_Category__c = 'Other - Hardware' and opportunityId = :sonumb];
  SOrec.Hardware_3rd_Party__c = (Decimal)thirdserv[0].get('ThirdServ');
AggregateResult[] thirdservlist = [select sum(Extended_List__c)ThirdServList from OpportunityLineItem where Sales_Order_Category__c = 'Other - Hardware' and opportunityId = :sonumb];
  SOrec.Hardware_List__c = (Decimal)thirdservlist[0].get('ThirdServList');
AggregateResult[] thirdhardserv = [select sum(Extended_Price__c)ThirdHardServ from OpportunityLineItem where Sales_Order_Category__c = 'Other - Hardware Support' and opportunityId = :sonumb];
  SOrec.Hardware_3rd_Party_Support__c = (Decimal)thirdhardserv[0].get('ThirdHardServ');
AggregateResult[] thirdsoft = [select sum(Extended_Price__c)ThirdSoft from OpportunityLineItem where Sales_Order_Category__c = 'Other - 3rd Party Software' and opportunityId = :sonumb];
  SOrec.X3rd_Party_Software__c = (Decimal)thirdsoft[0].get('ThirdSoft');
AggregateResult[] thirdsoftlist = [select sum(Extended_List__c)ThirdSoftList from OpportunityLineItem where Sales_Order_Category__c = 'Other - 3rd Party Software' and opportunityId = :sonumb];
  SOrec.X3rd_Party_Soft_List__c = (Decimal)thirdsoftlist[0].get('ThirdSoftList');
AggregateResult[] thirdsoftSuplist = [select sum(Extended_List__c)ThirdSoftSupList from OpportunityLineItem where Sales_Order_Category__c = 'Other - 3rd Party Support' and opportunityId = :sonumb];
  SOrec.X3rd_Party_Support__c = (Decimal)thirdsoftSuplist[0].get('ThirdSoftSupList');
AggregateResult[] dvserv = [select sum(Extended_Price__c)DVServ from OpportunityLineItem where Functional_Area__c = 'Data Vault' and opportunityId = :sonumb];
  SOrec.Datavault_Subscription__c = (Decimal)dvserv[0].get('DVServ');  
AggregateResult[] dvservlist = [select sum(Extended_List__c)DVServList from OpportunityLineItem where Functional_Area__c = 'Data Vault' and opportunityId = :sonumb];
  SOrec.Datavault_List__c = (Decimal)dvservlist[0].get('DVServList'); 
AggregateResult[] siserv = [select sum(Extended_Price__c)SIServ from OpportunityLineItem where Sales_Order_Category__c = 'Other - System Integration' and opportunityId = :sonumb];
  SOrec.System_Integration__c = (Decimal)siserv[0].get('SIServ'); 
AggregateResult[] siservlist = [select sum(Extended_List__c)SIServList from OpportunityLineItem where Sales_Order_Category__c = 'Other - System Integration' and opportunityId = :sonumb];
  SOrec.SI_List__c = (Decimal)siservlist[0].get('SIServList'); 
  
  
 //Other Right
AggregateResult[] shipserv = [select sum(Extended_Price__c)ShipServ from OpportunityLineItem where Name like 'Shipping' and opportunityId = :sonumb];
  SOrec.Shipping__c = (Decimal)shipserv[0].get('ShipServ');
AggregateResult[] eserv = [select sum(Extended_Price__c)EServ from OpportunityLineItem where Name like 'Escrow' and opportunityId = :sonumb];
  SOrec.Escrow__c = (Decimal)eserv[0].get('EServ');
AggregateResult[] ttfee = [select sum(Extended_Price__c)ttfee from OpportunityLineItem where Sales_Order_Category__c = 'Other - TriCon Fees' and opportunityId = :sonumb];
  SOrec.TriCon_Fees__c = (Decimal)ttfee[0].get('ttfee');
AggregateResult[] bondserv = [select sum(Extended_Price__c)BondServ from OpportunityLineItem where Name like 'Performance Bond' and opportunityId = :sonumb];
  SOrec.Bonds_L_C__c = (Decimal)bondserv[0].get('BondServ'); 
//travel - fixed
SOrec.Travel_Fixed__c = (Decimal)[Select sum(T_E_Fee__c) travelfix from OpportunityLineItem where opportunityId = :sonumb][0].get('travelfix');
//other
//discount other
//other total

//software support
SOrec.Software_Support__c = (Decimal)[Select sum(Maintenance_Amount__c) totalsup from OpportunityLineItem where opportunityId = :sonumb][0].get('totalsup');


SOrec.Software_Support__c = (Decimal)[Select sum(Maintenance_Amount__c) totalsup from OpportunityLineItem where opportunityId = :sonumb][0].get('totalsup');
//non booking items
//prepaid maint
//other deferred revenue

//Tritech.com Hosting
AggregateResult[] iqhost = [select sum(Extended_Price__c)IQHost from OpportunityLineItem where Functional_Area__c = 'IQ' and Type__c = 'Software Subscriptions' and 
    Product2.Item_Sub_type__c = 'Annual Subscription' and opportunityId = :sonumb];
  SOrec.Tritech_Com_IQ_Hosting__c = (Decimal)iqhost[0].get('IQHost');
AggregateResult[] iqhostlist = [select sum(Extended_List__c)IQHostList from OpportunityLineItem where Functional_Area__c = 'IQ' and Type__c = 'Software Subscriptions' and 
    Product2.Item_Sub_type__c = 'Annual Subscription' and opportunityId = :sonumb];
  SOrec.Tritech_Com_IQ_Hosting_List__c = (Decimal)iqhostlist[0].get('IQHostList');
AggregateResult[] iqinstall = [select sum(Extended_Price__c)IQInstall from OpportunityLineItem where Functional_Area__c = 'IQ' and Type__c = 'Services' and 
    Product2.Item_Sub_type__c = 'Implementation' and opportunityId = :sonumb];
  SOrec.Tritech_Com_Install__c = (Decimal)iqinstall[0].get('IQInstall');
AggregateResult[] iqinstalllist = [select sum(Extended_List__c)IQInstallList from OpportunityLineItem where Functional_Area__c = 'IQ' and Type__c = 'Services' and 
    Product2.Item_Sub_type__c = 'Implementation' and opportunityId = :sonumb];
  SOrec.Tritech_Com_Install_List__c = (Decimal)iqinstalllist[0].get('IQInstallList');  
AggregateResult[] iqtrain = [select sum(Extended_Price__c)IQTrain from OpportunityLineItem where Functional_Area__c = 'IQ' and Type__c = 'Services' and 
    Product2.Item_Sub_type__c = 'Training' and opportunityId = :sonumb];
  SOrec.Tritech_Com_Training__c = (Decimal)iqtrain[0].get('IQTrain');
AggregateResult[] iqtrainlist = [select sum(Extended_List__c)IQTrainList from OpportunityLineItem where Functional_Area__c = 'IQ' and Type__c = 'Services' and 
    Product2.Item_Sub_type__c = 'Training' and opportunityId = :sonumb];
  SOrec.Tritech_Com_Training_List__c = (Decimal)iqtrainlist[0].get('IQTrainList'); 
  

//Embedded Costs
//MO
AggregateResult[] arcgisrt = [select sum(quantity)ArcGISRT from OpportunityLineItem where Product2.Name = 'Inform Mobile Base Position' and opportunityId = :sonumb];  
  SOrec.ArcGIS_Run_Time__c = (Decimal)arcgisrt[0].get('ArcGISRT'); 
AggregateResult[] arcgise = [select sum(quantity)ArcGISE from OpportunityLineItem where Product2.Name = 'Inform CAD Mapping' and opportunityId = :sonumb];  
  SOrec.ArcGIS_Engine_10X__c = (Decimal)arcgise[0].get('ArcGISE'); 
AggregateResult[] moupgrade = [select sum(quantity)MOUpgrade from OpportunityLineItem where Product2.Name = 'Inform Mobile Mapping Upgrade v5.6 / 5.7' and Type__c = 'Software' and opportunityId = :sonumb];  
  SOrec.MO_Upgrade__c = (Decimal)moupgrade[0].get('MOUpgrade');  
AggregateResult[] dundas = [select sum(quantity)Dundas from OpportunityLineItem where Product2.Name = 'IQ Analytics 5 Concurrent User Bundle One Year Subscription' and opportunityId = :sonumb];  
  SOrec.Dundas__c = (Decimal)dundas[0].get('Dundas');  
    

}
}