//author: Mohan (Navivo)
//created date: 20-09-2013
//System.schedule('PortalPicture', '0 30 * * * ?', new PortalPictureUploadSchedule());
global class PortalPictureUploadSchedule implements Schedulable {
	
	global void execute(SchedulableContext SC) {
		try {
			String folderId;
			List<Folder> folders = [Select f.Name, f.Id, f.DeveloperName From Folder f Where DeveloperName = 'TriTech_Protal_User_Photos'];
			if(folders.size() > 0) {
				folderId = folders[0].Id;
			}
			List<Document> docList = [Select Id From Document Where Name like 'Temp-%'];
			
			delete docList;
		} catch(Exception ex) {
			System.debug('Job Error: '+ex.getMessage());
		}
	}
}