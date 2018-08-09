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
    <!--[if lte IE 6]><meta http-equiv="refresh" content="0;url=IE6/IE6.html"><![endif]-->
    <link type="image/x-icon" href="${ctx}/static/images" rel="shortcut icon" />
    <link href="${ctx}/static/images/favicon.ico" rel="bookmark icon" />
    <title>17素材·私厨 - 为你推荐遍布全球最新鲜，最与众不同的顶级生活方式</title>
</head>
<body>
<%--<div class="head">--%>
    <%--<div class="wrap clearfix">--%>
        <%--<a href="index.html" class="logo indent">logo</a>--%>
        <%--<div class="headr fr">--%>
            <%--<form action="active.html" method="post" class="headsearch">--%>
                <%--<label class="label">--%>
                    <%--<input type="text" value="" name="" class="key">--%>
                    <%--<span class="text">搜索地址、名称、时间等</span>--%>
                <%--</label>--%>
                <%--<button type="submit" class="button btn-search">&#xe628;</button>--%>
            <%--</form>--%>
            <%--<a href="${ctx}/user/login">登录</a><a href="${ctx}/user/register">注册</a><a href="${ctx}/mutually/dinner/create">发布我的饭局</a>--%>
        <%--</div>--%>
    <%--</div>--%>
<%--</div>--%>
<div class="indexban" style="background-image:url(${ctx}/static/images/img1.jpg);">
    <div class="wrap">
        <a href="index.html" class="logo indent">logo</a>
        <c:if test="${not empty loginUser}">
            <div class="medium-right">
                <a href="${ctx}/me/meHome">您好！&nbsp;|&nbsp;${loginUser.nickname}</a>
                <a href="${ctx}/mutually/dinner/create">发布我的饭局</a>
            </div>
        </c:if>
        <c:if test="${empty loginUser}">
            <div class="medium-right">
                <a href="${ctx}/user/login">登陆</a>
                <a href="${ctx}/user/register">注册</a>
            </div>
        </c:if>

        <div class="txt"><span class="hd">美食与生活的完美演绎</span><a href="#">早餐</a><a href="#">午餐</a><a href="#">晚餐</a><a href="#">一键搞定</a></div>
    </div>
    <div class="p1-hero-search-form">
        <div class="wrap clearfix">
            <form action="${ctx}/find/dinner/search" method="post" class="search_form clearfix" onsubmit="return check()">
                <div class="box-wrapper">
                    <input type="text" class="input-large eat" autocomplete="off" id="keyword" name="keyword" placeholder="您想要吃什么？">
                    <span id="enter_location_error_message" class="bad hide">请告诉我您要吃什么？</span>
                </div>
                <div class="box-wrapper">
                    <select data-placeholder="地点" style="width:150px;" class="chosen-select-no-single" tabindex="9">
                        <option>地点</option>
                        <option>地点</option>
                    </select>
                </div>
                <div class="box-wrapper bd0">
                    <select data-placeholder="就餐人数" style="width:150px;" class="chosen-select-no-single" tabindex="9">
                        <option>就餐人数</option>
                        <option>2人</option>
                        <option>2人</option>
                    </select>
                </div>
                <button type="submit" class="button search-button" id="submit_search">搜索</button>
            </form>
            <div class="hot-key fl">热门搜索： <a href="active.html">早餐</a><a href="active.html">午餐</a><a href="active.html">晚餐</a><a href="active.html">西餐</a><a href="active.html">午餐</a><a href="active.html">西餐</a><a href="active.html">西餐</a></div>
        </div>
    </div>
</div>

