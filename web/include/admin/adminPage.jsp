<%--
  Created by IntelliJ IDEA.
  User: home-pc
  Date: 2017/8/7
  Time: 7:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" pageEncoding="UTF-8" %>
<html>
<head>
    <script>
        $(function () {
            
        })
    </script>
    <title>Title</title>
</head>
<body>
<nav>
    <ul class="pagination">
        <li <c:if test="${!page.hasPreviouse}">class="disabled" </c:if> ><%--如果页面没有前一页，则不可点击--%>
            <a href="?page.start=0${page.param}" aria-label="Previous">
                <span aria-hidden="true">«</span>
            </a>
        </li>
        <li <c:if test="${!page.hasPreviouse}">class="disable"</c:if> >
            <a href="?page.start=${page.start-page.count}${page.param}" aria-label="Previous">
                <span aria-hidden="true">‹</span>
            </a>
        </li>
        <c:forEach begin="0" end="${page.totalPage-1}" varStatus="status">

            <c:if test="${status.count*page.count-page.start<=20 &&status.count*page.count-page.start>=-10}">
                <li <c:if test="${status.index*page.count==page.start}">class="disabled" </c:if> >
                    <a
                            href="?page.start=${status.index*page.count}${page.param}"
                            <c:if test="${status.index*page.count==page.start}">class="current"</c:if>
                    >${status.count}</a>
                </li>
            </c:if>
        </c:forEach>

        <li <c:if test="${page.hasNext}">class="disabled"</c:if>  >
            <a href="?page.start=${page.start+page.count}${page.param}" aria-label="Next">
                <span aria-hidden="true">›</span>
            </a>
        </li>
        <li <c:if test="${!page.hasNext}">class="disabled"</c:if> >
            <a href="?page.start=${page.last}${page.param}" aria-label="Next">
                <span aria-hidden="true">»</span>
            </a>
        </li>
    </ul>
</nav>
</body>
</html>
