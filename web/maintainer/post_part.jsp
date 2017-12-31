<%@ page import="model.Login" %>

<%--
  Created by IntelliJ IDEA.
  User: hewro
  Date: 2017/12/27
  Time: 19:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>发布商品</title>
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
                <h1 class="m-n font-thin h3">发布新商品</h1>
            </div>
            <div class="wrapper-md" ng-controller="FormDemoCtrl">
                <div class="panel panel-default">
                    <div class="panel-heading font-bold">
                        填写下列表单
                    </div>
                    <div class="panel-body">
                        <form class="form-horizontal" method="post" action="${pageContext.request.contextPath}/servlet/addPart">

                            <div class="line line-dashed b-b line-lg pull-in"></div>

                            <div class="form-group">
                                <label class="col-sm-2 control-label">名称</label>
                                <div class="col-sm-10">
                                    <input class="form-control m-b" type="text" placeholder="名称" name="name">
                                </div>
                            </div>
                            <div class="line line-dashed b-b line-lg pull-in"></div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label">颜色</label>
                                <div class="col-sm-10">
                                    <input class="form-control m-b" type="text" placeholder="颜色" name="color">
                                </div>
                            </div>
                            <div class="line line-dashed b-b line-lg pull-in"></div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label">重量</label>
                                <div class="col-sm-10">
                                    <input class="form-control m-b" type="text" placeholder="重量" name="weight">
                                </div>
                            </div>
                            <div class="line line-dashed b-b line-lg pull-in"></div>

                            <div class="form-group">
                                <label class="col-sm-2 control-label">简介</label>
                                <div class="col-sm-10">
                                    <input class="form-control m-b" type="text" placeholder="简介" name="introduction">
                                </div>
                            </div>
                            <div class="line line-dashed b-b line-lg pull-in"></div>
                            <div class="form-group">
                                <div class="col-sm-4 col-sm-offset-2">
                                    <button type="submit" class="btn btn-primary">发布</button>
                                </div>
                            </div>
                        </form>
                    </div>
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

    $("input[name='partPrice']").TouchSpin({
        min: -1000000000,
        max: 1000000000,
        stepinterval: 50,
        maxboostedstep: 10000000,
        prefix: '$'
    });


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
            for (var i = 0; i < results.length; i++){
                s = "<option value=\"" + results[i].partId + "\">"+ results[i].name +"</option>";
                $("#post_parts_list").append(s);
            }
        }
    });

    $('#post_parts_list').change(function(){
        var p1=$(this).children('option:selected').val();//这就是selected的值
        $("#part_color").text("颜色: " + results[p1 - 1].color);
        $("#part_weight").text("重量: " + results[p1 - 1].weight);
        $("#part_intro").text("描述: " + results[p1 - 1].text);
    });


</script>

</body>
</html>
