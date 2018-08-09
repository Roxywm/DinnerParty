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
    <title>17素材·私厨 - 为你推荐遍布全球最新鲜，最与众不同的顶级生活方式</title>
</head>
<body>
<%@include file="/common/user_head.jsp"%>

<div class="mem-banner" style="background-image:url(${ctx}/static/upload/img11.jpg);"></div>


<div class="memwrap wrap clearfix">
    <div class="section fl">
        <div class="location tr"><a href="${ctx}/user/edit" class="current">基本资料</a><a href="${ctx}/user/edit/pwd">修改密码</a><a href="${ctx}/user/edit/binding">帐号绑定</a></div>
        <div class="pd20">
            <table class="baseinfo">
                <tr>
                    <td width="50%">
                        <div class="icoimg"><img src="${ctx}/static/images/img5.jpg"></div>
                        <div class="infotxt">你的邮箱帐号：

                            <c:if test="${user.email!=null}">
                                ${user.email}
                                <c:if test="${user.emailStatus==0}">
                                    <p class="mt10">
                                        <a href="${ctx}/user/edit/email" class="button btn-bind">未验证</a>
                                    </p>
                                </c:if>
                                <c:if test="${user.emailStatus==1}">
                                    <p class="mt10">
                                        <a href="javascript:;" class="button btn-bind">已验证</a>
                                    </p>
                                </c:if>
                            </c:if>
                            <c:if test="${user.email==null}">
                                未绑定
                                <p class="mt10">
                                    <a href="/user/edit/email" class="button btn-bind">立即去绑定</a>
                                </p>
                            </c:if>

                        </div>
                    </td>
                    <td>
                        <div class="icoimg"><img src="${ctx}/static/images/img6.jpg"></div>
                        <div class="infotxt">你的手机号码：
                            <c:if test="${user.mobile!=null}">
                                ${user.mobile}
                                <c:if test="${user.mobileStatus==0}">
                                    <p class="mt10">
                                        <a href="${ctx}/user/edit/mobile" class="button btn-bind">未验证</a>
                                    </p>
                                </c:if>
                                <c:if test="${user.mobileStatus==1}">
                                    <p class="mt10">
                                        <a href="javascript:;" class="button btn-bind">已验证</a>
                                    </p>
                                </c:if>
                            </c:if>
                            <c:if test="${user.mobile==null}">
                                未绑定
                                <p class="mt10">
                                    <a href="${ctx}/user/edit/mobile" class="button btn-bind">立即去绑定</a>
                                </p>
                            </c:if>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td>
                        <div class="icoimg"><img src="${ctx}/static/images/img7.jpg"></div>
                        <div class="infotxt">实名认证：未认证
                            <p class="mt10">
                                <a href="#" class="button btn-bind">立即去认证</a>
                            </p>
                        </div>
                    </td>
                    <td></td>
                </tr>
            </table>
        </div>
    </div>

    <%@include file="/WEB-INF/me/me_right.jsp"%>
</div>

<script src="${ctx}/static/js/jquery.js"></script>
<script src="${ctx}/static/js/Action.js"></script>
<script src="${ctx}/static/js/upfiles.js"></script>

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