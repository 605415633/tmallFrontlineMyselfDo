<%--
  Created by IntelliJ IDEA.
  User: home-pc
  Date: 2017/9/17
  Time: 8:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="needLoginReusablePageCSS/confirmPayCss.css">
</head>
<body>
<div class="confirmPayDiv">
    <table class="shoppingIcon">
        <thead>
            <td><img src="img/site/comformPayFlow.png"></td>
        </thead>
        <tbody>
            <td><fmt:formatDate value="${o.createDate}" pattern="yyyy-MM-dd HH:mm:ss"/> </td>
            <td><fmt:formatDate value="${o.payDate}" pattern="yyyy-MM-dd HH:mm:ss"/> </td>
            <td>yyyy-MM-dd HH:mm:ss</td>
            <td></td>
            <td></td>
        </tbody>
    </table>

    <div class="confirmPageInfo">
        我已收到货，同意支付宝付款
    </div>
    <div class="orderInfoReminderIcon">
        订单信息
    </div>
    <table class="confirmOrderInfo">
        <thead>
        <td  colspan="2" class="orderImgAndName">宝贝</td>
        <td >单价</td>
        <td>数量</td>
        <td>商品总价</td>
        <td>运费</td>
        </thead>
        <c:forEach items="${o.orderItems}" var="oi">
            <tr>
                <td><img width="50px" src="img/productSingle_middle/${oi.product.firstProductImage.id}.jpg"></td>
                <td><a href="foreproduct?pid=${oi.product.id}">${oi.product.name}</a></td>
                <td><fmt:formatNumber type="number" value="${oi.product.orignalPrice}" minFractionDigits="2"/> </td>
                <td>${oi.number} </td>
                <td><fmt:formatNumber type="number" value="${oi.number*oi.product.orignalPrice}" minFractionDigits="2"/> </td>
                <td>快递：0.00</td>
            </tr>
        </c:forEach>
    </table>

    <div class="actualPaymentCount">
        <span>实付款：￥<b>${o.total}</b></span>
    </div>

    <table class="orderSecondInfo">
        <tr>
            <td>订单编号：</td>
            <td>${o.orderCode}<img src="img/site/confirmOrderTmall.png" ></td>
        </tr>
        <tr>
            <td>卖家昵称：</td>
            <td>天猫商铺<span class="confirmPayOrderDetailWangWangGif"></span></td>
        </tr>
        <tr>
            <td>收货信息：</td>
            <td>${o.address},${o.receiver},${o.mobile},${o.post}</td>
        </tr>
        <tr>
            <td>成交时间：</td>
            <td><fmt:formatDate value="${o.createDate}" pattern="yyyy-MM-dd HH:mm:ss"/> </td>
        </tr>
    </table>

    <div class="confirmPayments">
        <div class="confirmPayWarning">请收到货后，再确认收货！否则您可能钱货两空！</div>
        <a href="foreOrderConfirmed?oid=${o.id}"><button>确认支付</button></a>
    </div>
</div>
</body>
</html>
