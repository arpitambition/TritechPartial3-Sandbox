public with sharing class CryptoDecryption {
    
    // Get decrypted timestamp in GMT in format yyyyMMddHHmmss
	public static string getDecryptedTimeGMT( string encryptedString ){
		
		string decryptedString = '';
		
		List<string> lst = encryptedString.split(':');
		
		if(lst.size() > 0){
			decryptedString = lst.get(0);
			
			CryptoDecryption cls = new CryptoDecryption();
			decryptedString = cls.DoDecrypt(decryptedString);
		}
 
		return decryptedString;
	}
	
	// Get decrypted username 
	public static string getDecryptedUsername(string encryptedString ){
		
		string decryptedString = '';
		
		List<string> lst = encryptedString.split(':');
		
		if(lst.size() > 1){
			decryptedString = lst.get(1);
			
			CryptoDecryption cls = new CryptoDecryption();
			decryptedString = cls.DoDecrypt(decryptedString);
		}
		 
		return decryptedString;
	}
	
	 
	// Method to decrypt given string	
	private string DoDecrypt(string str){
		
	  string strValue  = '';
	  
		if(str != null && str != ''){
		    integer iIndex = 1;
		    integer iIncr = 3;
		    
		    for(integer i=1;i<str.length();i++){
		    	
		      if(iIndex == i){
		      	
		        strValue = strValue + str.substring(i,i+1);
		        
		        iIndex = iIndex + iIncr;
			      iIncr = iIncr + 1;
		      }
		      
		    }
	  }	
	  
	  return strValue;
	}	
		
		
}