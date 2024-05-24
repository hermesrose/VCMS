package jp.co.vcms.common;


import java.security.MessageDigest;

import org.apache.commons.codec.binary.Base64;




public class VCMSUtility {
  
	/*
	public static String alg = "AES/CBC/PKCS5Padding";
	private final String key = "CatAndDogAndTigerAndRose"; //32byte   ?��?��: 16 24 32byte
	private final String iv = key.substring(0, 16);// 16byte
    */
	/*
	//AES256 ?��?��?��
	public String encrypt(String text) throws Exception {

		Cipher cipher = Cipher.getInstance(alg);
		SecretKeySpec keySpec = new SecretKeySpec(key.getBytes(), "AES");
		IvParameterSpec ivParameterSpec = new IvParameterSpec(iv.getBytes());
		cipher.init(Cipher.ENCRYPT_MODE, keySpec, ivParameterSpec);

		byte[] encrypted = cipher.doFinal(text.getBytes("UTF-8"));

		return Base64.getEncoder().encodeToString(encrypted);
	}
     
	//AES256 복호?��
	public String decrypt(String cipherText) throws Exception {

		Cipher cipher = Cipher.getInstance(alg);
		SecretKeySpec keySpec = new SecretKeySpec(key.getBytes(), "AES");
		IvParameterSpec ivParameterSpec = new IvParameterSpec(iv.getBytes());
		cipher.init(Cipher.DECRYPT_MODE, keySpec, ivParameterSpec);

		byte[] decodeBytes = Base64.getDecoder().decode(cipherText);
		byte[] decrypted = cipher.doFinal(decodeBytes);

		return new String(decrypted, "UTF-8");
	}
    */
	
	//SHA-512 ?��?��?��--?���?
	/*
	public static String SecurityHashingAlgorithm512(String planText) {
		String encodingText =" ";
   try {
	    MessageDigest md = MessageDigest.getInstance("SHA-512"); 
	    md.update( planText.getBytes(StandardCharsets.UTF_8) ); 
	    encodingText =DatatypeConverter.printBase64Binary(md.digest());
   }catch(NoSuchAlgorithmException e) {	       
           throw new RuntimeException(e);	   
	    }	     
	    return encodingText;		
	}		
	*/
	
	//SHA-512 TEST
	
public static String SecurityHashingAlgorithm512(String planText) throws Exception {
    
	String encodingText = "";
	String password = planText;
	String key = "0131";
	

	byte[] hashValue = null; // 

	MessageDigest md = MessageDigest.getInstance("SHA-512");

	md.reset();
	md.update(key.getBytes());

	hashValue = md.digest(password.getBytes());
	//encodingText =DatatypeConverter.printBase64Binary(hashValue);
	//encodingText =new String(Base64.getEncoder().encode(hashValue));
	encodingText = new String(Base64.encodeBase64(hashValue));
	return encodingText;
}

	
	
  
	
	
	
	
	
	
	
}
