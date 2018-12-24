<%@ page import="onlineMall.web.pojo.User" %><%--
  Created by IntelliJ IDEA.
  User: 83708
  Date: 2018/12/24
  Time: 10:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>homepage</title>
    <link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
    <script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>
<nav class="navbar navbar-default navbar-fixed-top">
    <div class="container">
        <div class="navbar-header">
            <a class="navbar-brand" href="#"><span class="glyphicon glyphicon-shopping-cart"></span>&nbsp;&nbsp;网上商城</a>
        </div>
        <ul class="nav navbar-nav">
            <li class="dropdown">
                <a href="#" data-toggle="dropdown">登录
                    <span class="caret"></span>
                </a>
                <ul class="dropdown-menu dropdown-menu-left">
                    <li><a href="../userLogin.jsp">用户登陆</a></li>
                    <li><a href="../administratorLogin.jsp">管理员登陆</a></li>
                    <li><a href="../shopLogin.jsp">商家登陆</a></li>
                </ul>
            </li>
            <li class="dropdown">
                <a href="#" data-toggle="dropdown">注册
                    <span class="caret"></span>
                </a>
                <ul class="dropdown-menu dropdown-menu-left">
                    <li><a href="#">用户注册</a></li>
                    <li><a href="#">商家注册</a></li>
                </ul>
            </li>
        </ul>
        <ul class="nav navbar-nav">
            <li>&nbsp;&nbsp;<p id="indexIfLoginInfo" style="padding: auto; color: blue"></p></li>
        </ul>
        <ul class="nav navbar-nav">
            <li><p>&nbsp;&nbsp;&nbsp;&nbsp;</p></li>
        </ul>
        <ul class="nav navbar-nav">
            <li>&nbsp;&nbsp;<form method="post" action="/login/userLoginOut">
                <input type="submit" class="btn btn-warning" id="btnUserLogout" value="注销"></form></li>
        </ul>
        <ul class="nav navbar-nav navbar-right">
            <li class="dropdown">
                <a href="#" data-toggle="dropdown">
                    用户中心
                    <span class="caret"></span>
                </a>
                <ul class="dropdown-menu dropdown-menu-left">
                    <li><a href="../cart.jsp">购物车</a></li>
                    <li><a href="../userorder.jsp">我的订单</a></li>
                </ul>
            </li>
            <li><a href="#">商城论坛</a></li>
        </ul>
    </div>
</nav>

<div id="slide" class="carousel slider">
    <ol class="carousel-indicators">
        <li data-target="#slide" data-slide-to="0" class="active"></li>
        <li data-target="#slide" data-slide-to="1"></li>
        <li data-target="#slide" data-slide-to="2"></li>
        <li data-target="#slide" data-slide-to="3"></li>
    </ol>
    <div class="carousel-inner">
        <div class="item active">
            <img src="../imags/轮播1.jpg" alt="" style="width: 900px;height:350px">
        </div>
        <div class="item">
            <img src="../imags/轮播2.jpg" alt="" style="width: 900px;height:350px" >
        </div>
        <div class="item">
            <img src="../imags/轮播3.jpg" alt="" style="width: 900px;height:350px">
        </div>
        <div class="item">
            <img src="../imags/轮播4.jpg" alt="" style="width: 900px;height:350px">
        </div>
    </div>
    <a href="#slide" data-slide="prev" class="carousel-control left">
        <span class="glyphicon glyphicon-chevron-left"></span>
    </a>
    <a href="#slide" data-slide="next" class="carousel-control right">
        <span class="glyphicon glyphicon-chevron-right"></span>
    </a>
</div>
<div class="container">
    <div class="row">
        <div class="col-lg-2">
            <ul class="nav nav-stacked text-left" id="indexCateList">
                <%--动态查询插入商品类别--%>
            </ul>
        </div>
        <div class="col-lg-10" id="item_container"></div>
    </div>
</div>
<script src="../js/jquery.min.js"></script>
<script src="../js/bootstrap.min.js"></script>
<script type="text/javascript">

    $(function(){
        // 滚动
        $('#slide').carousel({
            interval:3000,
        })
    })

    $(document).ready(function () {
        // 页面加载后自动识别用户登录、加载商品类别
        $("#indexIfLoginInfo").text("");
        <%
          User user = (User)session.getAttribute("user");
          if (user != null){
        %>
              $("#indexIfLoginInfo").text("用户已登录："+"<%=user.getUserName()%>");
        <%
          }else {
        %>
              $("#indexIfLoginInfo").text("未登录");
        <%
          }
        %>

        $("#indexCateList").empty();
        $.ajax({
            url: "/category/queryAll",
            type: "GET",
            dataType: "json",
            success: function (data) {
                if (data[0]){
                    var cateList = "<li><span class=\"glyphicon glyphicon-th-list\"></span>&nbsp;<b>商品分类</b></li>";
                    for (var i in data){
                        cateList += "<li><a href=\"javascript:showItems("+data[i].categoryId+")\">"+data[i].name+"</a></li>";
                    }
                    $("#indexCateList").html(cateList);
                }else {
                    alert("未查询到分类");
                }
            }
        })
    })

    function showItems(categoryId) {
        //根据点击的分类刷新商品列表
        $("#item_container").empty();
        $.ajax({
            url: "",
            type: "GET",
            dataType: "json",
            success: function (data) {
                if (data[0]){
                    var items = "";
                    for (var i in data){
                        items += "<div class=\"thumbnail\" ><img src=\""+URL+"\"><div class=\"caption\"><h4>"+商品名+"</h4><p>"+商品描述+"</p><p><button class=\"btn btn-default\">价格："+
                            商品价格+"元</button><button class=\"btn btn-primary\" onclick=\"getItemInfo("+itemId+")\">查看详情</button></p></div></div>";
                    }
                }
            }
        })
    }


    // function shopLogin() {
    //
    //      User tempuser = (User)session.getAttribute("user");
    //      if (tempuser != null){
    //
    //     alert("用户已登录，请先注销！");
    //
    //       }else {
    //          response.sendRedirect("/shopLogin.jsp");
    //       }
    //
    // }
</script>
</body>
</html>

