@istest
private class TestCryptoEncryption {
	
	public static testmethod void getEncryptedString(){
		try{
			
			CryptoDecryption.getDecryptedTimeGMT('20120101050505');
		}
		catch(Exception ex){
			system.debug(ex.getMessage());
		}
	}
	
	public static testmethod void DoEncrypt(){
		try{
			
			CryptoDecryption.getDecryptedUsername('user@test.com');
		}
		catch(Exception ex){
			system.debug(ex.getMessage());
		}
	}
}