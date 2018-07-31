<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/common/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
    <meta name="renderer" content="webkit">
    <title>后台管理-管理员登录</title>
    <link rel="stylesheet" href="${ctx}/static/css/pintuer.css">
    <link rel="stylesheet" href="${ctx}/static/css/admin.css">
    <script src="${ctx}/static/js/jquery-3.3.1.min.js"></script>
    <script src="${ctx}/static/js/pintuer.js"></script>
    <script src="${ctx}/static/js/respond.js"></script>
    <script src="${ctx}/static/js/admin.js"></script>
    <link type="image/x-icon" href="${ctx}/static/images/" rel="shortcut icon" />
    <link href="${ctx}/static/images/favicon.ico" rel="bookmark icon" />
</head>
<body>
<div class="container">
    <div class="line">
        <div class="xs6 xm4 xs3-move xm4-move">
            <br /><br />
            <div class="media media-y">
                <a href="http://www.pintuer.com" target="_blank"><img src="${ctx}/static/images/logo.png" class="radius" alt="后台管理系统" /></a>
            </div>
            <br /><br />
            <form action="${ctx}/admin/login" method="post">
                <div class="panel">
                    <div class="panel-head"><strong>登录后台管理系统</strong></div>
                    <div class="panel-body" style="padding:30px;">
                        <c:if test="${not empty error}">
                            <div class="alert alert-red"><span class="close"></span>${error}</div>
                        </c:if>
                        <div class="form-group">
                            <div class="field field-icon-right">
                                <input type="text" class="input" name="username" placeholder="登录账号" data-validate="required:请填写账号,length#>=5:账号长度不符合要求" />
                                <span class="icon icon-user"></span>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="field field-icon-right">
                                <input type="password" class="input" name="password" placeholder="登录密码" data-validate="required:请填写密码,length#>=5:密码长度不符合要求" />
                                <span class="icon icon-key"></span>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="field">
                                <input type="text" class="input" name="passcode" placeholder="填写右侧的验证码" data-validate="required:请填写右侧的验证码" />
                                <img src="${ctx}/admin/authCode" id="codeImage" width="80" height="32" class="passcode" onclick="chageCode()"/>
                            </div>
                        </div>
                    </div>
                    <div class="panel-foot text-center"><button class="button button-block bg-main text-big">立即登录后台</button></div>
                </div>
            </form>
            <div class="text-right text-small text-gray padding-top">基于<a class="text-gray" target="_blank" href="http://www.pintuer.com">拼图前端框架</a>构建</div>
        </div>
    </div>
</div>
<script type="text/javascript">
    function chageCode(){
        $('#codeImage').attr('src','${ctx}/admin/authCode?t='+Math.random());//链接后添加Math.random，确保每次产生新的验证码，避免缓存问题。
    }
</script>
</body>
</html>