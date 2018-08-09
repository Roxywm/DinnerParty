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
    <link type="image/x-icon" href="${ctx}/static/images" rel="shortcut icon" />
    <link href="${ctx}/static/images/favicon.ico" rel="bookmark icon" />
    <title>17素材·私厨 - 为你推荐遍布全球最新鲜，最与众不同的顶级生活方式</title>
</head>
<body>
<%@include file="/common/user_head.jsp"%>


<div class="activewrap wrap clearfix">
    <div class="section fl">
        <div class="Condition clearfix">
            <div class="item classfy">
                <h1>类别</h1>
                <a href="#">中餐</a><a href="#" class="current">西餐</a><a href="#">意餐</a>
            </div>
            <div class="item time">
                <h1>时间</h1>
                <input id="time" class="Wdate" type="text" onfocus="WdatePicker({minDate:'%y-%M-{%d+1}',isShowClear:false,isShowToday:false,readOnly:true})"/> - <input id="" class="Wdate" type="text" onfocus="WdatePicker({minDate:'%y-%M-{%d+1}',isShowClear:false,isShowToday:false,readOnly:true})"/>
            </div>
            <div class="item place">
                <h1>地点</h1>
                <a href="#">北京市</a><a href="#">上海市</a><a href="#">天津市</a><a href="#" class="current">重庆市</a><a href="#">吉林省</a><a href="#">河北省 </a>      </div>
            <div class="item Number">
                <h1>就餐人数</h1>
                <a href="#"> 1人</a><a href="#" class="current">2人</a><a href="#">3人</a><a href="#">4人</a><a href="#">5人</a><a href="#">6人</a>
            </div>

        </div>

        <div class="sortbar mt10 clearfix">
            <ul class="nav-pills">
                <li class="current"><a href="active.html?id=1" title="全部">全部</a></li>
                <li><a href="active.html?id=2" title="时间">时间<em class="ico time"></em></a></li>
                <li><a href="active.html?id=3" title="菜金从高到低">菜金<em class="ico price"></em></a></li>
            </ul>
            <div class="pagination-sort fr">
                <span class="page-info"><strong>1</strong>/33</span>
                <a href="javascript:;" class="myfont page-prev">&#xe606;</a>
                <a href="javascript:;" class="myfont page-next">&#xe609;</a>
            </div>

        </div>

        <ul class="active-list">
            <c:if test="${fn:length(dinnerPage.list)==0}">
                <li class="Prompt green" style="padding:0 0 10px;text-align: center;font-size: 18px;">
                    没有符合要求的结果！
                </li>
            </c:if>
            <c:forEach items="${dinnerPage.list}" var="dinner">
                <li>
                    <div class="img">
                        <a href="${ctx}/mutually/dinner/dinnerDetail?dinnerId=${dinner.id}"><img src="${ctx}/uploads/${dinner.thumbnail}" height="220px" width="730px"></a>
                        <div class="bottominfo">
                            <span class="label">
                                <c:forEach items="${dinner.label.split(' ')}" var="str">
                                    <a href="javascript:;">${str}</a>
                                </c:forEach>

                                <%--<a href="javascript:;">活动标签</a>--%>
                                <%--<a href="javascript:;">活动标签</a>--%>
                            </span>
                            <a href="${ctx}/mutually/dinner/applyParty?dinnerId=${dinner.id}" class="Sign_up">我要报名</a>
                        </div>
                    </div>
                    <div class="active-info">
                        <div class="user">
                            <a href="${ctx}/he/heMain?userId=${dinner.user.id}" class="userimg"><img src="${ctx}/userIcon/${dinner.user.icon}"></a>
                            <a href="${ctx}/he/heMain?userId=${dinner.user.id}">${dinner.user.nickname}</a><em class="user-level"></em><em class="user-level"></em><em class="user-level"></em>
                        </div>
                        <div class="txt">${dinner.details}</div>
                        <span class="o">${dinner.price}元/每人 </span>  <fmt:formatDate value='${dinner.endTime}' pattern='yyyy年MM月dd日'/>结束报名
                    </div>
                </li>
            </c:forEach>
        </ul>

        <div class="page2">
            <div class="inner">
                <c:if test="${fn:length(dinnerPage.list)!=0}">
                    <div class="page mt20 clearfix">
                        <c:if test="${dinnerPage.prePage!=0}">
                            <a href="?pageNum=${dinnerPage.prePage}" class="prev"><em></em>上一页</a>
                        </c:if>
                        <c:if test="${dinnerPage.prePage==0}">
                            <a href="javascript:;" class="prev"><em></em>上一页</a>
                        </c:if>
                        <c:forEach begin="1" end="${dinnerPage.pages}" var="p">
                            <c:if test="${p==dinnerPage.pageNum}"><span>${p}</span></c:if>
                            <c:if test="${p!=dinnerPage.pageNum}"><a href="?pageNum=${p}">${p}</a></c:if>
                        </c:forEach>
                        <c:if test="${dinnerPage.nextPage!=0}">
                            <a href="?pageNum=${dinnerPage.nextPage}" class="next">下一页<em></em></a>
                        </c:if>
                        <c:if test="${dinnerPage.nextPage==0}">
                            <a href="javascript:;" class="next">下一页<em></em></a>
                        </c:if>
                    </div>
                </c:if>
            </div>
        </div>

    </div>

    <div class="aside fr">
        <h1 class="header">热门活动</h1>
        <div class="hot-active">
            <a href="#" class="img"><img src="${ctx}/static/upload/img19.jpg"></a>
            <div class="active-info">
                <div class="user">
                    <a href="${ctx}/he/heMain?userId=${dinner.user.id}" class="userimg"><img src="${ctx}/userIcon/${dinner.user.icon}"></a>
                    <a href="${ctx}/he/heMain?userId=${dinner.user.id}">${dinner.user.nickname}</a>
                </div>
                <div class="hd"><a href="${ctx}/mutually/dinner/dinnerDetail?dinnerId=${dinner.id}">${dinner.titel}</a></div>
                <span class="o">${dinner.price}元/每人 </span>  <fmt:formatDate value='${dinner.startTime}' pattern='yyyy年MM月dd日'/>
            </div>
        </div>
        <ul class="active-news">
            <li><span class="time">[11-10]</span><a href="#">海纳创作料理价值350元高级...</a></li>
            <li><span class="time">[11-10]</span><a href="#">海纳创作料理价值350元高级...</a></li>
            <li><span class="time">[11-10]</span><a href="#">海纳创作料理价值350元高级...</a></li>
            <li><span class="time">[11-10]</span><a href="#">海纳创作料理价值350元高级...</a></li>
            <li><span class="time">[11-10]</span><a href="#">海纳创作料理价值350元高级...</a></li>
            <li><span class="time">[11-10]</span><a href="#">海纳创作料理价值350元高级...</a></li>
        </ul>
    </div>

