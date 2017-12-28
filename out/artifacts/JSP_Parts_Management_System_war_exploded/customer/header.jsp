<%--
  Created by IntelliJ IDEA.
  User: hewro
  Date: 2017/12/27
  Time: 16:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<header id="header" class="app-header navbar" role="menu">
    <!-- navbar header -->
    <div class="navbar-header bg-dark">
        <button class="pull-right visible-xs dk" ui-toggle-class="show" target=".navbar-collapse">
            <i class="glyphicon glyphicon-cog"></i>
        </button>
        <button class="pull-right visible-xs" ui-toggle-class="off-screen" target=".app-aside" ui-scroll="app">
            <i class="glyphicon glyphicon-align-justify"></i>
        </button>
        <!-- brand -->
        <a href="#/" class="navbar-brand text-lt">
            <i class="fa fa-btc"></i>
            <img src="img/logo.png" alt="." class="hide">
            <span class="hidden-folded m-l-xs">Angulr</span>
        </a>
        <!-- / brand -->
    </div>
    <!-- / navbar header -->

    <!-- navbar collapse -->
    <div class="collapse pos-rlt navbar-collapse box-shadow bg-white-only">
        <!-- buttons -->
        <div class="nav navbar-nav hidden-xs">
            <a href="#" class="btn no-shadow navbar-btn" ui-toggle-class="app-aside-folded" target=".app">
                <i class="fa fa-dedent fa-fw text"></i>
                <i class="fa fa-indent fa-fw text-active"></i>
            </a>
            <a href="#" class="btn no-shadow navbar-btn" ui-toggle-class="show" target="#aside-user">
                <i class="icon-user fa-fw"></i>
            </a>
        </div>
        <!-- / buttons -->

        <!-- nabar right -->
        <ul class="nav navbar-nav navbar-right">
            <li class="dropdown">
                <a href="#" data-toggle="dropdown" class="dropdown-toggle clear">
              <span class="thumb-sm avatar pull-right m-t-n-sm m-b-n-sm m-l-sm">
                <img src="../assets/img/avatar.jpeg" alt="...">
                <i class="on md b-white bottom"></i>
              </span>
                    <span class="hidden-sm hidden-md">John.Smith</span> <b class="caret"></b>
                </a>
                <!-- dropdown -->
                <ul class="dropdown-menu animated fadeInRight w">
                    <li class="wrapper b-b m-b-sm bg-light m-t-n-xs">
                        <div>
                            <p>300mb of 500mb used</p>
                        </div>
                        <div class="progress progress-xs m-b-none dker">
                            <div class="progress-bar progress-bar-info" data-toggle="tooltip" data-original-title="50%" style="width: 50%"></div>
                        </div>
                    </li>
                    <li>
                        <a href="">
                            <span class="badge bg-danger pull-right">30%</span>
                            <span>Settings</span>
                        </a>
                    </li>
                    <li>
                        <a ui-sref="app.page.profile">Profile</a>
                    </li>
                    <li>
                        <a ui-sref="app.docs">
                            <span class="label bg-info pull-right">new</span>
                            Help
                        </a>
                    </li>
                    <li class="divider"></li>
                    <li>
                        <a ui-sref="access.signin">Logout</a>
                    </li>
                </ul>
                <!-- / dropdown -->
            </li>
        </ul>
        <!-- / navbar right -->
    </div>
    <!-- / navbar collapse -->
</header>
