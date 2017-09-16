<%--
  Created by IntelliJ IDEA.
  User: home-pc
  Date: 2017/9/16
  Time: 8:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="needLoginReusablePageCSS/alipayPageCss.css">
</head>
<body>
<div class="paymentPageDiv">
    <a href="forehome" class="paymentPageSimpleLogoDiv">
        <img src="img/site/simpleLogo.png" ></a>
    <div class="paymentPageContent">

            <span class="paymentTitle">扫一扫付款(元)</span>
            <span class="paymentCount">￥<fmt:formatNumber type="number" value="${param.total}" minFractionDigits="2"/> </span>
            <img src="img/site/alipay2wei.png">
            <a href="forepayed?oid=${param.oid}&total=${param.total}"><button class="confirmPay">确认支付</button></a>

    </div>
</div>
</body>
</html>
