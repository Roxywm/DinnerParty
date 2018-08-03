<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="head">
    <div class="wrap clearfix">
        <a href="index.html" class="logo indent">logo</a>
        <div class="headr fr">
            <form action="active.html" method="post" class="headsearch">
                <label class="label">
                    <input type="text" value="" name="" class="key">
                    <span class="text">搜索地址、名称、时间等</span>
                </label>
                <button type="submit" class="button btn-search">&#xe628;</button>
            </form>
            <a href="${ctx}/dinner/create"><em><img src="${ctx}/static/images/sb.png"></em>  &nbsp;&nbsp;发布我的饭局</a>
            <div class="user">
        <span class="clearfix"><span class="userimg" style="overflow: hidden">
            <c:if test="${loginUser.icon!=null}">
                <img src="${ctx}/userIcon/${loginUser.icon}">
            </c:if>
            <c:if test="${loginUser.icon==null}">
                <img src="${ctx}/static/images/usericon.png">
            </c:if>

            <i></i></span>
        <a href="javascript:;" class="fr">${loginUser.nickname}  <em>&#xe607;</em></a></span>
                <ul class="topslide">
                    <li><em>&#xe627;</em><a href="${ctx}/user/edit">个人设置</a></li>
                    <li><em>&#xe63d;</em><a href="Message.html">消息中心<s>3</s></a></li>
                    <li><em>&#xe63c;</em><a href="Dinner.html">饭局管理</a></li>
                    <li><em>&#xe63e;</em><a href="fans.html">我的好友</a></li>
                    <li><em>&#xe611;</em><a href="${ctx}/user/logout">退出</a></li>
                </ul>
            </div>
        </div>
    </div>
</div>