<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%--
  Created by IntelliJ IDEA.
  User: home-pc
  Date: 2017/7/18
  Time: 9:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <script src="../jQuery/jquery-3.2.1.js"></script>
    <link rel="stylesheet" href="../bootstrap-3.3.7-dist/css/bootstrap.min.css">
    <script src="../bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="../homePageContentCss/homePageProductListCss.css">
    <script>
        $(function () {
            $("a.productLine").mouseenter(function () {
                $(this).css("border-color","#c40000");
                $(this).css("opacity",0.7);
            });
            $("a.productLine").mouseleave(function () {
                $(this).css("border-color","transparent");
                $(this).css("opacity",1);

            });

        });
    </script>
</head>
<body>
<div class="productList">
    <div>
        <c:forEach items="${cs}" var="c" varStatus="stc">
            <div class="productRowTitle">
                <div class="greenChunk"></div>
                <div class="productTitle">${c.name}</div>
            </div>
            <c:forEach items="${c.products}" var="p" varStatus="st">
                <div class="productRow">
                    <c:if test="${st.count<=5}">
                        <a href="foreproduct?pid=${p.id}" class="productLine">
                            <img src="../img/productSingle_middle/${p.firstProductImage.id}.jpg" style="width: 168px ;height: 149px" >
                            <span class="productIntroduce">
                                [热销]${fn:substring(p.name,0 ,18 )}
                            </span>
                            <span class="productPrice">
                                <fmt:formatNumber type="number" value="${p.promotePrice}" minFractionDigits="2"/>
                            </span>
                        </a>
                    </c:if>
                </div>
            </c:forEach>
        </c:forEach>
    </div>

    <div class="ends">
        <img src="../img/endImg/end.png" >
    </div>
</div>

</body>
</html>
