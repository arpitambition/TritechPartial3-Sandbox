public class CreateAssetsFromOppProduct {
    public string oppId {get; set;}
    
    public CreateAssetsFromOppProduct(ApexPages.StandardController sc) {
        oppId = sc.getId();
    }
    
    public PageReference doCreateAssests(){
        Opportunity currentOpp = null;
        for(Opportunity o : [Select Id, AccountId,  CloseDate, IsClosed,Sales_Order_Number__c,Purchase_Order_Date__c,Booked_Date__c  From Opportunity WHERE Id = :oppId ]){
            currentOpp = o;
        }
        
        if(currentOpp != null){
        
            if(currentOpp.IsClosed ){
                 OpportunityLineItem[] oppLines = [Select UnitPrice, Quantity, PricebookEntry.Product2Id, PricebookEntry.Product2.Name, Description, Converted_to_Asset__c,Maintenance_Amount__c,Support_Level__c,ListPrice,Extended_Price__c,Type__c  
                                      From OpportunityLineItem 
                                      where OpportunityId = :currentOpp.Id  and Converted_to_Asset__c = false  
                                      and
                    ((  
                        (
                            PricebookEntry.Product2.ProductCode Like '%SW%' 
                                                or PricebookEntry.Product2.ProductCode like '%Software%' 
                                            )
                                         and 
                        (
                            NOT PricebookEntry.Product2.Template_Product_Category__c like '%Maintenance%'
                        )
                                        )
                                         
                                     OR
                                            (
                            (PricebookEntry.Product2.ProductCode like '%GuidedSelling%') 
                                AND (
                                    (Type__c like 'Integrated Solution') 
                                    or (Type__c like 'Recurring Fee')
                                                        or (Type__c like 'Software Modification') 
                                    or (Type__c like 'third Party Software') 
                                    or (Type__c like 'Software')
                                    )
                        )
                    )]; 
                                                         
                                      
                Asset[] assets = new Asset[]{};
                Asset singleAsset = new Asset();
                //loop through the opportunity line items to create an asset associated with each opportunity line item
                for(OpportunityLineItem singleoppLine: oppLines)
                {
                    singleAsset = new Asset();
                    singleAsset.AccountId = currentOpp.AccountId;
                    singleAsset.Product_WMP__c = singleoppLine.PricebookEntry.Product2Id;
                    singleAsset.Quantity_WMP__c = singleoppLine.Quantity;
                    singleAsset.Price =  singleoppLine.UnitPrice;
                    singleAsset.Sales_Order__c =  currentOpp.Sales_Order_Number__c;
                    if(currentOpp.Booked_Date__c.format() != '')
                       { 
                        singleAsset.PurchaseDate = currentOpp.Booked_Date__c;
                       }
                    if(currentOpp.Booked_Date__c.format() == '')
                       { 
                        singleAsset.PurchaseDate = currentOpp.CloseDate;
                       }
                    singleAsset.List_Price_Per_Unit__c = singleoppLine.ListPrice;
                    singleAsset.Extended_Net_Price__c = singleoppLine.Extended_Price__c;
                    singleAsset.Status = 'Purchased';
                    singleAsset.Description = singleoppLine.Description;
                    singleAsset.Support_Price__c = singleoppLine.Maintenance_Amount__c;
                    singleAsset.Asset_Description__c = singleoppLine.Description;
                    if(singleoppLine.PricebookEntry.Product2.Name == 'CPQ Custom Product')
                    {
                        singleAsset.Name = singleoppLine.Description;
                    }
                    else
                    {
                        singleAsset.Name = singleoppLine.PricebookEntry.Product2.Name;
                    }
                    //if(singleoppLine.Maintenance_Amount__c > 0.00)
                    //{
                      // singleAsset.Under_Maintenance__c = true; 
                    //}
              
                    Assets.add(singleAsset);
                    singleoppLine.Converted_to_Asset__c = true;
                }
                try 
                {
                    Database.update(oppLines); 
                    Database.insert(assets);
                }
                catch (DMLException exp){
                    ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.ERROR, 'OpportunityId:' + currentOpp.Id + 'AccountID:' + currentOpp.AccountId + 'CloseDate:' + currentOpp.Closedate+' Exception:' + exp.getMessage()));
                }
                //On success return a message to the calling program
                ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.INFO,   'Asset(s) created.'));
            }else{
                ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.ERROR, 'This Operation is only allowed on Closed Won Opportunities'));
            }
        }else{
            ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.ERROR, 'Can\'t find opportunity product'));
        }
        return null;
    }
     
}