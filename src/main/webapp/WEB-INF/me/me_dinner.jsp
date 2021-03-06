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
    <title>美滋滋·私厨 - 我的饭局</title>
</head>
<body>
<%@include file="/common/user_head.jsp"%>

<div class="mem-banner" style="background-image:url(${ctx}/static/upload/img11.jpg);"></div>


<div class="memwrap wrap clearfix">
    <div class="section fl">
        <div class="location tr"><a href="${ctx}/me/meHome">首页</a><a href="${ctx}/me/meDinner" class="current" style="font-weight: bold">我的饭局</a><a href="${ctx}/me/meFollow">我的关注</a><a href="${ctx}/me/meMessage">我的留言</a></div>
        <div class="message pd30">
            <%--<div class="plmain">--%>
                <%--<div class="plm clearfix"><span class="fr">(您还可输入 <span id="textCount">90</span> 个字)</span>给TA留下一句话吧……</div>--%>
                <%--<div class="textarea_input"><textarea id="TextArea1" onkeyup="words_deal();" ></textarea></div>--%>
                <%--<div class="tool_submit tr"><button type="button" name="" value="" class="button sublist">留 言</button></div>--%>
            <%--</div>--%>

            <div class="plmcomment mt30">
                <c:if test="${fn:length(page.list)==0}">
                    <div class="Participate pd30">
                        您目前没有主持任何饭局活动！
                    </div>
                </c:if>
                <ul class="comment-list">
                    <c:forEach items="${page.list}" var="dinner">
                        <li class="np-post">
                            <a href="${ctx}/he/heMain?userId=${dinner.user.id}" class="fans img"><img src="${ctx}/userIcon/${dinner.user.icon}" style="border-radius:50%;"></a>
                            <div class="post-body">
                                <div class="post-header clearfix">
                                    <a href="${ctx}/he/heMain?userId=${dinner.user.id}" class="name">${dinner.user.nickname}</a>发布了  no.${dinner.id}期活动
                                </div>
                                <div class="Participate children">
                                    <div class="item">
                                        <div class="bd">
                                            <c:if test="${dinner.endTime.time < newDate.time}">
                                                <span class="Expired indent">已过期</span>
                                            </c:if>
                                            <div class="Activity-img img"><img src="${ctx}/uploads/${dinner.thumbnail}"></div>
                                            <div class="txt">
                                                <div class="title"><a href="${ctx}/mutually/dinner/dinnerDetail?dinnerId=${dinner.id}">${dinner.titel}</a></div>
                                                <div class="info">${dinner.details}</div>
                                                <p class="mt10"><a href="#" target="_blank">先到先得</a>    <a href="#" target="_blank">双向选择</a>    <a href="#" target="_blank">大数据匹配</a></p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
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