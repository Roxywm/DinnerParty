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
    <title>美滋滋·私厨 - 申请参加</title>
</head>
<body>
<%@include file="/common/user_head.jsp"%>

<div class="wrap">
    <div class="sign-title tc">
        <h1>我要申请报名</h1>
        亲爱的<a href="#" class="o">${loginUser.nickname}</a>，欢迎申请<span class="o">${dinner.titel}</span>
    </div>

    <div class="membox clearfix">
        <div class="userinfo fl">
            <a href="#" class="img"><img src="${ctx}/userIcon/${loginUser.icon}"></a>
            ${loginUser.nickname}
        </div>
        <div class="txt fr">
            <h1>你永远不会知道，这一秒的选择，将会在未来有怎样的惊奇收获。</h1>
            旅行途中的那个夜里，在申请截止时间三分钟之前，抱着“Just do it”的想法按键提交了申请赶上了末班车…于是自己真的于1260人之中 获选第3期爱·新鲜体验官，获得这个千万人艳羡的机会。
        </div>
    </div>

    <div class="Application mt30">
        <form action="${ctx}/mutually/dinner/applyParty" method="post">
            <input type="hidden" name="dinnerId" value="${dinner.id}">
            <table class="apptab">
                <tr>
                    <th><em class="ico"></em>申请理由：</th>
                    <td>
                        <p class="boxw clearfix"><span class="fr">还可以输入<span class="o" id="textCount" >90</span>字</span>(为了提高申请成功率，请如实填写）</p>
                        <textarea name="reason" cols="" rows="" id="TextArea1" class="boxw TextArea" onkeyup="words_deal();"></textarea>
                    </td>
                </tr>
                <tr>
                    <th>备注：</th>
                    <td>
                        <p class="clearfix">(是否有忌口和过敏问题）</p>
                        <textarea name="remark" cols="" rows="" class="boxw TextArea"></textarea>
                        <div class="Release-submit tl">
                            <input name="" type="checkbox" id="Myreder">  我已阅读并同意<a href="#" class="o">《美滋滋服务条款》</a>
                            <p class="mt20">
                                <button type="submit" disabled id="submitBtn" style="background: #CCCCCC" class="button btn-submit Appbtn">提交</button>
                                <button type="button" name="" value="" class="button btn-reset Appbtn">取消</button></p>
                        </div>
                    </td>
                </tr>
            </table>
        </form>
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

    $("#Myreder").click(function () {
        var aaa = $("#Myreder").prop("checked");
        if(aaa){
            $("#submitBtn").removeAttr("style");
            $("#submitBtn").removeAttr("disabled");
        }else{
            $("#submitBtn").attr("style","background: #CCCCCC");
            $("#submitBtn").attr("disabled",true);
        };
    })

</script>
</body>
</html>