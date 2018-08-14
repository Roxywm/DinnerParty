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
    <title>美滋滋·私厨 - 我的留言评价</title>
</head>
<body>
<%@include file="/common/user_head.jsp"%>

<div class="mem-banner" style="background-image:url(${ctx}/static/upload/img11.jpg);"></div>


<div class="memwrap wrap clearfix">
    <div class="section fl">
        <div class="location tr"><a href="${ctx}/me/meHome">首页</a><a href="${ctx}/me/meDinner">我的饭局</a><a href="${ctx}/me/meFollow">我的关注</a><a href="${ctx}/me/meMessage" class="current" style="font-weight: bold">我的留言</a></div>
        <div class="message pd30">
            <%--<div class="plmain">--%>
                <%--<div class="plm clearfix"><span class="fr">(您还可输入 <span id="textCount">90</span> 个字)</span>给TA留下一句话吧……</div>--%>
                <%--<div class="textarea_input"><textarea id="TextArea1" onkeyup="words_deal();" ></textarea></div>--%>
                <%--<div class="tool_submit tr"><button type="button" name="" value="" class="button sublist">留 言</button></div>--%>
            <%--</div>--%>

            <div class="plmcomment mt30">
                <c:if test="${fn:length(page.list)==0}">
                    <div class="Participate pd30">
                        您没有留言！
                    </div>
                </c:if>
                <ul class="comment-list">
                    <c:forEach items="${page.list}" var="userMsg">
                        <li class="np-post">
                            <a href="${ctx}/he/heMain?userId=${userMsg.msgUser.id}" class="fans img"><img src="${ctx}/userIcon/${userMsg.msgUser.icon}" style="border-radius: 50%;"></a>
                            <div class="post-body">
                                <div class="post-header clearfix">
                                    <a href="${ctx}/he/heMain?userId=${userMsg.msgUser.id}" class="name o">${userMsg.msgUser.nickname}</a>
                                    <span class="time"><fmt:formatDate value='${userMsg.msgTime}' pattern='yyyy年MM月dd日 HH:mm'/></span>
                                    <span class="dele"><em class="myfont">&#xe601;</em><a href="javascript:;"> 删除</a></span>
                                    <span class="reply"><em class="myfont">&#xe640;</em><a href="javascript:;"> 回复</a></span>
                                </div>

                                <div class="child">
                                    <%--<div class="post-header clearfix"><a href="home.html" class="name o">兜帽家的豆豆</a><span class="time">01月20日 11:11</span></div>--%>
                                    <div class="post-content"><div class="txtcon">${userMsg.message}</div></div>
                                </div>

                            </div>
                        </li>
                    </c:forEach>
                </ul>


                <!--Pagination-->
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