</div>

<!--foot-->
<div class="footmenu">
    <div class="wrap clearfix">
        <div class="item bd0">
            <h1 class="hd">产品理念</h1>
            <ul>
                <li><a href="#">食品安全</a></li>
                <li><a href="#">订购流程</a></li>
                <li><a href="#">修改订单</a></li>
                <li><a href="#">冷链配送</a></li>
                <li><a href="#">全程冷链</a></li>
            </ul>
        </div>
        <div class="item">
            <h1 class="hd">产品理念</h1>
            <ul>
                <li><a href="#">食品安全</a></li>
                <li><a href="#">订购流程</a></li>
                <li><a href="#">修改订单</a></li>
                <li><a href="#">冷链配送</a></li>
                <li><a href="#">全程冷链</a></li>
            </ul>
        </div>
        <div class="item">
            <h1 class="hd">产品理念</h1>
            <ul>
                <li><a href="#">食品安全</a></li>
                <li><a href="#">订购流程</a></li>
                <li><a href="#">修改订单</a></li>
                <li><a href="#">冷链配送</a></li>
                <li><a href="#">全程冷链</a></li>
            </ul>
        </div>
        <div class="item">
            <h1 class="hd">产品理念</h1>
            <ul>
                <li><a href="#">食品安全</a></li>
                <li><a href="#">订购流程</a></li>
                <li><a href="#">修改订单</a></li>
                <li><a href="#">冷链配送</a></li>
                <li><a href="#">全程冷链</a></li>
            </ul>
        </div>
        <div class="fr">
            <img src="${ctx}/static/images/img2.jpg">
            <img src="${ctx}/static/images/img3.jpg">
        </div>
    </div>
    <div class="gotop">&#xe608;</div>
</div>
<div class="foot tc">Copyright © 2003-2015 17素材, All Rights Reserved</div>
<script src="${ctx}/static/js/jquery.js"></script>
<script src="${ctx}/static/date/WdatePicker.js"></script>
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
</body>
</html>