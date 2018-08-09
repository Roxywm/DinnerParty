<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="aside fr">
    <div class="pd15">
        <div class="userimg">
            <img src="${ctx}/userIcon/${loginUser.icon}" height="145px">
            <i></i></div>
        <div class="user-level tc">${loginUser.nickname} <em></em><em></em><em></em></div>
        <%--<div class="tc"><a href="javascript:;" class="button btn-control btn-follow" id="concernBtn"> + 关注</a><a href="javascript:;" class="button btn-control btn-sent"><em class="myfont f18">&#xe63f;</em> 私信</a></div>--%>
        <div class="Praise tc">${loginUser.job}<c:if test="${loginUser.job!=null}">，</c:if>${loginUser.area.parent.parent.name}
            <c:if test="${loginUser.area.parent.parent.name != null}">-</c:if>
            ${loginUser.area.parent.name}-${loginUser.area.name} <em>&#xe61d;</em><em>&#xe61d;</em><em>&#xe61d;</em></div>

        <div class="txtwrap tc"><h1 class="f16">个人简介</h1>${loginUser.about}</div>
        <h1 class="f16">关注 ${concernNum}</h1>
        <ul class="followlist clearfix">
            <c:forEach items="${concernPage.list}" var="concern">
                <li><a href="${ctx}/he/heMain?userId=${concern.concernUser.id}"><img src="${ctx}/userIcon/${concern.concernUser.icon}"></a></li>
            </c:forEach>
        </ul>
        <h1 class="f16">粉丝 ${fansNum}</h1>
        <ul class="followlist bd0 clearfix">
            <c:forEach items="${fansPage.list}" var="concern">
                <li><a href="${ctx}/he/heMain?userId=${concern.user.id}"><img src="${ctx}/userIcon/${concern.user.icon}"></a></li>
            </c:forEach>
        </ul>
    </div>
</div>