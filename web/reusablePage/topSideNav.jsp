<%--
  Created by IntelliJ IDEA.
  User: home-pc
  Date: 2017/7/14
  Time: 20:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>  <!-- c通常用于条件判断和遍历 -->
    <%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%> <!-- fmt用于格式化日期和货币 -->
    <%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%> <!-- fn用于校验长度 -->
    <script src="../jQuery/jquery-3.2.1.js"></script>
    <link rel="stylesheet" href="../bootstrap-3.3.7-dist/css/bootstrap.min.css">
    <script src="../bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="../reusablePageCss/topSideNavCss.css">
</head>
<body>
<nav class="topNav">
    <div class="topNavLeft">
        <a href="${contextPath}">
            <span class="glyphicon glyphicon-home redColor"></span>
            天猫首页</a>
        <a href="#">喵，欢迎来天猫</a>
        <c:if test="${!empty user}">
            <a href="login.jsp">${user.name}</a>
            <a href="forelogout">退出</a>
        </c:if>

        <c:if test="${empty user}">
            <a href="login.jsp">请登录</a>
            <a href="register.jsp">免费注册</a>
        </c:if>

    </div>
    <div class="topNavRight">
        <a href="forecart">
            <span class="glyphicon glyphicon-shopping-cart redColor"></span>
        购物车<strong>${cartTotalItemNumber}</strong>件
        </a>
        <a href="forebought">我的订单</a>
    </div>
</nav>
</body>
</html>
