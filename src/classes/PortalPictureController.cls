//author: Mohan (Navivo)
//created date: 19-09-2013
public without sharing class PortalPictureController {
	public Blob photo {get;set;}
	public String profilePictureLink {get;set;}
	public String previewprofilePictureLink {get;set;}
	public String browserTitle {get;set;}
	public Boolean photoExist {get;set;}
	public String filePath {get;set;}
	public String fileName {get;set;}
	public Boolean success {get;set;}
	public Boolean preview {get;set;}
	public Boolean closeWindow {get;set;}
	public Boolean doSelect {get;set;}
	public Boolean doCorp {get;set;}
	
	private String documentFolderId;
	private Contact cont = new Contact();
	private Document tempFile = new Document();
	private String tempDocumentId;
	
	public PortalPictureController() {
		
		try {
			preview = false;
			success = false;
			doCorp = false;
			closeWindow = false;
			String onlyImage = Apexpages.currentPage().getParameters().get('sidebar');
			if(onlyImage != null) {
				previewprofilePictureLink = '/servlet/servlet.FileDownload?file=' + onlyImage;
				preview = true;
				return;
			}
			photoExist = false;
			browserTitle = 'Browse to select your photo';
			User curUser = [Select Id, Name, ContactId From User where Id =: Userinfo.getUserId()];
			List<Folder> folders = [Select f.Name, f.Id, f.DeveloperName From Folder f Where DeveloperName = 'TriTech_Protal_User_Photos'];
			if(folders.size() == 0) {
				ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.ERROR, 'Please contact your administrator'));
				return;
			}
			doSelect = true;
			documentFolderId = folders[0].Id;
			if(curUser.ContactId != null || test.isRunningTest()) {
	    		List<Contact> c = [Select Id, Name, PictId__c From Contact Where Id =: curUser.ContactId];
	    		if(c.size() > 0) {
	    			cont = c[0];
	    			if(c[0].PictId__c != null) {
		    			profilePictureLink = '/servlet/servlet.FileDownload?file=' + c[0].PictId__c;
		    			photoExist = true;
		    			browserTitle = 'Browse to update your photo';
	    			} else {
	    				//profilePictureLink = 'https://c.cs1.content.force.com/profilephoto/005/F';
	    				profilePictureLink = '../profilephoto/005/F';
	    			}
	    		}
			}
		} catch(Exception ex) {
			ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.ERROR, ex.getMessage()));
		}
	}
	
	public void previewPhotoSelected() {
		if(photo == null) {
			ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.ERROR, 'Please select your photo'));
			return;
		}
		System.debug('size:'+photo.size());
		Integer fileSize = photo.size();
		Integer validFileSize = (1024*1024)*4;
		if(photo.size() > ((1024*1024)*4)) {
			ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.ERROR, 'Selected file cannot be greater than 4 MB. Please select a different file'));
			photo = null;
			return;
		}
		
		tempFile = new Document();
		tempFile.Name = 'Temp-' + fileName;
		tempFile.FolderId = documentFolderId;
		tempFile.Body = photo;
		insert tempFile;
		tempDocumentId = tempFile.Id;
		profilePictureLink = '/servlet/servlet.FileDownload?file=' + tempDocumentId;
		doSelect = false;
		doCorp = true;
		photo = null;
		tempFile = null;
	}
	
	public void uploadPhoto() {
		try {
			//System.debug('size:'+photo.ContentSize);
			Document newImage = [Select Id, Name From Document Where Id =: tempDocumentId];
			newImage.Name = fileName;
			update newImage;
			
			if(cont.PictId__c != null) {
				delete [Select Id From Document Where Id =: cont.PictId__c];
			}
			cont.PictId__c = newImage.Id;
			update cont;
			
			success = true;
			ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.CONFIRM, 'Your photo has been saved successfully.'));
			
		} catch(Exception ex) {
			ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.ERROR, ex.getMessage()));
		}
	}
	
	public void deletePhoto() {
		try {
			if(cont.PictId__c != null) {
				Document delImage = [Select Id, Name From Document Where Id =: cont.PictId__c];
				delete delImage;
				cont.PictId__c = null;
				update cont;
				
				//success = true;
				photoExist = false;
				profilePictureLink = '../profilephoto/005/F';
				/*
				deleteTempDocument();
				success = true;
				closeWindow = true;*/
				//ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.CONFIRM, 'Your photo has been removed successfully and it will take some time to update on your profile.'));
			}
			//if(photo != null && photo.Id != null) delete photo;
		} catch(Exception ex) {
			ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.ERROR, ex.getMessage()));
		}
	}
	
	public void deleteTempDocument() {
		try {
			if(tempDocumentId != null) {
				Document tempImage = [Select Id, Name From Document Where Id =: tempDocumentId];
				delete tempImage;
				closeWindow = true;
			}
		} catch(Exception ex) {
			ApexPages.addMessage(new ApexPages.Message(ApexPages.Severity.ERROR, ex.getMessage()));
		}
	}
}