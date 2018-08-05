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
    <!-- Bootstrap -->
    <link href="${ctx}/static/css/bootstrap.min.css" rel="stylesheet" media="screen">
    <link href="${ctx}/static/css/bootstrap-theme.min.css" rel="stylesheet" media="screen">
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
                    您目前没有主持任何饭局活动！
                </div>
            </c:if>
            <c:forEach items="${page.list}" var="dinner">
                <div class="item">
                    <a href="#" class="user img"><img src="${ctx}/userIcon/${dinner.user.icon}"></a>
                    <div class="hd"><span class="username">${dinner.user.nickname}</span>  发布了  <span class="Period">NO.${dinner.id}期活动</span></div>
                    <div class="bd">
                        <div class="Activity-img img"><img src="${ctx}/uploads/${dinner.thumbnail}"></div>
                        <div class="number">报名人数：<span class="count"><c:if test="${dinner.enrolment==null}">0</c:if>${dinner.enrolment}人</span></div>
                        <div class="txt">
                            <div class="title"><a href="${ctx}/mutually/dinner/dinnerDetail?dinnerId=${dinner.id}">${dinner.titel}</a></div>
                            <div class="info">${dinner.details}</div>
                            <%--<p class="mt10"><a href="#" target="_blank">先到先得</a>    <a href="#" target="_blank">双向选择</a>    <a href="#" target="_blank">大数据匹配</a></p>--%>
                            <p class="mt10"><a href="javascript:;" target="_blank">${dinner.category.name}</a></p>
                            <a href="Management.html" class="button btn-mana">管理报名人数</a>
                        </div>
                    </div>
                </div>
            </c:forEach>

            <!-- 分页 -->
            <div class="dataTables_paginate paging_bootstrap">
                <ul class="pagination">
                    <li class="prev disabled">
                        <a href="?pageNum=${page.prePage}&menu=${param.menu}">上一页</a>
                    </li>
                    <c:forEach begin="1" end="${page.pages}" var="p">
                        <li <c:if test="${p==page.pageNum}">class="active"</c:if>>
                            <a href="?pageNum=${p}&menu=${param.menu}">${p}</a>
                        </li>
                    </c:forEach>
                    <li class="next">
                        <a href="?pageNum=${page.nextPage}&menu=${param.menu}">下一页</a>
                    </li>
                </ul>
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