<%@ page import="util.ContentUtil" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="util.DbConn" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="model.Login" %><%--
  Created by IntelliJ IDEA.
  User: hewro
  Date: 2017/12/27
  Time: 19:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>用户交易列表</title>

    <%@ include file="../header.jsp" %>

</head>
<body>

<div class="app app-aside-fixed container app-header-fixed">

    <!-- header -->
    <%@ include file="header.jsp" %>
    <!-- / header -->


    <!-- aside -->
    <%@ include file="leftSide.jsp" %>
    <!-- / aside -->


    <!-- content -->
    <div id="content" class="app-content" role="main">
        <div class="app-content-body ">


            <div class="bg-light lter b-b wrapper-md">
                <h1 class="m-n font-thin h3">用户交易列表</h1>
            </div>
            <div class="wrapper-md">

                <div class="panel panel-default">
                    <div class="panel-heading">
                        交易
                    </div>
                    <div class="row wrapper">
                        <div class="col-sm-5 m-b-xs">
                            <button class="btn btn-sm btn-default">添加新交易</button>
                        </div>
                        <div class="col-sm-4">
                        </div>

                    </div>
                    <div class="table-responsive">
                        <table class="table table-striped b-t b-light">
                            <thead>
                            <tr>
                                <th>交易序号</th>
                                <th>商品编号</th>
                                <th>商品名称</th>
                                <th>建议数量</th>
                                <th>建议价格</th>
                                <th>顾客状态</th>
                                <th>供应商状态</th>
                            </tr>
                            </thead>
                            <tbody id="demands_table">
                            <!--TODO:通过js进行插入数据，数据通过ajax获取-->
                            </tbody>
                        </table>
                    </div>
                    <footer class="panel-footer">
                        <div class="row">
                            <div class="col-sm-4 text-right text-center-xs" style="display: none!important;">
                                <!--表格底部-->
                            </div>
                        </div>
                    </footer>
                </div>
            </div>
        </div>
    </div>

    <!-- /content -->

    <!-- footer -->
    <%@ include file="../footer.jsp"%>
    <!-- / footer -->

</div>
<script>
    $.ajax({
        url: '../servlet/showTransaction',
        type: 'GET',
        error: function (data) {
            alert("error" + data);
            return false;
        },
        success: function (data) {
            var results = $.parseJSON(data).transactionList;
            for (var i = 0; i < results.length; i++){
                var customerStatus;
                var supplierStatus;
                switch (results[i].customerStatus){
                    case -1: customerStatus = "待确认";break;
                    case 0: customerStatus = "拒绝";break;
                    case 1: customerStatus = "同意";break;
                    default:break;
                }
                switch (results[i].supplierStatus){
                    case -1: supplierStatus = "待确认";break;
                    case 0: supplierStatus = "拒绝";break;
                    case 1: supplierStatus = "同意";break;
                    default:break;
                }
                s = "<tr>" +
                    '<td>' + results[i].transactionId + '</td>' +
                    '<td>' + results[i].partId + '</td>' +
                    '<td>' + results[i].partName + '</td>' +
                    '<td>' + results[i].partNum + '</td>' +
                    '<td>' + results[i].partPrice + '</td>' +
                    '<td>' + customerStatus + '</td>' +
                    '<td>' + supplierStatus + '</td>' +
                    '</tr>';
                $("#demands_table").append(s);
            }
        }
    });
</script>
</body>
</html>
