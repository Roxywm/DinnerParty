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
    <link type="image/x-icon" href="${ctx}/static/images" rel="shortcut icon" />
    <link href="${ctx}/static/images/favicon.ico" rel="bookmark icon" />
    <title>美滋滋·私厨 - 报名成功</title>
</head>
<body>
<%@include file="/common/user_head.jsp"%>

<div class="wrap">
    <div class="sign-title tc" style=" -webkit-opacity: 0.3; -moz-opacity: 0.3; -khtml-opacity: 0.3;  opacity: .3; filter:alpha(opacity=30);  ">
        <h1>我要申请报名</h1>
        亲爱的<a href="#" class="o">${loginUser.nickname}</a>，欢迎申请<span class="o">热红酒</span>
    </div>

    <div class="Application tc">
        <div class="suc-header o"><img src="${ctx}/static/images/rrt.png">已提交申请！</div>
        <div class="suctxt">恭喜你，成功提交主持申请表。<br>
            　　请您耐心等待结果，我们会在一个工作日内处理您的申请！ </div>
        <div class="Release-submit"><a href="${ctx}/me/meHome" class="button btn-submit Appbtn">返回个人首页</a></div>
    </div>

</div>


<!-- foot -->
<%@include file="/common/user_foot.jsp"%>

<script src="${ctx}/static/js/jquery.js"></script>
<script src="${ctx}/static/js/Action.js"></script>
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
    });
</script>
</body>
</html>