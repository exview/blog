<%--
  Created by IntelliJ IDEA.
  User: silverspoon
  Date: 2019/2/4
  Time: 11:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName()+":"+request
            .getServerPort()+path+"/";
    request.setAttribute("basePath", basePath);
%>