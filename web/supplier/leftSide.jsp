<%--
  Created by IntelliJ IDEA.
  User: hewro
  Date: 2017/12/27
  Time: 16:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<aside id="aside" class="app-aside hidden-xs bg-dark">
    <div class="aside-wrap">
        <div class="navi-wrap">
            <!-- user -->
            <div class="clearfix hidden-xs text-center show" id="aside-user">
                <div class="dropdown wrapper">
                    <a href="app.page.profile">
                <span class="thumb-lg w-auto-folded avatar m-t-sm">
                  <img src="../assets/img/avatar.jpeg" class="img-full" alt="...">
                </span>
                    </a>
                    <a href="#" data-toggle="dropdown" class="dropdown-toggle hidden-folded">
                <span class="clear">
                  <span class="block m-t-sm">
                    <strong class="font-bold text-lt"><%= ((Login)(request.getSession(true).getAttribute("login"))).getName() %></strong>
                    <b class="caret"></b>
                  </span>
                  <span class="text-muted text-xs block">Art Director</span>
                </span>
                    </a>
                </div>
                <div class="line dk hidden-folded"></div>
            </div>
            <!-- / user -->

            <!-- nav -->
            <nav ui-nav="" class="navi clearfix">
                <ul class="nav">
                    <li class="hidden-folded padder m-t m-b-sm text-muted text-xs">
                        <span>导航</span>
                    </li>
                    <li>
                        <a href="${pageContext.request.contextPath}/">
                            <i class="fa fa-home"></i>
                            <span class="font-bold">首页</span>
                        </a>
                    </li>
                    <li class="line dk"></li>

                    <li class="hidden-folded padder m-t m-b-sm text-muted text-xs">
                        <span>组成</span>
                    </li>
                    <li>
                        <a href="post_supply.jsp">
                            <i class="fa  fa-edit"></i>
                            <span>发布供应</span>
                        </a>
                    </li>
                    <li>
                        <a href="list_supply.jsp">
                            <i class="fa fa-list-ol"></i>
                            <span>供应列表</span>
                        </a>
                    </li>
                    <li>
                        <a href="list_transaction.jsp">
                            <i class="fa fa-shopping-cart"></i>
                            <span>订单列表</span>
                        </a>
                    </li>
                </ul>
            </nav>
            <!-- nav -->
        </div>
    </div>
</aside>