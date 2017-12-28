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
<html>
  <head>
    <title>登录界面——零件销售管理界面</title>
    <link href="https://cdn.bootcss.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="./assets/css/frame.css">
    <link rel="stylesheet" href="./assets/css/function.css">
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
      response.sendRedirect("/customer/dashboard.jsp");
      return ;
    }
  %>


  <div class="app app-header-fixed ">

    <div class="container w-xxl w-auto-xs" ng-controller="SigninFormController" ng-init="app.settings.container = false;">
      <a href class="navbar-brand block m-t">登录</a>
      <div class="m-b-lg">
        <!--登录表格-->
        <form name="form" id="login_form" method="post"  class="form-validation">
          <div class="text-danger wrapper text-center" ng-show="authError">
          </div>
          <div class="list-group list-group-sm">
            <div class="list-group-item">
              <input type="text" placeholder="用户名" name="username" class="form-control no-border" required>
            </div>
            <div class="list-group-item">
              <input type="password" placeholder="密码" name="password" class="form-control no-border" required>
            </div>
          </div>
          <div class="form-group">
            <label class="control-label">选择身份</label>
            <select name="type" class="form-control m-b">
              <option value="customer">购买者</option>
              <option value="supplier">供应商</option>
              <option value="trader">交易员</option>
              <option value="admin">维护员</option>
            </select>
          </div>
          <button type="submit" class="btn btn-lg btn-primary btn-block">登录</button>
          <div class="text-center m-t m-b"><a>忘记密码?</a></div>
          <div class="line line-dashed"></div>
          <p class="text-center"><small>Do not have an account?</small></p>
          <a ui-sref="access.signup" class="btn btn-lg btn-default btn-block">注册</a>
        </form>

      </div>
      <div class="text-center">
        <p>
          <small class="text-muted">零件交易中心管理系统 北京化工大学 何炜<br>&copy; <%= new SimpleDateFormat("yyyy年MM月dd日 HH:kk:ss").format(new Date()) %></small>
        </p>
      </div>
    </div>
  </div>
  <!--定义一些js变量-->
  <script src="https://cdn.bootcss.com/jquery/2.2.4/jquery.min.js"></script>
  <script src="./assets/js/function.js"></script>
  <script src="./assets/js/core.js">
    var loginUrl = "/servlet/login";
  </script>
  </body>
</html>
