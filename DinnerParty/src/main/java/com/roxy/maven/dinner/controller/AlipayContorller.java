package com.roxy.maven.dinner.controller;

import com.alipay.api.AlipayApiException;
import com.alipay.api.AlipayClient;
import com.alipay.api.DefaultAlipayClient;
import com.alipay.api.internal.util.AlipaySignature;
import com.alipay.api.request.AlipayTradePagePayRequest;
import com.roxy.maven.dinner.alipay.config.AlipayConfig;
import com.roxy.maven.dinner.entity.ApplyParty;
import com.roxy.maven.dinner.entity.Dinner;
import com.roxy.maven.dinner.entity.Orders;
import com.roxy.maven.dinner.entity.User;
import com.roxy.maven.dinner.service.ApplyPartyService;
import com.roxy.maven.dinner.service.DinnerService;
import com.roxy.maven.dinner.service.OrdersService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.sql.Timestamp;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

@Controller
@RequestMapping(value = "/alipay")
public class AlipayContorller {

    @Autowired
    private DinnerService dinnerService;
    @Autowired
    private OrdersService ordersService;
    @Autowired
    private ApplyPartyService applyPartyService;

    private String remark;
    private Dinner dinner;

    @RequestMapping(value = "/openPlay", method = RequestMethod.POST)
    public void payment(String price, HttpServletResponse resp, String dinnerId){
        //找出该饭局
        dinner = dinnerService.findByDinnerId(Long.parseLong(dinnerId));

        /**跳转支付宝**/

        //获得初始化的AlipayClient
        AlipayClient alipayClient = new DefaultAlipayClient(AlipayConfig.gatewayUrl, AlipayConfig.app_id,
                AlipayConfig.merchant_private_key, "json", AlipayConfig.charset, AlipayConfig.alipay_public_key, AlipayConfig.sign_type);

        //设置请求参数
        AlipayTradePagePayRequest alipayRequest = new AlipayTradePagePayRequest();
        alipayRequest.setReturnUrl(AlipayConfig.return_url);
        alipayRequest.setNotifyUrl(AlipayConfig.notify_url);

        //付款金额
        String total_amount = ""+price;
        //商户订单号，商户网站订单系统中唯一订单号
        String out_trade_no = ""+System.currentTimeMillis();
        //订单名称
        String subject = out_trade_no;
        //商品描述，可空
        String body = dinner.getTitel()+"："+dinner.getStartTime().toString();
        remark = body;

        alipayRequest.setBizContent("{\"out_trade_no\":\""+ out_trade_no +"\","
                + "\"total_amount\":\""+ price +"\","
                + "\"subject\":\""+ subject +"\","
                + "\"body\":\""+ body +"\","
                + "\"product_code\":\"FAST_INSTANT_TRADE_PAY\"}");

        //请求
        String result = null;
        try {
            result = alipayClient.pageExecute(alipayRequest).getBody();

        } catch (AlipayApiException e) {
            e.printStackTrace();
        }

        try {
            //输出
            resp.setContentType("text/html;charset=" + AlipayConfig.charset);
            resp.getWriter().println(result);
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    @RequestMapping("/notify_url")
    public void notify_url(HttpServletResponse response, HttpServletRequest request) throws IOException, AlipayApiException{
        //获取支付宝POST过来反馈信息
        Map<String,String> params = new HashMap<String,String>();
        Map<String,String[]> requestParams = request.getParameterMap();
        for (Iterator<String> iter = requestParams.keySet().iterator(); iter.hasNext();) {
            String name = (String) iter.next();
            String[] values = (String[]) requestParams.get(name);
            String valueStr = "";
            for (int i = 0; i < values.length; i++) {
                valueStr = (i == values.length - 1) ? valueStr + values[i]
                        : valueStr + values[i] + ",";
            }
            //乱码解决，这段代码在出现乱码时使用
            valueStr = new String(valueStr.getBytes("ISO-8859-1"), "utf-8");
            params.put(name, valueStr);
        }

        boolean signVerified = AlipaySignature.rsaCheckV1(params, AlipayConfig.alipay_public_key, AlipayConfig.charset, AlipayConfig.sign_type); //调用SDK验证签名

        //——请在这里编写您的程序（以下代码仅作参考）——

		/* 实际验证过程建议商户务必添加以下校验：
		1、需要验证该通知数据中的out_trade_no是否为商户系统中创建的订单号，
		2、判断total_amount是否确实为该订单的实际金额（即商户订单创建时的金额），
		3、校验通知中的seller_id（或者seller_email) 是否为out_trade_no这笔单据的对应的操作方（有的时候，一个商户可能有多个seller_id/seller_email）
		4、验证app_id是否为该商户本身。
		*/
        if(signVerified) {//验证成功
            //商户订单号
            String out_trade_no = new String(request.getParameter("out_trade_no").getBytes("ISO-8859-1"),"UTF-8");

            //支付宝交易号
            String trade_no = new String(request.getParameter("trade_no").getBytes("ISO-8859-1"),"UTF-8");

            //交易状态
            String trade_status = new String(request.getParameter("trade_status").getBytes("ISO-8859-1"),"UTF-8");

            if(trade_status.equals("TRADE_FINISHED")){
                //判断该笔订单是否在商户网站中已经做过处理
                //如果没有做过处理，根据订单号（out_trade_no）在商户网站的订单系统中查到该笔订单的详细，并执行商户的业务程序
                //如果有做过处理，不执行商户的业务程序

                //注意：
                //退款日期超过可退款期限后（如三个月可退款），支付宝系统发送该交易状态通知
            }else if (trade_status.equals("TRADE_SUCCESS")){
                //判断该笔订单是否在商户网站中已经做过处理
                //如果没有做过处理，根据订单号（out_trade_no）在商户网站的订单系统中查到该笔订单的详细，并执行商户的业务程序
                //如果有做过处理，不执行商户的业务程序

                //注意：
                //付款完成后，支付宝系统发送该交易状态通知
            }

            response.getWriter().println("success");

        }else {//验证失败
            response.getWriter().println("fail");

            //调试用，写文本函数记录程序运行情况是否正常
            //String sWord = AlipaySignature.getSignCheckContentV1(params);
            //AlipayConfig.logResult(sWord);
        }
    }

    @RequestMapping(value = "/return_url")
    public String return_url(HttpServletRequest request, Map<String, Object> map, HttpSession session){
        //获取支付宝GET过来反馈信息
        Map<String,String> params = new HashMap<String,String>();
        Map<String,String[]> requestParams = request.getParameterMap();
        for (Iterator<String> iter = requestParams.keySet().iterator(); iter.hasNext();) {
            String name = (String) iter.next();
            String[] values = (String[]) requestParams.get(name);
            String valueStr = "";
            for (int i = 0; i < values.length; i++) {
                valueStr = (i == values.length - 1) ? valueStr + values[i]
                        : valueStr + values[i] + ",";
            }
            //乱码解决，这段代码在出现乱码时使用
            try {
                valueStr = new String(valueStr.getBytes("ISO-8859-1"), "utf-8");
            } catch (UnsupportedEncodingException e) {
                e.printStackTrace();
            }
            params.put(name, valueStr);
        }

        boolean signVerified = false; //调用SDK验证签名
        try {
            signVerified = AlipaySignature.rsaCheckV1(params, AlipayConfig.alipay_public_key, AlipayConfig.charset, AlipayConfig.sign_type);
        } catch (AlipayApiException e) {
            e.printStackTrace();
        }

        //——请在这里编写您的程序（以下代码仅作参考）——
        if(signVerified) {
            //商户订单号
            String out_trade_no = null;
            String total_amount = null;
            String trade_no = null;
            try {
                out_trade_no = new String(request.getParameter("out_trade_no").getBytes("ISO-8859-1"),"UTF-8");
                //支付宝交易号
                trade_no = new String(request.getParameter("trade_no").getBytes("ISO-8859-1"),"UTF-8");
                //付款金额
                total_amount = new String(request.getParameter("total_amount").getBytes("ISO-8859-1"),"UTF-8");
            } catch (UnsupportedEncodingException e) {
                e.printStackTrace();
            }

            //提交订单到数据库
            User user = (User) session.getAttribute("loginUser");
            Orders orders = new Orders(user,dinner,remark,Double.parseDouble(total_amount),out_trade_no,trade_no,new Timestamp(new Date().getTime()));
            int rows = ordersService.create(orders);
            if(rows>0){
                ApplyParty applyParty = new ApplyParty();
                applyParty.setUser(user);
                applyParty.setDinner(dinner);
                applyPartyService.updatePayStatus(applyParty);
            }

            //重定向到自己参加的饭局页面
            return "redirect:/mutually/dinner/joinDinner";
        }else {
            map.put("error", "验签失败");
            return "";//失败页面
        }
    }

}
