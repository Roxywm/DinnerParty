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
        <div class="location tr"><a href="${ctx}/mutually/dinner/joinDinner">参加的饭局</a><a href="${ctx}/mutually/dinner/hostDinner">主办的饭局</a><a href="${ctx}/mutually/dinner/create" class="current">发布饭局</a></div>
        <div class="Participate pd30">
            <c:if test="${fn:length(page.list)==0}">
                <div class="Participate pd30">
                    您目前没有参加任何饭局活动！
                </div>
            </c:if>
            <c:forEach items="${page.list}" var="applyParty">
                <div class="item">
                    <a href="#" class="user img"><img src="${ctx}/userIcon/${applyParty.user.icon}"></a>
                    <div class="hd"><span class="username">${applyParty.user.nickname}</span>  发布了  <span class="Period">NO.${applyParty.dinner.id}期活动</span></div>
                    <div class="bd">
                        <div class="Activity-img img"><img src="${ctx}/uploads/${applyParty.dinner.thumbnail}"></div>
                        <div class="number">报名人数：<span class="count"><c:if test="${applyParty.dinner.enrolment==null}">0</c:if>${applyParty.dinner.enrolment}人</span></div>
                        <div class="txt">
                            <div class="title"><a href=#">${applyParty.dinner.titel}</a></div>
                            <div class="info">${applyParty.dinner.details}</div>
                            <%--<p class="mt10"><a href="#" target="_blank">先到先得</a>    <a href="#" target="_blank">双向选择</a>    <a href="#" target="_blank">大数据匹配</a></p>--%>
                            <p class="mt10"><a href="javascript:;" target="_blank">${applyParty.dinner.category.name}</a></p>
                            <a href="Management.html" class="button btn-mana">管理报名人数</a>
                        </div>
                    </div>
                </div>
            </c:forEach>

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