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
    <title>17素材·私厨 - 为你推荐遍布全球最新鲜，最与众不同的顶级生活方式</title>
</head>
<body>
<%@include file="/common/user_head.jsp"%>

<div class="mem-banner" style="background-image:url(${ctx}/static/upload/img11.jpg);"></div>


<div class="memwrap wrap clearfix">
    <div class="section fl">
        <div class="location tr"><a href="${ctx}/me/meHome">首页</a><a href="${ctx}/me/meDinner">我的饭局</a><a href="${ctx}/me/meFollow" class="current" style="font-weight: bold">我的关注</a><a href="${ctx}/me/meMessage">我的留言</a></div>
        <div class="message pd30">
            <%--<div class="plmain">--%>
                <%--<div class="plm clearfix"><span class="fr">(您还可输入 <span id="textCount">90</span> 个字)</span>给TA留下一句话吧……</div>--%>
                <%--<div class="textarea_input"><textarea id="TextArea1" onkeyup="words_deal();" ></textarea></div>--%>
                <%--<div class="tool_submit tr"><button type="button" name="" value="" class="button sublist">留 言</button></div>--%>
            <%--</div>--%>

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
    </div>

    <%@include file="/WEB-INF/me/me_right.jsp"%>


</div>

<script src="${ctx}/static/js/jquery.js"></script>
<script src="${ctx}/static/js/Action.js"></script>

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