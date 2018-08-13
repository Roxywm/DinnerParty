<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/common/taglib.jsp" %>
<!doctype html>
<html><head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <meta name="keywords" content="">
    <meta name="description" content="mezz">
    <meta name="author" content="mezz">
    <link href="${ctx}/static/css/css.css" rel="stylesheet">
    <link href="${ctx}/static/css/chosen.css" rel="stylesheet">
    <!--[if lt IE 9]>
    <link href="${ctx}/static/css/ie.css" rel="stylesheet" type="text/css" >
    <meta http-equiv="X-UA-Compatible" content="IE=8" >
    <![endif]-->
    <!--[if lte IE 6]><meta http-equiv="refresh" content="0;url=${ctx}/static/IE6/IE6.html"><![endif]-->
    <link type="image/x-icon" href="${ctx}/static/images/" rel="shortcut icon" />
    <link href="${ctx}/static/images/favicon.ico" rel="bookmark icon" />
    <title>美滋滋·私厨 - 用户登录</title>
</head>
<body>
<%--<div class="head">--%>
    <%--<div class="wrap clearfix">--%>
        <%--<a href="${ctx}/" class="logo indent">logo</a>--%>
        <%--<div class="headr fr">--%>
            <%--<form action="${ctx}/find/dinner/search" method="post" class="headsearch" onsubmit="return check()">--%>
                <%--<label class="label">--%>
                    <%--<input type="text" id="keyword" name="keyword" class="key">--%>
                    <%--<span class="text">搜索地址、名称、时间等</span>--%>
                <%--</label>--%>
                <%--<button type="submit" class="button btn-search">&#xe628;</button>--%>
            <%--</form>--%>
            <%--&lt;%&ndash;<a href="${ctx}/user/login">登录</a><a href="${ctx}/user/register">注册</a><a href="${ctx}/mutually/dinner/create">发布我的饭局</a>&ndash;%&gt;--%>
        <%--</div>--%>
    <%--</div>--%>
<%--</div>--%>
<%@include file="/common/user_head.jsp"%>

<div class="loginwrapper">
    <div class="wrap pr">
        <div class="loginbox">
            <h1 class="hd">用户登录</h1>
            <div class="tc">
                <a href="#" target="_blank" class="ico dou">豆</a>
                <a href="#" target="_blank" class="ico sina">新浪</a>
                <a href="#" target="_blank" class="ico qq">QQ</a>
            </div>
            <div class="Prompt">使用以上社交网络帐号登录</div>

            <div class="boxbd">
                <div class="ohter"><span class="ohtertxt">或</span></div>

                <form action="${ctx}/user/login" method="post">
                    <c:if test="${not empty error}">
                        <div class="Prompt red" style="padding:0 0 10px">${error}</div>
                    </c:if>
                    <c:if test="${not empty message}">
                        <div class="Prompt green" style="padding:0 0 10px">${message}</div>
                    </c:if>
                    <label class="label">
                        <input type="email" name="email" value="" class="loginipt key user">
                        <span class="text">请输入您的邮箱</span>
                    </label>
                    <label class="label">
                        <input type="password" name="password" value="" class="loginipt key pwd">
                        <span class="text">请输入您的密码</span>
                    </label>
                    <button type="submit" class="button btn-login">登录</button>
                    <p class="mt20"><label for="remember"><input name="" type="checkbox" id="remember" value="" checked> 记住我</label><a href="forgot.html" class="fr"> 忘记密码？</a></p>
                    <p class="mt10 tr">还没有账号？<a href="${ctx}/user/register" class="o">注册</a></p>
                </form>
            </div>

        </div>
    </div>
</div>
<div class="foot2">
    <div class="wrap clearfix">
        <div class="txt fl">
            <div class="foot-nav"><a href="#">加入我们</a>/<a href="#">联系我们</a>/<a href="#">媒体报道</a>/<a href="#">会员条款</a>/<a href="#">版权声明</a></div>
            Copyright © 2003-2015 17素材, All Rights Reserved　
        </div>
        <div class="orc fr"><img src="${ctx}/static/images/img2.jpg" width="63"><img src="${ctx}/static/images/img3.jpg" width="63"></div>
    </div>
</div>
<script src="${ctx}/static/js/jquery.js"></script>
<script src="${ctx}/static/js/Action.js"></script>
</body>
</html>