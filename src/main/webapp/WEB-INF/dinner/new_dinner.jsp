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
        <div class="location tr"><a href="${ctx}/mutually/dinner/joinDinner">参加的饭局</a><a href="${ctx}/mutually/dinner/hostDinner">主办的饭局</a><a href="${ctx}/mutually/dinner/create" class="current" style="font-weight: bold">发布饭局</a></div>
        <c:if test="${user.hostStatus==0}">
            <c:if test="${applyHost==null}">
                <div class="Participate pd30">
                    你还不是主持人，请<a href="${ctx}/user/applyHost/createApply" class="blue" style="margin: auto;">申请成为主持人</a>
                </div>
            </c:if>
            <c:if test="${applyHost.status==0}">
                <div class="Participate pd30">
                你已提交主持人申请，请耐心等待工作人员审核！
                </div>
            </c:if>
        </c:if>

        <c:if test="${user.hostStatus==1}">
            <div class="Participate pd30">
                <form action="${ctx}/mutually/dinner/create" method="post" enctype="multipart/form-data">
                    <table class="baseinfo participate-tab">
                        <tr>
                            <th>活动标题：</th>
                            <td><input type="text" name="titel" value="" class="baseipt"></td>
                        </tr>
                        <tr>
                            <th>活动价格：</th>
                            <td><input type="text" name="price" value="" class="baseipt"> 人/元</td>
                        </tr>
                        <tr>
                            <th>报名人数：</th>
                            <td><input type="text" name="maximum" value="" class="baseipt" style="width:185px"> 人</td>
                        </tr>
                        <tr>
                            <th>活动时间：</th>
                            <td>
                                <input class="Wdate" type="text" name="startDate" onfocus="WdatePicker({minDate:'%y-%M-{%d+1}',isShowClear:false,isShowToday:false,readOnly:true})"/>&nbsp;&nbsp;&nbsp;&nbsp;
                                截至报名时间：<input id="" class="Wdate" name="endDate" type="text" onfocus="WdatePicker({minDate:'%y-%M-{%d+1}',isShowClear:false,isShowToday:false,readOnly:true})"/></td>
                        </tr>
                        <tr>
                            <%--<th>活动玩法：</th>--%>
                            <th>活动类型：</th>
                            <td>
                                <select style="width:185px;" name="categoryId" class="chosen-select-no-single" tabindex="9">
                                    <c:forEach items="${categoryList}" var="category">
                                        <option value="${category.id}">${category.name}</option>
                                    </c:forEach>
                                </select>
                                <%--<label><input type="radio" name="RadioGroup1" value="先到先得" id="RadioGroup1_0"> 先到先得 </label>--%>
                                <%--<label><input type="radio" name="RadioGroup1" value="双向选择" id="RadioGroup1_1">  双向选择 </label>--%>
                                <%--<label><input type="radio" name="RadioGroup1" value="大数据匹配" id="RadioGroup1_2">  大数据匹配 </label>--%>
                            </td>
                        </tr>
                        <tr>
                            <th valign="top">活动标签：</th>
                            <td class="label-active">
                                <a href="javascript:;" class="label-name">标签</a><a href="javascript:;" class="label-name">标签</a><a href="javascript:;" class="label-name">标签</a><a href="javascript:;" class="label-name">标签</a><a href="javascript:;" class="label-name">标签</a>
                                <p class="mt10"><input type="text" name="label" value="" class="baseipt"> 多个标签请用“空格”分开</p>
                            </td>
                        </tr>
                    </table>
                    活动照片：
                    <div class="photo clearfix">
                        <div class="photo-control fl">
                            <div class="active-photo img"><img id="ImgPr"></div>
                            <p class="mt10 clearfix"><a href="javascript:;" class="button dele fr">删除图片</a><label class="btn-upfiles"><input type="file" name="photo" id="up" />修改图片</label></p>
                        </div>
                        <%--<div class="photo-info fl">--%>
                            <%--<textarea name="" cols="" rows="" class="area"></textarea>--%>
                        <%--</div>--%>
                    </div>
                    <div class="photo clearfix">
                        <div class="photo-control fl">
                            <div class="active-photo img " id="ImgPr3">
                                <img id="ImgPr2">
                            </div>
                            <div id="imgBox">

                            </div>
                            <p class="mt10 tc">
                                <label class="btn-upfiles">
                                    <%--<input type="file" name="photos" id="up2" />--%>
                                     <input type="file" name="files" id="file_input" multiple/>添加

                                </label>
                            </p>

                        </div>
                        <%--<div class="photo-info fl">--%>
                            <%--<textarea name="" cols="" rows="" class="area"></textarea>--%>
                        <%--</div>--%>
                    </div>
                    <p class="mt30">活动详情：</p>
                    <textarea name="details" cols="" rows="" class="area2"></textarea>
                    <div class="Release-submit">
                        <input type="checkbox" id="Myreder">  我已阅读并同意<a href="#" class="o">《17素材服务条款》</a>
                        <p class="mt20"><button type="submit" style="background: #CCCCCC" disabled  id="submitBtn" class="button btn-submit">提交</button><button type="button" name="" value="" class="button btn-reset">取消</button></p>
                    </div>
                </form>
            </div>
        </c:if>
    </div>


    <%@include file="/WEB-INF/me/me_right.jsp"%>

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
<script type="text/javascript">
    window.onload = function(){
        var input = document.getElementById("file_input");
        //var fd;  //FormData方式发送请求
        var oInput = document.getElementById("file_input");
        if(typeof FileReader==='undefined'){
            alert("抱歉，你的浏览器不支持 FileReader");
            input.setAttribute('disabled','disabled');
        }else{
            input.addEventListener('change',readFile,false);
        }//handler
        function readFile(){
            fd = new FormData();
            var iLen = this.files.length;
            var index = 0;
            for(var i=0;i<iLen;i++){
                if (!input['value'].match(/.jpg|.gif|.png|.jpeg|.bmp/i)){//判断上传文件格式
                    return alert("上传的图片格式不正确，请重新选择");
                }
                var reader = new FileReader();
                reader.index = i;
                //fd.append(i,this.files[i]);
                reader.readAsDataURL(this.files[i]);  //转成base64
                reader.fileName = this.files[i].name;
                reader.onload = function(e){
                    var imgMsg = {
                        name : this.fileName,//获取文件名
                        base64 : this.result   //reader.readAsDataURL方法执行完后，base64数据储存在reader.result里
                    }
                    result = '<button class="delete">删除</button><div class="result"><img src="'+this.result+'" alt=""/></div>';
                    var div = document.createElement('div');
                    div.innerHTML = result;
                    div['className'] = 'myfloat';
                    div['index'] = index;
                    document.getElementById('imgBox').appendChild(div);  　　//插入dom树
                    var img = div.getElementsByTagName('img')[0];
                    img.onload = function(){
                        var nowHeight = ReSizePic(this); //设置图片大小
                        this.parentNode.style.display = 'block';
                        var oParent = this.parentNode;
                        if(nowHeight){
                            oParent.style.paddingTop = (oParent.offsetHeight - nowHeight)/2 + 'px';
                        }
                    }
                    div.onclick = function(){
                        this.remove();                  // 在页面中删除该图片元素
                        //delete dataArr[this.index];  // 删除dataArr对应的数据
                        var aa = $("#imgBox").children();
                        if(aa.length==0){
                            $("#ImgPr3").removeAttr("style");
                        }
                    }
                    index++;
                }
            }
            $("#ImgPr3").attr("style","display: none");
        }
    }

    function ReSizePic(ThisPic) {
        var RePicWidth = 150; //这里修改为您想显示的宽度值

        var TrueWidth = ThisPic.width; //图片实际宽度
        var TrueHeight = ThisPic.height; //图片实际高度

        if(TrueWidth>TrueHeight){
            //宽大于高
            var reWidth = RePicWidth;
            ThisPic.width = reWidth;
            //垂直居中
            var nowHeight = TrueHeight * (reWidth/TrueWidth);
            return nowHeight;  //将图片修改后的高度返回，供垂直居中用
        }else{
            //宽小于高
            var reHeight = RePicWidth;
            ThisPic.height = reHeight;
        }
    }
</script>
</html>