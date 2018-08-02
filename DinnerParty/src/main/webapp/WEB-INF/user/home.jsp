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
    <link type="image/x-icon" href="${ctx}/static/images/" rel="shortcut icon" />
    <link href="${ctx}/static/images/favicon.ico" rel="bookmark icon" />
    <title>17素材·私厨 - 为你推荐遍布全球最新鲜，最与众不同的顶级生活方式</title>
</head>
<body>
<%@include file="/common/user_head.jsp"%>

<div class="mem-banner" style="background-image:url(${ctx}/static/upload/img11.jpg);"></div>


<div class="memwrap wrap clearfix">
    <div class="section fl">
        <div class="location tr"><a href="home.html" class="current">首页</a><a href="#">我的饭局</a><a href="follow.html">我的关注</a><a href="My_Messages.html">我的留言</a></div>
        <div class="message pd30">
            <%--<div class="plmain">--%>
                <%--<div class="plm clearfix"><span class="fr">(您还可输入 <span id="textCount">90</span> 个字)</span>给TA留下一句话吧……</div>--%>
                <%--<div class="textarea_input"><textarea id="TextArea1" onkeyup="words_deal();" ></textarea></div>--%>
                <%--<div class="tool_submit tr"><button type="button" name="" value="" class="button sublist">留 言</button></div>--%>
            <%--</div>--%>

            <div class="plmcomment mt30">
                <ul class="comment-list">
                    <li class="np-post">
                        <a href="home.html" class="fans img"><img src="${ctx}/static/upload/img12.png"></a>
                        <div class="post-body">
                            <div class="post-header clearfix">
                                <a href="home.html" class="name">大郭郭呐</a>发布了  no.01期活动
                            </div>
                            <div class="Participate children">
                                <div class="item">
                                    <div class="bd">
                                        <div class="Activity-img img"><img src="${ctx}/static/upload/img14.jpg"></div>
                                        <div class="txt">
                                            <div class="title">价值350元高级自助餐免费抢！</div>
                                            <div class="info">最近，因为各种事，总是会觉得有些委屈，有些难过，也会掉泪，甚至觉得自己不能够好好的活着，偶然看到写着“活着”这两个字，我想知道，郝云的专辑里是否蕴藏...	</div>
                                            <p class="mt10"><a href="#" target="_blank">先到先得</a>    <a href="#" target="_blank">双向选择</a>    <a href="#" target="_blank">大数据匹配</a></p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </li>
                    <li class="np-post">
                        <a href="home.html" class="fans img"><img src="${ctx}/static/upload/img12.png"></a>
                        <div class="post-body">
                            <div class="post-header clearfix">
                                <a href="home.html" class="name">大郭郭呐</a>发布了  no.01期活动
                            </div>
                            <div class="Participate children">
                                <div class="item">
                                    <div class="bd">
                                        <div class="Activity-img img"><img src="${ctx}/static/upload/img14.jpg"></div>
                                        <div class="txt">
                                            <div class="title">价值350元高级自助餐免费抢！</div>
                                            <div class="info">最近，因为各种事，总是会觉得有些委屈，有些难过，也会掉泪，甚至觉得自己不能够好好的活着，偶然看到写着“活着”这两个字，我想知道，郝云的专辑里是否蕴藏...	</div>
                                            <p class="mt10"><a href="#" target="_blank">先到先得</a>    <a href="#" target="_blank">双向选择</a>    <a href="#" target="_blank">大数据匹配</a></p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </li>
                    <li class="np-post">
                        <a href="home.html" class="fans img"><img src="${ctx}/static/upload/img12.png"></a>
                        <div class="post-body">
                            <div class="post-header clearfix">
                                <a href="home.html" class="name">大郭郭呐</a>发布了  no.01期活动
                            </div>
                            <div class="Participate children">
                                <div class="item">
                                    <div class="bd">
                                        <div class="Activity-img img"><img src="${ctx}/static/upload/img14.jpg"></div>
                                        <div class="txt">
                                            <div class="title">价值350元高级自助餐免费抢！</div>
                                            <div class="info">最近，因为各种事，总是会觉得有些委屈，有些难过，也会掉泪，甚至觉得自己不能够好好的活着，偶然看到写着“活着”这两个字，我想知道，郝云的专辑里是否蕴藏...	</div>
                                            <p class="mt10"><a href="#" target="_blank">先到先得</a>    <a href="#" target="_blank">双向选择</a>    <a href="#" target="_blank">大数据匹配</a></p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </li>
                </ul>
                <!--Pagination-->
                <div class="page mt20 clearfix"><a href="#" class="prev"><em></em>上一页</a><span>1</span><a href="#">2</a><a href="#">3</a><a href="#">4</a>...<a href="#">23</a><a href="#" class="next">下一页<em></em></a></div>
            </div>

        </div>
    </div>

    <%@include file="/common/user_right.jsp"%>


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