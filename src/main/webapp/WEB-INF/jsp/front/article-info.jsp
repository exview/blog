<%@ page import="com.springMVC.dto.ArticleDto" %><%--
  Created by IntelliJ IDEA.
  User: silverspoon
  Date: 2019/2/8
  Time: 16:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8"%>
<%
    ArticleDto articleDto = (ArticleDto) request.getAttribute("articleDto");
%>
<!DOCTYPE html>
<html style="height: 100%;">
<head>
    <meta charset="UTF-8">
    <title>Blog</title>
    <link rel="stylesheet" href="${basePath}css/bootstrap.min.css">
    <link rel="stylesheet" href="${basePath}css/bootstrap-markdown.min.css">
    <link rel="stylesheet" href="${basePath}css/articleInfo.css">
    <script src="${basePath}js/jquery-3.3.1.min.js"></script>
    <script src="${basePath}js/bootstrap-markdown.js"></script>
    <script src="${basePath}js/marked.js"></script>
</head>

<body style="height: 100%;">
    <nav class="navbar navbar-default" role="navigation">
        <div class="container container-fluid">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle collapsed" data-toggle="#navbar"
                        aria-controls="navbar">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand">Hello</a>
            </div>

            <div class="navbar-collapse collapse" id="navbar">
                <ul class="nav navbar-nav">
                    <li class="active"><a>Home</a></li>
                    <li class="dropdown">
                        <a class="dropdown-toggle" role="button"
                           aria-expanded="false" aria-haspopup="true" data-toggle="dropdown">
                            Category<span class="caret"></span>
                        </a>
                        <ul class="dropdown-menu">
                            <li><a>IT</a></li>
                            <li><a>Java</a></li>
                        </ul>
                    </li>
                </ul>
            </div>
        </div>
    </nav>

    <div class="col-md-2">
    </div>

    <div class="col-md-8">
        <div style="margin: 10px auto">
            <button id="back" class="btn btn-default btn-circle well"><i class="glyphicon glyphicon-chevron-left"></i></button>
        </div>
        <div style="display: none;">
            <textarea id="target_editor" data-provide="markdown">
        </textarea>
        </div>

        <h1>${articleDto.title}</h1>
        <div id="show" style="font-size: x-large"></div>
    </div>

    <div class="col-md-2">
    </div>

<script type="text/javascript">
    $("#navbar li").click(function () {
        $("#navbar li").removeClass("active")
        $(this).addClass("active")
    })

    $("#target_editor").markdown({
        onShow: function(e) {
            $.get(
                '${articleDto.MDFilePath}?callback=?',
                function (data) {
                    document.getElementById('show').innerHTML = e.parseContent(data)
                })
        },
        onChange: function (e) {
            document.getElementById("show").innerHTML = e.parseContent()
        }
    })

    $("#back").click(function () {
        window.history.back()
    })
</script>
</body>
</html>
