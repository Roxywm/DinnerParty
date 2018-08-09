<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!-- left, vertical navbar -->
<div class="col-md-2 bootstrap-admin-col-left">
    <ul class="nav navbar-collapse collapse bootstrap-admin-navbar-side">
        <li class="active">
            <a href="${ctx}/admin/index"><i class="glyphicon glyphicon-chevron-right"></i> 首页</a>
        </li>
        <li>
            <a href="${ctx}/admin/user/"><i class="glyphicon glyphicon-chevron-right"></i> 用户管理</a>
            <a href="${ctx}/admin/orders/"><i class="glyphicon glyphicon-chevron-right"></i> 支付订单</a>
            <a href="${ctx}/admin/applyHost/applyPage"><i class="glyphicon glyphicon-chevron-right"></i> 报名管理</a>
        </li>
    </ul>
</div>