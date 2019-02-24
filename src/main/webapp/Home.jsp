<%--
  Created by IntelliJ IDEA.
  User: silverspoon
  Date: 2019/2/7
  Time: 13:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="utf-8" %>
<!DOCTYPE html>
<html style="height: 100%;">
<head>
    <meta charset="utf-8">
    <title>Blog</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="stylesheet" type="text/css" href="${basePath}css/bootstrap.min.css">

    <!-- Le styles -->
    <script src="${basePath}js/jquery-3.3.1.min.js"></script>
    <script src="${basePath}js/bootstrap.min.js"></script>
    <link rel="stylesheet" type="text/css" href="${basePath}css/index.css">
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
        <div class="well-sm" style="background-color: #f5f5f5">
            <ul class="nav nav-pills nav-stacked" id="tag-list">
            </ul>
        </div>
    </div>

    <div class="col-md-8" style="height: 100%;">
        <ol class="breadcrumb">
            <li><a>Category</a></li>
            <li class="active">IT</li>
        </ol>
        <div id="main-body" style="height: 100%;">
        </div>
    </div>

    <div class="col-md-2">
    </div>

<script type="text/javascript">

    $("#navbar li").click(function () {
        $("#navbar li").removeClass("active")
        $(this).addClass("active")
    })

    $(".col-md-2").ready(function () {
        $.get(
            "admin/tag",
            {},
            function (data, states) {
                var tagList = document.getElementById("tag-list")
                for (var i = 0; i < data.length; i++) {
                    var tag = document.createElement("li")
                    tag.text = data[i].id
                    var tag_a = document.createElement("a")
                    tag_a.innerHTML = data[i].name
                    tag.appendChild(tag_a)
                    $(tag).click(function () {
                        $("#tag-list li").removeClass("active")
                        $(this).addClass("active")
                        $.get(
                            this.text,
                            {},
                            //刷新main-body中的内容
                            function (data) {
                                var articleList = document.getElementById("main-body")
                                while(articleList.firstChild){
                                    articleList.removeChild(articleList.firstChild)
                                }
                                for (var i = 0; i < data.length; i++) {
                                    var article = document.createElement("div")
                                    var column1 = document.createElement("h2")
                                    column1.innerHTML = data[i].title
                                    var column2 = document.createElement("p")
                                    column2.innerHTML = data[i].introduction
                                    article.appendChild(column1)
                                    article.appendChild(column2)
                                    article.text = data[i].id
                                    $(article).addClass('well')
                                    $(article).click(function () {
                                        window.location.href = "article/" + this.text
                                    })
                                    articleList.appendChild(article)
                                }
                            }
                        )
                    })
                    tagList.appendChild(tag)
                }
            }
        )
    })

    $(".col-md-8").ready(function () {
        $.get(
            "admin/article",
            {},
            function (data, states) {
                var articleList = document.getElementById("main-body")
                for (var i = 0; i < data.length; i++) {
                    var article = document.createElement("div")
                    var column1 = document.createElement("h2")
                    column1.innerHTML = data[i].title
                    var column2 = document.createElement("p")
                    column2.innerHTML = data[i].introduction
                    article.appendChild(column1)
                    article.appendChild(column2)
                    article.text = data[i].id
                    $(article).addClass('well')
                    $(article).click(function () {
                        window.location.href = "article/" + this.text
                    })
                    articleList.appendChild(article)
                }
            }
        )
    })
</script>
</body>
</html>