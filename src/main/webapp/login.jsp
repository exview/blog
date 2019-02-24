<%--
  Created by IntelliJ IDEA.
  User: silverspoon
  Date: 2019/2/4
  Time: 12:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>Sign in &middot; Blog</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="stylesheet" type="text/css" href="${basePath}css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="${basePath}css/login.css">

    <!-- Le styles -->
    <script src="${basePath}js/jquery-3.3.1.min.js"></script>
    <script src="${basePath}js/bootstrap.min.js"></script>
    <script type="text/javascript" src="${basePath}js/md5.js"></script>
</head>

<body>

<div class="container">

    <div class="form-signin">
        <h2 class="form-signin-heading">请登录</h2>
        <label for="inputEmail" class="sr-only">Email address</label>
        <input type="email" id="inputEmail" class="form-control username" placeholder="Email address" required autofocus>
        <label for="inputPassword" class="sr-only">Password</label>
        <input type="password" id="inputPassword" class="form-control password" placeholder="Password" required>
        <div class="checkbox">
            <label>
                <input type="checkbox" value="remember-me">保存账户
            </label>
        </div>
        <button class="btn btn-lg btn-block btn-primary" id="login2">登录</button>
        <p class="content"></p>
    </div>

</div>

<script type="text/javascript">
    $("#login2").click(function() {
        $.get(
            "test",
            function(data) {
                window.location.href="toAdmin"
            })
    })
    $("#login").click(function() {
        var passwordMD5 = hex_md5($(".password").val())
        $.post(
            "admin/login",
            {
                "username": $(".username").val(),
                "password": passwordMD5
            },
            function(data, status) {
                if (status == 200) {
                    window.location.href=data
                }else {
                    alert("用户名或密码错误。")
                }
                window.location.href=data
            },
            "json")
    })
</script>
</body>
</html>

