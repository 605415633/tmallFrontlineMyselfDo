<%--
  Created by IntelliJ IDEA.
  User: home-pc
  Date: 2017/7/19
  Time: 10:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="../reusablePageCss/simpleSearchBoxCss.css">
</head>
<body>
<div class="simpleSearchBox">
    <a href="forehome" class="simpleSearchBoxImg">
        <img src="../img/searchBoxImg/simpleLogo.png">
    </a>
    <div class="leftSearchBox">
        <form action="foresearch" method="post">
            <input type="text" placeholder="平衡车 原汁机" name="keyword" value="${param.keyword}">
            <button type="submit">搜天猫</button>
            <div class="leftSearchKeyword">
                <c:forEach items="${cs}" var="c" varStatus="st">
                    <c:if test="${st.count>=8 and st.count<=11}">
                        <span>
                        <a href="forecategory?cid=${c.id}">
                            ${c.name}
                        </a>
                            <c:if test="${st.count!=11}">
                                <span>|</span>
                            </c:if>
                    </span>
                    </c:if>
                </c:forEach>
            </div>
        </form>
    </div>
    <%--<div class="leftSearchKeyword">--%>
        <%--<span><a href="#">冰箱</a><span>|</span></span>--%>
        <%--<span><a href="#">空调</a><span>|</span></span>--%>
        <%--<span><a href="#">女表</a><span>|</span></span>--%>
        <%--<span><a href="#">男表</a></span>--%>
    <%--</div>--%>
</div>
</body>
</html>
