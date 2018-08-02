<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="aside fr">
    <div class="pd15">
        <div class="userimg">
            <c:if test="${loginUser.icon!=null}">
                <img src="${ctx}/userIcon/${loginUser.icon}" height="145px">
            </c:if>
            <c:if test="${loginUser.icon==null}">
                <img src="${ctx}/static/images/usericon.png" height="145px">
            </c:if>
            <i></i></div>
        <div class="user-level tc">${loginUser.nickname} <em></em><em></em><em></em></div>
        <div class="tc"><a href="javascript:;" class="button btn-control btn-follow"> + 关注</a><a href="javascript:;" class="button btn-control btn-sent"><em class="myfont f18">&#xe63f;</em> 私信</a></div>
        <div class="Praise tc">${loginUser.job}，${loginUser.area.parent.parent.name}
            <c:if test="${loginUser.area.parent.parent.name != null}">-</c:if>
            ${loginUser.area.parent.name}-${loginUser.area.name} <em>&#xe61d;</em><em>&#xe61d;</em><em>&#xe61d;</em></div>

        <div class="txtwrap tc"><h1 class="f16">个人简介</h1>${loginUser.about}</div>
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