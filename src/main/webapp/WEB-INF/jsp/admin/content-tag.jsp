<%--
  Created by IntelliJ IDEA.
  User: silverspoon
  Date: 2019/2/5
  Time: 20:22
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
    <button class="btn btn-info pull-left addTag" data-target="#add_tag" data-toggle="modal"><i class="glyphicon glyphicon-plus"></i></button>
    <div class="navbar-form navbar-left pull-right">
        <input type="text" class="form-control" placeholder="Search">
        <button type="submit" class="btn btn-info"><i class="glyphicon glyphicon-search"></i></button>
    </div>
</div>

<div class="container">
    <table class="table table-striped">
        <thead>
        <tr>
            <th>#</th>
            <th>Id</th>
            <th>标签</th>
            <th>操作</th>
        </tr>
        </thead>
        <tbody id="content-tag">

        </tbody>
    </table>
</div>

<div class="modal fade" id="add_tag" role="dialog">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">
                    <span>&times;</span>
                </button>
                <h4 class="modal-title">添加标签</h4>
            </div>
            <div class="modal-body">
                <div class="form-group">
                    <label for="name" class="control-label">Tag Name</label>
                    <input type="text" id="name" class="form-control" placeholder="Tag Name" required/>
                </div>
            </div>
            <div class="modal-footer">
                <button class="btn" data-dismiss="modal" id="save">保存</button>
            </div>
        </div>
    </div>
</div>

<script type="text/javascript">
    $("#content-tag").ready(function () {
        $.get(
            "admin/tag",
            function (data) {
                var table = document.getElementById("content-tag")
                for (var i = 0; i < data.length; i++) {
                    var newRow = document.createElement("tr")
                    var column1 = document.createElement("td")
                    column1.innerHTML = i + 1
                    var column2 = document.createElement("td")
                    column2.innerHTML = data[i].id
                    var column3 = document.createElement("td")
                    column3.innerHTML = data[i].name
                    var column4 = document.createElement("td")
                    column4.innerHTML = "<div class=\"btn-group\">" +
                        "<button class=\"btn btn-warning update\">修改</button>" +
                        "<button class=\"btn btn-danger delete\">删除</button></div>"
                    newRow.appendChild(column1)
                    newRow.appendChild(column2)
                    newRow.appendChild(column3)
                    newRow.appendChild(column4)
                    table.appendChild(newRow)
                }
            },
            "json"
        )
    })
    
    $("#save").click(function () {
        $.post(
            "admin/tag",
            { "name": $(".name").val() },
            function (data) {
                if (data != null) {
                    alert("添加标签成功.")
                    addTagToTable(data)
                }
            }
        )
    })

    var addTagToTable = function (data) {
        var table = document.getElementById("content-tag")
        var newRow = document.createElement("tr")
        var column1 = document.createElement("td")
        column1.innerHTML = table.rows.length + 1
        var column2 = document.createElement("td")
        column2.innerHTML = data.id
        var column3 = document.createElement("td")
        column3.innerHTML = data.name
        var column4 = document.createElement("td")
        column4.innerHTML = "<div class=\"btn-group\">" +
            "<button class=\"btn btn-warning update\">修改</button>" +
            "<button class=\"btn btn-danger delete\">删除</button></div>"
        newRow.appendChild(column1)
        newRow.appendChild(column2)
        newRow.appendChild(column3)
        newRow.appendChild(column4)
        table.appendChild(newRow)
    }
</script>
</body>
</html>