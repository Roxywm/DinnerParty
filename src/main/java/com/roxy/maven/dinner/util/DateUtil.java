package com.roxy.maven.dinner.util;

import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;


/**
 * 时间处理工具类
 * @author Administrator
 *
 */
public class DateUtil {
	private final  static  String SIMPLE = "yyyy/MM/dd HH:mm:ss";
	private final static String SIMPLE2="yyyyMMddHHMMSS";
	private final static String SIMPLE3="yyyy-MM-dd";
	
	public static String parseDate(long times){
		Date date = new Date(times);
		SimpleDateFormat sdf = new SimpleDateFormat(SIMPLE2);
		return sdf.format(date);
	}

	public static Timestamp parseTimestamp(String date){
		SimpleDateFormat sdf = new SimpleDateFormat(SIMPLE3);
		try {
			Timestamp ts = new Timestamp(sdf.parse(date).getTime());
			return ts;
		} catch (ParseException e) {
			e.printStackTrace();
		}
		return null;
	}
	
	/*
	 *把字符串转成Date类型 
	 */
	public static Date parseDate(String date){
		SimpleDateFormat sdf = new SimpleDateFormat(SIMPLE3);
		try {
			return sdf.parse(date);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		return null;
	}

}
