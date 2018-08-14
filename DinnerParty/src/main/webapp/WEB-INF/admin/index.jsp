<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/common/taglib.jsp" %>
<html>
<head>
    <title>美滋滋·私厨 - 后台管理 - 首页</title>
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

    <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
    <script type="text/javascript" src="${ctx}/static/js/html5shiv.js"></script>
    <script type="text/javascript" src="${ctx}/static/js/respond.min.js"></script>
    <![endif]-->
</head>
<body class="bootstrap-admin-with-small-navbar">
<%@include file="/common/admin_nav.jsp"%>

<div class="container">
    <!-- left, vertical navbar & content -->
    <div class="row">
        <%@include file="/common/admin_left.jsp"%>

        <!-- content -->
        <div class="col-md-10">
            <c:if test="${not empty message}">
                <div class="row">
                    <div class="alert alert-success bootstrap-admin-alert">
                        <button type="button" class="close" data-dismiss="alert">×</button>
                        <h4>成功</h4>
                        这里是操作成功提示信息！
                    </div>
                </div>
            </c:if>

            <div class="row">
                <div class="navbar navbar-default bootstrap-admin-navbar-thin">
                    <ol class="breadcrumb bootstrap-admin-breadcrumb">
                        <li>
                            <a href="#">首页</a>
                        </li>
                        <li>
                            <a href="#">设置</a>
                        </li>
                        <li class="active">工具</li>
                    </ol>
                </div>
            </div>

            <div class="row">
                <div class="panel panel-default bootstrap-admin-no-table-panel">
                    <div class="panel-heading">
                        <div class="text-muted bootstrap-admin-box-title">统计</div>
                        <div class="pull-right"><span class="badge">查看更多</span></div>
                    </div>
                    <div class="bootstrap-admin-panel-content bootstrap-admin-no-table-panel-content collapse in">
                        <div class="col-md-3">
                            <div class="easyPieChart" data-percent="73" style="width: 110px; height: 110px; line-height: 110px;">73%<canvas width="110" height="110"></canvas></div>
                            <div class="chart-bottom-heading"><span class="label label-info">访问量</span></div>
                        </div>
                        <div class="col-md-3">
                            <div class="easyPieChart" data-percent="53" style="width: 110px; height: 110px; line-height: 110px;">53%<canvas width="110" height="110"></canvas></div>
                            <div class="chart-bottom-heading"><span class="label label-info">页面浏览量</span></div>
                        </div>
                        <div class="col-md-3">
                            <div class="easyPieChart" data-percent="83" style="width: 110px; height: 110px; line-height: 110px;">83%<canvas width="110" height="110"></canvas></div>
                            <div class="chart-bottom-heading"><span class="label label-info">用户</span></div>
                        </div>
                        <div class="col-md-3">
                            <div class="easyPieChart" data-percent="13" style="width: 110px; height: 110px; line-height: 110px;">13%<canvas width="110" height="110"></canvas></div>
                            <div class="chart-bottom-heading"><span class="label label-info">订单</span></div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="row bootstrap-admin-no-edges-padding">
                <div class="col-md-6">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <div class="text-muted bootstrap-admin-box-title">用户</div>
                            <div class="pull-right"><span class="badge">1,234</span></div>
                        </div>
                        <div class="bootstrap-admin-panel-content">
                            <table class="table table-striped">
                                <thead>
                                <tr>
                                    <th>#</th>
                                    <th>First Name</th>
                                    <th>Last Name</th>
                                    <th>Username</th>
                                </tr>
                                </thead>
                                <tbody>
                                <tr>
                                    <td>1</td>
                                    <td>Mark</td>
                                    <td>Otto</td>
                                    <td>@mdo</td>
                                </tr>
                                <tr>
                                    <td>2</td>
                                    <td>Jacob</td>
                                    <td>Thornton</td>
                                    <td>@fat</td>
                                </tr>
                                <tr>
                                    <td>3</td>
                                    <td>Vincent</td>
                                    <td>Gabriel</td>
                                    <td>@gabrielva</td>
                                </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <div class="text-muted bootstrap-admin-box-title">订单</div>
                            <div class="pull-right"><span class="badge">752</span></div>
                        </div>
                        <div class="bootstrap-admin-panel-content">
                            <table class="table table-striped">
                                <thead>
                                <tr>
                                    <th>#</th>
                                    <th>Product</th>
                                    <th>Date</th>
                                    <th>Amount</th>
                                </tr>
                                </thead>
                                <tbody>
                                <tr>
                                    <td>1</td>
                                    <td>Coat</td>
                                    <td>02/02/2013</td>
                                    <td>$25.12</td>
                                </tr>
                                <tr>
                                    <td>2</td>
                                    <td>Jacket</td>
                                    <td>01/02/2013</td>
                                    <td>$335.00</td>
                                </tr>
                                <tr>
                                    <td>3</td>
                                    <td>Shoes</td>
                                    <td>01/02/2013</td>
                                    <td>$29.99</td>
                                </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>

        </div>
    </div>

    <div class="row">
        <hr>
        <footer role="contentinfo">
            <p>&copy; 2013 <a href="#" target="_blank">Boot3Admin</a></p>
        </footer>
    </div>
</div>



<!-- Include all compiled plugins (below), or include individual files as needed -->
<script type="text/javascript" src="${ctx}/static/js/bootstrap.min.js"></script>
<script type="text/javascript" src="${ctx}/static/js/twitter-bootstrap-hover-dropdown.min.js"></script>
<script type="text/javascript" src="${ctx}/static/vendors/easypiechart/jquery.easy-pie-chart.js"></script>
<script type="text/javascript" src="${ctx}/static/layer/layer.js"></script>

<script type="text/javascript">
    $(function() {
        // Easy pie charts
        $('.easyPieChart').easyPieChart({animate: 1000});
    });
</script>
</body>
</html>