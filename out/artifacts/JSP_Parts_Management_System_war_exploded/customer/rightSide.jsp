<%--
  Created by IntelliJ IDEA.
  User: hewro
  Date: 2017/12/27
  Time: 18:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="col w-md bg-white-only b-l bg-auto no-border-xs">
    <div class="wrapper-md padder-md">
        <!-- streamline -->
        <div class="m-b text-md">最近活动</div>
        <div class="streamline b-l m-b">
            <div class="sl-item">
                <div class="m-l">
                    <div class="text-muted"><%= ((Login)(request.getSession(true).getAttribute("login"))).getDateTime() %></div>
                    <p><a class="text-info"><%= ((Login)(request.getSession(true).getAttribute("login"))).getName() %></a> 注册该系统</p>
                </div>
            </div>
        </div>
        <!-- / streamline -->
    </div>

</div>