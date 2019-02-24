<%--
  Created by IntelliJ IDEA.
  User: silverspoon
  Date: 2019/2/4
  Time: 11:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <link rel="stylesheet" type="text/css" href="${basePath}css/bootstrap.min.css">
    <script src="${basePath}js/jquery-3.3.1.min.js"></script>
    <script src="${basePath}js/bootstrap.min.js"></script>

    <link rel="stylesheet" type="text/css" href="${basePath}css/main.css">
    <script src="${basePath}js/admin.js" type="text/javascript"></script>
</head>
<body>
<div class="tabbable tabs-left">
    <ul class="nav nav-tabs aside-nav">
        <li class="active"><a>文章管理</a></li>
        <li><a>标签管理</a></li>
    </ul>
    <div class="tab-content" id="second-body">

    </div>
</div>


<script type="text/javascript">
    document.getElementById("second-body").innerHTML=
        '<object type="text/html" data="../../WEB-INF/jsp/admin/content-article.html" width="100%" hight="100%"></object>'

    $(".aside-nav li").click(function() {
        $('.aside-nav li').removeClass('active')
        $(this).addClass('active')
        var v = $(this).text()
        if (v == "文章管理") {
            document.getElementById("second-body").innerHTML=
                '<object type="text/html" data="../../WEB-INF/jsp/admin/content-article.html" width="100%" height="100%" ></object>'
        }
        else if (v == "标签管理") {
            document.getElementById("second-body").innerHTML=
                '<object type="text/html" data="../../WEB-INF/jsp/admin/content-tag.html" width="100%" height="100%"></object>'
        }
    })
</script>
</body>
</html>
