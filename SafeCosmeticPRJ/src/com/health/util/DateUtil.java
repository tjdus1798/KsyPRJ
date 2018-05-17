package com.health.util;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;

/**
 * ? μ§? κ΄?? ¨ ?¨? λͺ¨μ
 */
public class DateUtil {

	//? μ§? ?? ???Όλ‘? ?°?΄?° κ°?? Έ?€κΈ?
	public static String getDate(String str) {
		SimpleDateFormat formatter = new SimpleDateFormat(str, Locale.KOREA);
		Date currentTime = new Date();
		String res = formatter.format(currentTime);

		return res;
	}
	
	//?€? ? κ°?? Έ?€κΈ?
	public static String getTodayYYYY() {
		return getDate("yyyy");
		
	}
	
	//?€? ? κ°?? Έ?€κΈ?
	public static String getTodayMM() {
		return getDate("MM");
		
	}
	
	//?€? ?  κ°?? Έ?€κΈ?
	public static String getTodayDD() {
		return getDate("dd");
		
	}
}