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
</head>
<body>
<div class="registerFrame">
<span>设置会员名</span>
    <br>
    <br>
    <form action="foreregister" method="post">
        登录名：<input type="text" placeholder="会员名一旦设置成功，无法修改">
        <br><br>
        设置登录密码：登录时验证，保护账户信息。
        <br><br>
        登录密码：<input type="password" placeholder="设置你的登录密码">
        <br><br>
        密码确认：<input type="password" placeholder="请再次输入你的密码">
        <br><br>
        <input type="submit" value="提交">
    </form>
</div>
</body>
</html>
