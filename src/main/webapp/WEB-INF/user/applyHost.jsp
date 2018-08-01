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
    <link href="favicon.ico" rel="SHORTCUT ICON">
    <title>17素材·私厨 - 为你推荐遍布全球最新鲜，最与众不同的顶级生活方式</title>
</head>
<body>
<%@include file="/common/user_head.jsp"%>

<div class="wrap">
    <div class="sign-title tc" style=" -webkit-opacity: 0.3; -moz-opacity: 0.3; -khtml-opacity: 0.3;  opacity: .3; filter:alpha(opacity=30);  ">
        <h1>申请成为一名HOST</h1>
        亲爱的<a href="#" class="o">wang</a>，欢迎申请成为一名<span class="o"> “HOST”</span>
    </div>

    <div class="applybox">
        <form action="${ctx}/user/dinner/applyHost" method="post">
            <h1>请认真填写您申请<span class="o">“HOST”</span>信息，提交成功后，无法修改哦！</h1>
            <ul class="apply-form baseinfo">
                <li><span class="tt"><em>&#xe627;</em>姓名</span><input type="text" name="name" value="" class="inpt"></li>
                <li><span class="tt"><em>&#xe629;</em>城市</span>
                    <select data-placeholder="上海市" style="width:285px;" class="chosen-select-no-single" tabindex="9">
                        <option>上海市</option>
                        <option>上海市</option>
                    </select>
                    <select data-placeholder="上海市" style="width:285px;" class="chosen-select-no-single" tabindex="9">
                        <option>上海市</option>
                        <option>上海市</option>
                    </select>
                    <select name="city" data-placeholder="普陀区" style="width:285px;" class="chosen-select-no-single" tabindex="9">
                        <option>普陀区</option>
                        <option>普陀区</option>
                    </select>
                </li>
                <li><span class="tt"><em class="f16">&#xe63f;</em>你的邮箱</span> <span class="c999">  <input type="email" name="email" value="" class="inpt" >  （请填写您常用的邮箱，方便我们联系到您）</span>
                </li>
                <li><span class="tt"><em class="f16">&#xe642;</em>您的联系电话/手机</span> <span class="c999">  <input type="text" name="mobile" value="" class="inpt" >  （请填写您常用的电话或手机，方便我们联系到您）</span>
                </li>
                <li class="c999">
                    <div class="pd15">以下问题请上传图片<br>这些照片将作为我们对您是否能发布家宴活动的重要依据、照片要求清晰，每位申请人我们只会审核一次，请认真填写哦！<br>所有照片所有权均属于申请人，我们只用于审核之用。</div>
                </li>
                <li><span class="tt"><em>&#xe643;</em>请上传一张您在烹饪中的照片（必须为本人）</span>
                    <div class="pd15 clearfix">
                        <div class="active-photo img fl"><img id="ImgPr2"></div>
                        <label class="btn-upfiles fl" style="margin-left:10px;"><input type="file" name="photo" id="up2" />修改图片</label>
                    </div>
                </li>
                <li class="bd0"><div class="Release-submit pd30">
                    <input name="" type="checkbox" value="">  我已阅读并同意<a href="#" class="o">《17素材服务条款》</a>
                    <p class="mt20"><button type="submit" class="button btn-submit Appbtn">提交</button><button type="button" class="button btn-reset Appbtn">取消</button></p>
                </div>
                </li>
            </ul>
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
</body>
</html>