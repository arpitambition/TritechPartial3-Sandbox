public with sharing class AvailableDownloadsController {

  public PortalUserUtil.ProductFamilies prodFamilies {get; set;}
 	
  public List<AvailableDownload> getAvailableDownloads() {
  	
    List<Software_Download__c> softwareDownloads = null;
    
    List<AvailableDownload> availableDownloads = null;

    //get the product families based on the user's active contracts
    prodFamilies = PortalUserUtil.getProductFamiliesByContract(UserInfo.getUserId());
	
	string contractInitial = 'null';
	
	if (prodFamilies.productFamilyEMS == true) {
		contractInitial = 'EMS%';
	}
	else if (prodFamilies.productFamilyVisiNet == true) {
		contractInitial = 'VisiNet%';
	}
	
	
	SET<Id> setContentWorkspaceId = new SET<ID>();
	
	for(ContentWorkspace cw : [Select c.Name, c.Id From ContentWorkspace c Where Name LIKE :contractInitial ]){ setContentWorkspaceId.add(cw.Id); }
	
	
	SET<Id> setContentId = new SET<ID>();
	
	for(ContentWorkspaceDoc cwd: [Select c.ContentDocumentId From ContentWorkspaceDoc c Where ContentWorkspaceId IN:setContentWorkspaceId ]){ setContentId.add(cwd.ContentDocumentId);}
	
	
	availableDownloads = new List<AvailableDownload>();
	
	for(ContentDocument cd :  [Select c.Title, c.PublishStatus, c.LatestPublishedVersion.Description, c.LatestPublishedVersion.Title, c.LatestPublishedVersionId, c.Id 
								From ContentDocument c Where c.PublishStatus = 'P' AND Id IN: setContentId Order By Title ]){
		
		AvailableDownload availableDownload = new AvailableDownload();
  	
  		availableDownload.Id = cd.Id; availableDownload.LatestPublishedVersionId = cd.LatestPublishedVersionId; availableDownload.title = cd.LatestPublishedVersion.Title; availableDownload.description = cd.LatestPublishedVersion.Description; availableDownloads.add(availableDownload);
      
	}
  
    return availableDownloads;
  }

  public class AvailableDownload {

      public string Id {get;set;}
      public String title {get;set;}
      public String description {get;set;}
 
      public string LatestPublishedVersionId {get;set;}
      
    }

}