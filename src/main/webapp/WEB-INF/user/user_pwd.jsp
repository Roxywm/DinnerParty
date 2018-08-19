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
    <title>美滋滋·私厨 - 修改密码</title>
</head>
<body>
<%@include file="/common/user_head.jsp"%>

<div class="mem-banner" style="background-image:url(${ctx}/static/upload/img11.jpg);"></div>


<div class="memwrap wrap clearfix">
    <div class="section fl">
        <div class="location tr"><a href="${ctx}/user/edit">基本资料</a><a href="${ctx}/user/edit/pwd" class="current" style="font-weight: bold;">修改密码</a><a href="${ctx}/user/edit/binding">帐号绑定</a></div>
        <div class="pd20">
            <c:if test="${not empty error}">
                <div class="Prompt red" style="padding:0 0 10px; margin-left: 100px;">${error}</div>
            </c:if>
            <c:if test="${not empty message}">
                <div class="Prompt green" style="padding:0 0 10px; margin-left: 100px;">${message}</div>
            </c:if>
            <form action="${ctx}/user/update/pwd" method="post">
                <table class="baseinfo">
                    <tr>
                        <th>原始密码：</th>
                        <td>
                            <input type="password" value="${password}" name="password" class="baseipt">
                            <c:if test="${not empty yserror}">
                                <span class="ico wrong"></span><span class="f12">原始密码错误</span>
                            </c:if>
                        </td>
                    </tr>
                    <tr>
                        <th>新密码：</th>
                        <td><input type="password" value="${newPassword}" name="newPassword" class="baseipt"></td>
                    </tr>
                    <tr>
                        <th>确认密码：</th>
                        <td>
                            <input type="password" value="${qrPassword}" name="qrPassword" class="baseipt">

                            <c:if test="${not empty qrerror}">
                                <span class="ico wrong"></span><span class="f12">两次密码不一致</span>
                            </c:if>

                        </td>
                    </tr>
                    <tr>
                        <th>&nbsp;</th>
                        <td><button type="submit" name="save" class="button btn-save">修改</button></td>
                    </tr>
                </table>
            </form>
        </div>
    </div>

    <%@include file="/WEB-INF/me/me_right.jsp"%>
</div>

<!-- foot -->
<%@include file="/common/user_foot.jsp"%>

<script src="${ctx}/static/js/jquery.js"></script>
<script src="${ctx}/static/js/Action.js"></script>
<script src="${ctx}/static/js/upfiles.js"></script>

<script type="text/javascript" src="${ctx}/static/layer/layer.js"></script>
<script src="${ctx}/static/js/chosen.jquery.js"></script>
<script type="text/javascript">
    $(document).ready(function($){
        //select 样式美化
        var config = {
            '.chosen-select-no-single' : {disable_search_threshold:10}
        }
        for (var selector in config) {
            $(selector).chosen(config[selector]);
        }
        $("#up").uploadPreview({
            Img: "ImgPr",
        });
    });
</script>
</html>