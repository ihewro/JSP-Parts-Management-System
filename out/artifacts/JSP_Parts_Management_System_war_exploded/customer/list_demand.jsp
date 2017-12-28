<%--
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
                        <div class="col-sm-3">
                            <div class="input-group">
                                <input type="text" class="input-sm form-control" placeholder="跳转页码">
                                <span class="input-group-btn">
            <button class="btn btn-sm btn-default" type="button">Go!</button></span>
                            </div>
                        </div>
                    </div>
                    <div class="table-responsive">
                        <table class="table table-striped b-t b-light">
                            <thead>
                            <tr>
                                <th>商品编号</th>
                                <th>求购数量</th>
                                <th>求购价格</th>
                                <th>日期</th>
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
                                <ul class="pagination pagination-sm m-t-none m-b-none">
                                    <li><a href=""><i class="fa fa-chevron-left"></i></a></li>
                                    <li><a href="">1</a></li>
                                    <li><a href="">2</a></li>
                                    <li><a href="">3</a></li>
                                    <li><a href="">4</a></li>
                                    <li><a href="">5</a></li>
                                    <li><a href=""><i class="fa fa-chevron-right"></i></a></li>
                                </ul>
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
        url: '../servlet/showDemand',
        type: 'GET',
        error: function (data) {
            alert("error" + data);
            return false;
        },
        success: function (data) {
            var results = $.parseJSON(data).demandList;
            for (var i = 0; i < results.length; i++){
                s = "<tr>" +
                    "<td>" + results[i].partId + "</td>" +
                    "<td>" + results[i].partNum + "</td>" +
                    "<td>" + results[i].partPrice +"</td>" +
                    "<td>" + results[i].created + "</td>" +
                    "<td><button class=\"btn btn-default btn-xs\">修改</button><button class=\"btn btn-default btn-xs\">删除</button></td>" +
                    "</tr>";
                $("#demands_table").append(s);
            }
        }
    });


</script>
</body>
</html>
