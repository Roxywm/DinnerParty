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
        <div class="location tr"><a href="mem.html" class="current">基本资料</a><a href="pwd.html">修改密码</a><a href="binding.html">帐号绑定</a></div>
        <div class="pd20">
            <table class="baseinfo">
                <tr>
                    <th>账号：</th>
                    <td>${loginUser.account}</td>
                </tr>
                <tr>
                    <th>昵称：</th>
                    <td><input type="text" name="nickname" value="${loginUser.nickname}" class="baseipt"></td>
                </tr>
                <tr>
                    <th valign="top">头像：</th>
                    <td>
                        <c:if test="${loginUser.icon!=null}">
                            <div class="user-photo img fl"><img src="${ctx}/uploads/${loginUser.icon}"></div>
                        </c:if>
                        <c:if test="${loginUser.icon==null}">
                            <div class="user-photo img fl"><img src="${ctx}/static/images/usericon.png"></div>
                        </c:if>
                        <div class="upfilebox mt20">
                            <a href="javascript:;" class="button btn-upfile" id="user-photo">选择照片</a>
                            <p class="mt10">支持jpg,gif,png格式，建议尺寸大于100*100。</p>
                        </div>
                    </td>
                </tr>
                <tr>
                    <th>性别：</th>
                    <td>
                        <label><input type="radio" name="sex" value="男" id="RadioGroup1_0" checked>  男</label>&nbsp;&nbsp;&nbsp;&nbsp;
                        <label><input type="radio" name="sex" value="女" id="RadioGroup1_1">  女</label>
                    </td>
                </tr>
                <tr>
                    <th>职业：</th>
                    <td><input type="text" value="" class="baseipt"></td>
                </tr>
                <tr>
                    <th>所在城市：</th>
                    <td><select data-placeholder="上海市" style="width:154px;" class="chosen-select-no-single" tabindex="9">
                        <option>上海市</option>
                        <option>上海市</option>
                    </select><select data-placeholder="上海市" style="width:154px;" class="chosen-select-no-single" tabindex="9">
                        <option>上海市</option>
                        <option>上海市</option>
                    </select><select data-placeholder="长宁区" style="width:154px;" class="chosen-select-no-single" tabindex="9">
                        <option>长宁区</option>
                        <option>长宁区</option>
                    </select></td>
                </tr>
                <tr>
                    <th valign="top">个人简介：</th>
                    <td>
                        <textarea name="" cols="" rows="" class="baseinfo-textarea"></textarea>
                        <p class="mt30 tc"><button type="button" name="save" value="" class="button btn-save">保存</button></p>
                    </td>
                </tr>
            </table>
        </div>
    </div>
    <div class="aside fr">
        <div class="pd15">
            <div class="userimg"><img src="${ctx}/static/upload/img12.png"><i></i></div>
            <div class="user-level tc">大郭郭呐 <em></em><em></em><em></em></div>
            <div class="tc"><a href="javascript:;" class="button btn-control btn-follow"> + 关注</a><a href="javascript:;" class="button btn-control btn-sent"><em class="myfont f18">&#xe63f;</em> 私信</a></div>
            <div class="Praise tc">老师，中国，陕西 <em>&#xe61d;</em><em>&#xe61d;</em><em>&#xe61d;</em></div>

            <div class="txtwrap tc"><h1 class="f16">个人简介</h1>既能安静又能活泼，既能淑女又能犯二，<br>既能女汉子又能小清新～～～</div>
            <h1 class="f16">关注 4</h1>
            <ul class="followlist clearfix">
                <li><a href="#"><img src="${ctx}/static/upload/img12.png"></a></li>
                <li><a href="#"><img src="${ctx}/static/upload/img12.png"></a></li>
                <li><a href="#"><img src="${ctx}/static/upload/img12.png"></a></li>
                <li><a href="#"><img src="${ctx}/static/upload/img12.png"></a></li>
            </ul>
            <h1 class="f16">粉丝 4</h1>
            <ul class="followlist bd0 clearfix">
                <li><a href="#"><img src="${ctx}/static/upload/img12.png"></a></li>
                <li><a href="#"><img src="${ctx}/static/upload/img12.png"></a></li>
                <li><a href="#"><img src="${ctx}/static/upload/img12.png"></a></li>
                <li><a href="#"><img src="${ctx}/static/upload/img12.png"></a></li>
            </ul>
        </div>
    </div>
</div>

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
    });
</script>
</html>