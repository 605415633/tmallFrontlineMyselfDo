<%--
  Created by IntelliJ IDEA.
  User: home-pc
  Date: 2017/9/13
  Time: 16:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java"  pageEncoding="UTF-8" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="reusablePageCss/searchResultPageCss.css">
    <script src="jQuery/jquery-3.2.1.js"></script>
    <link rel="stylesheet" href="bootstrap-3.3.7-dist/css/bootstrap.min.css">
    <script src="bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
</head>
<body>
<div class="searchProducts">
    <c:forEach items="${ps}" var="p">
    <div class="productUnit" price="${p.promotePrice}">
        <a href="foreproduct?pid=${p.id}">
            <img class="productImage" src="img/productSingle/${p.firstProductImage.id}.jpg">
        </a>
        <span class="productPrice">¥<fmt:formatNumber type="number" value="${p.promotePrice}" minFractionDigits="2"/></span>
        <a class="productLink" href="foreproduct?pid=${p.id}">
                ${fn:substring(p.name, 0, 50)}
        </a>

        <a class="tmallLink" href="foreproduct?pid=${p.id}">天猫专卖</a>

        <div class="productInfo">
            <span class="monthDeal ">月成交 <span class="productDealNumber">${p.saleCount}笔</span></span>
            <span class="productReview">评价<span class="productReviewNumber">${p.reviewCount}</span></span>
            <span class="wangwang"><img src="img/site/wangwang.png"></span>
        </div>

    </div>
    </c:forEach>
    <c:if test="${empty ps}">
    <div class="noMatch">没有满足条件的产品</div>
        </c:if>

        <div style="clear:both"></div>
    </div>
</body>
</html>
