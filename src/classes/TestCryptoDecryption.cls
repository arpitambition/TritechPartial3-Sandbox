@istest
private class TestCryptoDecryption {
	
	public static testmethod void Dotest(){
		try{
			
			CryptoDecryption.getDecryptedTimeGMT('20120101050505');
		}
		catch(Exception ex){
			system.debug(ex.getMessage());
		}
	}
	
	public static testmethod void Dotest2(){
		try{
			
			CryptoDecryption.getDecryptedUsername('user@test.com');
		}
		catch(Exception ex){
			system.debug(ex.getMessage());
		}
	}
}