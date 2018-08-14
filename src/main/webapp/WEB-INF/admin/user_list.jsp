<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/common/taglib.jsp" %>
<html>
<head>
    <title>美滋滋·私厨 - 后台管理 - 用户列表</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <!-- Bootstrap -->
    <link href="${ctx}/static/css/bootstrap.min.css" rel="stylesheet" media="screen">
    <link href="${ctx}/static/css/bootstrap-theme.min.css" rel="stylesheet" media="screen">

    <!-- Bootstrap Admin Theme -->
    <link href="${ctx}/static/css/bootstrap-admin-theme.css" rel="stylesheet" media="screen">
    <!-- Vendors -->
    <link href="${ctx}/static/vendors/easypiechart/jquery.easy-pie-chart.css" rel="stylesheet" media="screen">
    <link href="${ctx}/static/vendors/easypiechart/jquery.easy-pie-chart_custom.css" rel="stylesheet" media="screen">
    <link type="image/x-icon" href="${ctx}/static/images/" rel="shortcut icon" />
    <link href="${ctx}/static/images/favicon.ico" rel="bookmark icon" />

    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script type="text/javascript" src="${ctx}/static/js/jQuery-v2.0.3.js"></script>

    <link href="${ctx}/static/toastr/toastr.css" rel="stylesheet"/>
    <script src="${ctx}/static/toastr/toastr.js" type="text/javascript"></script>

    <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
    <script type="text/javascript" src="${ctx}/static/js/html5shiv.js"></script>
    <script type="text/javascript" src="${ctx}/static/js/respond.min.js"></script>
    <![endif]-->
</head>
<body class="bootstrap-admin-with-small-navbar">

<%@include file="/common/admin_nav.jsp" %>

<div class="container">
    <!-- left, vertical navbar & content -->
    <div class="row">
        <%@include file="/common/admin_left.jsp" %>

        <!-- content -->
        <div class="col-md-10">
            <div class="row">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <div class="text-muted bootstrap-admin-box-title">
                            <a href="${ctx}/admin/applyHost/applyPage" class="btn btn-info btn-sm">
                                <span class="glyphicon glyphicon-refresh"></span>刷新
                            </a>
                            <a href="${ctx}/admin/user/userExce" class="btn btn-info btn-sm">
                                <span class="glyphicon glyphicon-export"></span>&nbsp;导出用户信息
                            </a>
                        </div>
                    </div>
                    <div class="bootstrap-admin-panel-content text-muted" style="padding: 30px 20px; text-align: center">
                        <div class="row">
                            <table class="table table-hover">
                                <thead>
                                <tr>
                                    <th>ID</th>
                                    <th>账号</th>
                                    <th>昵称</th>
                                    <th>性别</th>
                                    <th>手机</th>
                                    <th>职业</th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:forEach items="${page.list}" var="user">
                                    <tr>
                                        <td>${user.id}</td>
                                        <td>${user.email}</td>
                                        <td>${user.nickname}</td>
                                        <td>${user.sex}</td>
                                        <td>${user.mobile}</td>
                                        <td>${user.job}</td>
                                    </tr>
                                </c:forEach>
                                </tbody>
                            </table>
                        </div>
                        <div class="row">
                            <div class="col-md-6">
                                <div class="dataTables_info" id="example_info">Showing 1 to 10 of 57 entries</div>
                            </div>
                            <div class="col-md-6">
                                <div class="dataTables_paginate paging_bootstrap">
                                    <ul class="pagination">
                                        <li class="prev <c:if test="${page.prePage==0}">disabled</c:if>">
                                            <c:if test="${page.prePage==0}"><a href="javascript:;">上一页</a></c:if>
                                            <c:if test="${page.prePage!=0}"><a href="?pageNum=${page.prePage}">上一页</a></c:if>
                                        </li>
                                        <c:forEach begin="1" end="${page.pages}" var="p">
                                            <li <c:if test="${p==page.pageNum}">class="active"</c:if>>
                                                <a href="?pageNum=${p}">${p}</a>
                                            </li>
                                        </c:forEach>
                                        <li class="next <c:if test="${page.nextPage==0}">disabled</c:if>">
                                            <c:if test="${page.nextPage==0}"><a href="javascript:;">下一页</a></c:if>
                                            <c:if test="${page.nextPage!=0}"><a href="?pageNum=${page.nextPage}">下一页</a></c:if>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>


    </div>

    <div class="row">
        <hr>
        <footer role="contentinfo">
            <p>&copy; 2018 <a href="${ctx}/" target="_blank">美滋滋·私厨</a></p>
        </footer>
    </div>
</div>


<!-- Include all compiled plugins (below), or include individual files as needed -->
<script type="text/javascript" src="${ctx}/static/js/bootstrap.min.js"></script>
<script type="text/javascript" src="${ctx}/static/js/twitter-bootstrap-hover-dropdown.min.js"></script>
<script type="text/javascript" src="${ctx}/static/vendors/easypiechart/jquery.easy-pie-chart.js"></script>
<script type="text/javascript" src="${ctx}/static/layer/layer.js"></script>

<script type="text/javascript">
    $(function () {
        // Easy pie charts
        $('.easyPieChart').easyPieChart({animate: 1000});


    });
</script>
</body>
</html>