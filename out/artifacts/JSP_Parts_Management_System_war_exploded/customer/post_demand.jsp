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
    <title>发布需求</title>
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
                <h1 class="m-n font-thin h3">发布新需求</h1>
            </div>
            <div class="wrapper-md" ng-controller="FormDemoCtrl">
                <div class="panel panel-default">
                    <div class="panel-heading font-bold">
                        填写下列表单
                    </div>
                    <div class="panel-body">
                        <form class="form-horizontal" method="post" action="/servlet/addDemand">
                            <input type="hidden" name="customerId" value="<%= ((Login)(request.getSession(true).getAttribute("login"))).getUserId() %>">
                            <input type="hidden" name="created" value="<%
                             java.text.SimpleDateFormat simpleDateFormat = new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
                             java.util.Date currentTime = new java.util.Date();
                             String time2 = simpleDateFormat.format(currentTime);
                             out.println(time2);  %>">

                            <div class="form-group">
                                <label class="col-sm-2 control-label">选择商品</label>
                                <div class="col-sm-10">
                                    <select name="partId" class="form-control m-b" id="post_parts_list">
                                        <!--TODO：动态插入商品的列表数据-->
                                    </select>
                                    <span class="help-block m-b-none" id="part_color"></span>
                                    <span class="help-block m-b-none" id="part_weight"></span>
                                    <span class="help-block m-b-none" id="part_intro"></span>
                                </div>
                            </div>
                            <div class="line line-dashed b-b line-lg pull-in"></div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label">理想价格</label>
                                <div class="col-sm-10">
                                    <div class="m-b">
                                        <input name="partPrice" type="text" class="form-control" style="display: block;">
                                    </div>
                                </div>
                            </div>
                            <div class="line line-dashed b-b line-lg pull-in"></div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label">数量</label>
                                <div class="col-sm-10">
                                    <input class="form-control m-b" type="text" placeholder="数量" name="partNum">
                                </div>
                            </div>
                            <div class="line line-dashed b-b line-lg pull-in"></div>
                            <div class="form-group">
                                <div class="col-sm-4 col-sm-offset-2">
                                    <button type="submit" class="btn btn-default">取消</button>
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
                s = "<option value=\"" + results[i].id + "\">"+ results[i].name +"</option>";
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
