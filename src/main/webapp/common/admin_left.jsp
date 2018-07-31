<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!-- left, vertical navbar -->
<div class="col-md-2 bootstrap-admin-col-left">
    <ul class="nav navbar-collapse collapse bootstrap-admin-navbar-side">
        <li class="active">
            <a href="${ctx}/manager/index"><i class="glyphicon glyphicon-chevron-right"></i> 首页</a>
        </li>
        <c:forEach items="${jobRight}" var="jobRight">
            <c:if test="${jobRight.rights.rightType==1}">
                <li>
                    <a href="${ctx}/manager/power/?pid=${jobRight.rights.rid}"><i class="glyphicon glyphicon-chevron-right"></i> ${jobRight.rights.rightName}</a>
                </li>
            </c:if>
        </c:forEach>
    </ul>
</div>