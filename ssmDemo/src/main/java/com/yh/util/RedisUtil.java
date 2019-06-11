package com.yh.util;

import redis.clients.jedis.Jedis;

/**
 * @author yh create 2019-6-11 16:04:32
 * */
public class RedisUtil {
    private static Jedis jedis = null;

    static{
        init();
    }

    private RedisUtil(){
        System.out.println("RedisUtil初始化");
    }

    /**
     * 初始化
     * */
    private static void init(){
        jedis = new Jedis("127.0.0.1", 6379);
        System.out.println("连接Redis成功。。。");
    }

    /**
     * 使用单例模式
     * */
    public static Jedis getJedis(){
        return jedis;
    }

}
