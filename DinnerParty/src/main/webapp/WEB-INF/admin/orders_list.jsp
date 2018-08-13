<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/common/taglib.jsp" %>
<html>
<head>
    <title>美滋滋·私厨 - 后台管理 - 订单列表</title>
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
                                <span class="glyphicon glyphicon-refresh"></span>&nbsp;刷新
                            </a>
                            <a href="${ctx}/admin/orders/ordersExce" class="btn btn-info btn-sm">
                                <span class="glyphicon glyphicon-export"></span>&nbsp;导出订单信息
                            </a>
                        </div>
                    </div>
                    <div class="bootstrap-admin-panel-content text-muted" style="padding: 30px 20px; text-align: center">
                        <div class="row">
                            <table class="table table-hover">
                                <thead>
                                <tr>
                                    <th>订单ID</th>
                                    <th>账号</th>
                                    <th>饭局ID</th>
                                    <th>饭局标题</th>
                                    <%--<th>备注</th>--%>
                                    <th>总价</th>
                                    <th>订单号</th>
                                    <%--<th>交易号</th>--%>
                                    <th>支付时间</th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:forEach items="${page.list}" var="orders">
                                    <tr>
                                        <td>${orders.id}</td>
                                        <td>${orders.user.email}</td>
                                        <td>${orders.dinner.id}</td>
                                        <td>${orders.dinner.titel}</td>
                                        <%--<td>${orders.remark}</td>--%>
                                        <td>${orders.total}</td>
                                        <td>${orders.outTradeNo}</td>
                                        <%--<td>${orders.tradeNo}</td>--%>
                                        <td><fmt:formatDate value='${orders.createTime}' pattern='yyyy-MM-dd'/> </td>
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
            <p>&copy; 2013 <a href="#" target="_blank">Boot3Admin</a></p>
        </footer>
    </div>
</div>

<!-- 模态框 -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button>
                <h4 class="modal-title" id="myModalLabel">审核</h4>
            </div>
            <div class="modal-body">
                <div class="alert alert-info" role="alert">
                    <input type="hidden" id="userId" value="">
                    照片：<img id="photo" src="${ctx}/static/images/usericon.png" height="150px"><br><br>
                    ID：<span id="id" class="black"></span><br><br>
                    申请人：<span id="proposer" class="black"></span><br><br>
                    电话：<span id="mobile" class="black"></span><br><br>
                    邮箱：<span id="email" class="black"></span><br><br>
                    地址：<span id="area" class="black"></span>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">
                    <span class="glyphicon glyphicon-remove" aria-hidden="true"></span>驳回
                </button>
                <button type="button" id="btn_submit" class="btn btn-primary" data-dismiss="modal">
                    <span class="glyphicon glyphicon-floppy-disk" aria-hidden="true"></span>通过
                </button>
            </div>
        </div>
    </div>
</div>



<!-- Include all compiled plugins (below), or include individual files as needed -->
<script type="text/javascript" src="${ctx}/static/js/bootstrap.min.js"></script>
<script type="text/javascript" src="${ctx}/static/js/twitter-bootstrap-hover-dropdown.min.js"></script>
<script type="text/javascript" src="${ctx}/static/vendors/easypiechart/jquery.easy-pie-chart.js"></script>

<script type="text/javascript">
    $(function () {
        // Easy pie charts
        $('.easyPieChart').easyPieChart({animate: 1000});


    });

    $(".audit").click(function () {
        $("#userId").val($(this).attr("userId"))
        $("#id").text($(this).attr("value"));
        $("#photo").attr("src",$(this).attr("photo"));
        $("#proposer").text($(this).attr("proposer"));
        $("#mobile").text($(this).attr("mobile"));
        $("#email").text($(this).attr("email"));
        $("#area").text($(this).attr("area"));
        $('#myModal').modal();
    });

    $("#btn_submit").click(function(){
        var id = $("#id").text();
        var userId = $("#userId").val();
        $.get("${ctx}/admin/applyHost/updateStatus",{"applyId":id,"id":userId}, function(result){
            if (result=="ok"){
                toastr.options = {
                    closeButton: false,
                    debug: false,
                    progressBar: false,
                    positionClass: "toast-top-center",
                    onclick: null,
                    showDuration: "300",
                    hideDuration: "1000",
                    timeOut: "5000",
                    extendedTimeOut: "1000",
                    showEasing: "swing",
                    hideEasing: "linear",
                    showMethod: "fadeIn",
                    hideMethod: "fadeOut"
                };
                toastr.info("审核成功!");

            }else{
                toastr.options = {
                    closeButton: false,
                    debug: false,
                    progressBar: false,
                    positionClass: "toast-top-center",
                    onclick: null,
                    showDuration: "300",
                    hideDuration: "1000",
                    timeOut: "5000",
                    extendedTimeOut: "1000",
                    showEasing: "swing",
                    hideEasing: "linear",
                    showMethod: "fadeIn",
                    hideMethod: "fadeOut"
                };
                toastr.info("审核失败!");

            }
        });
    });
</script>
</body>
</html>