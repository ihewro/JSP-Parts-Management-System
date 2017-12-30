<%--
  Created by IntelliJ IDEA.
  User: hewro
  Date: 2017/12/27
  Time: 16:55
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<div id="content" class="app-content" role="main">
    <div class="app-content-body ">


        <div class="hbox hbox-auto-xs hbox-auto-sm" ng-init="
    app.settings.asideFolded = false;
    app.settings.asideDock = false;
  ">
            <!-- main -->
            <div class="col">
                <!-- main header -->
                <div class="bg-light lter b-b wrapper-md">
                    <div class="row">
                        <div class="col-sm-12 col-xs-12">
                            <h1 class="m-n font-thin h3 text-black">零件销售管理系统（用户界面）</h1>
                        </div>
                    </div>
                </div>
                <!-- / main header -->
                <div class="wrapper-md" ng-controller="FlotChartDemoCtrl">
                    <!-- stats -->
                    <div class="row">
                        <div class="col-md-12">
                            <div class="row row-sm text-center">
                                <div class="col-xs-6">
                                    <div class="panel padder-v item">
                                        <div class="h1 text-info font-thin h1">521</div>
                                        <span class="text-muted text-xs">New items</span>
                                        <div class="top text-right w-full">
                                            <i class="fa fa-caret-down text-warning m-r-sm"></i>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-xs-6">
                                    <a href="" class="block panel padder-v bg-primary item">
                                        <span class="text-white font-thin h1 block">930</span>
                                        <span class="text-muted text-xs">Uploads</span>
                                        <span class="bottom text-right w-full">
                  <i class="fa fa-cloud-upload text-muted m-r-sm"></i>
                </span>
                                    </a>
                                </div>
                                <div class="col-xs-6">
                                    <a href="" class="block panel padder-v bg-info item">
                                        <span class="text-white font-thin h1 block">432</span>
                                        <span class="text-muted text-xs">Comments</span>
                                        <span class="top">
                  <i class="fa fa-caret-up text-warning m-l-sm m-r-sm"></i>
                </span>
                                    </a>
                                </div>
                                <div class="col-xs-6">
                                    <div class="panel padder-v item">
                                        <div class="font-thin h1">129</div>
                                        <span class="text-muted text-xs">Feeds</span>
                                        <div class="bottom">
                                            <i class="fa fa-caret-up text-warning m-l-sm m-r-sm"></i>
                                        </div>
                                    </div>
                                </div>

                            </div>
                        </div>
                    </div>
                    <!-- / stats -->


                </div>
            </div>
            <!-- / main -->
            <%@ include file="rightSide.jsp" %>
        </div>



    </div>
</div>