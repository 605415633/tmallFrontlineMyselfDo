<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%--
  Created by IntelliJ IDEA.
  User: home-pc
  Date: 2017/7/17
  Time: 14:56
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <script src="jQuery/jquery-3.2.1.js"></script>
    <link rel="stylesheet" href="bootstrap-3.3.7-dist/css/bootstrap.min.css">
    <script src="bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="homePageContentCss/homePageNavCss.css" />
</head>
<body>
<div class="homePageTopTmallImg">
    <img src="img/homePageNavTmallEar/catear.png" id="cater" style="width: 30px;position: absolute; height:20px;display: none ">
</div>
<div class="homePageNav">
<div class="homePageNavTopTitle">
<div class="homePageNavTopTitleFirst glyphicon glyphicon-th-list">
    商品分类
</div>
<a href="#"><span class="glyphicon glyphicon-shopping-cart"></span>天猫超市</a>
<a href="#"><span class="glyphicon glyphicon-globe"></span>天猫国际</a>
<c:forEach items="${cs}" var="c" varStatus="st">
    <c:if test="${st.count<=4}">
                <span>
                    <a href="forecategory?cid=${c.id}">
                            ${c.name}
                    </a>
                </span>
    </c:if>
    </c:forEach>

    </div>
    <script>
    $("div.homePageNavTopTitle a").mouseenter(function () {
    var tops=$(this).position().top;
    var left=$(this).position().left;
    var width=$(this).css("width");
    var lefts=parseInt(left)+parseInt(width)/2+30;
    $("img#cater").css("left",lefts);
    $("img#cater").css("top",parseInt(tops)-25);
    $("div.homePageTopTmallImg img").fadeIn(500);
    });
    $("div.homePageNavTopTitle a").mouseleave(function () {
    $("div.homePageTopTmallImg img").hide();
    });
    </script>
    <div class="homePageNavBottomItem">
    <div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
    <!-- Indicators -->
    <ol class="carousel-indicators">
    <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
    <li data-target="#carousel-example-generic" data-slide-to="1"></li>
    <li data-target="#carousel-example-generic" data-slide-to="2"></li>
    <li data-target="#carousel-example-generic" data-slide-to="3"></li>
    </ol>

    <!-- Wrapper for slides -->
    <div class="carousel-inner" role="listbox">
    <div class="item active">
    <img src="img/lunbo/1.jpg" >
    </div>
    <div class="item">
    <img src="img/lunbo/2.jpg" >
    </div>
    <div class="item">
    <img src="img/lunbo/3.jpg" >
    </div>
    <div class="item">
    <img src="img/lunbo/4.jpg" >
    </div>

    </div>

    <!-- Controls -->
    </div>
    <script>
    function showProductsAsideCategorys(cid) {
    $("div.bottomItemLeftContent span[cid="+cid+"]").css("background-color","white");
    $("div.bottomItemLeftContent span[cid="+cid+"]").css("color","#87CEFA");
    $("div.bottomItemRightContents[cid="+cid+"]").show();
    }
    function hideProductsAsideCategorys(cid) {
    $("div.bottomItemLeftContent span[cid="+cid+"]").css("background-color","#e2e2e3");
    $("div.bottomItemLeftContent span[cid="+cid+"]").css("color","#000");
    $("div.bottomItemRightContents[cid="+cid+"]").hide();
    }
    $(function () {
    $("div.bottomItemLeftContent span").mouseenter(function () {
    var cid=$(this).attr("cid");
    showProductsAsideCategorys(cid);
    });
    $("div.bottomItemLeftContent span").mouseleave(function () {
    var cid=$(this).attr("cid");
    hideProductsAsideCategorys(cid);
    });
    $("div.bottomItemRightContents").mouseenter(function () {
    var cid=$(this).attr("cid");
    showProductsAsideCategorys(cid);
    });
    $("div.bottomItemRightContents").mouseleave(function () {
    var cid=$(this).attr("cid");
    hideProductsAsideCategorys(cid);
    });
    });
    </script>
    <div class="bottomItemLeftContent">
        <c:forEach items="${cs}" var="c">
                <span cid="${c.id}">
                    <span class="glyphicon glyphicon-paperclip"></span><a href="forecategory?cid=${c.id}" cid="${c.id}">${c.name}</a>
                </span>
    </c:forEach>
    </div>
    <div class="bottomItemRightContent">
        <c:forEach items="${cs}" var="c">

            <div class="bottomItemRightContents" cid="${c.id}" style="display: none">

                <c:forEach items="${c.productsByRow}" var="ps">
                    <div class="bottomItemRightContentsLittleTag">
                        <c:forEach items="${ps}" var="p">
                            <c:if test="${!empty p.subTitle}">
                                <a href="foreproduct?pid=${p.id}">
                                    <c:forEach items="${fn:split(p.subTitle,' ')}" var="title" varStatus="st">
                                        <c:if test="${st.index==0}">
                                            ${title}
                                        </c:if>
                                    </c:forEach>
                                </a>
                            </c:if>
                        </c:forEach>
                    </div>
                </c:forEach>
            </div>
        </c:forEach>
        <script>
            $(function () {
                $("div.bottomItemRightContentsLittleTag a").each(function () {
                    var v=Math.round(Math.random()*6);
                    if(v==1)
                        $(this).css("color","#87CEFA");
                })
            })
        </script>

    </div>
    </div>
    </div>
    </div>
    </body>
</html>
