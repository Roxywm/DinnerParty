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

    <link href="${ctx}/static/toastr/toastr.css" rel="stylesheet"/>
    <script src="${ctx}/static/toastr/toastr.js" type="text/javascript"></script>

    <!--[if lt IE 9]>
    <link href="${ctx}/static/css/ie.css" rel="stylesheet" type="text/css" >
    <meta http-equiv="X-UA-Compatible" content="IE=8" >
    <![endif]-->
    <!--[if lte IE 6]><meta http-equiv="refresh" content="0;url=${ctx}/static/IE6/IE6.html"><![endif]-->
    <link type="image/x-icon" href="${ctx}/static/images/" rel="shortcut icon" />
    <link href="${ctx}/static/images/favicon.ico" rel="bookmark icon" />
    <title>美滋滋·私厨 - 绑定邮箱</title>
</head>
<body>
<%@include file="/common/user_head.jsp"%>

<div class="mem-banner" style="background-image:url(${ctx}/static/upload/img11.jpg);"></div>


<div class="wrap">
    <form action="${ctx}/user/edit/updateEmail" method="post">
        <div class="sign-title tc" style=" -webkit-opacity: 0.3; -moz-opacity: 0.3; -khtml-opacity: 0.3;  opacity: .3; filter:alpha(opacity=30);  ">
            <h1>邮箱验证</h1>
            亲爱的<a href="#" class="o">${loginUser.nickname}</a>，欢迎使用<span class="o">邮箱验证</span>
        </div>

        <div class="Application tc">
            <c:if test="${not empty error}">
                <div class="Prompt red" style="padding:0 0 10px; margin-left: 100px;">${error}</div>
            </c:if>
            <p class="f18">邮箱地址：<input type="email" name="email" class="inputmail" placeholder="请输入您的邮箱"></p>
            <div class="Release-submit"><button type="submit" class="button btn-submit Appbtn">下一步</button></div>
        </div>
    </form>
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
<script>
    $("#btn-send").click(function () {
        var mobile = $("#mobile").val();
        var mobileCode = $("#mobileCode").val();
        $.get("${ctx}/user/mobileCode",{"phoneNumber":mobile,"mobileCode":mobileCode},function (data) {
            console.log(data)
            if(data=="ok"){
                var i = 60;
                var Times = setInterval(function () {
                    if(i>0){
                        $("#btn-send").attr("disabled",true);
                        $("#btn-send").text(i--+"秒后再次发送");
                    }else {
                        $("#btn-send").removeAttr("disabled");
                        $("#btn-send").text("发送短信验证码");
                        clearInterval(Times);
                    }
                },1000)
            }else{
                alert("获取验证码失败！");
                // toastr.options = {
                //     closeButton: false,
                //     debug: false,
                //     progressBar: false,
                //     positionClass: "toast-top-center",
                //     onclick: null,
                //     showDuration: "300",
                //     hideDuration: "1000",
                //     timeOut: "5000",
                //     extendedTimeOut: "1000",
                //     showEasing: "swing",
                //     hideEasing: "linear",
                //     showMethod: "fadeIn",
                //     hideMethod: "fadeOut"
                // };
                // toastr.info("获取验证码失败！");
            }
        })
    });
</script>
</html>