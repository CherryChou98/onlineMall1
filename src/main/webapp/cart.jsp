<%@ page import="onlineMall.web.pojo.User" %><%--
  Created by IntelliJ IDEA.
  User: 83708
  Date: 2018/12/24
  Time: 19:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
    <script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>

</body>
<script>
    $(document).ready(function () {
        <%
            User user = (User)session.getAttribute("user");
            if(user == null){
        %>
        $("body").empty();
        $("body").html("<h2>未登录，请先登录用户！</h2><br><a href=\"../index.jsp\">返回首页</a>");
        <%
            }
        %>
    })
</script>
</html>
