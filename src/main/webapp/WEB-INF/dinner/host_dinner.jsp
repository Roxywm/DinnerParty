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
    <style>
        .myfloat{float: left;margin-right: 10px;}
    </style>
    <title>17素材·私厨 - 为你推荐遍布全球最新鲜，最与众不同的顶级生活方式</title>
</head>
<body>
<%@include file="/common/user_head.jsp"%>

<div class="mem-banner" style="background-image:url(${ctx}/static/upload/img11.jpg);"></div>


<div class="memwrap wrap clearfix">
    <div class="section fl">
        <div class="location tr"><a href="Dinner.html">参加的饭局</a><a href="${ctx}/mutually/dinner/hostDinner">主办的饭局</a><a href="${ctx}/mutually/dinner/create" class="current">发布饭局</a></div>
        <div class="Participate pd30">
            <div class="item">
                <a href="#" class="user img"><img src="${ctx}/static/upload/img12.png"></a>
                <div class="hd"><span class="username">大郭郭呐</span>  发布了  <span class="Period">NO.02期活动</span></div>
                <div class="bd">
                    <div class="Activity-img img"><img src="${ctx}/static/upload/img14.jpg"></div>
                    <div class="number">报名人数：<span class="count">15人</span></div>
                    <div class="txt">
                        <div class="title">价值350元高级自助餐免费抢！</div>
                        <div class="info">最近，因为各种事，总是会觉得有些委屈，有些难过，也会掉泪，甚至觉得自己不能够好好的活着，偶然看到写着“活着”这两个字，我想知道，郝云的专辑里是否蕴藏...	</div>
                        <p class="mt10"><a href="#" target="_blank">先到先得</a>    <a href="#" target="_blank">双向选择</a>    <a href="#" target="_blank">大数据匹配</a></p>
                        <a href="Management.html" class="button btn-mana">管理报名人数</a>
                    </div>
                </div>
            </div>
            <div class="item">
                <a href="#" class="user img"><img src="${ctx}/static/upload/img12.png"></a>
                <div class="hd"><span class="username">大郭郭呐</span>  发布了  <span class="Period">NO.02期活动</span></div>
                <div class="bd">
                    <div class="Activity-img img"><img src="${ctx}/static/upload/img14.jpg"></div>
                    <div class="number">报名人数：<span class="count">15人</span></div>
                    <div class="txt">
                        <div class="title">价值350元高级自助餐免费抢！</div>
                        <div class="info">最近，因为各种事，总是会觉得有些委屈，有些难过，也会掉泪，甚至觉得自己不能够好好的活着，偶然看到写着“活着”这两个字，我想知道，郝云的专辑里是否蕴藏...	</div>
                        <p class="mt10"><a href="#" target="_blank">先到先得</a>    <a href="#" target="_blank">双向选择</a>    <a href="#" target="_blank">大数据匹配</a></p>
                        <a href="Management.html" class="button btn-mana">管理报名人数</a>
                    </div>
                </div>
            </div>
        </div>
    </div>


    <%@include file="/common/user_right.jsp"%>

</div>

<script src="${ctx}/static/js/jquery.js"></script>
<script src="${ctx}/static/date/WdatePicker.js"></script>
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
        $("#up2").uploadPreview({
            Img: "ImgPr2",
        });
    });
</script>
</html>