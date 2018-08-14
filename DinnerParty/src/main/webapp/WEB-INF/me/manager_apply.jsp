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
    <link href="css/ie.css" rel="stylesheet" type="text/css" >
    <meta http-equiv="X-UA-Compatible" content="IE=8" >
    <![endif]-->
    <!--[if lte IE 6]><meta http-equiv="refresh" content="0;url=IE6/IE6.html"><![endif]-->
    <link href="favicon.ico" rel="SHORTCUT ICON">
    <title>美滋滋·私厨 - 管理报名人员</title>
</head>
<body>
<%@include file="/common/user_head.jsp"%>

<div class="mem-banner" style="background-image:url(${ctx}/static/upload/img11.jpg);"></div>


<div class="memwrap wrap clearfix">
    <div class="section fl">
        <%--<div class="location tr"><a href="Dinner.html">参加的饭局</a><a href="Host.html" class="current">主办的饭局</a><a href="Release.html">发布饭局</a></div>--%>
        <div class="Participate pd30">
            <div class="item bd0">
                <a href="${ctx}/he/heMain?userId=${dinner.user.id}" class="user img"><img src="${ctx}/userIcon/${dinner.user.icon}"></a>
                <div class="hd"><span class="username">${dinner.user.nickname}</span>  发布了  <span class="Period">NO.${dinner.id}期活动</span></div>
                <div class="bd">
                    <div class="Activity-img img"><img src="${ctx}/uploads/${dinner.thumbnail}"></div>
                    <div class="txt">
                        <div class="title">${dinner.titel}</div>
                        <div class="info">${dinner.details}</div>
                        <p class="mt10"><a href="#" target="_blank">先到先得</a>    <a href="#" target="_blank">双向选择</a>    <a href="#" target="_blank">大数据匹配</a></p>
                    </div>
                </div>
            </div>
            <p class="mt40 tc"><img src="${ctx}/static/images/registration.jpg"></p>
        </div>
        <div class="registration clearfix">
            <c:if test="${fn:length(partyList)==0}">
                <div class="Participate pd30">
                    目前没有用户报名！
                </div>
            </c:if>
            <c:forEach items="${partyList}" var="applyParty">
                <div class="item">
                    <div class="bd">
                        <div class="lebox">
                            <div class="img"><img src="${ctx}/userIcon/${applyParty.user.icon}"></div>
                            <div class="choose tc"><a href="javascript:;" class="button btn-choose">选择</a></div>
                        </div>
                        <div class="baseinfo">${applyParty.user.nickname} <em class="ico level"></em><em class="ico level"></em></div>
                        ${applyParty.user.about}
                    </div>
                </div>
            </c:forEach>
        </div>

    </div>

    <%@include file="/WEB-INF/me/me_right.jsp"%>

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
</html>