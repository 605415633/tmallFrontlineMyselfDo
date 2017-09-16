<%--
  Created by IntelliJ IDEA.
  User: home-pc
  Date: 2017/9/16
  Time: 9:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <script src="jQuery/jquery-3.2.1.js"></script>
    <link rel="stylesheet" href="bootstrap-3.3.7-dist/css/bootstrap.min.css">
    <script src="bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="needLoginReusablePageCSS/payedPageCss.css">
</head>
<body>
<div class="payedDiv">
    <div class="payedTitle">
        <img src="img/site/paySuccess.png">
        <span>您已成功付款</span>
    </div>
    <div class="payedUserInfo">
        <ul>
            <li>收货地址：${o.address} ${o.receiver} ${o.mobile}</li>
            <li>实付款：
                <span class="payedCount">
                    <fmt:formatNumber type="number" value="${param.total}" minFractionDigits="2" />
                </span>
            </li>
            <li>预计8月08日送达</li><!-- 这个可以修改，通过传过来的日期，给它加上几天 -->
        </ul>
        <div class="payedCheckLinkDiv">
            您可以
            <a href="forebought" class="payedCheckLink">查看已买到的宝贝</a>
            <a href="forebought" class="payedCheckLink">查看交易详情</a>
        </div>
    </div>
    <div class="imaginaryLine"></div>
    <div class="securityReminder">
        <img src="img/site/warning.png">
        <b>安全提醒：</b>下单后，
        <span>用QQ给您发送链接办理退款的都是骗子！</span>
        天猫不存在系统升级，订单异常等问题，谨防假冒客服电话诈骗！
    </div>
</div>
</body>
</html>
