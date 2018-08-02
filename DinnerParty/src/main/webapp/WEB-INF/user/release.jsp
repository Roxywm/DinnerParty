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
        <div class="location tr"><a href="Dinner.html">参加的饭局</a><a href="Host.html">主办的饭局</a><a href="Release.html" class="current">发布饭局</a></div>
        <c:if test="${loginUser.hostStatus==0}">
            <c:if test="${applyHost==null}">
                <div class="Participate pd30">
                    你还不是主持人，请<a href="${ctx}/user/applyHost/createApply" class="blue" style="margin: auto;">申请成为主持人</a>
                </div>
            </c:if>
            <c:if test="${applyHost.status==0}">
                <div class="Participate pd30">
                    你已提交主持人申请，请耐心等待工作人员审核！</a>
                </div>
            </c:if>
        </c:if>

        <c:if test="${loginUser.hostStatus==1}">
            <div class="Participate pd30">
                <table class="baseinfo participate-tab">
                    <tr>
                        <th>活动标题：</th>
                        <td><input type="text" name="" value="" class="baseipt"></td>
                    </tr>
                    <tr>
                        <th>活动价格：</th>
                        <td><select data-placeholder="200" style="width:185px;" class="chosen-select-no-single" tabindex="9">
                            <option>200</option>
                            <option>200</option>
                        </select> 人/元</td>
                    </tr>
                    <tr>
                        <th>报名人数：</th>
                        <td><input type="text" name="" value="" class="baseipt" style="width:185px"> 人</td>
                    </tr>
                    <tr>
                        <th>活动时间：</th>
                        <td><input class="Wdate" type="text" onfocus="WdatePicker({minDate:'%y-%M-{%d+1}',isShowClear:false,isShowToday:false,readOnly:true})"/>&nbsp;&nbsp;&nbsp;&nbsp;截至报名时间：<input id="" class="Wdate" type="text" onfocus="WdatePicker({minDate:'%y-%M-{%d+1}',isShowClear:false,isShowToday:false,readOnly:true})"/></td>
                    </tr>
                    <tr>
                        <th>活动玩法：</th>
                        <td>
                            <label><input type="radio" name="RadioGroup1" value="先到先得" id="RadioGroup1_0"> 先到先得 </label>
                            <label><input type="radio" name="RadioGroup1" value="双向选择" id="RadioGroup1_1">  双向选择 </label>
                            <label><input type="radio" name="RadioGroup1" value="大数据匹配" id="RadioGroup1_2">  大数据匹配 </label>
                        </td>
                    </tr>
                    <tr>
                        <th valign="top">活动标签：</th>
                        <td class="label-active">
                            <a href="javascript:;" class="label-name">标签</a><a href="javascript:;" class="label-name">标签</a><a href="javascript:;" class="label-name">标签</a><a href="javascript:;" class="label-name">标签</a><a href="javascript:;" class="label-name">标签</a>
                            <p class="mt10"><input type="text" name="" value="" class="baseipt"> 多个标签请用“空格”分开</p>
                        </td>
                    </tr>
                </table>
                活动照片：
                <div class="photo clearfix">
                    <div class="photo-control fl">
                        <div class="active-photo img"><img id="ImgPr"></div>
                        <p class="mt10 clearfix"><a href="javascript:;" class="button dele fr">删除图片</a><label class="btn-upfiles"><input type="file" name="photo" id="up" />修改图片</label></p>
                    </div>
                    <div class="photo-info fl">
                        <textarea name="" cols="" rows="" class="area"></textarea>
                    </div>
                </div>
                <div class="photo clearfix">
                    <div class="photo-control fl">
                        <div class="active-photo img "><img id="ImgPr2"></div>
                        <p class="mt10 tc"><label class="btn-upfiles"><input type="file" name="photo" id="up2" />添加</label></p>

                    </div>
                    <div class="photo-info fl">
                        <textarea name="" cols="" rows="" class="area"></textarea>
                    </div>
                </div>
                <p class="mt30">活动照片：</p>
                <textarea name="" cols="" rows="" class="area2"></textarea>
                <div class="Release-submit">
                    <input name="" type="checkbox" value="">  我已阅读并同意<a href="#" class="o">《17素材服务条款》</a>
                    <p class="mt20"><button type="button" name="" value="" class="button btn-submit">提交</button><button type="button" name="" value="" class="button btn-reset">取消</button></p>
                </div>
            </div>
        </c:if>
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