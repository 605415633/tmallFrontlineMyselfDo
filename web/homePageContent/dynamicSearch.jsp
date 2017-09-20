<%--
  Created by IntelliJ IDEA.
  User: home-pc
  Date: 2017/9/20
  Time: 21:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <script src="jQuery/jquery-3.2.1.js"></script>
    <link rel="stylesheet" href="bootstrap-3.3.7-dist/css/bootstrap.min.css">
    <script src="bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="homePageContentCss/dynamicSearchCss.css">
    <script>
        $(function () {
            $(window).scroll(function () {
                if($(window).scrollTop()>=1000){
                    $("div.dynamicSearch").fadeIn(500);
                }else
                    $("div.dynamicSearch").fadeOut(500);
            })
        })
    </script>
</head>
<body>
<div class="dynamicSearch">
    <span class="dynamicSearchSpan">TMALL</span>&nbsp;&nbsp;&nbsp;<span>天猫</span>
    <form method="post" action="foresearch">
        <input type="text" name="keyword" class="dynamicInput"><button type="submit" class="dynamicSearchButton">搜索</button>
    </form>
</div>
</body>
</html>
