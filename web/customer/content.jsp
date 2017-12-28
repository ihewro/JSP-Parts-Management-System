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
                                <div class="col-xs-12 m-b-md">
                                    <div class="r bg-light dker item hbox no-border">
                                        <div class="col w-xs v-middle hidden-md">
                                            <div ng-init="d3_3=[60,40]" ui-jq="sparkline" ui-options="[60,40], {type:'pie', height:40, sliceColors:['#fad733','#fff']}" class="sparkline inline"><canvas width="80" height="80" style="display: inline-block; width: 40px; height: 40px; vertical-align: top;"></canvas></div>
                                        </div>
                                        <div class="col dk padder-v r-r">
                                            <div class="text-primary-dk font-thin h1"><span>$12,670</span></div>
                                            <span class="text-muted text-xs">Revenue, 60% of the goal</span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- / stats -->


                    <!-- tasks -->
                    <div class="panel wrapper">
                        <div class="row">
                            <div class="col-md-6 b-r b-light no-border-xs">
                                <a href="" class="text-muted pull-right text-lg"><i class="icon-arrow-right"></i></a>
                                <h4 class="font-thin m-t-none m-b-md text-muted">我的需求</h4>
                                <div class=" m-b">
                                    <div class="m-b">
                                        <span class="label text-base bg-warning pos-rlt m-r"><i class="arrow right arrow-warning"></i> 19:30</span>
                                        <a href="">购买100个锤子</a>
                                    </div>
                                    <div class="m-b">
                                        <span class="label text-base bg-info pos-rlt m-r"><i class="arrow right arrow-info"></i> 12:30</span>
                                        <a href="">购买100个斧头</a>
                                    </div>
                                    <div class="m-b">
                                        <span class="label text-base bg-primary pos-rlt m-r"><i class="arrow right arrow-primary"></i> 10:30</span>
                                        <a href="">购买1万把刀</a>
                                    </div>
                                    <div class="m-b">
                                        <span class="label text-base bg-light pos-rlt m-r"><i class="arrow right arrow-light"></i> 07:30</span>
                                        <a href="">购买北京化工大学</a>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="row row-sm">
                                    <div class="col-xs-6 text-center">
                                        <div ui-jq="easyPieChart" ui-options="{
                    percent: 75,
                    lineWidth: 4,
                    trackColor: '#e8eff0',
                    barColor: '#7266ba',
                    scaleColor: false,
                    size: 115,
                    rotate: 90,
                    lineCap: 'butt'
                  }" class="inline m-t easyPieChart" style="width: 115px; height: 115px; line-height: 115px;">
                                            <div>
                                                <span class="text-primary h4">75%</span>
                                            </div>
                                            <canvas width="230" height="230" style="width: 115px; height: 115px;"></canvas></div>
                                        <div class="text-muted font-bold text-xs m-t m-b">已处理</div>
                                    </div>
                                    <div class="col-xs-6 text-center">
                                        <div ui-jq="easyPieChart" ui-options="{
                    percent: 50,
                    lineWidth: 4,
                    trackColor: '#e8eff0',
                    barColor: '#23b7e5',
                    scaleColor: false,
                    size: 115,
                    rotate: 180,
                    lineCap: 'butt'
                  }" class="inline m-t easyPieChart" style="width: 115px; height: 115px; line-height: 115px;">
                                            <div>
                                                <span class="text-info h4">50%</span>
                                            </div>
                                            <canvas width="230" height="230" style="width: 115px; height: 115px;"></canvas></div>
                                        <div class="text-muted font-bold text-xs m-t m-b">待处理</div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- / tasks -->

                </div>
            </div>
            <!-- / main -->
            <%@ include file="rightSide.jsp" %>
        </div>



    </div>
</div>