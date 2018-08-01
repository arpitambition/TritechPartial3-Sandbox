public without sharing class PortalUserUtil {
  //Mohan 8.11.2015 - Inform contract should show the visinet filter
  public static final String INFORM_PRODUCT_FAMILY = 'Inform';
  public static final String RESPOND_PRODUCT_FAMILY = 'Respond';
    
  public static final String IMC_PRODUCT_FAMILY = 'IMC';
  
  public static final String PERFORM_PRODUCT_FAMILY = 'Perform';

  public static final String EMS_PRODUCT_FAMILY = 'EMS';

  public static final String VISINET_PRODUCT_FAMILY = 'VisiNet';

  public static final String VISIONAIR_PRODUCT_FAMILY = 'VisionAIR';
  
  public static final String PRODUCT_FAMILY_911 = '911';
  
  //12-11-2015 - add the Tiburon data category and subcategory filters
  public static final String PRODUCT_FAMILY_Tiburon = 'Tiburon';
  
  public static final String PRODUCT_FAMILY_Zuercher = 'Zuercher';
  public static final String PRODUCT_FAMILY_LETG = 'LETG';
  
  public static final String PRODUCT_FAMILY_ETI = 'ETI';
  public static final String PRODUCT_FAMILY_ETI911 = 'ETI 911';
    
    /*
    * Get the product families based on the account associated with the profile user's contact
    */
    public static ProductFamilies getProductFamilies(String portalUserId) {
        Account acct = null;
        PortalUserUtil.ProductFamilies prodFamilies = new ProductFamilies();
        
    system.debug('getProductFamilies: portalUserId [' + portalUserId + ']');

      User portalUser = [SELECT ContactId FROM User WHERE Id = :portalUserId];
      system.debug('getProductFamilies: portalUser contact [' + portalUser.ContactId + ']');
      

      if (portalUser.ContactId != null) {
        //Contact cnct = [SELECT AccountID FROM Contact WHERE Id = :portalUser.ContactId];
        Contact cnct = [SELECT Product_Family2__c FROM Contact WHERE Id = :portalUser.ContactId];
        
        if ((cnct != null) && (cnct.Product_Family2__c != null)) {
          system.debug('getProductFamilies: Contact Product_Family2__c [' + cnct.Product_Family2__c + ']');
          prodFamilies.productFamilyIMC = cnct.Product_Family2__c.contains(IMC_PRODUCT_FAMILY);
          prodFamilies.productFamilyEMS = cnct.Product_Family2__c.contains(EMS_PRODUCT_FAMILY);
          prodFamilies.productFamilyVisiNet = cnct.Product_Family2__c.contains(VISINET_PRODUCT_FAMILY);
          prodFamilies.productFamilyVisionAIR = cnct.Product_Family2__c.contains(VISIONAIR_PRODUCT_FAMILY);
          prodFamilies.productFamily911 = cnct.Product_Family2__c.contains(PRODUCT_FAMILY_911);
          prodFamilies.productFamilyTiburon = cnct.Product_Family2__c.contains(PRODUCT_FAMILY_Tiburon);
          prodFamilies.productFamilyZuercher = cnct.Product_Family2__c.contains(PRODUCT_FAMILY_Zuercher);
          prodFamilies.productFamilyLETG = cnct.Product_Family2__c.contains(PRODUCT_FAMILY_LETG);
          //prodFamilies.productFamily911 = cnct.Product_Family2__c.contains(PRODUCT_FAMILY_ETI);
          //prodFamilies.productFamily911 = cnct.Product_Family2__c.contains(PRODUCT_FAMILY_ETI911);
        }

        /*
        if (cnct.AccountId != null) {
            
            //Get the Account this contact is associated with as that has the definitive product family value
            List<Account> accounts = [SELECT Product_Family_WMP__c FROM Account WHERE Id = :cnct.AccountID];
            if (accounts.size() > 0) {
                acct = accounts.get(0);
            }
            
            if ((acct != null) && (acct.Product_Family_WMP__c != null)) {
                system.debug('getProductFamilies: Account Product_Family_WMP__c [' + acct.Product_Family_WMP__c + ']');
              prodFamilies.productFamilyIMC = acct.Product_Family_WMP__c.contains(IMC_PRODUCT_FAMILY);
              prodFamilies.productFamilyEMS = acct.Product_Family_WMP__c.contains(EMS_PRODUCT_FAMILY);
              prodFamilies.productFamilyVisiNet = acct.Product_Family_WMP__c.contains(VISINET_PRODUCT_FAMILY);
              prodFamilies.productFamilyVisionAIR = acct.Product_Family_WMP__c.contains(VISIONAIR_PRODUCT_FAMILY);
            }
          }
          */
      }
        
        return prodFamilies;
    }
  
 /*
  * Get the product families based on the active contracts associated with the profile user's contact/account
  */
  public static ProductFamilies getProductFamiliesByContract(String portalUserId) {
    Account acct = null;
    PortalUserUtil.ProductFamilies prodFamilies = new ProductFamilies();
    
    system.debug('getProductFamiliesByContract: portalUserId [' + portalUserId + ']');

      User portalUser = [SELECT ContactId FROM User WHERE Id = :portalUserId];
      system.debug('getProductFamiliesByContract: portalUser contact [' + portalUser.ContactId + ']');
      
      if (portalUser.ContactId != null) {
        //Contact cnct = [SELECT AccountID FROM Contact WHERE Id = :portalUser.ContactId];
        Contact cnct = [SELECT AccountId FROM Contact WHERE Id = :portalUser.ContactId];
        
        if (cnct.AccountId != null) {
          
          //Get the Account this contact is associated with as that has the definitive product family value
          List<Account> accounts = [SELECT Id FROM Account WHERE Id = :cnct.AccountID];
          if (accounts.size() > 0) {
            acct = accounts.get(0);
          }
          
          if (acct != null) {
            system.debug('getProductFamiliesByContract: Account Id [' + acct.Id + ']');
            
            //set the "active" contract types to everything but inactive or suspended
            Set<String> activeContractValues = new Set<String>();
            activeContractValues.add('Active');
            activeContractValues.add('Installed Not Live');     //Mohan 10-04-2014: Installed Not Live is considered as Active status
            activeContractValues.add('Renewal Due');
            activeContractValues.add('No HW Support, Software Only');
            //activeContractValues.add('Emergency Support Only');
            //activeContractValues.add('Installed Not Live');
            //activeContractValues.add('Sold but Not Installed');
            //activeContractValues.add('Vendor/Partner');
            
            //get the active contracts for this account
            List<ServiceContract> activeContracts = [SELECT Id, Contract_Type__c, Product_Family_WMP__c, Derived_Prd_Family_from_Contract_Type__c FROM ServiceContract WHERE AccountId = :acct.Id AND Contract_Status_WMP__c IN :activeContractValues];
            
            //set the available product families based on the values on the contract
            List<String> activeContractTypes = new List<String>();
            for (ServiceContract contract : activeContracts) {
                activeContractTypes.add(contract.Contract_Type__c);
                 
              if (IMC_PRODUCT_FAMILY == contract.Product_Family_WMP__c || PERFORM_PRODUCT_FAMILY == contract.Product_Family_WMP__c) {
                prodFamilies.productFamilyIMC = true;
              } else if (EMS_PRODUCT_FAMILY == contract.Product_Family_WMP__c || RESPOND_PRODUCT_FAMILY == contract.Product_Family_WMP__c) {
                prodFamilies.productFamilyEMS = true;
              } else if (VISINET_PRODUCT_FAMILY == contract.Product_Family_WMP__c || INFORM_PRODUCT_FAMILY == contract.Product_Family_WMP__c) {
                prodFamilies.productFamilyVisiNet = true;
              } else if (VISIONAIR_PRODUCT_FAMILY == contract.Product_Family_WMP__c) {
                prodFamilies.productFamilyVisionAIR = true;
              } else if(PRODUCT_FAMILY_911 == contract.Product_Family_WMP__c) {
                prodFamilies.productFamily911 = true;
              } else if(PRODUCT_FAMILY_Tiburon == contract.Product_Family_WMP__c) {
                prodFamilies.productFamilyTiburon = true;
              } else if(PRODUCT_FAMILY_Zuercher == contract.Product_Family_WMP__c) {
                prodFamilies.productFamilyZuercher = true;
              } else if(PRODUCT_FAMILY_LETG == contract.Product_Family_WMP__c) {
                prodFamilies.productFamilyLETG = true;
              } else if(PRODUCT_FAMILY_ETI == contract.Product_Family_WMP__c) {
                prodFamilies.productFamilyETI = true;
              } else if(PRODUCT_FAMILY_ETI911 == contract.Product_Family_WMP__c) {
                prodFamilies.productFamilyETI911 = true;
              }
            }
            
            prodFamilies.activeContractTypes = activeContractTypes;
            
             
          }
        }
        
      }
    
    return prodFamilies;
  }

  public class ProductFamilies {
    public boolean productFamilyIMC {get;set;}
    public boolean productFamilyEMS {get;set;}
    public boolean productFamilyVisiNet {get;set;}
    public boolean productFamilyVisionAIR {get;set;}
    public boolean productFamily911 {get;set;}
    public boolean productFamilyTiburon {get;set;}
    public boolean productFamilyZuercher {get;set;}
    public boolean productFamilyLETG {get;set;}
    public boolean productFamilyETI {get;set;}
    public boolean productFamilyETI911 {get;set;}
    public List<String> activeContractTypes {get;set;}
    
    public ProductFamilies() {
        
    }
  }
  
  static testmethod void testProductFamiliesByContract() {
    User usr = [SELECT Id FROM User WHERE IsActive = true AND ContactId != NULL LIMIT 1];
    PortalUserUtil.getProductFamiliesByContract(usr.Id);
    
  }
  
  static testmethod void testProductFamiliesByContract2() {
    User usr = [SELECT Id FROM User WHERE IsActive = true AND ContactId != NULL LIMIT 1];
    PortalUserUtil.getProductFamilies(usr.Id);
    
  }
}