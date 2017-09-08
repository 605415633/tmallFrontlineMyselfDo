<%--
  Created by IntelliJ IDEA.
  User: home-pc
  Date: 2017/9/8
  Time: 8:09
  To change this template use File | Settings | File Templates.
--%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<html>
<head>
    <script src="jQuery/jquery-3.2.1.js"></script>
    <link rel="stylesheet" href="bootstrap-3.3.7-dist/css/bootstrap.min.css">
    <script src="bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="needLoginReusablePageCSS/loginCss.css">
    <script>
        $(function () {

            <c:if test="${!empty message}">
            $("span.errorMessage").html(${message});
            $("div.loginErrorMessageDiv").show();
            </c:if>
            $("form.loginForm").submit(function () {
                if($("#name").val().length==0 || $("#password").val().length==0){
                    $("span.errorMessage").html("请输入账户和密码");
                    $("div.loginErrorMessageDiv").show();
                    return false;
                }
                return true;
            })

            $("form.loginForm input").keyup(function () {
                $("div.loginErrorMessageDiv").hide();
            })
        })
    </script>
</head>
<body>
<div class="loginPageDiv">
    <div class="simpleLogoDiv">
        <img src="img/site/simpleLogo.png" ></div>
    <div class="loginBackground">
        <img class="loginBackgroundImg" src="img/site/loginBackground.png" >
    </div>
    <div class="loginContent">
        <div class="innerLoginContent">
            <form action="forelogin" method="post" class="loginForm">
                <div class="loginErrorMessageDiv">
                    <div class="alert alert-danger">
                        <button type="button" class="close" data-dismiss="alert" aria-label="Close"></button>
                        <span class="errorMessage"></span>
                    </div>
                </div>
                <span class="usernameTag">
                    <span class=" glyphicon glyphicon-user " style="color: #606060" aria-hidden="true"></span>
                </span><input type="text" class="userNameDiv" name="name" id="name" placeholder="会员名"><br>
                <span class="passwordTag">
                    <span class="glyphicon glyphicon-lock"></span>
                </span>
                <input class="passwordDiv" type="password" name="password" id="password" placeholder="密码">

                <div class="promptInfo">不要输入真实的账户信息</div>
                <div class="skipLink">
                    <a href="#" class="pull-left">忘记登录密码</a>
                    <a href="register.jsp"  class="pull-right">免费注册</a>
                </div>
                <button type="submit" class="submitButton">登录</button>
            </form>
        </div>
    </div>
</div>
</body>
</html>
