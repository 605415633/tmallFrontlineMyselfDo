<%--
  Created by IntelliJ IDEA.
  User: home-pc
  Date: 2017/8/25
  Time: 8:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" isELIgnored="false" pageEncoding="UTF-8" language="java" %>
<html>
<head>
    <link rel="stylesheet" href="../reusablePageCss/modalCss.css">
    <script src="../jQuery/jquery-3.2.1.js"></script>
    <link rel="stylesheet" href="../bootstrap-3.3.7-dist/css/bootstrap.min.css">
    <script src="../bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
    <title>Title</title>
</head>
<body>
<%--dialog:会话--%>
<div class="modal fade" id="loginModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog modalLoginWindow"><!-- 模态会话 -->


        <div class="modal-content">
            <div class="loginErrorMessageDiv" style="display: none">
                <div class="alert alert-danger" >
                    <button type="button" class="close" data-dismiss="alert" aria-label="Close"></button>
                    <span class="errorMessage"></span>
                </div>
            </div>
            <div class="modalLoginContent">
                <div class="modalLoginTitle">
                    <span>账户登录</span>
                </div>
                <div class="modalLoginName">
                    <div class="glyphiconDiv">
                        <span class="glyphicon glyphicon-user"></span>
                    </div>
                    <input type="text" id="name" name="name" placeholder="手机/会员/邮箱名">
                </div>
                <div class="modalLoginPassword">
                    <div class="glyphiconDiv">
                        <span class="glyphicon glyphicon-lock"></span></div>
                    <input type="password" id="password" name="password" placeholder="密码"></div>
                <a href="#" class="pull-left" style="margin-left: 10%">忘记登录密码</a>
                <a href="register.jsp" class="pull-right " style="margin-right: 10%">免费注册</a>
                <button class="modalLoginButton" type="submit">登录</button>
            </div>
        </div>

</div>

<%--模态删除窗口--%>
<div class="modal" id="deleteConfirmModal" tabindex="-1" role="dialog" >
    <div class="modal-dialog deleteConfirmModalDiv">
        <div class="modal-content">
            <div class="modal-header">
                <button data-dismiss="modal" class="close" type="button"><span aria-hidden="true">×</span><span class="sr-only">Close</span></button>
                <h4 class="modal-title">确认删除？</h4>
            </div>
            <div class="modal-footer">
                <button data-dismiss="modal" class="btn btn-default" type="button">关闭</button>
                <button class="btn btn-primary deleteConfirmButton" id="submit" type="button">确认</button>
            </div>
        </div>
    </div>
</div>
</div>
</body>
</html>
