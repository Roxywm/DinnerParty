<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="head">
    <div class="wrap clearfix">
        <a href="${ctx}/" class="logo indent">logo</a>
        <div class="headr fr">
            <form action="${ctx}/find/dinner/search" method="post" class="headsearch" onsubmit="return check1()">
                <label class="label">
                    <input type="text" id="keyword1" name="keyword" class="key">
                    <span class="text">搜索地址、名称、时间等</span>
                </label>
                <button type="submit" class="button btn-search">&#xe628;</button>
            </form>
            <a href="${ctx}/mutually/dinner/create"><em><img src="${ctx}/static/images/sb.png"></em>  &nbsp;&nbsp;发布我的饭局</a>
            <div class="user">
            <span class="clearfix">
                <span class="userimg" style="overflow: hidden">
                    <a href="${ctx}/user/edit">
                        <img src="${ctx}/userIcon/${loginUser.icon}<c:if test="${loginUser==null}">usericon.png</c:if>">
                        <i></i>
                    </a>
                </span>
                <c:if test="${empty loginUser}">
                    <a href="${ctx}/user/login" class="fl" style="margin-left: 20px">登陆</a>
                    <a href="${ctx}/user/register" class="fl" style="margin-left: 10px">注册</a>
                </c:if>
                <c:if test="${not empty loginUser}">
                    <a href="${ctx}/me/meHome" class="fr">${loginUser.nickname}  <em>&#xe607;</em></a>
                </c:if>
            </span>
                <c:if test="${not empty loginUser}">
                    <ul class="topslide">
                        <li><em>&#xe627;</em><a href="${ctx}/user/edit">个人设置</a></li>
                            <%--<li><em>&#xe63d;</em><a href="Message.html">消息中心<s>3</s></a></li>--%>
                        <li><em>&#xe63c;</em><a href="${ctx}/mutually/dinner/joinDinner">饭局管理</a></li>
                        <li><em>&#xe63e;</em><a href="${ctx}/me/meConcern">我的好友</a></li>
                        <li><em>&#xe611;</em><a href="${ctx}/user/logout">退出</a></li>
                    </ul>
                </c:if>
            </div>
        </div>
    </div>
    <script>
        function check1(){
            var keyword = $("#keyword1").val();
            if(keyword ==  null || keyword == ""){
                layer.msg("关键字不能为空");
                return false;
            }
            return true;
        }
    </script>
</div>