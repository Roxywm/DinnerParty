package com.roxy.maven.dinner.test;

import com.alibaba.fastjson.JSONObject;
import com.aliyuncs.exceptions.ClientException;
import com.roxy.maven.dinner.dao.AreaDao;
import com.roxy.maven.dinner.util.VerificationCode;
import redis.clients.jedis.Jedis;

public class Test {
    public static void main(String[] args) {
        try {
            JSONObject jsonObject = VerificationCode.sendAliyunMobileCode("15224553696", "123456");
            System.out.println(jsonObject.toJSONString());
        } catch (ClientException e) {
            e.printStackTrace();
        }
//        Jedis jedis = new Jedis();
//        jedis.flushDB();

//        JSONObject jsonObject = VerificationCode.sendMiaodiMobileCode("15224553696", VerificationCode.createRandomVcode());
//        System.out.println(jsonObject.toJSONString());

//        String s = VerificationCode.sendEamilCode("Roxywm@163.com");

    }
}
