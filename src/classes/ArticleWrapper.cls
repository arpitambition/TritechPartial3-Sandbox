public class ArticleWrapper implements Comparable {
    public String articleId {get;set;}
  	public String articleKnowledgeId {get;set;}
  	public String articleTitle {get;set;}
  	public String articleSummary {get;set;}
  	public String articleType {get;set;}
  	public String articleURL {get;set;}
  	public DateTime articlePublishDate {get;set;}
    // (8/27/2014) - Madan - storing Article Data categories
	public String categoryGroups {get;set;}
	public String createdById {get;set;}
	public DateTime articleLastModifiedDate {get;set;}
	public Integer matchedKeyCount {get;set;}
	public Integer viewedCount {get;set;}
	//-------------------------------------------
    public ArticleWrapper() {
		
    }
    
    public Integer compareTo(Object compareTo) {
    	ArticleWrapper compareToObj = (ArticleWrapper)compareTo;
        /*if (id == compareToObj.id) return 0;
        if (id > compareToObj.id) return 1;
        return -1;        */
        if(matchedKeyCount == compareToObj.matchedKeyCount){
            if(viewedCount == compareToObj.viewedCount){
                if(articleLastModifiedDate == compareToObj.articleLastModifiedDate){
                    return 0;
                } else if(articleLastModifiedDate > compareToObj.articleLastModifiedDate){
                    return -1;
                } else {
                    return 1;
                }
            } else if(viewedCount > compareToObj.viewedCount){
                return 1;
            } else {
                return -1;
            } 
        } else if(matchedKeyCount > compareToObj.matchedKeyCount){
            return -1;
        } else {
            return 1;
        }
    }
}