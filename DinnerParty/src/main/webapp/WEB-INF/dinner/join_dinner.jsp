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
        <div class="location tr"><a href="${ctx}/mutually/dinner/joinDinner" class="current" style="font-weight: bold">参加的饭局</a><a href="${ctx}/mutually/dinner/hostDinner">主办的饭局</a><a href="${ctx}/mutually/dinner/create">发布饭局</a></div>
        <div class="Participate pd30">
            <c:if test="${fn:length(page.list)==0}">
                <div class="Participate pd30">
                    您目前没有参加任何饭局活动！
                </div>
            </c:if>
            <c:forEach items="${page.list}" var="applyParty">
                <div class="item">
                    <a href="#" class="user img"><img src="${ctx}/userIcon/${applyParty.user.icon}"></a>
                    <div class="hd"><span class="username">${applyParty.user.nickname}</span>  报名了  <span class="Period">NO.${applyParty.dinner.id}期活动</span></div>
                    <div class="bd">
                        <c:if test="${applyParty.dinner.endTime.time < newDate.time}">
                            <span class="Expired indent">已过期</span>
                        </c:if>

                        <div class="Activity-img img"><a href="detail.html"><img src="${ctx}/uploads/${applyParty.dinner.thumbnail}"></a></div>
                        <div class="txt">
                            <div class="title"><a href="${ctx}/mutually/dinner/dinnerDetail?dinnerId=${applyParty.dinner.id}">${applyParty.dinner.titel}</a></div>
                            <div class="info">${applyParty.dinner.details}</div>
                            <%--<p class="mt10"><a href="#" target="_blank">先到先得</a>    <a href="#" target="_blank">双向选择</a>    <a href="#" target="_blank">大数据匹配</a></p>--%>
                            <p class="mt10"><a href="javascript:;" target="_blank">${applyParty.dinner.category.name}</a></p>
                            <c:if test="${applyParty.dinner.endTime.time>newDate.time}">
                                <c:if test="${applyParty.payStatus==0}">
                                    <form action="${ctx}/alipay/openPlay" method="post" class="fl">
                                        <input type="hidden" name="price" value="${applyParty.dinner.price}">
                                        <input type="hidden" name="dinnerId" value="${applyParty.dinner.id}">
                                        <input type="hidden" name="reason" value="${applyParty.reason}">
                                        <input type="hidden" name="remark" value="${applyParty.remark}">
                                        <span class="ff4800" style="margin-right: 88px">报名费：${applyParty.dinner.price}元</span>
                                        <button type="submit" class="button btn-mana">立即付款</button>
                                    </form>
                                </c:if>
                            </c:if>

                            <c:if test="${applyParty.payStatus==1}">
                                <p class="Status-wrap mt5 clearfix">
                                    <span class="ff4800 fr">报名费：${applyParty.dinner.price}元</span>
                                    <a href="#" class="Status">评论</a>
                                    <span class="Selected"><em class="myfont"></em>已选中</span>
                                </p>
                            </c:if>

                        </div>
                    </div>
                </div>
            </c:forEach>
            <!-- 分页 -->
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