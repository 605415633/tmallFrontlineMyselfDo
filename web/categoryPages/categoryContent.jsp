<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%--
  Created by IntelliJ IDEA.
  User: home-pc
  Date: 2017/7/18
  Time: 15:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>模拟天猫官网${c.name}</title>
    <script src="../jQuery/jquery-3.2.1.js"></script>
    <link rel="stylesheet" href="../bootstrap-3.3.7-dist/css/bootstrap.min.css">
    <script src="../bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="../categoryPagesCss/CategoryCss.css">
    <script>
        $(function () {
           $("div.productLine").mouseenter(function () {
               $(this).css("border-width",3);
               $(this).css("border-color","#c40000");
           }) ;
            $("div.productLine").mouseleave(function () {
                $(this).css("border-width",1);
                $(this).css("border-color","#EEEEEE");
            }) ;
        });
    </script>
</head>
<body>
<div class="categoryContent">
    <div class="categoryImg">
        <img src="../img/category/${c.id}.jpg" >
    </div>
    <div class="searchNav">
     <%--显示高亮部分没有写--%>
        <span class="span"><a href="?cid=${c.id}&sort=all">综合</a><span class="glyphicon glyphicon-arrow-down"></span></span>
        <span class="span"><a href="?cid=${c.id}&sort=review">人气</a><span class="glyphicon glyphicon-arrow-down"></span></span>
        <span class="span"><a href="?cid=${c.id}&sort=date">新品</a><span class="glyphicon glyphicon-arrow-down"></span></span>
        <span class="span"><a href="?cid=${c.id}&sort=saleCount">销量</a><span class="glyphicon glyphicon-arrow-down"></span></span>
        <span class="span"><a href="?cid=${c.id}&sort=price">价格</a><span class="glyphicon glyphicon-resize-vertical"></span></span>
        <input type="text" placeholder="请输入" class="sortBarPrice beginPrice">
        <input type="text" placeholder="请输入" class="sortBarPrice endPrice">

        <script>
            $(function () {
                $("input.sortBarPrice").keyup(function () {
                    var num=$(this).val();
                    if(num.length==0){
                        $("div.productLine").show();
                        return;
                    }
                    num=parseInt(num);
                    if(isNaN(num))
                        num=1;
                    if(num<=0)
                        num=1;
                    $(this).val(num);
                    var begin=$("input.beginPrice").val();
                    var end=$("input.endPrice").val();
                    if(!isNaN(begin)&&!isNaN(end)){
                        $("div.productLine").hide();
                        $("div.productLine").each(function () {
                            var price=$(this).attr("price");
                            price=new Number(price);
                            if(price<=end&&price>=begin)
                                $(this).show();
                        });
                    }

                });
            });
        </script>
    </div>
    <c:if test="${empty param.categorycount}">
        <c:set var="categorycount" scope="page" value="100"/>
    </c:if>

    <c:if test="${!empty param.categorycount}">
        <c:set var="categorycount" scope="page" value="${param.categorycount}"/>
    </c:if>



    <div class="ProductList">

            <div class="productRow">
                <c:forEach items="${c.products}" var="p" varStatus="stc">
                    <c:if test="${stc.count<=categorycount}">
                <div class="productLine" price="${p.promotePrice}">
                    <a href="foreproduct?pid=${p.id}"><img src="../img/productSingle_middle/${p.firstProductImage.id}.jpg" style="width: 100%;height: 190px"></a>
                    <span class="price">￥<fmt:formatNumber type="number" value="${p.promotePrice}" minFractionDigits="2"/> </span>
                    <div class="productLink">
                        <a href="foreproduct?pid=${p.id}">${fn:substring(p.name,0 ,50 )}</a>
                    </div>
                    <div class="tmallMonopoly">
                        <a href="foreproduct?pid=${p.id}"></a>
                    </div>
                    <div class="productBottom">
                        <span>月成交<b>${p.saleCount}笔</b></span>
                        <span>评价<b>${p.reviewCount}</b></span>
                    </div>
                    <div class="serviceIcon">
                        <a href="#nowhere"><img src="../img/menHandBagPageImg/wangwang.png" ></a>
                    </div>
                </div>
                    </c:if>
                    </c:forEach>
            </div>

    </div>
</div>
</body>
</html>
