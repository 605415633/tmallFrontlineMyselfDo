<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: home-pc
  Date: 2017/7/14
  Time: 20:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java"  pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <link rel="stylesheet" href="reusablePageCss/searchBoxCss.css">
</head>
<body>
<div class="searchBox">
    <a href="forehome">
        <img src="../img/searchBoxImg/logo.gif" class="simple-logo">
    </a>

    <form action="foresearch" method="post">
        <div class="search">
            <div class="searchTopContent">
                <input type="text" name="keyword" placeholder="时尚男鞋 太阳镜"  value="${param.keyword}"><button type="submit" class="searchButton">搜索</button>
            </div>
            <div class="searchBottomContent">
                <c:forEach items="${cs}" var="c" varStatus="st">
                    <c:if test="${st.count>=5 and st.count<=8}">
                        <span>
                            <a href="forecategory?cid=${c.id}">
                                ${c.name}
                            </a>
                            <c:if test="${st.count!=8}">
                                <%--写这个的目的是为了不让在最后一种类别的后面有竖线--%>
                                <span>|</span>
                            </c:if>
                        </span>
                    </c:if>
                </c:forEach>
            </div>
        </div>
    </form>
</div>
</body>
</html>