<div class="wrap">
    <div class="row-space tc"><a href="active.html"><img src="${ctx}/static/images/txt1.png"></a></div>

    <div class="Activity clearfix">
        <a href="${ctx}/mutually/dinner/dinnerDetail?dinnerId=${dinnerPage.list.get(0).id}" class="item">
            <div class="img"><img src="${ctx}/uploads/${dinnerPage.list.get(0).thumbnail}" height="300px" width="306px"></div>
            <div class="txt">${dinnerPage.list.get(0).titel}<p class="f14">不管是跨洋过海还是跨城郊游，<br>Alice & Chris总是寻找着最本真最<br>当地化的体验。</p></div>
        </a>
        <div class="item large fr">
            <div id="full-screen-slider">
                <ul id="slides">
                    <li><a href="#" target="_blank"><img src="${ctx}/static/upload/img2.jpg"></a></li>
                    <li><a href="#" target="_blank"><img src="${ctx}/static/upload/img2.jpg"></a></li>
                    <li><a href="#" target="_blank"><img src="${ctx}/static/upload/img2.jpg"></a></li>
                </ul>
            </div>
        </div>
    </div>

    <div class="Activity mt36 clearfix">
        <a href="${ctx}/mutually/dinner/dinnerDetail?dinnerId=${dinnerPage.list.get(1).id}" class="item">
            <div class="img"><img src="${ctx}/uploads/${dinnerPage.list.get(1).thumbnail}" height="300px" width="306px"></div>
            <div class="txt">${dinnerPage.list.get(1).titel}<p class="f14">不管是跨洋过海还是跨城郊游，<br>Alice & Chris总是寻找着最本真最<br>当地化的体验。</p></div>
        </a>
        <a href="${ctx}/mutually/dinner/dinnerDetail?dinnerId=${dinnerPage.list.get(2).id}" class="item mid">
            <div class="img"><img src="${ctx}/uploads/${dinnerPage.list.get(2).thumbnail}" height="300px" width="360px"></div>
            <div class="txt">${dinnerPage.list.get(2).titel}<p class="f14">不管是跨洋过海还是跨城郊游，<br>Alice & Chris总是寻找着最本真最<br>当地化的体验。</p></div>
        </a>
        <%--<a href="${ctx}/mutually/dinner/dinnerDetail?dinnerId=${dinnerPage.list.get(3).id}" class="item mid last">--%>
            <%--<div class="img"><img src="${ctx}/uploads/${dinnerPage.list.get(3).thumbnail}" height="300px" width="360px"></div>--%>
            <%--<div class="txt">${dinnerPage.list.get(3).titel}<p class="f14">不管是跨洋过海还是跨城郊游，<br>Alice & Chris总是寻找着最本真最<br>当地化的体验。</p></div>--%>
        <%--</a>--%>
    </div>

</div>

<div class="slideshow">
    <div class="m_banner">
        <div class="ban" style=" background-image:url(${ctx}/static/upload/img6.jpg);"></div>
        <div class="ban" style=" background-image:url(${ctx}/static/upload/img6.jpg);"></div>
        <a href="javascript:;" class="ico prev"></a>
        <a href="javascript:;" class="ico next"></a>
    </div>
</div>

<div class="community">
    <div class="row-space tc"><img src="${ctx}/static/images/txt2.png"></div>
    <ul class="community-wrapper clearfix">
        <li><a href="#"><img src="${ctx}/static/upload/img7.jpg"></a></li>
        <li><a href="#"><img src="${ctx}/static/upload/img8.jpg"></a></li>
        <li><a href="#"><img src="${ctx}/static/upload/img9.jpg"></a></li>
        <li><a href="#"><img src="${ctx}/static/upload/img10.jpg"></a></li>
    </ul>
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

</body>
<script src="${ctx}/static/js/jquery.js"></script>
<script src="${ctx}/static/js/Action.js"></script>

<script src="${ctx}/static/js/jquery.jslides.js"></script>

<script src="${ctx}/static/js/index.js"></script>

<script src="${ctx}/static/js/chosen.jquery.js"></script>
<script type="text/javascript">
    var config = {
        '.chosen-select-no-single' : {disable_search_threshold:10}
    }
    for (var selector in config) {
        $(selector).chosen(config[selector]);
    }
</script>
<script>
    $(".Activity .item .txt").hover(
        function () {
            $(this).stop();
            $(this).animate({height:"130px"});
        },
        function () {
            $(this).stop();
            $(this).animate({height:"30px"});
        }
    )
    function check(){
        var keyword = $("#keyword").val();
            if(keyword ==  null || keyword == ''){
               alert("关键字不能为空");
               return false;
            }
            return true;
    }
</script>
</html>