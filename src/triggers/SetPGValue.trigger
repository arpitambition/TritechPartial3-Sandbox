Trigger SetPGValue on ServiceContract (before insert, before update) 
{
  Set<Id> accntIds = new Set<Id>();
  for(ServiceContract c : trigger.new) 
    {
        if(c.Contract_Type__c == 'Inform 911' || c.Contract_Type__c == '911' || c.Contract_Type__c == 'ETI 911' || c.Contract_Type__c == 'ETI 911 Hardware'|| c.Contract_Type__c == 'ETI 911 ANI Link')
        {
                //collect the account IDs to pull the Mailing/Billing address info
                c.Product_Group1__c = 'Inform 911';
        }
        if(c.Contract_Type__c == 'TC CAD/Mobile')
        {
                //collect the account IDs to pull the Mailing/Billing address info
                c.Product_Group1__c = 'TC CAD/Mobile';
        }
        if(c.Contract_Type__c == 'TC RMS')
        {
                //collect the account IDs to pull the Mailing/Billing address info
                c.Product_Group1__c = 'TC RMS';
        }
        if(c.Contract_Type__c == 'DN CAD/Mobile')
        {
                //collect the account IDs to pull the Mailing/Billing address info
                c.Product_Group1__c = 'DN CAD/Mobile';
        }
        if(c.Contract_Type__c == 'TE RMS')
        {
                //collect the account IDs to pull the Mailing/Billing address info
                c.Product_Group1__c = 'TE RMS';
        }
        if(c.Contract_Type__c == 'FACTS' || c.Contract_Type__c == 'IMS' || c.Contract_Type__c == 'Copperfire' || c.Contract_Type__c == 'CAD 2000')
        {
                //collect the account IDs to pull the Mailing/Billing address info
                c.Product_Group1__c = 'Legacy Tiburon';
        }
        if(c.Contract_Type__c == 'Inform CAD' || c.Contract_Type__c == 'Inform Mobile' || c.Contract_Type__c == 'Respond CAD' || c.Contract_Type__c == 'VisiNet' || c.Contract_Type__c == 'Custom Solution' || 
            c.Contract_Type__c == 'Inform CAD Custom Solution' || c.Contract_Type__c == 'Inform ME' || c.Contract_Type__c == 'Inform Mobile Custom Solution' || c.Contract_Type__c == 'Third Party' || c.Contract_Type__c == 'Stratus'
            || c.Contract_Type__c == 'TriTech Message Switch CAD' || c.Contract_Type__c == 'TriTech Message Switch Mobile' || c.Contract_Type__c == 'Field Ops')
        {
                //collect the account IDs to pull the Mailing/Billing address info
                c.Product_Group1__c = 'Inform CAD-Mobile';
        }
        if(c.Contract_Type__c == 'Inform FBR' || c.Contract_Type__c == 'Inform Jail' || c.Contract_Type__c == 'Inform Fire' 
            || c.Contract_Type__c == 'Inform RMS' || c.Contract_Type__c == 'Inform RMS Custom Solution' || c.Contract_Type__c == 'Inform FBR Custom Solution' || c.Contract_Type__c == 'Inform Jail Custom Solution'
            || c.Contract_Type__c == 'VisionFBR' || c.Contract_Type__c == 'VisionINFORM' || c.Contract_Type__c == 'VisionRMS' 
            || c.Contract_Type__c == 'VisionJAIL' || c.Contract_Type__c == 'Go To Assist' || c.Contract_Type__c == 'GEO Comm' || c.Contract_Type__c == 'VisionDATAVAULT' || c.Contract_Type__c == 'VisionDASHBOARD'
            || c.Contract_Type__c == 'APS' || c.Contract_Type__c == 'VisionMNHS' || c.Contract_Type__c == 'NorthPointe' || c.Contract_Type__c == 'Inform Web RMS' || c.Contract_Type__c == 'TriTech Message Switch RMS' || c.Contract_Type__c == 'TriTech Message Switch Jail')
        {
                //collect the account IDs to pull the Mailing/Billing address info
                c.Product_Group1__c = 'Inform RMS-IQ';
        }
        if(c.Contract_Type__c == 'IMC')
        {
                //collect the account IDs to pull the Mailing/Billing address info
                c.Product_Group1__c = 'Perform';
        }
        if(c.Contract_Type__c == 'Zuercher Suite' || c.Contract_Type__c == 'Insight'  || c.Contract_Type__c == 'LETG'  || c.Contract_Type__c == 'GIS Maintenance'  || c.Contract_Type__c == 'Emergitech'  || c.Contract_Type__c == 'State'
             || c.Contract_Type__c == 'ETI'  || c.Contract_Type__c == 'ETI Hardware' || c.Contract_Type__c == 'Impact')
        {
                //collect the account IDs to pull the Mailing/Billing address info
                c.Product_Group1__c = 'Zuercher';
        }
        if(c.Contract_Type__c == 'TriTech.com ePCR' || c.Contract_Type__c == 'TriTech.com Billing' || c.Contract_Type__c == 'Respond ePCR' || c.Contract_Type__c == 'Respond Billing' || c.Contract_Type__c == 'Sweet CAD'
             || c.Contract_Type__c == 'FDC'  || c.Contract_Type__c == 'SBS'  || c.Contract_Type__c == 'AVeL' || c.Contract_Type__c == 'RespondMapping Hosted')
        {
                //collect the account IDs to pull the Mailing/Billing address info
                c.Product_Group1__c = 'Respond';
        }
        if(c.Contract_Type__c == 'VisionCAD' || c.Contract_Type__c == 'VisionMOBILE' || c.Contract_Type__c == 'VisionLMS' || c.Contract_Type__c == 'VisionFORCE' || c.Contract_Type__c == 'Emergin' || c.Contract_Type__c == 'VisionFIRE'
             || c.Contract_Type__c == 'VisionCONNECT')
        {    
                c.Product_Group1__c = 'Vision';
        }         
        if(c.Contract_Type__c == 'Inform IQ' || c.Contract_Type__c == 'Inform Analytics' || c.Contract_Type__c == 'CrimeMapping Desktop' || c.Contract_Type__c == 'CrimeMapping Hosted' || c.Contract_Type__c == 'CrimeView Dashboard' || c.Contract_Type__c == 'CrimeView Desktop' || c.Contract_Type__c == 'CrimeView Hosted'
            || c.Contract_Type__c == 'TriTech.com IQ' || c.Contract_Type__c == 'TriTech.com Analytics' || c.Contract_Type__c == 'FireView_Dashboard' || c.Contract_Type__c == 'Omega' || c.Contract_Type__c == 'FireView Desktop' || c.Contract_Type__c == 'FireView Hosted' || c.Contract_Type__c == 'NEARme Desktop' || c.Contract_Type__c == 'NEARme Hosted'
            || c.Contract_Type__c == 'Advanced Reporting Module' || c.Contract_Type__c == 'Advanced Reporting Module Hosted' || c.Contract_Type__c == 'CrimeView Dashboard Hosted' || c.Contract_Type__c == 'FireView Dashboard Hosted' || c.Contract_Type__c == 'Predictive Missions' || c.Contract_Type__c == 'Predictive Missions Hosted'
            || c.Contract_Type__c == 'CDP Inform' || c.Contract_Type__c == 'CDP Zuercher' || c.Contract_Type__c == 'CDP IMC')
        {
                c.Product_Group1__c = 'GIS - Analytics';
        }
        if(c.Contract_Type__c == 'Response CAD' || c.Contract_Type__c == 'Response Mobile' || c.Contract_Type__c == 'ICIS Records' || c.Contract_Type__c == 'ICIS Field Reporting' || c.Contract_Type__c == 'Embrs FireRecords' || c.Contract_Type__c == 'Ultra Android Mobile' || c.Contract_Type__c == 'Ultra IOS Mobile'
            || c.Contract_Type__c == 'GEOServer' || c.Contract_Type__c == 'ICIS MTX' || c.Contract_Type__c == 'EMBRS' || c.Contract_Type__c == 'Web Based Incident Reporting' || c.Contract_Type__c == 'Interoperabilty Server (IOS)')
        {
                c.Product_Group1__c = 'PSSI';
    }
}
}