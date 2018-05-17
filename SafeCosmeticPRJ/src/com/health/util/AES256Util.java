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
	  * ?���? 문자?��?�� �??��?�� ?���? ?��?��?��?�� AES256 ?���? ?��?��?��
	  * @param  String - ?��?��?�� ???�� 문자?��
	  * @param  String - 문자?�� ?��?��?��?�� ?��?��?�� ?��
	  * @return String - key �? ?��?��?��?��  문자?�� 
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
	  * ?��?��?��?�� 문자?��?�� �??��?�� ?���? ?��?��?��?�� AES256 ?���? 복호?��
	  * @param  String - 복호?�� ???�� 문자?��
	  * @param  String - 문자?�� 복호?��?�� ?��?��?�� ?��
	  * @return String - key �? 복호?��?��  문자?�� 
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