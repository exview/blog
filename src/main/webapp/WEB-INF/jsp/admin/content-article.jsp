<%--
  Created by IntelliJ IDEA.
  User: silverspoon
  Date: 2019/2/5
  Time: 20:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <link rel="stylesheet" type="text/css" href="${basePath}css/bootstrap.min.css">
    <script src="${basePath}js/jquery-3.3.1.min.js"></script>
    <script src="${basePath}js/bootstrap.min.js"></script>

    <script src="${basePath}js/admin.js" type="text/javascript"></script>
</head>
<body>
<div class="container">
    <button class="btn btn-info pull-left addArticle" data-target="#add_article" data-toggle="modal"><i class="glyphicon glyphicon-plus"></i></button>
    <div class="navbar-form navbar-left pull-right">
        <input type="text" class="form-control" placeholder="Search">
        <button type="submit" class="btn btn-info"><i class="glyphicon-search glyphicon"></i></button>
    </div>
</div>

<div class="container">
    <table class="table table-striped">
        <thead>
        <tr>
            <th>#</th>
            <th>Id</th>
            <th>标题</th>
            <th>标签</th>
            <th>描述</th>
            <th>文件路径</th>
            <th>操作</th>
        </tr>
        </thead>
        <tbody id="content-article">

        </tbody>
    </table>
</div>

<div class="modal fade" id="add_article" tabindex="-1" role="dialog">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">
                    <span>&times;</span>
                </button>
                <h4 class="modal-title">添加文章</h4>
            </div>
            <div class="modal-body">
                <div class="form-group">
                    <label for="title" class="control-label">Title</label>
                    <input type="text" class="form-control" id="title" placeholder="Title" required/>
                </div>
                <div class="form-group">
                    <label for="tagName" class="control-label">Tag</label>
                    <input type="text" class="form-control" id="tagName" placeholder="Tag Name" required/>
                </div>
                <div class="form-group">
                    <label for="introduction" class="control-label">Introduction</label>
                    <input type="textarea" class="form-control" id="introduction" placeholder="Introduction" required/>
                </div>
                <div class="form-group">
                    <label for="mdFile" class="control-label">Markdown File</label>
                    <input type="file" id="mdFile" class="form-control" required/>
                </div>
            </div>
            <div class="modal-footer">
                <button class="btn" type="reset">重置</button>
                <button class="btn" data-dismiss="modal" id="save">保存</button>
            </div>
        </div>
    </div>
</div>


<script type="text/javascript">
    $("#content-article").ready(function () {
        $.get(
            "admin/article",
            {},
            function (data) {
                var table = document.getElementById("content-article")
                for (var i = 0; i < data.length; i++) {
                    var newRow = document.createElement("tr")
                    var column1 = document.createElement("td")
                    column1.innerHTML = i+1
                    var column2 = document.createElement("td")
                    column2.innerHTML = data[i].id
                    var column3 = document.createElement("td")
                    column3.innerHTML = data[i].title
                    var column4 = document.createElement("td")
                    column4.innerHTML = data[i].tagName
                    var column5 = document.createElement("td")
                    column5.innerHTML = data[i].introduction
                    var column6 = document.createElement("td")
                    column6.innerHTML = data[i].mdfile
                    var column7 = document.createElement("td")
                    column7.innerHTML = "<div class=\"btn-group\">" +
                        "<button class=\"btn btn-warning update\">修改</button>" +
                        "<button class=\"btn btn-danger delete\">删除</button></div>"
                    newRow.appendChild(column1)
                    newRow.appendChild(column2)
                    newRow.appendChild(column3)
                    newRow.appendChild(column4)
                    newRow.appendChild(column5)
                    newRow.appendChild(column6)
                    newRow.appendChild(column7)
                    table.appendChild(newRow)
                }
            },
            "json"
        )
    })

    $(".addArticle").click(function () {
        $.get(
            "admin/tag",
            {},
            function(data, status){

            },
            "json"
        )
    })

    //对话框中保存按钮点击事件
    $("#save").click(function() {
        var formData = new FormData()
        formData.append("title", $("#title").val())
        formData.append("tagName", $("#tagName").val())
        formData.append("introduction", $("#introduction").val())
        formData.append("mdFile", $("#mdFile")[0].files[0])
        $.ajax({
            url: "admin/article",
            type: "POST",
            data: formData,
            processData: false,
            contentType: false,
            success: function (data) {
                if (data == 1) {
                    alert("文章添加成功.")
                }
            }
        })
    })

    //修改按钮点击事件
    $(".update").click(function() {
        $.get("test", function(data, status) {
            alert(data)
        })
    })


</script>
</body>
</html>