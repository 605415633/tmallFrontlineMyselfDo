<%--
  Created by IntelliJ IDEA.
  User: home-pc
  Date: 2017/9/5
  Time: 9:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="needRegisterCss/registerCss.css">
    <script>
        $(function () {

            <c:if test="${!empty msg}">
            $("span.errorMessage").html("${msg}");
            $("div.registerErrorMessageDiv").css("visibility","visible");
            </c:if>

            $("form.registerFrom").submit(function () {
                if($("#name").val().length==0){
                    $("span.errorMessage").html("请输入用户名");
                    $("div.registerErrorMessageDiv").css("visibility","visible");
                    return false;
                }
                if($("#password").val().length==0){
                    $("span.errorMessage").html("请输入密码");
                    $("div.registerErrorMessageDiv").css("visibility","visible");
                    return false;
                }
                if($("#repeatpassword").val().length==0){
                    $("span.errorMessage").html("请再次输入密码");
                    $("div.registerErrorMessageDiv").css("visibility","visible");
                    return false;
                }
                if($("#password").val()!=$("#repeatpassword").val()){
                    $("span.errorMessage").html("请输入一致的密码");
                    $("div.registerErrorMessageDiv").css("visibility","visible");
                    return false;
                }
                return true;
            })
            })

    </script>
</head>
<body>
<form action="foreregister" method="post" class="registerFrom">
    <div class="registerFrame" style="text-align: center">
        <div class="registerErrorMessageDiv">
            <div class="alert alert-danger" role="alert">
                <button type="button" class="close" data-dismiss="alert" aria-label="Close"></button>
                <span class="errorMessage" ></span>
            </div>
        </div>
        <span class="installMemberName">设置会员名</span>
        <br>
        <br>
        <br>
        <span class="registerNameTag">登录名</span><input id="name" name="name" type="text" placeholder="会员名一旦设置成功，无法修改">
        <br><br><br>
        <span class="setRegisterPasswordInfo">设置登录密码 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;登录时验证，保护账户信息。</span>
        <br><br><br>
        <span class="setRegisterPassword">登录密码</span><input id="password" name="password" type="password" placeholder="设置你的登录密码">
        <br><br>
        <span class="affirmPassword">密码确认</span><input id="repeatpassword" type="password" placeholder="请再次输入你的密码">
        <br><br>
        <input type="submit" value="提交" class="submitRegisterInfo">

    </div>
</form>
</body>
</html>
