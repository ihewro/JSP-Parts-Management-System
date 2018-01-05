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
    <title>用户需求列表页面</title>

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
                <h1 class="m-n font-thin h3">需求列表</h1>
            </div>
            <div class="wrapper-md">

                <div class="panel panel-default">
                    <div class="panel-heading">
                        需求列表
                    </div>
                    <div class="row wrapper">
                        <div class="col-sm-5 m-b-xs">
                            <button class="btn btn-sm btn-default">添加新需求</button>
                        </div>
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
                                <th>求购数量</th>
                                <th>求购价格</th>
                                <th>日期</th>
                                <th>状态</th>
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
                                        <div class="col-lg-12 b-r">
                                            <div class="form-group">
                                                <label class="insert_tips">零件编号</label>
                                                <select name="partId" class="form-control m-b" id="post_parts_list">
                                                    <%
                                                        ResultSet rowSet = DbConn.selectPartTable();
                                                        //out.println(rowSet.);
                                                        int length = 0;
                                                        if (rowSet != null){
                                                            //out.println("获取到数据");
                                                            try {
                                                                while (rowSet.next()){
                                                                    out.println(" <option position=\""+length+"\" value=\"" + rowSet.getInt(1) + "\">" + rowSet.getString(3)+"</option>");
                                                                    length ++;
                                                                }
                                                            } catch (SQLException e) {
                                                                e.printStackTrace();
                                                                out.println(length);
                                                            }
                                                        }else {
                                                            out.println("没有获取到数据");
                                                        }

                                                        //out.println("大小" + length);
                                                    %>
                                                </select>
                                                <span class="help-block m-b-none" id="part_color"></span>
                                                <span class="help-block m-b-none" id="part_weight"></span>
                                                <span class="help-block m-b-none" id="part_intro"></span>
                                            </div>
                                        </div>
                                        <div class="col-lg-12 b-r">
                                            <div class="form-group">
                                                <label class="insert_tips">求购数量</label>
                                                <input required class="form-control m-b" type="text" placeholder="数量" name="partNum">
                                            </div>
                                        </div>
                                        <div class="col-lg-12 b-r">
                                            <div class="form-group">
                                                <label class="insert_tips">求购价格</label>
                                                <input required name="partPrice" type="text" class="form-control" style="display: block;">
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
        url: '../servlet/showDemand?userId=<%= ((Login)(request.getSession(true).getAttribute("login"))).getUserId() %>',
        type: 'GET',
        error: function (data) {
            alert("error" + data);
            return false;
        },
        success: function (data) {
            var results = $.parseJSON(data).demandList;
            for (var i = 0; i < results.length; i++){
                var button = '';
                var status = '';
                switch (results[i].status){
                    case -2: button = '<button class="btn btn-default btn-xs" data-toggle="modal" data-target="#modifyModal" data-partid="' + results[i].partId + '" data-partnum="' + results[i].partNum +'" data-partprice="' + results[i].partPrice +'" data-mainid="' + results[i].demandId + '">修改</button><button class="btn btn-default btn-xs" data-toggle="modal" data-target="#deleteModal" data-deleteid="' + results[i].demandId + '">删除</button>';
                            status = '交易员未处理';break;
                    case -1: button = '<button class="btn btn-default btn-xs" data-toggle="modal" data-target="#deleteModal" data-deleteid="' + results[i].demandId + '">删除</button>';
                            status = '交易已处理，等待用户和供应商响应'; break;
                    case 0: status = '该需求已经关闭';break;
                    case 1: status = '该需求求购成功';break;
                    default: button = '';break;
                }
                s = "<tr>" +
                    '<td>' + results[i].demandId + '</td>' +
                    '<td>' + results[i].partId + '</td>' +
                    '<td>' + results[i].partName + '</td>' +
                    '<td>' + results[i].partNum + '</td>' +
                    '<td>' + results[i].partPrice + '</td>' +
                    '<td>' + results[i].created + '</td>' +
                    '<td>' + status + '</td>' +
                    '<td>' + button +'</td>' +
                    '</tr>';
                $("#demands_table").append(s);
            }
        }
    });
    $('#modifyModal').on('show.bs.modal', function (event) {
        var button = $(event.relatedTarget); // Button that triggered the modal
        var partId = button.data('partid');
        var partNum = button.data('partnum');
        var partPrice = button.data('partprice');
        var mainId = button.data('mainid');

        var modal = $(this);
        modal.find(".modal-body input[name='partNum']").val(partNum);
        modal.find(".modal-body input[name='partPrice']").val(partPrice);
        //默认选中当前值的项：select
        //alert(partId);
        modal.find("option[value!='"+ partId +"']").removeAttr("selected");
        modal.find(".modal-body option[value='"+ partId +"']").attr("selected","selected");
        $("#part_color").text("");
        $("#part_weight").text("");
        $("#part_intro").text("");

        $('#modifyOk').click(function () {
            //执行修改
            $.ajax({
                url: '../servlet/modifyDemand',
                type: 'POST',
                data: {partId: modal.find(".modal-body select[name='partId']").children('option:selected').val(),partNum:modal.find(".modal-body input[name='partNum']").val(),
                partPrice: modal.find(".modal-body input[name='partPrice']").val(),mainId:mainId},
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
                url: '../servlet/deleteDemand',
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


    /*显示零件的详细描述*/
    var results;
    $.ajax({
        url: '../servlet/showParts',
        type: 'GET',
        error: function (data) {
            alert("error" + data);
            return false;
        },
        success: function (data) {
            results = $.parseJSON(data).partList;
        }
    });

    $('#post_parts_list').change(function(){
        var p1=$(this).children('option:selected').attr('position');//这就是selected的值
        $("#part_color").text("颜色: " + results[p1].color);
        $("#part_weight").text("重量: " + results[p1].weight);
        $("#part_intro").text("描述: " + results[p1].text);
    });

    $("input[name='partPrice']").TouchSpin({
        min: -1000000000,
        max: 1000000000,
        stepinterval: 50,
        maxboostedstep: 10000000,
        prefix: '$'
    });

</script>
</body>
</html>
