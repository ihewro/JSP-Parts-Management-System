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
<% request.setCharacterEncoding("UTF-8"); %>


<html>
<head>
    <title>商品页面</title>

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
                <h1 class="m-n font-thin h3">商品列表</h1>
            </div>
            <div class="wrapper-md">

                <div class="panel panel-default">
                    <div class="panel-heading">
                        商品列表
                    </div>
                    <div class="row wrapper">
                        <div class="col-sm-5 m-b-xs">
                            <button class="btn btn-sm btn-default">添加新商品</button>
                        </div>
                        <div class="col-sm-4">
                        </div>

                    </div>
                    <div class="table-responsive">
                        <table class="table table-striped b-t b-light">
                            <thead>
                            <tr>
                                <th>商品编号</th>
                                <th>商品名称</th>
                                <th>颜色</th>
                                <th>重量</th>
                                <th>简介</th>
                                <th>操作</th>
                            </tr>
                            </thead>
                            <tbody id="demands_table">
                            <!--TODO:通过js进行插入数据，数据通过ajax获取-->
                            </tbody>
                        </table>
                    </div>

                    <!--模态框-->
                    <div class="modal fade" id="modifyModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
                        <div class="modal-dialog modal-sm" role="document">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                    <h4 class="modal-title" id="myModalLabel">修改需求</h4>
                                </div>
                                <div class="modal-body">
                                    <div class="row">
                                        <input required class="form-control m-b" type="hidden"  name="partId">
                                        <div class="col-lg-12 b-r">
                                            <div class="form-group">
                                                <label class="insert_tips">零件名称</label>
                                                <input required class="form-control m-b" type="text" placeholder="名称" name="partName">

                                            </div>
                                        </div>
                                        <div class="col-lg-12 b-r">
                                            <div class="form-group">
                                                <label class="insert_tips">零件颜色</label>
                                                <input required class="form-control m-b" type="text" placeholder="数量" name="partColor">
                                            </div>
                                        </div>
                                        <div class="col-lg-12 b-r">
                                            <div class="form-group">
                                                <label class="insert_tips">零件重量</label>
                                                <input required name="partWeight" type="text" class="form-control" style="display: block;">
                                            </div>
                                        </div>
                                        <div class="col-lg-12 b-r">
                                            <div class="form-group">
                                                <label class="insert_tips">零件简介</label>
                                                <input required name="partIntroduction" type="text" class="form-control" style="display: block;">
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-default" data-dismiss="modal"> 取消 </button>
                                    <button type="button" id="modifyOk" class="btn btn-primary">确定</button>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="modal fade" id="deleteModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
                        <div class="modal-dialog modal-sm" role="document">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                    <h4 class="modal-title" >删除确认</h4>
                                </div>
                                <div class="modal-body ng-scope">
                                    确认需要删除该需求吗？
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-default" data-dismiss="modal"> 取消 </button>
                                    <button type="button" id="deleteOk" class="btn btn-primary">确定</button>
                                </div>
                            </div>
                        </div>
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
        url: '../servlet/showParts',
        type: 'GET',
        error: function (data) {
            alert("error" + data);
            return false;
        },
        success: function (data) {
            var results = $.parseJSON(data).partList;
            for (var i = 0; i < results.length; i++){


                s = "<tr>" +
                    '<td>' + results[i].partId + '</td>' +
                    '<td>' + results[i].name + '</td>' +
                    '<td>' + results[i].color + '</td>' +
                    '<td>' + results[i].weight + '</td>' +
                    '<td>' + results[i].text + '</td>' +
                    '<td>' + '<button class="btn btn-default btn-xs" data-toggle="modal" data-target="#modifyModal" data-partid="' + results[i].partId + '" data-partname="' + results[i].name +'" data-partcolor="' + results[i].color +'" data-partweight="' + results[i].weight + '" data-partintroduction="' + results[i].text +'">修改</button><button class="btn btn-default btn-xs" data-toggle="modal" data-target="#deleteModal" data-deleteid="' + results[i].partId + '">删除</button>' +'</td>' +
                    '</tr>';
                $("#demands_table").append(s);
            }
        }
    });
    $('#modifyModal').on('show.bs.modal', function (event) {
        var button = $(event.relatedTarget); // Button that triggered the modal
        var partId = button.data('partid');
        var partName = button.data('partname');
        var partColor = button.data('partcolor');
        var partWeight = button.data('partweight');
        var partIntroduction = button.data('partintroduction');

        var modal = $(this);
        modal.find(".modal-body input[name='partId']").val(partId);
        modal.find(".modal-body input[name='partName']").val(partName);
        modal.find(".modal-body input[name='partColor']").val(partColor);
        modal.find(".modal-body input[name='partWeight']").val(partWeight);
        modal.find(".modal-body input[name='partIntroduction']").val(partIntroduction);

        $('#modifyOk').click(function () {
            //执行修改
            $.ajax({
                url: '../servlet/modifyPart',
                type: 'POST',
                data: {partId: partId,partName:modal.find(".modal-body input[name='partName']").val(),
                    partColor: modal.find(".modal-body input[name='partColor']").val(),partWeight: modal.find(".modal-body input[name='partWeight']").val(),partIntroduction: modal.find(".modal-body input[name='partIntroduction']").val()},
                error: function (data) {
                    alert("error" + data);
                    return false;
                },
                success: function (data) {
                    //修改成功
                    window.location.reload();
                }
            });

        });


    });


    $("#deleteModal").on('show.bs.modal',function (event) {
        var button = $(event.relatedTarget); // Button that triggered the modal
        var mainId = button.data('deleteid');

        console.log("需要删除的需求ID" + mainId);
        $('#deleteOk').click(function (e) {
            //执行删除
            $.ajax({
                url: '../servlet/deletePart',
                type: 'POST',
                data: {id:mainId},
                error: function (data) {
                    console.log(data);
                    return false;
                },
                success: function (data) {
                    //删除
                    window.location.reload();
                }
            });
        })
    });


</script>
</body>
</html>
