<%--
  Created by IntelliJ IDEA.
  User: silverspoon
  Date: 2019/2/5
  Time: 20:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html style="height: 100%;">
<head>
    <link rel="stylesheet" type="text/css" href="${basePath}css/bootstrap.min.css">
    <script src="${basePath}js/jquery-3.3.1.min.js"></script>
    <script src="${basePath}js/bootstrap.min.js"></script>

    <script src="${basePath}js/admin.js" type="text/javascript"></script>
    <script type="text/css">
        .footer{
            width: 100%;
            height: 30px;
            line-height: 30px;
            margin-top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            position: absolute;
            z-index: 10;
            background-color: #DFDFDF;
        }
    </script>
</head>
<body style="height: 100%;">
<div class="col-md-2" style="height: 100%;">
    <div class="well-sm">
        <ul class="nav nav-pills nav-stacked aside-nav" style="height: 100%">
            <li class="active"><a>文章管理</a></li>
            <li><a>标签管理</a></li>
        </ul>
    </div>
</div>

<div class="col-md-10" style="height: 100%;">
    <div class="well-sm" id="second-body" style="height: 100%; overflow: hidden;padding: 10px auto;">

    </div>
</div>


<script type="text/javascript">
    document.getElementById("second-body").innerHTML=
        '<object type="text/html" data="toAdminContentArticle" width="100%" height="100%"></object>'

    $(".aside-nav li").click(function() {
        $('.aside-nav li').removeClass('active')
        $(this).addClass('active')
        var v = $(this).text()
        if (v == "文章管理") {
            document.getElementById("second-body").innerHTML=
                '<object type="text/html" data="toAdminContentArticle" width="100%" height="100%" ></object>'
        }
        else if (v == "标签管理") {
            document.getElementById("second-body").innerHTML=
                '<object type="text/html" data="toAdminContentTag" width="100%" height="100%"></object>'
        }
    })
</script>

</body>
</html>