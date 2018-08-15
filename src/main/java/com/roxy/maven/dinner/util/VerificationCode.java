package com.roxy.maven.dinner.util;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.aliyuncs.DefaultAcsClient;
import com.aliyuncs.IAcsClient;
import com.aliyuncs.dysmsapi.model.v20170525.SendSmsRequest;
import com.aliyuncs.dysmsapi.model.v20170525.SendSmsResponse;
import com.aliyuncs.exceptions.ClientException;
import com.aliyuncs.profile.DefaultProfile;
import com.aliyuncs.profile.IClientProfile;
import org.apache.commons.mail.EmailException;
import org.apache.commons.mail.HtmlEmail;

import java.io.BufferedReader;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.URL;
import java.net.URLConnection;
import java.security.MessageDigest;
import java.text.SimpleDateFormat;
import java.util.*;

public class VerificationCode {
    //秒滴用户ID
    public static final String ACCOUNT_SID = "6705e10e103f4deebdc36728ff4e6b96";
    //秒滴密钥
    public static final String AUTH_TOKEN = "b8bc8c8068334f7fb225f12eacc0c816";
    //秒滴请求地址前半部分
    public static final String BASE_URL = "https://api.miaodiyun.com/20150822/industrySMS/sendSMS";
    //随机数
    public static String randNum = "";
    //秒滴短信内容
    public static String smsContent = "【必要商城】您的验证码为"+randNum+"，请于5分钟内正确输入，如非本人操作，请忽略此短信。";


    /**
     * 发送阿里云手机验证码
     * @param phoneNumber
     * @return 请求响应
     * @throws ClientException
     */
    public static JSONObject sendAliyunMobileCode(String phoneNumber, String code) throws ClientException {
        randNum = code;
        System.setProperty("sun.net.client.defaultConnectTimeout", "10000");//不必修改
        System.setProperty("sun.net.client.defaultReadTimeout", "10000");//不必修改
        IClientProfile profile = DefaultProfile.getProfile("cn-hangzhou", "LTAIzwxyOQKaX4sf", "cOMRHBvbhmfFr9pmsudHdX6sM7bAgE");//"***"分别填写自己的AccessKey ID和Secret
        DefaultProfile.addEndpoint("cn-hangzhou", "cn-hangzhou", "Dysmsapi", "dysmsapi.aliyuncs.com");//不必修改
        IAcsClient acsClient = new DefaultAcsClient(profile);//不必修改
        SendSmsRequest request = new SendSmsRequest();//不必修改
        request.setPhoneNumbers(phoneNumber);//****处填写接收方的手机号码
        request.setSignName("袁伟铭");//此处填写已申请的短信签名
        request.setTemplateCode("SMS_139580060");//此处填写获得的短信模版CODE
        request.setTemplateParam("{\"code\":\""+randNum+"\"}");//笔者的短信模版中有${code}, 因此此处对应填写验证码
        SendSmsResponse sendSmsResponse = acsClient.getAcsResponse(request);//不必修改
        JSONObject jsonObject = new JSONObject();
        jsonObject.put("code",randNum);
        jsonObject.put("status",sendSmsResponse.getCode());
        jsonObject.put("message",sendSmsResponse.getMessage());
        return jsonObject;
    }

