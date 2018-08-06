package com.roxy.maven.dinner.alipay.config;

import java.io.FileWriter;
import java.io.IOException;

/* *
 *类名：AlipayConfig
 *功能：基础配置类
 *详细：设置帐户有关信息及返回路径
 *修改日期：2017-04-05
 *说明：
 *以下代码只是为了方便商户测试而提供的样例代码，商户可以根据自己网站的需要，按照技术文档编写,并非一定要使用该代码。
 *该代码仅供学习和研究支付宝接口使用，只是提供一个参考。
 */

public class AlipayConfig {
	// 应用ID,您的APPID，收款账号既是您的APPID对应支付宝账号
	public static String app_id = "2016091400512426";
	// 商户私钥，您的PKCS8格式RSA2私钥
    public static String merchant_private_key = "MIIEvAIBADANBgkqhkiG9w0BAQEFAASCBKYwggSiAgEAAoIBAQCybbdwcyvhS/W3QRqGSgfL988fmdOTCxar8TndO8vUCaHf5wPloqeAhZgRFzBLzJUFIkT9UAIWJPyzT7iBif0asAYby2WZiftvt8QZ8K4UbWCpRx5KyRMxsTJF/3MoNgM2YUn3A761eAIMiNXmcbis3L6cB0hgV0QBLE1oUiyUS+FM68+4M3tPhfm2xOutcyD7zGy+L/0catmc1BQ2KJ65xPN2om1cHMAY7S03kPMDRnVblI4mGZ3M+pQ9/8HJCWQ1sVEYOXwqxuIw+h/Z9lvRLm/t88a2ROp5AuZR/9RxsVZE7hk1kjrLtWAAtsYVxiSvGbcB26jzQpPYs/Ao8CCvAgMBAAECggEAd4gI28xMGSJJ+fojStNNZdcdao4irt8+0PFJUmw8oE/ToauhcLUGgZL9zHU8ZYsoScgrb4ep3ivpHjbJ4/4NEVPaw8P+zF0jlDQHq1kRRZ4Ao2aBZJhPw3pxs3LuMoH8pPGIG3Lmz6sVtE/2++ozTZqUFvLKCcBsTlzffoOOWclc0SfZn9PezvvQ1gS3l3qZjFRItQpipFMwfmGDTPfMrfOB9uZlUbMkFxQVZn0KL8rTnSbP2lCIoD2HNLN451EDZK36zpbQuF+z9q9NJibXa9Teks1mtizwmlJO6Ylq6GegRnEudagR2ClIWY+BRHSpud4AGUtWPR/G8Do7mt0QAQKBgQDiYXKOHJPyBqGJl5Rc2Wwj3XUo/u9a1ruv0rcZVnacL7/aAWX95pC7ZhK88PjPg2o8/urCmt9RNPnwY8SPvZkZ90Wlb8nVYnfhNWDXX6yyWnkHtY9HjI5QmrX2rmTBq+oxNaCHcy6BnyEm7GnjTfVSOgLCp4n3bDU+IMGp6EDpkQKBgQDJxiDv1lHsWMijJKljYAyseMF/ZrKwLju62m2Tmw8nowWRADIx7lBeky3FZFdLio9TXu9RIoyRWOZJn6xgKZuz6ctkxjAHWNG7EWke7gr7dDYXwXcxhWaDzvu3UD7HeSsbFqoupAfgusnFYKmmlR9LGH8bNszwLA4OuK+X2wlGPwKBgFZGz1Lr/1KBRnVa6LdOQdGVaD58kpprNlK3GwM0GbZC2HpsiANxKP3S1BdgO2NS8V1Xxf7u6WdYqlz8mQAzQTNNMyTu6txBT/Dr2AGdPAMpSfEvN/EL131OyUS/iDTroTCqAIk+052hGRBtj5mKr5Fr/HtVQNakTdJkx4pKstqRAoGAM/qhc4eftSYuEbEZHeuZeDjniB15vN88LeelQNg6MDjT70XAqJI/DA4YRXiS8HfyckTLm/gthCgFs0O6EU/Gt7Nr3TsdFldwOCPFE9244IxQfxAs14oJHb2NpOy8L4DsdN8C2l8RVHhqEDnVmn9h/2OBIw6b/ucqe+ph+dnIatsCgYBmUdfTwdblz7a0pCpu6ALsIuPsxXsrgwTp8A5uKOnvW+B62Y5CVGLDS/4PggiYkG4y7L8lsbmNJJIBvJR3nkmIhN1B/Yjv21EUVaDwYkFKOJbemlW/+gkTCiIszMstDnJ8HDiRcsWVqDGGqU3jFTi2QWyf8IX20FN5uihglyX5Bw==";
	// 支付宝公钥,查看地址：https://openhome.alipay.com/platform/keyManage.htm 对应APPID下的支付宝公钥。
    public static String alipay_public_key = "MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAt7owVuCb5/lyREdE/BZ7IURp0bv6YZ2O81tRVU69r62Ca7u+4DovgvEGLjs+kIP2QZVpUODUPr1yk1sf/k5xzsRPkFtrVNb/X3h/jALQu5Aj2mDIMZymDbvErGzvCCub3A81xYz+S46VOmQpPhVm26xJySNX5R1dRjTltp9meq/rrqTR3IjWd2VjQUnKqVkjRJ89RPCJVOdFgj3211VlCyTz1PBlAJ79J7dyNl46moSvTEDnjX9J50sUxgMNpJJjJZ22Ga/OYQ6IB38SQQAAajZreqwA8AguxwA/yyr24OkfVp3Pk6Cpxv6lksSENAezMiHSFgPeroV826fvxK0wRQIDAQAB";
	// 服务器异步通知页面路径  需http://格式的完整路径，不能加?id=123这类自定义参数，必须外网可以正常访问
    public static String notify_url = "http://localhost:8080/dinner/alipay/notify_url.jsp";
//    public static String notify_url = "http://www.ywming.com/member/notify_url.jsp";
	// 页面跳转同步通知页面路径 需http://格式的完整路径，不能加?id=123这类自定义参数，必须外网可以正常访问
    public static String return_url = "http://localhost:8080/dinner/alipay/pay_success";
//    public static String return_url = "http://localhost:8080/dinner/mutually/dinner/hostDinner";
//    public static String return_url = "http://www.ywming.com/member/pay_success.jsp";
	// 签名方式
	public static String sign_type = "RSA2";
	// 字符编码格式
	public static String charset = "utf-8";
	// 支付宝网关
	public static String gatewayUrl = "https://openapi.alipaydev.com/gateway.do";
	// 支付宝网关
	public static String log_path = "C:\\";
    /**
     * 写日志，方便测试（看网站需求，也可以改成把记录存入数据库）
     * @param sWord 要写入日志里的文本内容
     */
    public static void logResult(String sWord) {
        FileWriter writer = null;
        try {
            writer = new FileWriter(log_path + "alipay_log_" + System.currentTimeMillis()+".txt");
            writer.write(sWord);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (writer != null) {
                try {
                    writer.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }
    }
}

