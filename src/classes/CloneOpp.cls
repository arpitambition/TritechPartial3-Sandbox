public with sharing class CloneOpp {
    private String oppId;
    private Opportunity caseObj;
    private Opportunity copyCaseObj;
    public Opportunity ClonedOpportunity {get;set;}
    public Opportunity NewOpportunity {get;set;} 
    public Boolean showNewOppButton {get;set;}
    public String LaunchMode {get;set;}      
    GuidedSelling__GuidedSellingSettings__c orgSettings = null;    
    
    public CloneOpp (ApexPages.StandardController controller) {
        caseObj = new Opportunity();
        
        
    oppId =  System.currentPageReference().getParameters().get('id');
        for( Opportunity c:[ Select c.Owner.id,c.Name,c.Account.id,c.Sales_Order_Number__c,c.Contact__c,c.type,c.Probability,c.Products_Required__c,c.Deal_Type__c,c.RecordType.Id,c.Product_Family_WMP__c,c.Price_Book__c,c.RecordType.name,c.leadsource,c.RecordTypeId,
                        c.StageName,c.Quote_Number__c
                        From Opportunity c where id =: oppId]){
            caseObj = c;
        }               
    }
    
    public Pagereference doClone(){
        Pagereference pr = null;
        try{
            System.debug('Start : doClone ');
            System.debug('caseObj.StageName : ' + caseObj.StageName);
            if((caseObj.StageName == 'Booked')||(caseObj.StageName == 'Closed Won'))
            {
            System.debug('caseObj.RecordType.Name : ' + caseObj.RecordType.Name);
            //if((caseObj.RecordType.Name != 'Tritech Change Order')&&(caseObj.RecordType.Name != 'Zuercher Change Order'))
            //{
            //assigning values to new opportunity
            //SObject record = ProcessSchemaInfo(ClonedOpportunity.Id);
            Opportunity OpportunityRecordQueried = caseObj;     
            NewOpportunity = OpportunityRecordQueried.clone(false);
            NewOpportunity.Name = NewOpportunity.Name + ' Copy'; 
            NewOpportunity.CloseDate = system.today() + 30;
            NewOpportunity.StageName = 'Active Opportunity';
            NewOpportunity.Probability = 5;
            insert NewOpportunity;         
            
            //NewOpportunity.Owner = caseObj.Owner;
            
            //NewOpportunity.Account = caseObj.Account;
            //NewOpportunity.Sales_Order_Number__c = caseObj.Sales_Order_Number__c;
           // NewOpportunity.Contact__c = caseObj.Contact__c;
            //NewOpportunity.Products_Required__c = caseObj.Products_Required__c;
            
            //NewOpportunity.Original_Quote_Number__c = caseObj.Quote_Number__c;
            //NewOpportunity.Deal_Type__c = 'Change Order';
            //NewOpportunity.LeadSource = 'Customer Request';
            //NewOpportunity.Type = 'Existing Business';
            
            //string quonum = caseObj.Quote_Number__c.ToUpperCase().substring(0,9);
            //quonum = quonum.ToUpperCase().replace('QUO','ORD');
            //string variable = quonum.substring(4,9);
            //String[] variables = new String[]{'%' + variable + '%'};
            //variable = string.valueof(variables);
           // variable = variable.substring(1,8);
            //system.debug('Variable is: ' + variable);
            //determining number of quote versions
            //aggregateresult  ar = database.query('select count(id) result from opportunity where quote_number__c like \''+ variable + '\''); 
            //integer total = integer.valueof(ar.get('result'));              
            //system.debug('new number is ' + total);
            
            //formatting the new Sales Order revision number to be -XXXX
            //if(total == 0)
              //  {quonum = quonum + '-0001';}
            //if(total > 0 && total < 10)
            //    {quonum = quonum + '-000' + (total + 1);}
            //if(total >9 && total < 100)
            //    {quonum = quonum + '-00' + (total + 1);}
            //if(total > 99 && total < 1000)
            //    {quonum = quonum + '-0' + (total + 1);}
            //if(total > 999)
            //    {quonum = quonum + '-' + (total + 1);}    
                            
            //NewOpportunity.Quote_Number__c = quonum;
            //NewOpportunity.Name = 'Change Order - ' + total + ' ' + caseObj.Name;
            //system.debug('Count = ' + total);
            
            NewOpportunity.Probability = caseObj.Probability;
            //System.debug('The value of stage is: ' + caseObj.StageName);
            //System.debug('The value of RecordType is: ' + caseObj.RecordType.Name);
            if((caseObj.StageName == 'Booked')||(caseObj.StageName == 'Closed Won'))
            {
            if ((caseObj.RecordType.Name == 'Tritech Competitive') || (caseObj.RecordType.Name == 'Tritech Non-Competitive'))
            {
                //inserting the Tritech specific required data elements
                NewOpportunity.RecordTypeid = [Select Id from recordtype where name = 'Tritech Change Order'].id;
                NewOpportunity.Description = 'Change Order for Sales Order: ' + caseObj.Sales_Order_Number__c;
                NewOpportunity.StageName = 'Active Opportunity';
                NewOpportunity.Probability = 5;
            }
            else if ((caseObj.RecordType.Name == 'Zuercher Non-Competitive') || (caseObj.RecordType.Name == 'Zuercher Competitive'))
            {
                //inserting the Z specific required elements
                NewOpportunity.RecordTypeid = [Select Id from recordtype where name = 'Zuercher Change Order'].id;
                NewOpportunity.StageName = 'Active Opportunity';
                NewOpportunity.Probability = 5;
            }
            }
            
            
            //NewOpportunity.Product_Family_WMP__c = caseObj.Product_Family_WMP__c;
            //NewOpportunity.Price_Book__c = caseObj.Price_Book__c;
            
            //inserting the Sales Order record type opportunity
            upsert NewOpportunity;
            
            //building the list of Opportunity line items
            Map<Id, Opportunity> cloneOppMap = new Map<Id, Opportunity>();
            List<OpportunityLineItem> cloneOppLineItemList = new List<OpportunityLineItem>();
            List<OpportunityLineItem> oldOppLineItemList = [Select UnitPrice, Quantity, Discount,GRoss_Margin__c,PricebookEntryId, ProductCode,Functional_Area__c,Type__c,Extended_Price__c,Cost__c,Support_Level__c,Maintenance_Amount__c,Charge_Type__c,OpportunityId, ListPrice, Id, Description From OpportunityLineItem where OpportunityId = :oppId];
            system.debug('********** OLD Opp Line Items List-1: '+ oldOppLineItemList);
            for(OpportunityLineItem oldlineitem : oldOppLineItemList) 
            {
            //copying the old line items to the new opportunity list   
            OpportunityLineItem newlineitem = oldlineitem.clone(false, true);
            newlineitem.OpportunityId = NewOpportunity.id;
            cloneOppLineItemList.add(newlineitem);
            }
            system.debug('********** Cloned Opp Line Item List-1: '+ cloneOppLineItemList);
            //inserting the line items into the newly created opportunity
            //upsert cloneOppLineItemList;
                                                                            
            //defining the page to be returned to the user once the inserts have completed 
            pr = new PageReference('/' + NewOpportunity.id + '/e?saveURL=/' + NewOpportunity.Id + '&00N80000004ZqvX=');
            pr.setRedirect(true);
            //}
            //else
            //{
            //  string error = caseObj.RecordType.name;
             //   caseObj.addError('Change Orders can only be created on the Original Opportunity.' + error);
            //    System.debug('Change Orders can only be created on the Original Opportunity.');
            //}
            }
            else
            {
                caseObj.addError('Only Opportunities with a Booked stage are available to create a Change Order.');
                System.debug('Change Orders can only be created on the Original Opportunity.');
            }
            System.debug('End : doClone');
        }
        catch(DMLException e ){
            ApexPages.addMessage(new ApexPages.message(ApexPages.severity.ERROR,e.getDMLMessage(0))); 
            System.debug('Error : doClone action : ' + e.getDMLMessage(0));
            return null;  
        }
        catch(Exception ex){
            ApexPages.addMessage(new ApexPages.message(ApexPages.severity.ERROR,ex.getMessage())); 
            System.debug('Error : doClone action : ' + ex.getMessage());
            return null;  
        }
        //return pr;
        return null; 
    }        
    
    /*
        Copying quote in CPQ.
    */
    public PageReference CopyQuote() {
        
         try    
         {               
            System.debug(' Start : CopyQuote() '); 
             
            if((caseObj.StageName == 'Booked')||(caseObj.StageName == 'Closed Won'))
            {
                System.debug('caseObj.RecordType.Name : ' + caseObj.RecordType.Name);
            //  if((caseObj.RecordType.Name == 'Tritech Change Order')||(caseObj.RecordType.Name == 'Zuercher Change Order'))
            //  {
             //       caseObj.addError('Change Orders can only be created on the Original Opportunity.');
            //        return null;
                    //ApexPages.addmessage(new ApexPages.message(ApexPages.severity.INFO, 'New Opportunity is not created. Having error in doClone action.'));
            //    }
            }
            else
            {
                caseObj.addError('Only Opportunities with a Booked stage are available to create a Change Order.'); 
                return null;
            }
                          
             if(NewOpportunity == null)
             {
                 ApexPages.addmessage(new ApexPages.message(ApexPages.severity.ERROR,'New Opportunity is not created. Having error in doClone action.'));
                 //showNewOppButton = true;
                 return null;                 
             }
             
             if(caseObj == null)
             {
                 ApexPages.addmessage(new ApexPages.message(ApexPages.severity.ERROR,'Old Opportunity is null. Having error in doClone action.'));
                 //showNewOppButton = true;
                 return null;                 
             }
                          
             //string quonum = caseObj.Quote_Number__c.ToUpperCase().substring(0,9);
             string quonum = caseObj.Quote_Number__c.ToUpperCase();
             //system.debug('orig quote number' + quonum);
             quonum = quonum.ToUpperCase().replace('QUO','ORD');
                         
             string variable = quonum.substring(4);
             //string variable = quonum;
             system.debug (' quotenumber ' + variable); 
             //String[] variables = new String[]{'%' + variable + '%'};
             //variable = string.valueof(variables);
             //variable = variable.substring(1,8);
             system.debug('variable after changes' + variable);
             //determining number of quote versions
             variable = '\'%' + String.escapeSingleQuotes(variable.trim()) + '%\'';
             aggregateresult  ar = database.query('select count(id) result from opportunity where quote_number__c like ' + variable);
             
             integer total = integer.valueof(ar.get('result'));              
                         
             //formatting the new Sales Order revision number to be -XXXX
             if (total > 0)
                total = total - 1;
             if(total == 0)
                {quonum = quonum + '-0001';}
             if(total > 0 && total < 10)
                 {quonum = quonum + '-000' + (total);}
             if(total >9 && total < 100)
                 {quonum = quonum + '-00' + (total);}
             if(total > 99 && total < 1000)
                 {quonum = quonum + '-0' + (total);}
             if(total > 999)
                 {quonum = quonum + '-' + (total);}    
              if((caseObj.StageName == 'Booked')||(caseObj.StageName == 'Closed Won'))
            {
            if ((caseObj.RecordType.Name == 'Tritech Competitive') || (caseObj.RecordType.Name == 'Tritech Non-Competitive'))
            {
                //inserting the Tritech specific required data elements
                NewOpportunity.RecordTypeid = [Select Id from recordtype where name = 'Tritech Change Order'].id;
                NewOpportunity.Description = 'Change Order for Sales Order: ' + caseObj.Sales_Order_Number__c;
                NewOpportunity.StageName = 'Active Opportunity';
                NewOpportunity.Probability = 5;
            }
            else if ((caseObj.RecordType.Name == 'Zuercher Non-Competitive') || (caseObj.RecordType.Name == 'Zuercher Competitive'))
            {
                //inserting the Z specific required elements
                NewOpportunity.RecordTypeid = [Select Id from recordtype where name = 'Zuercher Change Order'].id;
                NewOpportunity.StageName = 'Active Opportunity';
                NewOpportunity.Probability = 5;
            }
            }
             if((caseObj.RecordType.Name != 'Tritech Change Order')&&(caseObj.RecordType.Name != 'Zuercher Change Order'))
             {               
                NewOpportunity.Quote_Number__c = quonum;
                NewOpportunity.CPQ_Quote_Number__c = quonum;
                NewOpportunity.StageName = 'Active Opportunity';
                NewOpportunity.Probability = 5;
             }
             Pagereference pr = null;
             String applicationUrl = getApplicationUrl('prod');             
             String serverUrl = 'https://' + ApexPages.currentPage().getHeaders().get('Host') + '/services/Soap/u/26.0/' + UserInfo.getOrganizationId(); 
             System.debug(' Old OpportunityId ' + caseObj.Id);             
             System.debug(' New OpportunityId ' + NewOpportunity.id);             
             // Login to CPQ with HMAC and Session Id                        
             String statusMsg = CloneOpportunityController.CopyQuote(UserInfo.getSessionId(), getHMACSignature(UserInfo.getSessionId()), UserInfo.getUserName(), applicationUrl, serverUrl, caseObj.Id, NewOpportunity.id);
             //String statusMsg = GuidedSelling.CloneOpportunityController.CopyQuote(UserInfo.getSessionId(), getHMACSignature(UserInfo.getSessionId()), UserInfo.getUserName(), endeavorCPQUrl, serverUrl, oppId, NewOpportunity.id);             
             System.debug('statusMsg : ' + statusMsg);             
             NewOpportunity.LeadSource = 'Customer Request';             
             NewOpportunity.Type = 'Existing Business';             
             NewOpportunity.Deal_Type__c = 'Change Order';             
             NewOpportunity.StageName = 'Active Opportunity';             
             NewOpportunity.Probability = 5;             
             
             if((caseObj.RecordType.Name != 'Tritech Change Order')&&(caseObj.RecordType.Name != 'Zuercher Change Order'))
             {                                
                NewOpportunity.Name = 'Change Order - ' + total + ' ' + caseObj.Name;
             }
             
             upsert NewOpportunity;                 
             
             if(statusMsg == 'ERROR')
             {
                 ApexPages.addmessage(new ApexPages.message(ApexPages.severity.INFO,'Opportunity has been created and opportunityid is ' + NewOpportunity.id + '. Opportunity does not associate with CPQ quote or getting error during process CopyQuote workflow in CPQ.'));
                 showNewOppButton = true;
                 return null;                              
             }
             else
             {  
                 //defining the page to be returned to the user once the inserts have completed 
                 pr = new PageReference('/' + NewOpportunity.id + '/e?saveURL=/' + NewOpportunity.Id + '&00N80000004ZqvX=');
                 pr.setRedirect(true);
                 return pr;                               
             }                       
         } 
         catch (Exception e)
         {
            System.debug('Error : Copy Quote : ' + e.getMessage());             
            ApexPages.addmessage(new ApexPages.message(ApexPages.severity.INFO,'Opportunity has been created and opportunityid is ' + NewOpportunity.id + '. Opportunity does not associate with CPQ quote or getting error during process CopyQuote workflow in CPQ.'));
            return null;             
         }                       
    } 
    
    /*     
        Redirect to new opportunity.
    */
    public PageReference RedirectToNewOpportunity() {               
        return new PageReference('/'+ NewOpportunity.id);
    }
    
    /*
        Returns the HMAC encoded Signature for the given input.
    */
    public String getHMACSignature(string inputData)
    {
        string AuthenticationKey = null;                         
        orgSettings = getGuidedSellingSettings();
        AuthenticationKey = orgSettings.GuidedSelling__Authentication_Key__c;
        Blob mac = Crypto.generateMac('HmacSHA256', Blob.valueOf(inputData), Blob.valueOf(AuthenticationKey));
        String sig = EncodingUtil.urlEncode(EncodingUtil.base64Encode(mac), 'UTF-8');
        return sig;
    }
    
    /*
        Retrieves settings from the database.
    */
    public GuidedSelling__GuidedSellingSettings__c getGuidedSellingSettings()
    {
        if(orgSettings == null)
        {                
            GuidedSelling__GuidedSellingSettings__c[] settings = [Select Id,GuidedSelling__Authentication_Key__c, GuidedSelling__Organization_Name__c From GuidedSelling__GuidedSellingSettings__c];   
            if(settings.size() > 0)
                orgSettings = settings[0];
        }
        return orgSettings;      
    }
    
   public string getApplicationUrl(string mode)
   {
       string applicationUrl = null;                         
       orgSettings = getGuidedSellingSettings();
       applicationUrl = orgSettings.GuidedSelling__Organization_Name__c;              
       // Set dev url static values. 
       if(mode == 'dev')
       {
           if(applicationUrl.indexOf('https://cpqdev-') == -1) 
           { 
               if(applicationUrl.indexOf('https://') > -1) 
                   applicationUrl = applicationUrl.replace('https://', ''); 
               applicationUrl = 'https://cpqdev-' + applicationUrl; 
           } 
           if(applicationUrl.indexOf('.com') == -1) 
               applicationUrl += '.endeavorcpq.com'; 
       }
       else if(mode == 'test')
       {
           if(applicationUrl.indexOf('https://cpqtest-') == -1) 
           { 
               if(applicationUrl.indexOf('https://') > -1) 
                   applicationUrl = applicationUrl.replace('https://', ''); 
               applicationUrl = 'https://cpqtest-' + applicationUrl; 
           } 
           if(applicationUrl.indexOf('.com') == -1) 
               applicationUrl += '.endeavorcpq.com'; 
       }
       else if(mode == 'stage')
       {
           if(applicationUrl.indexOf('https://cpqstage-') == -1) 
           { 
               if(applicationUrl.indexOf('https://') > -1) 
                   applicationUrl = applicationUrl.replace('https://', ''); 
               applicationUrl = 'https://cpqstage-' + applicationUrl; 
           } 
           if(applicationUrl.indexOf('.com') == -1) 
               applicationUrl += '.endeavorcpq.com'; 
       }
       else
       {               
           if(applicationUrl.indexOf('https://') == -1) 
               applicationUrl = 'https://' + applicationUrl; 
           if(applicationUrl.indexOf('.com') == -1) 
               applicationUrl += '.endeavorcpq.com'; 
       }
       return applicationUrl;
   }
}