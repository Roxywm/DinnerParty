package com.roxy.maven.dinner.test;

import redis.clients.jedis.Jedis;

public class Test {
    public static void main(String[] args) {
//        try {
//            JSONObject jsonObject = VerificationCode.sendAliyunMobileCode("15224553696");
//        } catch (ClientException e) {
//            e.printStackTrace();
//        }
        Jedis jedis = new Jedis();
        jedis.flushDB();

    }
}
