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
    <title>美滋滋·私厨 - 编辑信息</title>
</head>
<body>
<%@include file="/common/user_head.jsp"%>

<div class="mem-banner" style="background-image:url(${ctx}/static/upload/img11.jpg);"></div>


<div class="memwrap wrap clearfix">
    <div class="section fl">
        <div class="location tr"><a href="${ctx}/user/edit" class="current" style="font-weight: bold;">基本资料</a><a href="${ctx}/user/edit/pwd">修改密码</a><a href="${ctx}/user/edit/binding">帐号绑定</a></div>
        <div class="pd20">
            <c:if test="${not empty error}">
                <div class="Prompt red" style="padding:0 0 10px; margin-left: 100px;">${error}</div>
            </c:if>
            <c:if test="${not empty message}">
                <div class="Prompt green" style="padding:0 0 10px; margin-left: 100px;">${message}</div>
            </c:if>
            <form action="${ctx}/user/update" enctype="multipart/form-data" method="post">
                <input type="hidden" name="id" value="${user.id}">
                <table class="baseinfo">
                    <tr>
                        <th>账号：</th>
                        <td>${user.email}</td>
                        <input type="hidden" name="email" value="${user.email}">
                    </tr>
                    <tr>
                        <th>昵称：</th>
                        <td><input type="text" name="nickname" value="${user.nickname}" class="baseipt"></td>
                    </tr>
                    <tr>
                        <th valign="top">头像：</th>
                        <td>
                            <div class="user-photo img fl">
                                <c:if test="${user.icon!=null}">
                                    <img id="ImgPr" src="${ctx}/userIcon/${user.icon}">
                                </c:if>
                                <c:if test="${user.icon==null}">
                                    <img id="ImgPr" src="${ctx}/static/images/usericon.png">
                                </c:if>
                            </div>
                            <div class="upfilebox f14 mt20">
                                <label class="btn-upfiles">
                                    <input type="file" name="photo" id="up" />选择照片
                                </label>
                                <p class="mt10">支持jpg,gif,png格式，建议尺寸大于100*100。</p>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <th>性别：</th>
                        <td>
                            <label><input type="radio" name="sex" value="男" id="RadioGroup1_0" <c:if test="${user.sex=='男'||user.sex==null}">checked</c:if>>  男</label>&nbsp;&nbsp;&nbsp;&nbsp;
                            <label><input type="radio" name="sex" value="女" id="RadioGroup1_1" <c:if test="${user.sex=='女'}">checked</c:if>>  女</label>
                        </td>
                    </tr>
                    <tr>
                        <th>职业：</th>
                        <td><input type="text" name="job" value="${user.job}" class="baseipt"></td>
                    </tr>
                    <tr>
                        <th>所在城市：</th>
                        <td>
                            <select data-placeholder="北京市" id="province" style="width:185px;" class="chosen-select-no-single" tabindex="9">
                            </select>
                            <select data-placeholder="北京市" name="cityId" id="city" style="width:185px;" class="chosen-select-no-single" tabindex="9">
                            </select>
                            <select data-placeholder="&nbsp;" name="areaId" id="area" style="width:185px;" class="chosen-select-no-single" tabindex="9">
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <th valign="top">个人简介：</th>
                        <td>
                            <textarea name="about" cols="" rows="" class="baseinfo-textarea">${user.about}</textarea>
                            <p class="mt30 tc"><button type="submit" name="save" class="button btn-save">保存</button></p>
                        </td>
                    </tr>
                </table>
            </form>

        </div>
    </div>

    <%@include file="/WEB-INF/me/me_right.jsp"%>
</div>

<!-- foot -->
<%@include file="/common/user_foot.jsp"%>

<script src="${ctx}/static/js/jquery.js"></script>
<script src="${ctx}/static/js/Action.js"></script>
<script src="${ctx}/static/js/upfiles.js"></script>
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
        $("#up").uploadPreview({
            Img: "ImgPr",
        });
    });
</script>
<script>
    $(function () {
        $.getJSON("${ctx}/area/getCitys", {"provinceId":"0"}, function (data) {
            $("#province").empty();
            $.each(data,function(i,v){
                var $tr = $("<option value='"+v.id+"'>"+v.name+"</option>");
                $("#province").append($tr);
            });
            $(".chosen-select-no-single").trigger("chosen:updated");
        } );
        $.getJSON("${ctx}/area/getCitys", {"provinceId":110000}, function (data) {
            $("#city").empty();
            $.each(data,function(i,v){
                var $tr = $("<option value='"+v.id+"'>"+v.name+"</option>");
                $("#city").append($tr);
            });
            $(".chosen-select-no-single").trigger("chosen:updated");
        } );
    })

    $("#province").change(function () {
        var parentId = $(this).val();
        $.getJSON("${ctx}/area/getCitys", {"provinceId":parentId}, function (data) {
            $("#city").empty();
            $.each(data,function(i,v){
                var $tr = $("<option value='"+v.id+"'>"+v.name+"</option>");
                $("#city").append($tr);
            });
            $(".chosen-select-no-single").trigger("chosen:updated");
        } );
    });

    $("#city").change(function () {
        var parentId = $(this).val();
        $.getJSON("${ctx}/area/getCitys", {"provinceId":parentId}, function (data) {
            $("#area").empty();
            $.each(data,function(i,v){
                var $tr = $("<option value='"+v.id+"'>"+v.name+"</option>");
                $("#area").append($tr);
            });
            $(".chosen-select-no-single").trigger("chosen:updated");
        } );
    });

    $("#area").change(function () {
    });
</script>
</html>