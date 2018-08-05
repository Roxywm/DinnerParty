<%@ page language="java" contentType="text/html;charset=UTF-8"%>
<%@ include file="/common/taglib.jsp" %>
<%@ page import="com.alipay.api.internal.util.AlipaySignature" %>
<%@ page import="com.roxy.maven.dinner.alipay.config.AlipayConfig" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.Iterator" %>
<%@ page import="java.util.HashMap" %><%
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
        valueStr = new String(valueStr.getBytes("ISO-8859-1"), "utf-8");
        params.put(name, valueStr);
    }

    boolean signVerified = AlipaySignature.rsaCheckV1(params, AlipayConfig.alipay_public_key, AlipayConfig.charset, AlipayConfig.sign_type); //调用SDK验证签名

    //——请在这里编写您的程序（以下代码仅作参考）——
    if(signVerified) {
        //商户订单号
        String out_trade_no = new String(request.getParameter("out_trade_no").getBytes("ISO-8859-1"),"UTF-8");
        //支付宝交易号
        String trade_no = new String(request.getParameter("trade_no").getBytes("ISO-8859-1"),"UTF-8");
        //付款金额
        String total_amount = new String(request.getParameter("total_amount").getBytes("ISO-8859-1"),"UTF-8");

//  		out.println("<span class='specification'>交易号："+trade_no+"</span><br>");
//  		out.println("<span class='specification'>订单号："+out_trade_no+"</span><br>");
//  		out.println("<span class='specification'>金额："+total_amount+"</span><br>");
    }else {
//  		out.println("验签失败");
    }

%>