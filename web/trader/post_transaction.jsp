<%@ page import="model.Login" %>
<%@ page import="util.ContentUtil" %>
<%@ page import="util.DbConn" %>
<%@ page import="java.sql.ResultSet" %>

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
    <title>发布交易</title>
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
                <h1 class="m-n font-thin h3">发布新交易</h1>
            </div>
            <div class="wrapper-md" ng-controller="FormDemoCtrl">
                <div class="panel panel-default">
                    <div class="panel-heading font-bold">
                        填写下列表单
                    </div>
                    <div class="panel-body">
                        <form class="form-horizontal" method="post" action="${pageContext.request.contextPath}/servlet/addTransaction">
                            <input type="hidden" name="customerId" value="<%= ((Login)(request.getSession(true).getAttribute("login"))).getUserId() %>">
                            <input type="hidden" name="created" value="<%
                             java.text.SimpleDateFormat simpleDateFormat = new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
                             java.util.Date currentTime = new java.util.Date();
                             String time2 = simpleDateFormat.format(currentTime);
                             out.println(time2);  %>">

                            <div class="form-group">
                                <label class="col-sm-2 control-label">处理某个需求</label>
                                <div class="col-sm-10">
                                    <select name="buyId" class="form-control m-b" id="post_demands_list">
                                        <!--动态插入数据-->
                                    </select>
                                    <span class="help-block m-b-none" id="buy_user_name"></span>
                                    <span class="help-block m-b-none" id="buy_part_name"></span>
                                    <span class="help-block m-b-none" id="buy_part_num"></span>
                                    <span class="help-block m-b-none" id="buy_part_price"></span>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-sm-2 control-label">选择供应商</label>
                                <div class="col-sm-10">
                                    <select name="partId" class="form-control m-b" id="post_supplier_list">
                                        <!--TODO：动态插入供应商，而且还需要更新上面的需求buyId-->
                                    </select>
                                    <span class="help-block m-b-none" id="supply_name"></span>
                                    <span class="help-block m-b-none" id="supply_price"></span>
                                    <span class="help-block m-b-none" id="supply_num"></span>
                                </div>
                            </div>
                            <div class="line line-dashed b-b line-lg pull-in"></div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label">交易员建议</label>
                                <div class="col-sm-10">
                                    <input class="form-control m-b" type="text" placeholder="建议" name="suggestion">
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


    var demandResults;
    var supplyList;
    $.ajax({
        url: '../servlet/showDemand',
        type: 'GET',
        error: function (data) {
            alert("error" + data);
            return false;
        },
        success: function (data) {
            demandResults = $.parseJSON(data).demandList;
            for (var i = 0; i < demandResults.length; i++){
                s = "<option position='"+ i+"' value=\"" + demandResults[i].demandId + "\">求购"+ demandResults[i].partName +"</option>";
                $("#post_demands_list").append(s);
            }
        }
    });

    $('#post_demands_list').change(function(){
        var p1=$(this).children('option:selected').attr('position');//这就是selected的值
        $("#buy_user_name").text("求购用户: " + demandResults[p1].customerName);
        $("#buy_part_name").text("求购零件: " + demandResults[p1].partName);
        $("#buy_part_num").text("求购数量: " + demandResults[p1].partNum);
        $("#buy_part_price").text("求购价格: " + demandResults[p1].partPrice);

        //动态生成下面的供应商列表

        $.ajax({
            url: '../servlet/showSupply?partId=' + demandResults[p1].partId,
            type: 'GET',
            error: function (data) {
                alert("error" + data);
                return false;
            },
            success: function (data) {
                supplyList = $.parseJSON(data).supplyList;
                $("#post_supplier_list").html("");
                for (var i = 0; i < supplyList.length; i++){
                    if (supplyList[i].partNum > demandResults[p1].partNum){
                        s = "<option position='"+ i+"' value=\"" + supplyList[i].supplyId + "\">"+ supplyList[i].supplierName +"</option>";
                        $("#post_supplier_list").append(s);
                    }
                }

                //初始赋值

                $("#supply_name").text("供应商名称：" + supplyList[0].supplierName);
                $("#supply_price").text("供应价格：" + supplyList[0].partPrice);
                $("#supply_num").text("供应数量：" + supplyList[0].partNum);
            }

        });
    });

    $('#post_supplier_list').change(function(){
        var p2=$(this).children('option:selected').attr('position');//这就是selected的值
        $("#supply_name").text("供应商名称：" + supplyList[p2].supplierName);
        $("#supply_price").text("供应价格：" + supplyList[p2].partPrice);
        $("#supply_num").text("供应数量：" + supplyList[p2].partNum);

    })

</script>

</body>
</html>
