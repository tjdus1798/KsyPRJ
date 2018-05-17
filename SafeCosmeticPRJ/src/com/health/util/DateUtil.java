package com.health.util;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;

/**
 * ?‚ ì§? ê´?? ¨ ?•¨?ˆ˜ ëª¨ìŒ
 */
public class DateUtil {

	//?‚ ì§? ?‘œ?‹œ ?˜•?‹?œ¼ë¡? ?°?´?„° ê°?? ¸?˜¤ê¸?
	public static String getDate(String str) {
		SimpleDateFormat formatter = new SimpleDateFormat(str, Locale.KOREA);
		Date currentTime = new Date();
		String res = formatter.format(currentTime);

		return res;
	}
	
	//?˜¤?Š˜ ?…„ ê°?? ¸?˜¤ê¸?
	public static String getTodayYYYY() {
		return getDate("yyyy");
		
	}
	
	//?˜¤?Š˜ ?›” ê°?? ¸?˜¤ê¸?
	public static String getTodayMM() {
		return getDate("MM");
		
	}
	
	//?˜¤?Š˜ ?‚  ê°?? ¸?˜¤ê¸?
	public static String getTodayDD() {
		return getDate("dd");
		
	}
}