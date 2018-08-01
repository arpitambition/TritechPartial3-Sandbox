public class IdeaUserLinkController extends IdeaController {

    public String userId { get; set; }
    private String communityNickname;
    private String AccountName;
    private static List<GroupMember> experts;
	 
    public String getConCommunityNickname() { 
    	
        if (communityNickname == null || communityNickname == '') {
        	for(User u : [select Name, communityNickname  from user where id=:userId]){
            	communityNickname = u.Name;
            	 
        	}
        }
        return communityNickname;
    }
    
    public String getConAccountName() {
    	if (AccountName == null || AccountName == '') {
        	
        }
        return AccountName;
    }
	
	public void setConAccountName(String newContName) {
        AccountName = newContName;
    }
    
    public void setConCommunityNickname(String newName) {
        communityNickname = newName;
    }

    public PageReference getUserPage() {
        return getUserPage(userId);
    }

    public String getUserStyleClass() {
        return isUserExpert(userId) ? 'ibtUserLinkExpert' : 'ibtUserLinkNormal';
    }

    public static Boolean isUserExpert(String userId) {
        if (experts == null) {
            loadExperts();
        }
        for (GroupMember expert : experts) {
            if ((IdeaController.toShortId((String)expert.userOrGroupId)).equals(userId)) {
                return true;
            }
        }

        return false;
    }

    public static void loadExperts() {
      
        String expertsGroupId = IdeaController.siteSetup.expertsGroupId__c;
        
        if (expertsGroupId != null) {
            experts = [select userOrGroupId from GroupMember where groupId=:expertsGroupId];
        } else {
            experts = new List<GroupMember>();
        }
    }
}