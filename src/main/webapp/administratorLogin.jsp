<%--
  Created by IntelliJ IDEA.
  User: L
  Date: 2018/12/24
  Time: 0:55
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>管理员登录页面</title>
    <link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
    <script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>
<div class="container-fluid">
    <div class="panel panel-info" style="margin: auto; width: 70%" >
        <div class="panel-heading">
            <h3 class="panel-title" align="center">
                <span class="glyphicon glyphicon-briefcase"></span>&nbsp;&nbsp;管理员登录
            </h3>
        </div>
        <div class="panel-body">
            <form role="form" id="adminLoginForm" method="post" action="/login/administratorLogin">
                <div class="form-group">
                    <label for="inputAdminName">用户名：</label>
                    <input id="inputAdminName" name="userName" class="form-control" type="text" placeholder="请输入用户名" size="20" required>
                </div>
                <div class="form-group">
                    <label for="inputAdminPwd">密&nbsp;&nbsp;码：</label>
                    <input id="inputAdminPwd" name="password" class="form-control" type="password" placeholder="请输入用户密码" size="20" required>
                </div>
                <div class="form-group">
                    <p id="adminLoginInfo"></p>
                </div>
                <div class="form-group" align="center">
                    <input id="btnAdminLogin" type="submit" class="btn btn-success" value="登录">
                    <input type="reset" class="btn btn-danger" value="清空">
                </div>
            </form>
        </div>
    </div>
</div>
</body>

<script>

</script>

</html>
