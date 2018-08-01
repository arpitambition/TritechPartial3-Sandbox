public with sharing class CryptoEncryption {
 
	public static string getEncryptedString(string Username ){
		 
		string encryptedString = '';
		
		CryptoEncryption cls = new CryptoEncryption();
		
		encryptedString = cls.DoEncrypt(system.now().format('yyyyMMddHHmmss', 'GMT')) + ':' +
						   cls.DoEncrypt(Username) ;
		  
		return encryptedString;
	}
	  
	// Method to encrypt given string
	private string DoEncrypt(string strValue){
		
	  string str = '';
	  	CryptoEncryption cls = new CryptoEncryption();
	  	
		if(strValue != null && strValue != ''){
		    
		    for(integer i=0;i<strValue.length();i++){
		     
		      for(integer j=0;j<i+1;j++){
		        str  = str + cls.getCode(1) ;
		      }
		      
		      str =  str + strValue.substring(i,i+1);
		      
		    }
		}	
 
		return str;
	}
	
	
	//generates a random, alphanumeric code of length = codeLength 
	private String getCode(Integer codeLength) {
		integer index;
		String strCode = '';
		
		String strSource = '0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ';	
	
		for (integer i = 0; i < codeLength; i++) {
			
			index = Integer.valueOf(String.valueOf(math.roundToLong(math.random()* 61)));
			
			strCode = strCode + strSource.substring(index, index + 1);
		}
		
		return strCode;
	}
	 
		
}