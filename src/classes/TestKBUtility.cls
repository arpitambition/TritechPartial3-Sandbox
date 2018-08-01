@isTest
private class TestKBUtility {

    @isTest
    public static void DoTest(){
        
        string str = KBUtility.saveSearchTracking('String keyword', true, 'String emsFilter', 'String imcFilter', 'String visiNetFilter', 'String visionAIRFilter', true, true, true, true, true, true, true, true, true);
        str = KBUtility.saveSearchTracking('String keyword', true, 'String emsFilter', 'String imcFilter', 'String visiNetFilter', 'String visionAIRFilter', false, true, true, true, true, true, true, true, true);
        str = KBUtility.saveSearchTracking('String keyword', true, 'String emsFilter', 'String imcFilter', 'String visiNetFilter', 'String visionAIRFilter', false, false, true, true, true, true, true, true, true);
        str = KBUtility.saveSearchTracking('String keyword', true, 'String emsFilter', 'String imcFilter', 'String visiNetFilter', 'String visionAIRFilter', false, false, false, true, true, true, true, true, true);
        str = KBUtility.saveSearchTracking('String keyword', true, 'String emsFilter', 'String imcFilter', 'String visiNetFilter', 'String visionAIRFilter', false, false, false, false, true, true, true, true, true);
        str = KBUtility.saveSearchTracking('String keyword', true, 'String emsFilter', 'String imcFilter', 'String visiNetFilter', 'String visionAIRFilter', false, false, false, false, false, true, true, true, true);
        str = KBUtility.saveSearchTracking('String keyword', true, 'String emsFilter', 'String imcFilter', 'String visiNetFilter', 'String visionAIRFilter', false, false, false, false, false, false, true, true, true);
        str = KBUtility.saveSearchTracking('String keyword', true, 'String emsFilter', 'String imcFilter', 'String visiNetFilter', 'String visionAIRFilter', false, false, false, false, false, false, false, true, true);
        
        KBUtility.saveSearchResult(str , new List<ArticleWrapper>());
        
        KBUtility.updateArticleViewed(str , str );
        
        List<ArticleWrapper> lstSearchResult = new List<ArticleWrapper>();
        ArticleWrapper wrapper = new ArticleWrapper();
        wrapper.articleId = 'testId';
        lstSearchResult.add(wrapper);
        
        KBUtility.saveSearchResult('test', lstSearchResult);
        KBUtility.saveSearchResult(str, lstSearchResult);
        
    }
    
}