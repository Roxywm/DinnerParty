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
    <!--[if lte IE 6]><meta http-equiv="refresh" content="0;url=IE6/IE6.html"><![endif]-->
    <link type="image/x-icon" href="${ctx}/static/images/" rel="shortcut icon" />
    <link href="${ctx}/static/images/favicon.ico" rel="bookmark icon" />
    <title>私厨 - 为你推荐遍布全球最新鲜，最与众不同的顶级生活方式</title>
</head>
<body>
<%--<div class="head">--%>
    <%--<div class="wrap clearfix">--%>
        <%--<a href="index.html" class="logo indent">logo</a>--%>
        <%--<div class="headr fr">--%>
            <%--<form action="active.html" method="post" class="headsearch">--%>
                <%--<label class="label">--%>
                    <%--<input type="text" value="" name="" class="key">--%>
                    <%--<span class="text">搜索地址、名称、时间等</span>--%>
                <%--</label>--%>
                <%--<button type="submit" class="button btn-search">&#xe628;</button>--%>
            <%--</form>--%>
            <%--<a href="login.html">登录</a><a href="reg.html">注册</a><a href="#">发布我的饭局</a>--%>
        <%--</div>--%>
    <%--</div>--%>
<%--</div>--%>
<div class="loginwrapper">
    <div class="wrap pr">
        <div class="loginbox">
            <h1 class="hd">用户注册</h1>
            <div class="tc" style="margin-top:-10px;"><img src="${ctx}/static/images/regtxt.png"></div>
            <div class="boxbd mt20">
                <form action="${ctx}/user/register" method="post">
                    <c:if test="${not empty error}">
                        <div class="Prompt red" style="padding:0 0 10px">${error}</div>
                    </c:if>

                    <label class="label">
                        <input type="email" name="email" value="${email}" class="loginipt key user">
                        <span class="text">请输入您的邮箱</span>
                    </label>
                    <label class="label">
                        <input type="password" name="password" value="${password}" class="loginipt key Nickname">
                        <span class="text">请输入您的密码</span>
                    </label>
                    <label class="label">
                        <input type="password" name="qrPassword" value="${qrPassword}" class="loginipt key pwd">
                        <span class="text">请确认您的密码</span>
                    </label>
                    <button type="submit" class="button btn-reg" >立即注册</button>
                    <p class="mt20 tc">注册则表示同意<a href="#" class="o">《会员条款》</a></p>
                    <div class="ohter"><span class="ohtertxt">或</span></div>
                    <div class="Prompt" style="padding:0 0 10px">使用以上社交网络帐号登录</div>
                </form>
            </div>
            <div class="tc">
                <a href="#" target="_blank" class="ico dou">豆</a>
                <a href="#" target="_blank" class="ico sina">新浪</a>
                <a href="#" target="_blank" class="ico qq">QQ</a>
            </div>
            <p class="boxbd tr">已有帐号？<a href="${ctx}/user/login" class="o">登录</a></p>
        </div>
    </div>
</div>
<div class="foot2">
    <div class="wrap clearfix">
        <div class="txt fl">
            <div class="foot-nav"> <a href="#">加入我们</a>/<a href="#">联系我们</a>/<a href="#">媒体报道</a>/<a href="#">会员条款</a>/<a href="#">版权声明</a></div>
            Copyright © 2003-2015 , All Rights Reserved　
        </div>
        <div class="orc fr"><img src="${ctx}/static/images/img2.jpg" width="63"><img src="${ctx}/static/images/img3.jpg" width="63"></div>
    </div>
</div><script src="${ctx}/static/js/jquery.js"></script>
<script src="${ctx}/static/js/Action.js"></script>
</body>
</html>