    /**
     * 发送秒滴手机验证码
     * @param phoneNumber
     * @return JSONObject对象结果
     */
    public static JSONObject sendMiaodiMobileCode(String phoneNumber, String code){
        randNum = code;
        String args = qureyArguments(ACCOUNT_SID, AUTH_TOKEN, smsContent, phoneNumber);
        OutputStreamWriter out = null;
        InputStream in = null;
        BufferedReader br = null;
        StringBuffer sb = new StringBuffer();
        JSONObject jsonObject = null;
        try {
            URL url = new URL(BASE_URL);
            URLConnection connection = url.openConnection();//打开链接
            connection.setDoOutput(true);
            connection.setDoInput(true);
            connection.setConnectTimeout(5000);//设置请求链接超时时间
            connection.setReadTimeout(10000);//设置读取结果超时
            //提交数据
            out = new OutputStreamWriter(connection.getOutputStream(),"UTF-8");
            out.write(args);
            out.flush();
            //读取返回数据

            in = connection.getInputStream();
            br = new BufferedReader(new InputStreamReader(in));
            String line = "";
            while((line =br.readLine())!= null){
                sb.append(line);
            }
            jsonObject = JSON.parseObject(sb.toString());
            jsonObject.put("code", randNum);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return jsonObject;
    }

    /**
     * 发送邮箱验证码
     * @param eamil
     * @return 发送的验证码
     */
    public static String sendEamilCode(String eamil) {
        HtmlEmail send = new HtmlEmail();
        // 获取随机验证码
        String resultCode = achieveCode();
        try {
            send.setHostName("smtp.qq.com");
            send.setSmtpPort(465);  //端口号
            send.setSSLOnConnect(true); //开启SSL加密
            send.setCharset("utf-8");
            send.addTo(eamil);  //接收者的QQEamil
            send.setFrom("269735929@qq.com", "染月"); //第一个参数是发送者的QQEamil   第二个参数是发送者QQ昵称
            send.setAuthentication("269735929@qq.com", "trfcnohduynxbigj");  //第一个参数是发送者的QQEamil   第二个参数是刚刚获取的授权码
            send.setSubject("小渣渣特给您送上激活链接"); //Eamil的标题  第一个参数是我写的判断上下午，删掉即可
//            send.setMsg("HelloWorld!欢迎大大光临，点击此链接验证邮箱:   <a href='http://localhost:8080/dinner/user/update/email?code="+resultCode+"'>点击此处验证邮箱</a>   请大大签收");   //Eamil的内容
            send.setMsg("HelloWorld!欢迎大大光临，点击此链接验证邮箱:   <a href='http://www.ywming.com/dinner/user/update/email?code="+resultCode+"'>点击此处验证邮箱</a>   请大大签收");   //Eamil的内容
            send.send();//发送
        } catch (EmailException e) {
            e.printStackTrace();
        }
        return resultCode; //同等验证码
    }


    /**
     * 发送通知管理员审核邮件
     * @return 发送的验证码
     */
    public static String sendAdminExamineEmail() {
        HtmlEmail send = new HtmlEmail();
        // 获取随机验证码
        String resultCode = achieveCode();
        try {
            send.setHostName("smtp.qq.com");
            send.setSmtpPort(465);  //端口号
            send.setSSLOnConnect(true); //开启SSL加密
            send.setCharset("utf-8");
            send.addTo("Roxywm@163.com");  //接收者的QQEamil
            send.setFrom("269735929@qq.com", "染月"); //第一个参数是发送者的QQEamil   第二个参数是发送者QQ昵称
            send.setAuthentication("269735929@qq.com", "trfcnohduynxbigj");  //第一个参数是发送者的QQEamil   第二个参数是刚刚获取的授权码
            send.setSubject("有新的用户申请信息，请尽快处理！"); //Eamil的标题  第一个参数是我写的判断上下午，删掉即可
//            send.setMsg("HelloWorld！点击此链接进行登录处理：   <a href='http://localhost:8080/dinner/admin/login/'>点击此处</a>");   //Eamil的内容
            send.setMsg("HelloWorld！点击此链接进行登录处理：   <a href='http://www.ywming.com/dinner/admin/login/'>点击此处</a>");   //Eamil的内容
            send.send();//发送
        } catch (EmailException e) {
            e.printStackTrace();
        }
        return resultCode; //同等验证码
    }

    /**
     * 获取手机随机验证码
     * @return 所得验证码
     */
    public static String createRandomVcode(){
        Random r = new Random();
        String code = "";
        for(int i=0; i<6; i++){
            int anInt = r.nextInt(10);
            if(i==0&&anInt==0){
                i--;
                continue;
            }
            code+=anInt;
        }
        return code;
    }

    /**
     * 获取邮箱随机验证码
     * @return
     */
    public static String achieveCode() {
        String[] beforeShuffle= new String[] { "2", "3", "4", "5", "6", "7", "8", "9", "A", "B", "C", "D", "E", "F",
                "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z", "a",
                "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v",
                "w", "x", "y", "z" };
        List list = Arrays.asList(beforeShuffle);
        Collections.shuffle(list);
        StringBuilder sb = new StringBuilder();
        for (int i = 0; i < list.size(); i++) {
            sb.append(list.get(i));
        }
        String afterShuffle = sb.toString();
        String result = afterShuffle.substring(3, 9);
        return result;
    }

    /**
     * 秒滴请求参数
     * @param ACCOUNT_SID
     * @param AUTH_TOKEN
     * @param smsContent
     * @param to
     * @return
     */
    public static String qureyArguments(String ACCOUNT_SID,String AUTH_TOKEN,String smsContent,String to){
        //时间戳
        String timestamp = getTimestamp();
        //签名验证
        String sig = MD5(ACCOUNT_SID,AUTH_TOKEN,timestamp);
        //地址参数拼接
        String str = "accountSid="+ACCOUNT_SID+"&smsContent="+smsContent+
                "&to="+to+"&playTimes=2"+"&timestamp="+timestamp+"&sig="+sig;
        return str;
    }

    /**
     * 获取时间戳
     * @return
     */
    public static String getTimestamp(){
        SimpleDateFormat format = new SimpleDateFormat("yyyyMMddHHmmss");
        return format.format(new Date());
    }

    /**
     * MD5加密
     * @param args
     * @return
     */
    public static String MD5(String... args){
        StringBuffer result = new StringBuffer();
        if(args==null||args.length==0){
            return "";
        }else{
            StringBuffer sb = new StringBuffer();
            for (String string : args) {
                sb.append(string);
            }
            MessageDigest digest;
            try {
                digest = MessageDigest.getInstance("MD5");
                byte[] bytes = digest.digest(sb.toString().getBytes());
                for (byte b : bytes) {
                    String hex = Integer.toHexString(b&0xff);//16进制转换
                    if(hex.length()==1){
                        result.append("0"+hex);
                    }else{
                        result.append(hex);
                    }
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return result.toString();
    }

}
