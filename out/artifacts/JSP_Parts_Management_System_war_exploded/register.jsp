<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
<%@ page import="model.Login" %><%--
  Created by IntelliJ IDEA.
  User: hewro
  Date: 2017/12/22
  Time: 22:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html class="no-js bg" lang="zh-cmn-Hans">
<head>
    <title>注册界面——零件销售管理界面</title>
    <meta name="description" content="app, web app, responsive, responsive layout, admin, admin panel, admin dashboard, flat, flat ui, ui kit, AngularJS, ui route, charts, widgets, components">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link href="https://cdn.bootcss.com/bootstrap/3.3.4/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.bootcss.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
    <link rel="stylesheet" href="assets/css/jquery.bootstrap-touchspin.min.css" >

    <link rel="stylesheet" href="assets/css/app.css">
    <link rel="stylesheet" href="assets/css/function.css">
</head>
<body>

<%
    // 如果用户名已经存在，说明已经登录，跳转到主页

    HttpSession session2 = request.getSession(true);
    Login loginBean = (Login) session2.getAttribute("login");

    if(loginBean == null){
        //response.sendRedirect("/custom/dashboard.jsp");
        //return;
    }else {//如果已经登录了，跳转到登录后界面
        response.sendRedirect("/" + loginBean.getType()+ "/dashboard.jsp");
        return ;
    }
%>


<div class="app app-header-fixed ">

    <div class="container w-xxl w-auto-xs">
        <a href class="navbar-brand block m-t">注册</a>
        <div class="m-b-lg">
            <div class="wrapper text-center">
                <strong>注册以体验更多功能</strong>
            </div>
            <form name="form" class="form-validation" id="register_form" method="post">
                <div class="text-danger wrapper text-center">
                    <input required type="hidden" name="created" value="<%
                             java.text.SimpleDateFormat simpleDateFormat = new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
                             java.util.Date currentTime = new java.util.Date();
                             String time2 = simpleDateFormat.format(currentTime);
                             out.println(time2);  %>">
                </div>
                <div class="list-group list-group-sm">
                    <div class="list-group-item">
                        <input required name="username" placeholder="注册名称" class="form-control no-border">
                    </div>
                    <div class="list-group-item">
                        <input required name="password" type="password" placeholder="密码" class="form-control no-border" required="">
                    </div>
                </div>
                <div class="form-group">
                    <label class="control-label">选择身份</label>
                    <select name="type" class="form-control m-b" id="chooseIdentify">
                        <option value="customer">购买者</option>
                        <option value="supplier">供应商</option>
                    </select>
                </div>
                <button type="submit" class="btn btn-lg btn-primary btn-block" >注册</button>
                <div class="line line-dashed"></div>
                <p class="text-center"><small>已经注册过？</small></p>
                <a class="btn btn-lg btn-default btn-block" href="${pageContext.request.contextPath}/index.jsp">登录</a>
            </form>
        </div>        <div class="text-center">
            <p>
                <small class="text-muted">零件交易中心管理系统 北京化工大学 何炜<br>&copy; <%= new SimpleDateFormat("yyyy年MM月dd日 HH:kk:ss").format(new Date()) %></small>
            </p>
        </div>
    </div>
</div>
<!--定义一些js变量-->
<script src="https://cdn.bootcss.com/jquery/2.2.4/jquery.min.js"></script>
<script src="./assets/js/function.js"></script>
<script>
    $("#register_form").submit(function () {
        var identify = $("#chooseIdentify").children('option:selected').val();
        $.ajax({
            url: '/servlet/register',
            type: 'POST',
            data: {username: $("input[name='username']").val(),password: $("input[name = 'password']").val(),type:$("select[name='type']").val(),created:$("input[name = 'created']").val()},
            error: function (data) {
                alert("error" + data);
                return false;
            },
            success: function (data) {
                var results = $.parseJSON(data);
                //alert(results.status);
                if (results.status === 1){//登录成功
                    toastr.success("注册成功，即将为您跳转登录页面");
                    window.location.href="/index.jsp";

                }else{//登录失败
                    toastr.error("注册失败，原因：用户名被占用，请更换用户名");
                }
            }
        });
        return false;
    });
</script>
<script src="./assets/js/core.js">
</script>
</body>
</html>
