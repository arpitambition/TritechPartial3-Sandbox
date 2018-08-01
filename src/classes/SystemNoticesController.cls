public with sharing class SystemNoticesController {
  
  public List<Portal_Notices__c> getNotices() {
    
    List<Portal_Notices__c> allNotices = null;
    Set<Portal_Notices__c> noticesSet = null;
    List<Portal_Notices__c> productFamilyNotices = null;


    PortalUserUtil.ProductFamilies prodFamilies = PortalUserUtil.getProductFamiliesByContract(UserInfo.getUserId());
    
    //get all notices based on start/end date
    allNotices = [SELECT p.Id, p.Title__c, p.Start_Date__c, p.End_Date__c, p.Body__c, p.Product_Family__c From Portal_Notices__c p WHERE p.Start_Date__c <= TODAY AND p.End_Date__c >= TODAY];
    
    //filter notices based on the user's product family and put in a set to avoid showing duplicates
    noticesSet = new Set<Portal_Notices__c>();
    for (Portal_Notices__c notice : allNotices) {
      if (noticeMatchesProductFamily(notice, prodFamilies)) {
        noticesSet.add(notice);
      }
    }
    
    productFamilyNotices = new List<Portal_Notices__c>();
    productFamilyNotices.addAll(noticesSet);
    
    return productFamilyNotices;    
  }
  
  private boolean noticeMatchesProductFamily(Portal_Notices__c notice, PortalUserUtil.ProductFamilies prodFamilies) {
    boolean imcNotice = false;
    boolean emsNotice = false;
    boolean visiNetNotice = false;
    boolean visionAIRNotice = false;
    
    if (prodFamilies.productFamilyIMC == true) {
      imcNotice = notice.Product_Family__c.contains(PortalUserUtil.IMC_PRODUCT_FAMILY);
    }
    if (prodFamilies.productFamilyEMS == true) {
      emsNotice = notice.Product_Family__c.contains(PortalUserUtil.EMS_PRODUCT_FAMILY);
    }
    if (prodFamilies.productFamilyVisiNet == true) {
      visiNetNotice = notice.Product_Family__c.contains(PortalUserUtil.VISINET_PRODUCT_FAMILY);
    }
    if (prodFamilies.productFamilyVisionAIR == true) {
      visionAIRNotice = notice.Product_Family__c.contains(PortalUserUtil.VISIONAIR_PRODUCT_FAMILY);
    }
    
    //return true if any of the notice types are true
    return (imcNotice || emsNotice || visiNetNotice || visionAIRNotice);
  }
  
  static testmethod void testSearch() {

    SystemNoticesController controller = new SystemNoticesController();

    test.startTest();
    //Test the system notices functionality
    
    Portal_Notices__c notice = new Portal_Notices__c();
    notice.Product_Family__c = PortalUserUtil.VISIONAIR_PRODUCT_FAMILY;
    notice.Start_Date__c = System.today().addDays(-3);
    notice.End_Date__c = System.today().addDays(5);
    
    controller.getNotices();
    
    test.stopTest();
  }
  
}