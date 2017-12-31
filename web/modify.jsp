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

    <%@ include file="header.jsp" %>

</head>
<body>

<div class="app app-aside-fixed container app-header-fixed">

    <!-- header -->

    <%--
      Created by IntelliJ IDEA.
      User: hewro
      Date: 2017/12/27
      Time: 16:52
      To change this template use File | Settings | File Templates.
    --%>
    <%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <%@ page import="model.Login" %>

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
            <a href="#" class="navbar-brand text-lt">
                <i class="fa fa-btc"></i>
                <img src="img/logo.png" alt="." class="hide">
                <span class="hidden-folded m-l-xs">个人资料</span>
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
                        <span class="hidden-sm hidden-md"><%= ((Login)(request.getSession(true).getAttribute("login"))).getName() %></span> <b class="caret"></b>
                    </a>
                    <!-- dropdown -->
                    <ul class="dropdown-menu animated fadeInRight w">
                        <li>
                            <a id="exitSystem" href="${pageContext.request.contextPath}/servlet/exitSystem">退出</a>
                        </li>
                    </ul>
                    <!-- / dropdown -->
                </li>
            </ul>
            <!-- / navbar right -->
        </div>
        <!-- / navbar collapse -->
    </header>

    <!-- / header -->


    <!-- aside -->
    <%@ include file="leftSide.jsp" %>
    <!-- / aside -->


    <!-- content -->
    <div id="content" class="app-content" role="main">
        <div class="app-content-body ">


            <div class="hbox hbox-auto-xs hbox-auto-sm">
                <!-- main -->
                <div class="col">
                    <!-- main header -->
                    <div class="bg-light lter b-b wrapper-md">
                        <div class="row">
                            <div class="col-sm-12 col-xs-12">
                                <h1 class="m-n font-thin h3 text-black">修改个人信息</h1>
                            </div>
                        </div>
                    </div>
                    <!-- / main header -->
                    <div class="wrapper-md" ng-controller="FlotChartDemoCtrl">
                        <!-- stats -->
                        <table class="table table-bordered table-hover table-condensed bg-white-only">
                            <tbody><tr style="font-weight: bold">
                                <td style="width:35%">信息</td>
                                <td style="width:20%">内容</td>
                                <td style="width:25%">操作</td>
                            </tr>
                            <tr class="ng-scope">
                                <td class="v-middle">
                                    <span class="ng-scope ng-binding editable">用户名</span>
                                </td>
                                <td class="v-middle">
                                    <span class="ng-scope ng-binding editable"><%= ((Login)(request.getSession(true).getAttribute("login"))).getName() %></span>
                                </td>
                                <td style="white-space: nowrap">

                                    <div class="buttons" ng-show="!rowform.$visible" aria-hidden="false">
                                        <button class="btn btn-sm btn-info"  data-toggle="modal" data-target="#modifyModal" data-flag="0">修改</button>
                                    </div>
                                </td>
                            </tr>
                            <tr class="ng-scope">
                                <td class="v-middle">
                                    <span class="ng-scope ng-binding editable">密码</span>
                                </td>
                                <td class="v-middle">
                                    <span class="ng-scope ng-binding editable">******</span>
                                </td>
                                <td style="white-space: nowrap">

                                    <div class="buttons" ng-show="!rowform.$visible" aria-hidden="false">
                                        <button class="btn btn-sm btn-info" data-toggle="modal" data-target="#modifyModal" data-flag="1">修改</button>
                                    </div>
                                </td>
                            </tr>

                            </tbody>
                        </table>
                    </div>
                </div>
                <!-- / main -->
            </div>

            <div class="modal fade" id="modifyModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
                <div class="modal-dialog modal-sm" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                            <h4 class="modal-title" >删除确认</h4>
                        </div>
                        <div class="modal-body ng-scope">
                            <div class="row">
                                <div class="col-lg-12 b-r">
                                    <div class="form-group">
                                        <label class="insert_tips">修改后的用户名</label>
                                        <input class="form-control m-b" type="text" placeholder="请输入" name="modifyText">
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="button" id="modifyOk" class="btn btn-primary">确定</button>
                        </div>
                    </div>
                </div>
            </div>

        </div>
    </div>

    <!-- /content -->

    <!-- footer -->
    <%@ include file="footer.jsp"%>
    <!-- / footer -->

</div>

<script>

    $("#modifyModal").on('show.bs.modal',function (event) {
        var button = $(event.relatedTarget); // Button that triggered the modal
        var flag = button.data('flag');
        //flag 为0表示修改用户名，为1表示修改密码

        if (flag === 0){
            //修改用户名
            $('.insert_tips').html('修改用户名');
        }else {
            //修改密码
            $('.insert_tips').html('修改密码');

        }
        console.log("修改flag" + flag);
        $('#modifyOk').click(function (e) {
            //执行删除
            $.ajax({
                url: '../servlet/modifyUser',
                type: 'POST',
                data: {flag:flag,modifyText:$('input[name="modifyText"]').val(),type:'<%= ((Login)(request.getSession(true).getAttribute("login"))).getType() %>',id:'<%= ((Login)(request.getSession(true).getAttribute("login"))).getUserId() %>'},
                error: function (data) {
                    console.log(data);
                    return false;
                },
                success: function (data) {
                    //删除
                    window.location.href='index.jsp';
                }
            });
        })
    });


</script>


</body>
</html>
