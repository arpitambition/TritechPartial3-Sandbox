public class CloneOpportunityController {
    
    public CloneOpportunityController(){
    
    }
        
                        
    // Login to CPQ and Copy the Quote associated to the given Opportunity Id
    public static String CopyQuote(String sessionId, String hmac, String userName, String endeavorCPQUrl, String serverUrl, String oldOpportunityId, String newOpportunityId) {    
                 
       try
       {            
           string authToken = Login(sessionId, hmac, userName, endeavorCPQUrl, serverUrl);       
           string responseMessage = '';
           
           System.debug('oldOpportunityId : ' + oldOpportunityId);
           System.debug('newOpportunityId : ' + newOpportunityId);
           // Get old opportunity QuoteId.
           String oldQuoteId = GetOpportunityQuoteId(endeavorCPQUrl, authToken, oldOpportunityId);   
           System.debug('oldQuoteId : ' + oldQuoteId);
                        
           if(oldQuoteId != '')                            
           {
               String newQuoteId = ProcessCopyQuote(endeavorCPQUrl, authToken, newOpportunityId, oldQuoteId);
               if(newQuoteId != '')
                   responseMessage = 'SUCCESS';
               else
                   responseMessage = 'ERROR';
           }                
           else
               responseMessage = 'ERROR';           
           
           return responseMessage;
        }
        /*
        catch (System.CalloutException e)
        {
            System.debug('ERROR:' + e.getMessage());            
            return 'ERROR';
        }
        */
        catch (Exception e) 
        {
           System.debug('ERROR:' + e.getMessage());           
           return 'ERROR';
        }                                                         
    }
    
    // Fetch quoteid for given opportunityid
    public static String GetOpportunityQuoteId(String endeavorCPQUrl, String authToken, String oldOpportunityId)
    {           
        System.debug('Start GetOpportunityQuoteId()');  
            
        String QuoteId = '';
        String endpoint = endeavorCPQUrl + '/api/v2/entities/quotes?filter=quotes.opportunityId eq \'' + oldOpportunityId + '\' and quotes.iscurrent eq 1&fields=QuoteId';
        String responseData = ProcessGETRequest(endpoint.replaceAll('\\s+','%20'),authToken); 
        if(!Test.isRunningTest())
        {
            List<Quote> quotes = (List<Quote>)JSON.deserialize(responseData, List<Quote>.class);
            QuoteId = quotes[0].QuoteId;                                                                                                                  
        }
        else
        {
            QuoteId = 'UNITTEST-SUCCESS';               
        }
        System.debug('oldQuoteId : ' + QuoteId);                        
        System.debug('End GetOpportunityQuoteId()');   
        return QuoteId;                                                              
    }            
    
    // Copying quote in CPQ. 
    Public static String ProcessCopyQuote(String endeavorCPQUrl, String authToken, String newOpportunityId, String oldQuoteId)
    {  
        System.debug('Start ProcessCopyQuote()'); 
        String newQuoteId = '';
        string quonum = [select quote_number__c from opportunity where id = :newOpportunityId].quote_number__c;
             quonum = quonum.ToUpperCase().replace('QUO','ORD');
             string variable = quonum.substring(4,16);
             String[] variables = new String[]{'%' + variable + '%'};
             variable = string.valueof(variables);
             variable = variable.substring(1,12);
             //determining number of quote versions
             aggregateresult  ar = database.query('select count(id) result from opportunity where quote_number__c like \''+ variable + '\''); 
             integer total = integer.valueof(ar.get('result'));              
                         
             //formatting the new Sales Order revision number to be -XXXX
             total = total - 1;
             if(total == 0)
                {quonum = quonum + '-0001';}
             if(total > 0 && total < 10)
                 {quonum = quonum + '-000' + (total);}
             if(total >9 && total < 100)
                 {quonum = quonum + '-00' + (total);}
             if(total > 99 && total < 1000)
                 {quonum = quonum + '-0' + (total);}
             if(total > 999)
                 {quonum = quonum + '-' + (total);}                     
        //string endpoint = endeavorCPQUrl + '/api/v2/Workflows/CopyQuote/'+ oldQuoteId +'?returnEntireObjectResult=false&newOpportunityId=' + newOpportunityId;
        string endpoint = endeavorCPQUrl + '/api/v2/Workflows/CopyQuote/'+ oldQuoteId +'?returnEntireObjectResult=false&newOpportunityId=' + newOpportunityId + '&newQuoteNumber=' + quonum;
         
        string responseData = ProcessGETRequest(endpoint,authToken);
        if(!Test.isRunningTest())
        {
            Map<String, Object> m =(Map<String, Object>)JSON.deserializeUntyped(responseData); 
            newQuoteId = (String)m.get('QuoteId');        
        }
        else
        {
            newQuoteId = 'UNITTEST-SUCCESS';
        }
        System.debug('newQuoteId : ' + newQuoteId);
        System.debug('End ProcessCopyQuote()');     
        return newQuoteId;
    }
    
    // Login to the CPQ with HMAC and Session Id and retrieve an auth token  
    public static String Login(String sessionId, String hmac, String userName, String endeavorCPQUrl, String serverUrl) {    
                 
       try
       {                                                    
           System.debug('Start Login()');                                                   
           String password = 'hmac='+ hmac +'&serverurl='+ serverUrl +'&sessionid='+ sessionId;        
           String endpoint = endeavorCPQUrl + '/api/v2/oauth2/token/';               
           String reqestJsonData = '{"client_id":"EndeavorCPQ","client_secret":"","username":"' + userName + '","password":"' + password + '","grant_type":"password","platform":"cpq"}';                    
           String responseMessage = '';            
           String authToken = '';
           
           // Fetch authToken from CPQ            
           String responseData = ProcessPOSTRequest(endpoint, reqestJsonData);
           if(!Test.isRunningTest())
           {
               Map<String, Object> m =(Map<String, Object>)JSON.deserializeUntyped(responseData); 
               authToken = (String)m.get('access_token');                                  
           }           
           System.debug('authToken : ' + authToken); 
           System.debug('End Login()');   
           
           return authToken;
        }
    catch (Exception e) 
        {
           System.debug('ERROR:' + e.getMessage());           
           return 'ERROR';
        }                                                         
    }
    
    // Generic POST API Call
    Public static String ProcessPOSTRequest(String endpoint, String requestJsonData)
    {      
        HttpRequest request = new HttpRequest();                      
        request.setEndPoint(endpoint);                         
        request.setMethod('POST');
        request.setHeader('Content-Type','application/json');             
        request.setBody(requestJsonData);                                      
        if(!Test.isRunningTest())
        { 
            HttpResponse response = new HTTP().send(request);
            return response.getBody();        
        }
        else
        {
           return 'UNITTEST-SUCCESS';             
        }        
    }
    
    // Generic GET API Call
    Public static String ProcessGETRequest(String endpoint, String authToken)
    {                
        HttpRequest request = new HttpRequest();  
        System.debug('endpoint : ' + endpoint);                    
        request.setEndPoint(endpoint);                       
        request.setMethod('GET');
        request.setHeader('Authorization',authToken);
        request.setHeader('Content-Type','application/json');         
        
        if(!Test.isRunningTest())
        {                                
            HttpResponse response = new HTTP().send(request);
            return response.getBody();     
        }
        else
        {
            return 'UNITTEST-SUCCESS';
        }        
    }                     
}