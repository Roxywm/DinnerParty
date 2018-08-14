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
    <link type="image/x-icon" href="${ctx}/static/images/" rel="shortcut icon" />
    <link href="${ctx}/static/images/favicon.ico" rel="bookmark icon" />
    <title>美滋滋·私厨 - TA参加的饭局</title>
</head>
<body>
<%@include file="/common/user_head.jsp"%>

<div class="mem-banner" style="background-image:url(${ctx}/static/upload/img11.jpg);"></div>


<div class="memwrap wrap clearfix">
    <div class="section fl">
        <div class="location tr"><a href="${ctx}/he/heMain?userId=${user.id}" class="current" style="font-weight: bold;">参加的饭局</a><a href="${ctx}/he/heHostDinner?userId=${user.id}">发布的饭局</a><a href="${ctx}/he/heMessage?userId=${user.id}">TA的评价</a><a href="${ctx}/he/heConcern?userId=${user.id}">TA的关注</a></div>

        <div class="Participate pd30">
            <c:if test="${fn:length(page.list)==0}">
                <div class="Participate pd30">
                    TA这里空空如也！
                </div>
            </c:if>
            <c:forEach items="${page.list}" var="applyParty">
                <div class="item">
                    <a href="#" class="user img"><img src="${ctx}/userIcon/${applyParty.dinner.user.icon}"></a>
                    <div class="hd"><span class="username">${applyParty.dinner.user.nickname}</span>  报名了  <span class="Period">NO.${applyParty.dinner.id}期活动</span></div>
                    <div class="bd">
                        <c:if test="${applyParty.dinner.endTime.time < newDate.time}">
                            <span class="Expired indent">已过期</span>
                        </c:if>
                        <div class="Activity-img img"><a href="${ctx}/mutually/dinner/dinnerDetail?dinnerId=${applyParty.dinner.id}"><img src="${ctx}/uploads/${applyParty.dinner.thumbnail}"></a></div>
                        <div class="txt">
                            <div class="title"><a href="${ctx}/mutually/dinner/dinnerDetail?dinnerId=${applyParty.dinner.id}">${applyParty.dinner.titel}</a></div>
                            <div class="info">${applyParty.dinner.details}</div>
                            <p class="mt10"><a href="#" target="_blank">先到先得</a>    <a href="#" target="_blank">双向选择</a>    <a href="#" target="_blank">大数据匹配</a></p>
                            <p class="Status-wrap mt5 clearfix">
                                <span class="ff4800 fr">报名费：${applyParty.dinner.price}元</span>
                                <a href="#" class="Status">评论</a>
                                <%--<span class="Selected"><em class="myfont">&#xe64b;</em>已选中</span>--%>
                            </p>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>
        <!--Pagination-->
        <c:if test="${fn:length(page.list)!=0}">
            <div class="page mt20 clearfix">
                <c:if test="${page.prePage!=0}">
                    <a href="?pageNum=${page.prePage}" class="prev"><em></em>上一页</a>
                </c:if>
                <c:if test="${page.prePage==0}">
                    <a href="javascript:void(0);" class="prev"><em></em>上一页</a>
                </c:if>
                <c:forEach begin="1" end="${page.pages}" var="p">
                    <c:if test="${p==page.pageNum}"><span>${p}</span></c:if>
                    <c:if test="${p!=page.pageNum}"><a href="?pageNum=${p}">${p}</a></c:if>
                </c:forEach>
                <c:if test="${page.nextPage!=0}">
                    <a href="?pageNum=${page.nextPage}" class="next">下一页<em></em></a>
                </c:if>
                <c:if test="${page.nextPage==0}">
                    <a href="javascript:void(0);" class="next">下一页<em></em></a>
                </c:if>
            </div>
        </c:if>
    </div>


    <%@include file="he_right.jsp"%>

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
<script>
    var flag = ${isConcern==null};
    $("#concernBtn").click(function () {
        if(${loginUser!=null}){
            if(flag){
                //关注
                $.getJSON("${ctx}/he/addConcern",{"userId":${user.id}},function (data) {
                    if(data.ok){
                        $("#concernBtn").html("已关注");
                        flag = false;
                    }else{
                        alert(data.error);
                    }
                })
            }else{
                //取消关注
                $.getJSON("${ctx}/he/cancelConcern",{"userId":${user.id}},function (data) {
                    if(data.ok){
                        $("#concernBtn").html(" + 关注");
                        flag = true;
                    }else{
                        alert(data.error);
                    }
                })
            }

        }else{
            window.location.href="${ctx}/user/login";
        }
    })
</script>
</html>