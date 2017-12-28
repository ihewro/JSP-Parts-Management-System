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
                        <form class="form-horizontal" method="get">
                            <div class="form-group">
                                <label class="col-sm-2 control-label">标题</label>
                                <div class="col-sm-10">
                                    <input type="text" class="form-control rounded">
                                </div>
                            </div>
                            <div class="line line-dashed b-b line-lg pull-in"></div>
                            <div class="form-group">
                                <label class="col-sm-2 control-label">具体需求</label>
                                <div class="col-sm-10">
                                    <textarea class="form-control" style="overflow:scroll;height:200px;max-height:200px" contenteditable="true">
                                    </textarea>
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

</body>
</html>
