<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: home-pc
  Date: 2017/8/19
  Time: 7:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <script>
        $(function () {
            $("ul.pagination li.disabled a").click(function () {
                return false;
            })
        })
    </script>
</head>
<body>
<nav>
    <ul class="pagination">
        <li <c:if test="${!page.hasPreviouse}">class="disabled" </c:if> >
            <a href="?page.start=0${page.param}" aria-label="Previous">
            <span aria-hidden="true">«</span>
        </a>
        </li>
        <li <c:if test="${!page.hasPreviouse}">class="disabled" </c:if> >
            <a href="?page.start=${page.start-page.count}${page.param}" aria-label="Previous">
                <span aria-hidden="true">‹</span>
            </a>
        </li>
        <c:forEach begin="0" end="${page.totalPage-1}" varStatus="status">
            <c:if test="${status.count*page.count-page.start<=20&&status.count*page.count-page.start>=-10}">
                <li <c:if test="${status.index*page.count==page.start}">class="disabled" </c:if> >
                    <a
                            href="?page.start=${status.index*page.count}${page.param}"
                            <c:if test="${page.start==page.count*status.index}">class="current" </c:if>
                    >${status.count}</a>
                </li>
            </c:if>
        </c:forEach>
        <li <c:if test="${!page.hasNext}">class="disabled" </c:if> >
            <a href="?page.start=${page.start+page.count}${page.param}" aria-label="Next">
                <span aria-hidden="true">›</span>
            </a>
        </li>
        <li <c:if test="${!page.hasNext}">class="disabled" </c:if> >
            <a href="?page.start=${page.last}${page.param}" aria-label="Next">
                <span aria-hidden="true">»</span>
            </a>
        </li>
    </ul>
</nav>
</body>
</html>
