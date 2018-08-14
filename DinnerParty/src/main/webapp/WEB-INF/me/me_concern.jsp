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
    <title>美滋滋·私厨 - 我的关注</title>
</head>
<body>
<%@include file="/common/user_head.jsp"%>

<div class="mem-banner" style="background-image:url(${ctx}/static/upload/img11.jpg);"></div>


<div class="memwrap wrap clearfix">
    <div class="section fl">
        <div class="location tr"><span class="f12 fl"><em class="myfont"></em> 我已关注 <b class="o f14"> ${concernSize}</b> 人</span><a href="${ctx}/me/meConcern" class="current" style="font-weight: bold">我的关注</a><a href="${ctx}/me/meFans">我的粉丝</a></div>
        <div class="plmcomment mt30">
            <c:if test="${fn:length(page.list)==0}">
                <div class="Participate pd30">
                    您没有关注的人！
                </div>
            </c:if>
            <ul class="fans">
                <c:forEach items="${page.list}" var="concern">
                    <li>
                        <a href="${ctx}/he/heMain?userId=${concern.concernUser.id}" class="img"><img src="${ctx}/userIcon/${concern.concernUser.icon}" style="border-radius: 50%;"></a>
                        <div class="fansinfo">
                            <div class="header"><a href="${ctx}/he/heMain?userId=${concern.concernUser.id}">${concern.concernUser.nickname}</a>
                                <c:if test="${concern.concernUser.sex=='男'}"><em class="ico male">男</em></c:if>
                                <c:if test="${concern.concernUser.sex=='女'}"><em class="ico female">女</em></c:if>
                            </div>
                                ${concern.concernUser.about}
                        </div>
                        <div class="Status">
                            <a href="#" class="Pull">拉黑名单</a><a href="javascript:;" class="follow-btn"><span class="concerns"><em class="myfont">&#xe610;</em>已关注</span><span class="Unfollow">取消关注</span></a> <a href="#" class="Private-letter"><em class="myfont">&#xe63f;</em>私信</a>
                        </div>
                    </li>
                </c:forEach>
            </ul>

            <!--Pagination-->
            <div class="page mt20 clearfix">
                <c:if test="${fn:length(page.list)!=0}">
                    <div class="page mt20 clearfix">
                        <c:if test="${page.prePage!=0}">
                            <a href="?pageNum=${page.prePage}" class="prev"><em></em>上一页</a>
                        </c:if>
                        <c:if test="${page.prePage==0}">
                            <a href="javascript:;" class="prev"><em></em>上一页</a>
                        </c:if>
                        <c:forEach begin="1" end="${page.pages}" var="p">
                            <c:if test="${p==page.pageNum}"><span>${p}</span></c:if>
                            <c:if test="${p!=page.pageNum}"><a href="?pageNum=${p}">${p}</a></c:if>
                        </c:forEach>
                        <c:if test="${page.nextPage!=0}">
                            <a href="?pageNum=${page.nextPage}" class="next">下一页<em></em></a>
                        </c:if>
                        <c:if test="${page.nextPage==0}">
                            <a href="javascript:;" class="next">下一页<em></em></a>
                        </c:if>
                    </div>
                </c:if>
            </div>
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