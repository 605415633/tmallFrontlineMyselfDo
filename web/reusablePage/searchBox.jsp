<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: home-pc
  Date: 2017/7/14
  Time: 20:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <link rel="stylesheet" href="../reusablePageCss/searchBoxCss.css">
</head>
<body>
<div class="searchBox">
    <a href="${contextPath}">
        <img src="../img/searchBoxImg/logo.gif" class="simple-logo">
    </a>

    <form action="foresearch" method="post">
        <div class="search">
            <div class="searchTopContent">
                <input type="text" placeholder="时尚男鞋 太阳镜" name="keyword">
                <button type="submit" class="searchButton">搜索</button>
            </div>
            <div class="searchBottomContent">
                <c:forEach items="cs" var="c" varStatus="st">
                    <c:if test="${st.count>=5 and st.count<=8}">
                        <span>
                            <a href="forecategory?cid=${c.id}">
                                ${c.name}
                            </a>
                            <c:if test="${st.count!=8}">
                                <span>|</span>
                            </c:if>
                        </span>
                    </c:if>
                </c:forEach>
                <!-- 这里的数据原来是自己写上去的，上面的是通过数据库导入显示的。
                现在数据库还没导入数据了，所以无法显示搜索栏下面的内容 -->
                <%--<span><a href="#">平衡车</a><span>|</span></span>--%>
                <%--<span><a href="#">扫地机器人</a><span>|</span></span>--%>
                <%--<span><a href="#">原汁机</a><span>|</span></span>--%>
                <%--<span><a href="#">冰箱</a></span>--%>
            </div>
        </div>
    </form>
</div>
</body>
</html>
