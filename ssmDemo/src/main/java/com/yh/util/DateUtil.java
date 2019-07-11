package com.yh.util;

import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.Date;

/**
 * 时间工具类:
 * create by yinhan
 * */
public class DateUtil {

    private static final String FORMAT_ONE = "yyyy-MM-dd HH:mm:ss";

    /**
     * 默认返回 yyyy-MM-dd HH:mm:ss
     * */
    public static String getNow(){
        return new SimpleDateFormat(FORMAT_ONE).format(new Date());
    }

    public static String getNow(String pattern){
        return new SimpleDateFormat(pattern).format(new Date());
    }

    public static String formatDate(Date date, String pattern){
        return new SimpleDateFormat(pattern).format(date);
    }

}
