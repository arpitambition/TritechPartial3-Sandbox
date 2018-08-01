public class IdeaCommentPictureController extends IdeaController {
	public String userId;
	public String commentCreatorPicture {get;set;}
	
	public String getuserId(){return userId;}
	
	public void setuserId(String value) {
    	userId = value;
    	System.debug('userId : '+userId);
    	if(userId != null) {
    		User ideaCommentCreator = [Select Id, ContactId, UserType, SmallPhotoUrl From User where Id =: userId];
	    	if(ideaCommentCreator.ContactId != null) {
	    		List<Contact> c = [Select Id, PictId__c From Contact Where Id =: ideaCommentCreator.ContactId];
	    		if(c.size() > 0 && c[0].PictId__c != null) commentCreatorPicture = '/servlet/servlet.FileDownload?file=' + c[0].PictId__c;
	    	} else if(ideaCommentCreator.UserType ==  'Standard' && ideaCommentCreator.SmallPhotoUrl != null) {
	    		commentCreatorPicture = ideaCommentCreator.SmallPhotoUrl;
        	}
	    	if(commentCreatorPicture == null) commentCreatorPicture = ideaCommentCreator.SmallPhotoUrl;
	    	System.debug('commentCreatorPicture: '+commentCreatorPicture);
    	}
    }
}