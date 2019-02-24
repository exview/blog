<%@ page import="com.springMVC.bean.AdminUser" %>
<%@ page import="org.springframework.beans.BeanUtils" %><%--
  Created by IntelliJ IDEA.
  User: silverspoon
  Date: 2019/2/4
  Time: 9:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
    //AdminUser adminUser = new AdminUser();
    //Object o = request.getAttribute("adminUser");
    //BeanUtils.copyProperties(o, adminUser);
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <link rel="stylesheet" type="text/css" href="${basePath}css/bootstrap.min.css">
    <script type="text/javascript" src="${basePath}js/jquery-3.3.1.min.js"></script>
    <script type="text/javascript" src="${basePath}js/bootstrap.min.js"></script>

    <link rel="stylesheet" type="text/css" href="${basePath}css/main.css">
    <script src="${basePath}js/admin.js" type="text/javascript"></script>
    <title>Blog</title>
</head>
<body>
    <nav class="navbar-default" role="navigation">
        <div class="container">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle collapsed" data-toggle="#navbar"
                        aria-controls="navbar">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand">Blog</a>
            </div>

            <div class="navbar-collapse collapse" id="navbar">
                <ul class="nav navbar-nav top-nav">
                    <li class="active"><a>首页</a></li>
                    <li><a>内容管理</a></li>
                </ul>
            </div>
        </div>
    </nav>

<div class="container-fluid" id="main-body">
    <p>${adminUser.getUsername()}</p>
</div>

<!-- footer -->
<div class="footer">
    <p class="text-center">
        2019 © Silverspoon
    </p>
</div>

<script type="text/javascript">
    //设置body的宽、高

    document.getElementById("main-body").innerHTML =
        '<object type="text/html" data="toAdminHome" width="100%" height="100%"></object>'

    //首部导航点击事件
    $(".top-nav li").click(function() {
        $('.top-nav li').removeClass('active')
        $(this).addClass('active')
        var v = $(this).text()
        if (v == "首页") {
            document.getElementById("main-body").innerHTML =
                '<object type="text/html" data="toAdminHome" width="100%" height="100%"></object>'
        }
        else if (v == "内容管理") {
            document.getElementById("main-body").innerHTML =
                '<object type="text/html" data="toAdminContent" width="100%" height="100%"></object>'
        }
    })
</script>
</body>
</html>
