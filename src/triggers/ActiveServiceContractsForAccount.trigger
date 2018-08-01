trigger ActiveServiceContractsForAccount on ServiceContract (after insert, after update, after delete) 
{
 
    //Grab all account Ids associated with the service contracts
    set<ID> setAccountId = new set<ID>();
    if (trigger.isDelete) 
    {
        for(ServiceContract sc : trigger.old)
        {
             setAccountId.add(sc.AccountId);
        }
    }
    else
    {
        for(ServiceContract sc : trigger.new)
        {
             setAccountId.add(sc.AccountId);
        }
    }
    
    
    List<Account> listAccount = new List<Account>();
    
    // fetch all related accounts with associated active service contracts 
    for(Account a : [Select a.Id, a.Contract_Types__c, (Select Id, AccountId,EndDate, Contract_Type__c,Product_Group__c,Contract_Amount__c,Product_Family_WMP__c From ServiceContracts 
    Where (Contract_Status_WMP__c = 'Active' 
    OR Contract_Status_WMP__c = 'Installed Not Live' 
    OR Contract_Status_WMP__c = 'Renewal Due' 
    OR Contract_Status_WMP__c ='Vendor/Partner'
    OR Contract_Status_WMP__c = 'No HW Support, Software Only') 
    AND Contract_Type__c != null ) 
    From Account a Where Id  IN : setAccountId])
    {
        
        string contractTypes = '';
        string productFamilies = '';
        string productGroups = '';
        decimal contractamount = 0;
        date contend = System.Today().adddays(700) ;
        
        // create set of unique contract types (SET creates unique records)
        SET<string> setContractType = new SET<string>();
        for(ServiceContract sc: a.ServiceContracts ){
            setContractType.add(sc.Contract_Type__c);
        }
        
        SET<string> setProductFam = new SET<string>();
    for(ServiceContract sc: a.ServiceContracts )
    {
            setProductFam.add(sc.Product_Family_WMP__c);
    }
    SET<string> setProductGro = new SET<string>();
    for(ServiceContract sc: a.ServiceContracts )
    {
            setProductGro.add(sc.Product_Group__c);
    }    
    SET<decimal> setContractAMT = new SET<decimal>();
    for(ServiceContract sc: a.ServiceContracts )
    {
            setContractAMT.add(sc.Contract_Amount__c);
    } 
    SET<date> setContractEnd = new SET<date>();
    for(ServiceContract sc: a.ServiceContracts )
    {
            setContractEnd.add(sc.EndDate);
    }  
    // prepare comma separated string
    for(string str: setContractType)
    {
        if(contractTypes != '')
        {
            contractTypes = contractTypes + ', '; 
            }
        contractTypes = contractTypes + str;
        }
    for(string str1: setProductFam)
    {
        if(productFamilies != '')
        {
            productFamilies = productFamilies + ', '; 
            }
        productFamilies = productFamilies + str1;
        }   
    for(string str2: setProductGro)
    {
        if(productGroups != '')
        {
            productGroups = productGroups + ', '; 
            }
        productGroups = productGroups + str2;
        } 
      for(decimal int1: setContractAMT)
    {
        if(int1 != null)
        {
            contractamount = contractamount + int1;
         }
         contractamount = contractamount;
        }  
       for(date end1: setContractEnd)
    {
        If(end1 < contend)
        {
            contend = end1;
          }  
        }   
    a.Contract_Types__c = contractTypes;
    a.Active_Client_Product_Families__c = productFamilies;  
    a.Active_Contract_Product_Groups__c = productGroups;
    a.Z_Total_Maintenance_Amount__c = contractamount;
    a.z_Next_Renewal_Date__c = contend;
        
        listAccount.add(a);
    }
    
    // update account
    if(listAccount.size() > 0){
        update listAccount;
    }
     
}