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
                <h1 class="m-n font-thin h3">交易列表</h1>
            </div>
            <div class="wrapper-md">

                <div class="panel panel-default">
                    <div class="panel-heading">
                        交易
                    </div>
                    <div class="row wrapper">
                        <div class="col-sm-4">
                        </div>

                    </div>
                    <div class="table-responsive">
                        <table class="table table-striped b-t b-light">
                            <thead>
                            <tr>
                                <th>需求序号</th>
                                <th>商品编号</th>
                                <th>商品名称</th>
                                <th>建议数量</th>
                                <th>建议价格</th>
                                <th>顾客状态</th>
                                <th>供应商状态</th>
                                <th>操作</th>
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

    <div class="modal fade" id="confirmModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
        <div class="modal-dialog modal-sm" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" >同意确认</h4>
                </div>
                <div class="modal-body ng-scope">
                    确认同意该交易吗？
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal"> 取消 </button>
                    <button type="button" id="confirmOk" class="btn btn-primary">确定</button>
                </div>
            </div>
        </div>
    </div>
    <div class="modal fade" id="refuseModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
        <div class="modal-dialog modal-sm" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" >拒绝确认</h4>
                </div>
                <div class="modal-body ng-scope">
                    确认需要拒绝该需求吗？
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal"> 取消 </button>
                    <button type="button" id="refuseOk" class="btn btn-primary">确定</button>
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
        url: '../servlet/showTransaction?userId=<%= ((Login)(request.getSession(true).getAttribute("login"))).getUserId() %>',
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
                var button;
                switch (results[i].customerStatus){
                    case -1: customerStatus = "待确认";button='<button class="btn btn-default btn-xs" data-toggle="modal" data-target="#confirmModal" data-transactionid="' + results[i].transactionId + '">同意</button><button class="btn btn-default btn-xs" data-toggle="modal" data-target="#refuseModal" data-transactionid="' + results[i].transactionId + '">拒绝</button>';break;
                    case 0: customerStatus = "拒绝";button='<button class="btn btn-default btn-xs" data-toggle="modal" data-target="#confirmModal" data-transactionid="' + results[i].transactionId + '">同意</button>';break;
                    case 1: customerStatus = "同意";
                    if (results[i].supplierStatus === 1){
                        button = '';//两个人都同意的情况下禁止再次更改了
                    }else{
                        button='<button class="btn btn-default btn-xs" data-toggle="modal" data-target="#refuseModal" data-transactionid="' + results[i].transactionId + '">拒绝</button>';break;
                    }
                    default:break;
                }
                switch (results[i].supplierStatus){
                    case -1: supplierStatus = "待确认";break;
                    case 0: supplierStatus = "拒绝";break;
                    case 1: supplierStatus = "同意";break;
                    default:break;
                }
                s = "<tr>" +
                    '<td>' + results[i].buyId + '</td>' +
                    '<td>' + results[i].partId + '</td>' +
                    '<td>' + results[i].partName + '</td>' +
                    '<td>' + results[i].partNum + '</td>' +
                    '<td>' + results[i].partPrice + '</td>' +
                    '<td>' + customerStatus + '</td>' +
                    '<td>' + supplierStatus + '</td>' +
                    '<td>' + button + '<td>'+
                    '</tr>';
                $("#demands_table").append(s);
            }
        }
    });


    $("#confirmModal").on('show.bs.modal',function (event) {
        var button = $(event.relatedTarget); // Button that triggered the modal
        var transactionId = button.data('transactionid');

        console.log("需要同意的交易ID" + transactionId);
        $('#confirmOk').click(function (e) {
            //执行删除
            $.ajax({
                url: '../servlet/confirmTransaction',
                type: 'POST',
                data: {transactionId:transactionId,flag:0},
                error: function (data) {
                    console.log(data);
                    return false;
                },
                success: function (data) {
                    //同意交易成功
                    window.location.reload();
                }
            });
        })
    });


    $("#refuseModal").on('show.bs.modal',function (event) {
        var button = $(event.relatedTarget); // Button that triggered the modal
        var transactionId = button.data('transactionid');

        console.log("需要删除的需求ID" + transactionId);
        $('#refuseOk').click(function (e) {
            //执行删除
            $.ajax({
                url: '../servlet/refuseTransaction',
                type: 'POST',
                data: {transactionId:transactionId,flag:0},
                error: function (data) {
                    console.log(data);
                    return false;
                },
                success: function (data) {
                    //拒绝交易成功
                    window.location.reload();
                }
            });
        })
    });

</script>
</body>
</html>
