package com.health.util;

import java.security.InvalidAlgorithmParameterException;
import java.security.InvalidKeyException;
import java.security.NoSuchAlgorithmException;
import java.security.spec.AlgorithmParameterSpec;

import javax.crypto.BadPaddingException;
import javax.crypto.Cipher;
import javax.crypto.IllegalBlockSizeException;
import javax.crypto.NoSuchPaddingException;
import javax.crypto.spec.IvParameterSpec;
import javax.crypto.spec.SecretKeySpec;

import org.apache.commons.codec.binary.Base64;

public class AES256Util {

	 public static byte[] ivBytes = { 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 };
	 private static String key = "Super_Developers";
	 
	 /**
	  * ?ùºÎ∞? Î¨∏Ïûê?ó¥?ùÑ Ïß??†ï?êú ?Ç§Î•? ?ù¥?ö©?ïò?ó¨ AES256 ?úºÎ°? ?ïî?ò∏?ôî
	  * @param  String - ?ïî?ò∏?ôî ???ÉÅ Î¨∏Ïûê?ó¥
	  * @param  String - Î¨∏Ïûê?ó¥ ?ïî?ò∏?ôî?óê ?Ç¨?ö©?ê† ?Ç§
	  * @return String - key Î°? ?ïî?ò∏?ôî?êú  Î¨∏Ïûê?ó¥ 
	  * @exception 
	  */
	 public static String strEncode(String str) throws java.io.UnsupportedEncodingException, NoSuchAlgorithmException, NoSuchPaddingException, InvalidKeyException, InvalidAlgorithmParameterException, IllegalBlockSizeException, BadPaddingException {
	  
	  byte[] textBytes = str.getBytes("UTF-8");
	  AlgorithmParameterSpec ivSpec = new IvParameterSpec(ivBytes);
	  SecretKeySpec newKey = new SecretKeySpec(key.getBytes("UTF-8"), "AES");
	  Cipher cipher = null;
	  cipher = Cipher.getInstance("AES/CBC/PKCS5Padding");
	  cipher.init(Cipher.ENCRYPT_MODE, newKey, ivSpec);
	  return Base64.encodeBase64String(cipher.doFinal(textBytes));
	 }

	 
	 
	 /**
	  * ?ïî?ò∏?ôî?êú Î¨∏Ïûê?ó¥?ùÑ Ïß??†ï?êú ?Ç§Î•? ?ù¥?ö©?ïò?ó¨ AES256 ?úºÎ°? Î≥µÌò∏?ôî
	  * @param  String - Î≥µÌò∏?ôî ???ÉÅ Î¨∏Ïûê?ó¥
	  * @param  String - Î¨∏Ïûê?ó¥ Î≥µÌò∏?ôî?óê ?Ç¨?ö©?ê† ?Ç§
	  * @return String - key Î°? Î≥µÌò∏?ôî?êú  Î¨∏Ïûê?ó¥ 
	  * @exception 
	  */ 
	 public static String strDecode(String str) throws java.io.UnsupportedEncodingException, NoSuchAlgorithmException, NoSuchPaddingException, InvalidKeyException, InvalidAlgorithmParameterException, IllegalBlockSizeException, BadPaddingException {
	  
	  byte[] textBytes = Base64.decodeBase64(str);
	  //byte[] textBytes = str.getBytes("UTF-8");
	  AlgorithmParameterSpec ivSpec = new IvParameterSpec(ivBytes);
	  SecretKeySpec newKey = new SecretKeySpec(key.getBytes("UTF-8"), "AES");
	  Cipher cipher = Cipher.getInstance("AES/CBC/PKCS5Padding");
	  cipher.init(Cipher.DECRYPT_MODE, newKey, ivSpec);
	  return new String(cipher.doFinal(textBytes), "UTF-8");
	 }
	 
	}