<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="head">
    <div class="wrap clearfix">
        <a href="${ctx}/" class="logo indent">logo</a>
        <div class="headr fr">
            <form action="${ctx}/find/dinner/search" method="post" class="headsearch" onsubmit="return check()">
                <label class="label">
                    <input type="text" id="keyword" name="keyword" class="key">
                    <span class="text">搜索地址、名称、时间等</span>
                </label>
                <button type="submit" class="button btn-search">&#xe628;</button>
            </form>
            <a href="${ctx}/mutually/dinner/create"><em><img src="${ctx}/static/images/sb.png"></em>  &nbsp;&nbsp;发布我的饭局</a>
            <div class="user">
        <span class="clearfix"><span class="userimg" style="overflow: hidden">
            <img src="${ctx}/userIcon/${loginUser.icon}<c:if test="${loginUser==null}">usericon.png</c:if>">
            <i></i></span>
        <a href="${ctx}/user/home" class="fr">${loginUser.nickname}  <em>&#xe607;</em></a></span>
                <ul class="topslide">
                    <li><em>&#xe627;</em><a href="${ctx}/user/edit">个人设置</a></li>
                    <li><em>&#xe63d;</em><a href="Message.html">消息中心<%--<s>3</s>--%></a></li>
                    <li><em>&#xe63c;</em><a href="${ctx}/mutually/dinner/joinDinner">饭局管理</a></li>
                    <li><em>&#xe63e;</em><a href="fans.html">我的好友</a></li>
                    <li><em>&#xe611;</em><a href="${ctx}/user/logout">退出</a></li>
                </ul>
            </div>
        </div>
    </div>
    <script>
        function check(){
            var keyword = $("#keyword").val();
            if(keyword ==  null || keyword == ''){
                alert("关键字不能为空");
                return false;
            }
            return true;
        }
    </script>
</div>