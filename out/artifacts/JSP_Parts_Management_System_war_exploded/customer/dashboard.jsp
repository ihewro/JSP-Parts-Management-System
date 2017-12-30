<%--
  Created by IntelliJ IDEA.
  User: hewro
  Date: 2017/12/26
  Time: 21:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="model.Login" %>

<html>
<head>
    <title>零件交易中心管理系统——用户页面</title>

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
        <%@ include file="content.jsp" %>
        <!-- /content -->

        <!-- footer -->
        <%@ include file="../footer.jsp"%>
        <!-- / footer -->

    </div>

</body>
</html>
