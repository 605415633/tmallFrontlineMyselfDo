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
    <script src="../jQuery/jquery-3.2.1.js"></script>
    <link rel="stylesheet" href="../bootstrap-3.3.7-dist/css/bootstrap.min.css">
    <script src="../bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="../homePageContentCss/homePageNavCss.css" />
</head>
<body>
<div class="homePageTopTmallImg">
    <img src="../img/homePageNavTmallEar/catear.png" id="cater" style="width: 30px;position: absolute; height:20px;display: none ">
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
    <%--<span><a href="#">平板电视</a></span>--%>
    <%--<span><a href="#">马桶</a></span>--%>
    <%--<span><a href="#">沙发</a></span>--%>
    <%--<span><a href="#">电热水器</a></span>--%>
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
    <img src="../img/lunbo/1.jpg" >
    </div>
    <div class="item">
    <img src="../img/lunbo/2.jpg" >
    </div>
    <div class="item">
    <img src="../img/lunbo/3.jpg" >
    </div>

    <div class="item">
    <img src="../img/lunbo/4.jpg" >
    </div>

    </div>

    <!-- Controls -->
    </div>
    <script>
    function showProductsAsideCategorys(cid) {
    $("div.bottomItemLeftContent span[cid="+cid+"]").css("background-color","white");
    $("div.bottomItemLeftContent span[cid="+cid+"] a").css("color","#87CEFA");
    $("div.bottomItemRightContents[cid="+cid+"]").show();
    }
    function hideProductsAsideCategorys(cid) {
    $("div.bottomItemLeftContent span[cid="+cid+"]").css("background-color","#e2e2e3");
    $("div.bottomItemLeftContent span[cid="+cid+"] a").css("color","#000");
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
    //            function showProductsAsCategorys(cid) {
    //                $("div.bottomItemLeftContent span[cid="+cid+"]").css("background-color","white");
    //                $("div.bottomItemLeftContent span[cid="+cid+"] a").css("color","#87CEFA");
    //                $("div.bottomItemRightContents").show();
    //            };
    //           function hideProductsAsCategorys(cid) {
    //                $("div.bottomItemLeftContent span[cid="+cid+"]").css("background-color","#e2e2e3");
    //                $("div.bottomItemLeftContent span[cid="+cid+"] a").css("color","#000");
    //                $("div.bottomItemRightContents").hide();
    //            };
    //
    //            $(function () {
    //                $("div.bottomItemLeftContent").mouseenter(function () {
    //                    var cid=$(this).attr("cid");
    //                    showProductsAsCategorys(cid);
    //                });
    //                $("div.bottomItemLeftContent").mouseleave(function () {
    //                    var cid=$(this).attr("cid");
    //                    hideProductsAsCategorys(cid);
    //                });
    //                $("div.bottomItemRightContents").mouseenter(function () {
    //                    var cid=$(this).attr("cid");
    //                    showProductsAsCategorys(cid);
    //                });
    //                $("div.bottomItemRightContents").mouseleave(function () {
    //                    var cid=$(this).attr("cid");
    //                    hideProductsAsCategorys(cid);
    //                });
    //
    //
    //            });
    </script>
    <div class="bottomItemLeftContent">
    <%--<span cid="83"><span class="glyphicon glyphicon-paperclip"></span><a href="">平板电视</a></span>--%>
    <%--<span cid="82"><span class="glyphicon glyphicon-paperclip"></span><a href="">马桶</a></span>--%>
    <%--<span cid="81"><span class="glyphicon glyphicon-paperclip"></span><a href="">沙发</a></span>--%>
    <%--<span cid="80"><span class="glyphicon glyphicon-paperclip"></span><a href="">电热水器</a></span>--%>
    <%--<span cid="79"><span class="glyphicon glyphicon-paperclip"></span><a href="">平衡车</a></span>--%>
    <%--<span cid="78"><span class="glyphicon glyphicon-paperclip"></span><a href="">扫地机器人</a></span>--%>
    <%--<span cid="77"><span class="glyphicon glyphicon-paperclip"></span><a href="">原汁机</a></span>--%>
    <%--<span cid="76"><span class="glyphicon glyphicon-paperclip"></span><a href="">冰箱</a></span>--%>
    <%--<span cid="75"><span class="glyphicon glyphicon-paperclip"></span><a href="">空调</a></span>--%>
    <%--<span cid="74"><span class="glyphicon glyphicon-paperclip"></span><a href="">女表</a></span>--%>
    <%--<span cid="73"><span class="glyphicon glyphicon-paperclip"></span><a href="">男表</a></span>--%>
    <%--<span cid="72"><span class="glyphicon glyphicon-paperclip"></span><a href="">男士手拿包</a></span>--%>
    <%--<span cid="71"><span class="glyphicon glyphicon-paperclip"></span><a href="">男士西服</a></span>--%>
    <%--<span cid="70"><span class="glyphicon glyphicon-paperclip"></span><a href="">时尚男鞋</a></span>--%>
    <%--<span cid="69"><span class="glyphicon glyphicon-paperclip"></span><a href="">品牌女装</a></span>--%>
    <%--<span cid="68"><span class="glyphicon glyphicon-paperclip"></span><a href="">太阳镜</a></span>--%>
    <%--<span cid="67"><span class="glyphicon glyphicon-paperclip"></span><a href="">安全座椅</a></span>--%>
    <c:forEach items="${cs}" var="c">
                <span>
                    <span class="glyphicon glyphicon-paperclip"></span><a href="forecategory?cid=${c.id}">${c.name}</a>
                </span>
    </c:forEach>
    </div>
    <script>

    </script>
    <div class="bottomItemRightContent">
    <%--<c:forEach items="${cs}" var="c">--%>
        <%--就差这个了--%>
        <%--<div class="bottomItemRightContents" cid="${c.id}" style="display: none" >--%>
        <%--<c:forEach items="c.productsByRow" var="ps">--%>
        <%--<div class="bottomItemRightContentsLittleTag">--%>
        <%--<c:forEach items="${ps}" var="p">--%>
        <%--<c:if test="${!empty p.subTitle}">--%>
        <%--<a href="foreproduct?pid=${p.id}">--%>
        <%--<c:forEach items="${fn:split(p.subTitle,' ')}" var="title" varStatus="st">--%>
        <%--<c:if test="${st.index==0}">--%>
        <%--${title}--%>
        <%--</c:if>--%>
        <%--</c:forEach>--%>
        <%--</a>--%>
        <%--</c:if>--%>
        <%--</c:forEach>--%>
        <%--</div>--%>
        <%--</c:forEach>--%>
        <%--</div>--%>
    <%--</c:forEach>--%>



    <%--<div class="bottomItemRightContents" cid="83" style="display: none" >--%>
    <%--<div class="bottomItemRightContentsLittleTag"  >--%>
    <%--<a href="#">屏大影院</a>--%>
    <%--<a href="#">超大屏幕</a>--%>
    <%--<a href="#">4K时代</a>--%>
    <%--<a href="#">网络电视</a>--%>
    <%--<a href="#">新4G</a>--%>
    <%--<a href="#">动作大电影</a>--%>
    <%--<a href="#">电影新时代</a>--%>
    <%--</div>--%>
    <%--<div class="bottomItemRightContentsLittleTag" >--%>
    <%--<a href="#">屏大影院</a>--%>
    <%--<a href="#">超大屏幕</a>--%>
    <%--<a href="#">4K时代</a>--%>
    <%--<a href="#">网络电视</a>--%>
    <%--<a href="#">新4G</a>--%>
    <%--<a href="#">动作大电影</a>--%>
    <%--<a href="#">电影新时代</a>--%>
    <%--</div>--%>
    <%--<div class="bottomItemRightContentsLittleTag">--%>
    <%--<a href="#">屏大影院</a>--%>
    <%--<a href="#">超大屏幕</a>--%>
    <%--<a href="#">4K时代</a>--%>
    <%--<a href="#">网络电视</a>--%>
    <%--<a href="#">新4G</a>--%>
    <%--<a href="#">动作大电影</a>--%>
    <%--<a href="#">电影新时代</a>--%>
    <%--</div>--%>
    <%--<div class="bottomItemRightContentsLittleTag">--%>
    <%--<a href="#">屏大影院</a>--%>
    <%--<a href="#">超大屏幕</a>--%>
    <%--<a href="#">4K时代</a>--%>
    <%--<a href="#">网络电视</a>--%>
    <%--<a href="#">新4G</a>--%>
    <%--<a href="#">动作大电影</a>--%>
    <%--<a href="#">电影新时代</a>--%>
    <%--</div>--%>
    <%--<div class="bottomItemRightContentsLittleTag">--%>
    <%--<a href="#">屏大影院</a>--%>
    <%--<a href="#">超大屏幕</a>--%>
    <%--<a href="#">4K时代</a>--%>
    <%--<a href="#">网络电视</a>--%>
    <%--<a href="#">新4G</a>--%>
    <%--<a href="#">动作大电影</a>--%>
    <%--<a href="#">电影新时代</a>--%>
    <%--</div>--%>
    <%--<div class="bottomItemRightContentsLittleTag">--%>
    <%--<a href="#">屏大影院</a>--%>
    <%--<a href="#">超大屏幕</a>--%>
    <%--<a href="#">4K时代</a>--%>
    <%--<a href="#">网络电视</a>--%>
    <%--<a href="#">新4G</a>--%>
    <%--</div>--%>
    <%--<div class="bottomItemRightContentsLittleTag">--%>
    <%--<a href="#">屏大影院</a>--%>
    <%--<a href="#">超大屏幕</a>--%>
    <%--<a href="#">动作大电影</a>--%>
    <%--<a href="#">电影新时代</a>--%>
    <%--</div>--%>
    <%--<div class="bottomItemRightContentsLittleTag">--%>
    <%--<a href="#">超大屏幕</a>--%>
    <%--<a href="#">4K时代</a>--%>
    <%--<a href="#">网络电视</a>--%>
    <%--<a href="#">新4G</a>--%>
    <%--<a href="#">动作大电影</a>--%>
    <%--<a href="#">电影新时代</a>--%>
    <%--</div>--%>
    <%--</div>--%>
    <%--<div class="bottomItemRightContents" cid="82" style="display: none" >--%>
    <%--<div class="bottomItemRightContentsLittleTag"  >--%>
    <%--<a href="#">屏大影院</a>--%>
    <%--<a href="#">超大屏幕</a>--%>
    <%--<a href="#">4K时代</a>--%>
    <%--<a href="#">网络电视</a>--%>
    <%--<a href="#">新4G</a>--%>
    <%--<a href="#">动作大电影</a>--%>
    <%--<a href="#">电影新时代</a>--%>
    <%--</div>--%>
    <%--<div class="bottomItemRightContentsLittleTag" >--%>
    <%--<a href="#">屏大影院</a>--%>
    <%--<a href="#">超大屏幕</a>--%>
    <%--<a href="#">4K时代</a>--%>
    <%--<a href="#">网络电视</a>--%>
    <%--<a href="#">新4G</a>--%>
    <%--<a href="#">动作大电影</a>--%>
    <%--<a href="#">电影新时代</a>--%>
    <%--</div>--%>
    <%--<div class="bottomItemRightContentsLittleTag">--%>
    <%--<a href="#">屏大影院</a>--%>
    <%--<a href="#">超大屏幕</a>--%>
    <%--<a href="#">4K时代</a>--%>
    <%--<a href="#">网络电视</a>--%>
    <%--<a href="#">新4G</a>--%>
    <%--<a href="#">动作大电影</a>--%>
    <%--<a href="#">电影新时代</a>--%>
    <%--</div>--%>
    <%--<div class="bottomItemRightContentsLittleTag">--%>
    <%--<a href="#">屏大影院</a>--%>
    <%--<a href="#">超大屏幕</a>--%>
    <%--<a href="#">4K时代</a>--%>
    <%--<a href="#">网络电视</a>--%>
    <%--<a href="#">新4G</a>--%>
    <%--<a href="#">动作大电影</a>--%>
    <%--<a href="#">电影新时代</a>--%>
    <%--</div>--%>
    <%--<div class="bottomItemRightContentsLittleTag">--%>
    <%--<a href="#">屏大影院</a>--%>
    <%--<a href="#">超大屏幕</a>--%>
    <%--<a href="#">4K时代</a>--%>
    <%--<a href="#">网络电视</a>--%>
    <%--<a href="#">新4G</a>--%>
    <%--<a href="#">动作大电影</a>--%>
    <%--<a href="#">电影新时代</a>--%>
    <%--</div>--%>
    <%--<div class="bottomItemRightContentsLittleTag">--%>
    <%--<a href="#">屏大影院</a>--%>
    <%--<a href="#">超大屏幕</a>--%>
    <%--<a href="#">4K时代</a>--%>
    <%--<a href="#">网络电视</a>--%>
    <%--<a href="#">新4G</a>--%>
    <%--</div>--%>
    <%--<div class="bottomItemRightContentsLittleTag">--%>
    <%--<a href="#">屏大影院</a>--%>
    <%--<a href="#">超大屏幕</a>--%>
    <%--<a href="#">动作大电影</a>--%>
    <%--<a href="#">电影新时代</a>--%>
    <%--</div>--%>
    <%--<div class="bottomItemRightContentsLittleTag">--%>
    <%--<a href="#">超大屏幕</a>--%>
    <%--<a href="#">4K时代</a>--%>
    <%--<a href="#">网络电视</a>--%>
    <%--<a href="#">新4G</a>--%>
    <%--<a href="#">动作大电影</a>--%>
    <%--<a href="#">电影新时代</a>--%>
    <%--</div>--%>
    <%--</div>--%>
    <%--<div class="bottomItemRightContents" cid="81" style="display: none" >--%>
    <%--<div class="bottomItemRightContentsLittleTag"  >--%>
    <%--<a href="#">屏大影院</a>--%>
    <%--<a href="#">超大屏幕</a>--%>
    <%--<a href="#">4K时代</a>--%>
    <%--<a href="#">网络电视</a>--%>
    <%--</div>--%>
    <%--<div class="bottomItemRightContentsLittleTag" >--%>
    <%--<a href="#">屏大影院</a>--%>
    <%--<a href="#">超大屏幕</a>--%>
    <%--<a href="#">4K时代</a>--%>
    <%--<a href="#">网络电视</a>--%>
    <%--<a href="#">新4G</a>--%>
    <%--<a href="#">动作大电影</a>--%>
    <%--<a href="#">电影新时代</a>--%>
    <%--</div>--%>
    <%--<div class="bottomItemRightContentsLittleTag">--%>
    <%--<a href="#">屏大影院</a>--%>
    <%--<a href="#">超大屏幕</a>--%>
    <%--<a href="#">4K时代</a>--%>
    <%--<a href="#">网络电视</a>--%>
    <%--<a href="#">新4G</a>--%>
    <%--<a href="#">动作大电影</a>--%>
    <%--<a href="#">电影新时代</a>--%>
    <%--</div>--%>
    <%--<div class="bottomItemRightContentsLittleTag">--%>
    <%--<a href="#">屏大影院</a>--%>
    <%--<a href="#">超大屏幕</a>--%>
    <%--</div>--%>
    <%--<div class="bottomItemRightContentsLittleTag">--%>
    <%--<a href="#">屏大影院</a>--%>
    <%--<a href="#">超大屏幕</a>--%>
    <%--<a href="#">4K时代</a>--%>
    <%--<a href="#">网络电视</a>--%>
    <%--<a href="#">新4G</a>--%>
    <%--<a href="#">动作大电影</a>--%>
    <%--<a href="#">电影新时代</a>--%>
    <%--</div>--%>
    <%--<div class="bottomItemRightContentsLittleTag">--%>
    <%--<a href="#">屏大影院</a>--%>
    <%--<a href="#">超大屏幕</a>--%>
    <%--<a href="#">4K时代</a>--%>
    <%--<a href="#">网络电视</a>--%>
    <%--<a href="#">新4G</a>--%>
    <%--</div>--%>
    <%--<div class="bottomItemRightContentsLittleTag">--%>
    <%--<a href="#">屏大影院</a>--%>
    <%--<a href="#">超大屏幕</a>--%>
    <%--<a href="#">动作大电影</a>--%>

    <%--</div>--%>
    <%--<div class="bottomItemRightContentsLittleTag">--%>
    <%--<a href="#">超大屏幕</a>--%>
    <%--<a href="#">4K时代</a>--%>
    <%--<a href="#">网络电视</a>--%>

    <%--<a href="#">电影新时代</a>--%>
    <%--</div>--%>
    <%--</div>--%>
    <%--<div class="bottomItemRightContents" cid="80" style="display: none" >--%>
    <%--<div class="bottomItemRightContentsLittleTag"  >--%>
    <%--<a href="#">屏大影院</a>--%>
    <%--<a href="#">超大屏幕</a>--%>
    <%--<a href="#">动作大电影</a>--%>
    <%--<a href="#">电影新时代</a>--%>
    <%--</div>--%>
    <%--<div class="bottomItemRightContentsLittleTag" >--%>
    <%--<a href="#">屏大影院</a>--%>
    <%--<a href="#">超大屏幕</a>--%>
    <%--<a href="#">4K时代</a>--%>
    <%--</div>--%>
    <%--<div class="bottomItemRightContentsLittleTag">--%>
    <%--<a href="#">屏大影院</a>--%>
    <%--<a href="#">超大屏幕</a>--%>
    <%--<a href="#">4K时代</a>--%>
    <%--<a href="#">网络电视</a>--%>
    <%--<a href="#">新4G</a>--%>
    <%--<a href="#">动作大电影</a>--%>
    <%--<a href="#">电影新时代</a>--%>
    <%--</div>--%>
    <%--<div class="bottomItemRightContentsLittleTag">--%>
    <%--<a href="#">屏大影院</a>--%>
    <%--<a href="#">超大屏幕</a>--%>
    <%--<a href="#">4K时代</a>--%>
    <%--<a href="#">网络电视</a>--%>
    <%--</div>--%>
    <%--<div class="bottomItemRightContentsLittleTag">--%>
    <%--<a href="#">屏大影院</a>--%>
    <%--<a href="#">超大屏幕</a>--%>
    <%--<a href="#">4K时代</a>--%>
    <%--<a href="#">网络电视</a>--%>
    <%--<a href="#">新4G</a>--%>
    <%--<a href="#">动作大电影</a>--%>
    <%--<a href="#">电影新时代</a>--%>
    <%--</div>--%>
    <%--<div class="bottomItemRightContentsLittleTag">--%>
    <%--<a href="#">屏大影院</a>--%>
    <%--<a href="#">超大屏幕</a>--%>
    <%--<a href="#">4K时代</a>--%>
    <%--<a href="#">网络电视</a>--%>
    <%--<a href="#">新4G</a>--%>
    <%--</div>--%>
    <%--<div class="bottomItemRightContentsLittleTag">--%>
    <%--<a href="#">屏大影院</a>--%>
    <%--<a href="#">超大屏幕</a>--%>
    <%--<a href="#">动作大电影</a>--%>
    <%--</div>--%>
    <%--<div class="bottomItemRightContentsLittleTag">--%>
    <%--<a href="#">超大屏幕</a>--%>
    <%--<a href="#">4K时代</a>--%>
    <%--<a href="#">网络电视</a>--%>
    <%--<a href="#">新4G</a>--%>
    <%--<a href="#">动作大电影</a>--%>
    <%--<a href="#">电影新时代</a>--%>
    <%--</div>--%>
    <%--</div>--%>
    <%--<div class="bottomItemRightContents" cid="79" style="display: none" >--%>
    <%--<div class="bottomItemRightContentsLittleTag"  >--%>
    <%--<a href="#">屏大影院</a>--%>
    <%--<a href="#">超大屏幕</a>--%>
    <%--<a href="#">动作大电影</a>--%>
    <%--<a href="#">电影新时代</a>--%>
    <%--</div>--%>
    <%--<div class="bottomItemRightContentsLittleTag" >--%>
    <%--<a href="#">屏大影院</a>--%>
    <%--<a href="#">超大屏幕</a>--%>
    <%--<a href="#">4K时代</a>--%>
    <%--<a href="#">网络电视</a>--%>
    <%--</div>--%>
    <%--<div class="bottomItemRightContentsLittleTag">--%>
    <%--<a href="#">屏大影院</a>--%>
    <%--<a href="#">超大屏幕</a>--%>
    <%--<a href="#">4K时代</a>--%>
    <%--<a href="#">网络电视</a>--%>
    <%--<a href="#">新4G</a>--%>
    <%--<a href="#">动作大电影</a>--%>
    <%--<a href="#">电影新时代</a>--%>
    <%--</div>--%>
    <%--<div class="bottomItemRightContentsLittleTag">--%>
    <%--<a href="#">屏大影院</a>--%>
    <%--<a href="#">新4G</a>--%>
    <%--<a href="#">动作大电影</a>--%>
    <%--<a href="#">电影新时代</a>--%>
    <%--</div>--%>
    <%--<div class="bottomItemRightContentsLittleTag">--%>
    <%--<a href="#">屏大影院</a>--%>
    <%--<a href="#">超大屏幕</a>--%>
    <%--<a href="#">4K时代</a>--%>
    <%--<a href="#">网络电视</a>--%>
    <%--<a href="#">新4G</a>--%>
    <%--<a href="#">动作大电影</a>--%>
    <%--<a href="#">电影新时代</a>--%>
    <%--</div>--%>
    <%--<div class="bottomItemRightContentsLittleTag">--%>
    <%--<a href="#">屏大影院</a>--%>
    <%--<a href="#">超大屏幕</a>--%>
    <%--<a href="#">4K时代</a>--%>
    <%--<a href="#">网络电视</a>--%>
    <%--<a href="#">新4G</a>--%>
    <%--</div>--%>
    <%--<div class="bottomItemRightContentsLittleTag">--%>
    <%--<a href="#">屏大影院</a>--%>
    <%--<a href="#">超大屏幕</a>--%>
    <%--<a href="#">动作大电影</a>--%>
    <%--<a href="#">电影新时代</a>--%>
    <%--</div>--%>
    <%--<div class="bottomItemRightContentsLittleTag">--%>
    <%--<a href="#">超大屏幕</a>--%>
    <%--<a href="#">4K时代</a>--%>
    <%--<a href="#">动作大电影</a>--%>
    <%--<a href="#">电影新时代</a>--%>
    <%--</div>--%>
    <%--</div>--%>
    <%--<div class="bottomItemRightContents" cid="78" style="display: none" >--%>
    <%--<div class="bottomItemRightContentsLittleTag"  >--%>
    <%--<a href="#">屏大影院</a>--%>
    <%--<a href="#">超大屏幕</a>--%>
    <%--<a href="#">4K时代</a>--%>
    <%--<a href="#">电影新时代</a>--%>
    <%--</div>--%>
    <%--<div class="bottomItemRightContentsLittleTag" >--%>
    <%--<a href="#">屏大影院</a>--%>
    <%--<a href="#">超大屏幕</a>--%>
    <%--<a href="#">4K时代</a>--%>
    <%--<a href="#">网络电视</a>--%>
    <%--<a href="#">新4G</a>--%>
    <%--<a href="#">动作大电影</a>--%>
    <%--<a href="#">电影新时代</a>--%>
    <%--</div>--%>
    <%--<div class="bottomItemRightContentsLittleTag">--%>
    <%--<a href="#">屏大影院</a>--%>
    <%--<a href="#">超大屏幕</a>--%>
    <%--<a href="#">4K时代</a>--%>
    <%--<a href="#">网络电视</a>--%>
    <%--<a href="#">新4G</a>--%>
    <%--<a href="#">动作大电影</a>--%>
    <%--<a href="#">电影新时代</a>--%>
    <%--</div>--%>
    <%--<div class="bottomItemRightContentsLittleTag">--%>
    <%--<a href="#">屏大影院</a>--%>
    <%--<a href="#">动作大电影</a>--%>
    <%--<a href="#">电影新时代</a>--%>
    <%--</div>--%>
    <%--<div class="bottomItemRightContentsLittleTag">--%>
    <%--<a href="#">屏大影院</a>--%>
    <%--<a href="#">超大屏幕</a>--%>
    <%--<a href="#">4K时代</a>--%>
    <%--</div>--%>
    <%--<div class="bottomItemRightContentsLittleTag">--%>
    <%--<a href="#">屏大影院</a>--%>
    <%--<a href="#">超大屏幕</a>--%>
    <%--<a href="#">4K时代</a>--%>
    <%--<a href="#">网络电视</a>--%>
    <%--<a href="#">新4G</a>--%>
    <%--</div>--%>
    <%--<div class="bottomItemRightContentsLittleTag">--%>
    <%--<a href="#">屏大影院</a>--%>
    <%--<a href="#">超大屏幕</a>--%>
    <%--</div>--%>
    <%--<div class="bottomItemRightContentsLittleTag">--%>
    <%--<a href="#">超大屏幕</a>--%>
    <%--<a href="#">4K时代</a>--%>
    <%--<a href="#">网络电视</a>--%>
    <%--<a href="#">新4G</a>--%>
    <%--<a href="#">动作大电影</a>--%>
    <%--<a href="#">电影新时代</a>--%>
    <%--</div>--%>
    <%--</div>--%>
    <%--<div class="bottomItemRightContents" cid="77" style="display: none" >--%>
    <%--<div class="bottomItemRightContentsLittleTag"  >--%>
    <%--<a href="#">屏大影院</a>--%>
    <%--<a href="#">超大屏幕</a>--%>
    <%--<a href="#">动作大电影</a>--%>
    <%--<a href="#">电影新时代</a>--%>
    <%--</div>--%>
    <%--<div class="bottomItemRightContentsLittleTag" >--%>
    <%--<a href="#">屏大影院</a>--%>
    <%--<a href="#">超大屏幕</a>--%>
    <%--<a href="#">动作大电影</a>--%>
    <%--<a href="#">电影新时代</a>--%>
    <%--</div>--%>
    <%--<div class="bottomItemRightContentsLittleTag">--%>
    <%--<a href="#">屏大影院</a>--%>
    <%--<a href="#">超大屏幕</a>--%>
    <%--<a href="#">动作大电影</a>--%>
    <%--<a href="#">电影新时代</a>--%>
    <%--</div>--%>
    <%--<div class="bottomItemRightContentsLittleTag">--%>
    <%--<a href="#">屏大影院</a>--%>
    <%--<a href="#">超大屏幕</a>--%>
    <%--<a href="#">4K时代</a>--%>
    <%--<a href="#">网络电视</a>--%>
    <%--<a href="#">新4G</a>--%>
    <%--<a href="#">动作大电影</a>--%>
    <%--<a href="#">电影新时代</a>--%>
    <%--</div>--%>
    <%--<div class="bottomItemRightContentsLittleTag">--%>
    <%--<a href="#">屏大影院</a>--%>
    <%--<a href="#">超大屏幕</a>--%>
    <%--<a href="#">4K时代</a>--%>
    <%--<a href="#">网络电视</a>--%>
    <%--<a href="#">新4G</a>--%>
    <%--<a href="#">动作大电影</a>--%>
    <%--<a href="#">电影新时代</a>--%>
    <%--</div>--%>
    <%--<div class="bottomItemRightContentsLittleTag">--%>
    <%--<a href="#">屏大影院</a>--%>
    <%--<a href="#">超大屏幕</a>--%>
    <%--<a href="#">4K时代</a>--%>
    <%--<a href="#">网络电视</a>--%>
    <%--<a href="#">新4G</a>--%>
    <%--</div>--%>
    <%--<div class="bottomItemRightContentsLittleTag">--%>
    <%--<a href="#">屏大影院</a>--%>
    <%--<a href="#">超大屏幕</a>--%>
    <%--<a href="#">电影新时代</a>--%>
    <%--</div>--%>
    <%--<div class="bottomItemRightContentsLittleTag">--%>
    <%--<a href="#">超大屏幕</a>--%>
    <%--<a href="#">4K时代</a>--%>
    <%--<a href="#">网络电视</a>--%>
    <%--<a href="#">新4G</a>--%>
    <%--<a href="#">动作大电影</a>--%>
    <%--<a href="#">电影新时代</a>--%>
    <%--</div>--%>
    <%--</div>--%>
    <%--<div class="bottomItemRightContents" cid="76" style="display: none" >--%>
    <%--<div class="bottomItemRightContentsLittleTag"  >--%>
    <%--<a href="#">屏大影院</a>--%>
    <%--<a href="#">新4G</a>--%>
    <%--<a href="#">动作大电影</a>--%>
    <%--<a href="#">电影新时代</a>--%>
    <%--</div>--%>
    <%--<div class="bottomItemRightContentsLittleTag" >--%>
    <%--<a href="#">屏大影院</a>--%>
    <%--<a href="#">超大屏幕</a>--%>
    <%--<a href="#">动作大电影</a>--%>
    <%--<a href="#">电影新时代</a>--%>
    <%--</div>--%>
    <%--<div class="bottomItemRightContentsLittleTag">--%>
    <%--<a href="#">屏大影院</a>--%>
    <%--<a href="#">超大屏幕</a>--%>
    <%--<a href="#">4K时代</a>--%>
    <%--<a href="#">网络电视</a>--%>
    <%--<a href="#">新4G</a>--%>
    <%--<a href="#">动作大电影</a>--%>
    <%--<a href="#">电影新时代</a>--%>
    <%--</div>--%>
    <%--<div class="bottomItemRightContentsLittleTag">--%>
    <%--<a href="#">屏大影院</a>--%>
    <%--<a href="#">网络电视</a>--%>
    <%--<a href="#">新4G</a>--%>
    <%--<a href="#">动作大电影</a>--%>
    <%--<a href="#">电影新时代</a>--%>
    <%--</div>--%>
    <%--<div class="bottomItemRightContentsLittleTag">--%>
    <%--<a href="#">屏大影院</a>--%>
    <%--<a href="#">超大屏幕</a>--%>
    <%--<a href="#">新4G</a>--%>
    <%--<a href="#">动作大电影</a>--%>
    <%--<a href="#">电影新时代</a>--%>
    <%--</div>--%>
    <%--<div class="bottomItemRightContentsLittleTag">--%>
    <%--<a href="#">屏大影院</a>--%>
    <%--<a href="#">网络电视</a>--%>
    <%--<a href="#">新4G</a>--%>
    <%--</div>--%>
    <%--<div class="bottomItemRightContentsLittleTag">--%>
    <%--<a href="#">屏大影院</a>--%>
    <%--<a href="#">超大屏幕</a>--%>
    <%--<a href="#">动作大电影</a>--%>
    <%--<a href="#">电影新时代</a>--%>
    <%--</div>--%>
    <%--<div class="bottomItemRightContentsLittleTag">--%>
    <%--<a href="#">超大屏幕</a>--%>
    <%--<a href="#">4K时代</a>--%>
    <%--<a href="#">动作大电影</a>--%>
    <%--<a href="#">电影新时代</a>--%>
    <%--</div>--%>
    <%--</div>--%>
    <%--<div class="bottomItemRightContents" cid="75" style="display: none" >--%>
    <%--<div class="bottomItemRightContentsLittleTag"  >--%>
    <%--<a href="#">屏大影院</a>--%>
    <%--<a href="#">超大屏幕</a>--%>
    <%--<a href="#">4K时代</a>--%>
    <%--<a href="#">动作大电影</a>--%>
    <%--<a href="#">电影新时代</a>--%>
    <%--</div>--%>
    <%--<div class="bottomItemRightContentsLittleTag" >--%>
    <%--<a href="#">屏大影院</a>--%>
    <%--<a href="#">超大屏幕</a>--%>
    <%--<a href="#">4K时代</a>--%>
    <%--<a href="#">网络电视</a>--%>
    <%--<a href="#">新4G</a>--%>
    <%--<a href="#">动作大电影</a>--%>
    <%--<a href="#">电影新时代</a>--%>
    <%--</div>--%>
    <%--<div class="bottomItemRightContentsLittleTag">--%>
    <%--<a href="#">屏大影院</a>--%>
    <%--<a href="#">网络电视</a>--%>
    <%--<a href="#">新4G</a>--%>
    <%--<a href="#">动作大电影</a>--%>
    <%--<a href="#">电影新时代</a>--%>
    <%--</div>--%>
    <%--<div class="bottomItemRightContentsLittleTag">--%>
    <%--<a href="#">屏大影院</a>--%>
    <%--<a href="#">超大屏幕</a>--%>
    <%--<a href="#">4K时代</a>--%>
    <%--<a href="#">网络电视</a>--%>
    <%--</div>--%>
    <%--<div class="bottomItemRightContentsLittleTag">--%>
    <%--<a href="#">屏大影院</a>--%>
    <%--<a href="#">超大屏幕</a>--%>
    <%--<a href="#">4K时代</a>--%>
    <%--<a href="#">网络电视</a>--%>
    <%--<a href="#">新4G</a>--%>
    <%--<a href="#">动作大电影</a>--%>
    <%--<a href="#">电影新时代</a>--%>
    <%--</div>--%>
    <%--<div class="bottomItemRightContentsLittleTag">--%>
    <%--<a href="#">屏大影院</a>--%>
    <%--<a href="#">超大屏幕</a>--%>
    <%--<a href="#">网络电视</a>--%>
    <%--<a href="#">新4G</a>--%>
    <%--</div>--%>
    <%--<div class="bottomItemRightContentsLittleTag">--%>
    <%--<a href="#">屏大影院</a>--%>
    <%--<a href="#">超大屏幕</a>--%>
    <%--</div>--%>
    <%--<div class="bottomItemRightContentsLittleTag">--%>
    <%--<a href="#">超大屏幕</a>--%>
    <%--<a href="#">4K时代</a>--%>
    <%--<a href="#">网络电视</a>--%>
    <%--<a href="#">新4G</a>--%>
    <%--<a href="#">动作大电影</a>--%>
    <%--<a href="#">电影新时代</a>--%>
    <%--</div>--%>
    <%--</div>--%>
    <%--<div class="bottomItemRightContents" cid="74" style="display: none" >--%>
    <%--<div class="bottomItemRightContentsLittleTag"  >--%>
    <%--<a href="#">屏大影院</a>--%>
    <%--<a href="#">超大屏幕</a>--%>
    <%--<a href="#">新4G</a>--%>
    <%--<a href="#">动作大电影</a>--%>
    <%--<a href="#">电影新时代</a>--%>
    <%--</div>--%>
    <%--<div class="bottomItemRightContentsLittleTag" >--%>
    <%--<a href="#">屏大影院</a>--%>
    <%--<a href="#">超大屏幕</a>--%>
    <%--<a href="#">新4G</a>--%>
    <%--<a href="#">动作大电影</a>--%>
    <%--<a href="#">电影新时代</a>--%>
    <%--</div>--%>
    <%--<div class="bottomItemRightContentsLittleTag">--%>
    <%--<a href="#">屏大影院</a>--%>
    <%--<a href="#">超大屏幕</a>--%>
    <%--<a href="#">4K时代</a>--%>
    <%--<a href="#">网络电视</a>--%>
    <%--</div>--%>
    <%--<div class="bottomItemRightContentsLittleTag">--%>
    <%--<a href="#">屏大影院</a>--%>
    <%--<a href="#">超大屏幕</a>--%>
    <%--<a href="#">4K时代</a>--%>
    <%--<a href="#">网络电视</a>--%>
    <%--<a href="#">新4G</a>--%>
    <%--<a href="#">动作大电影</a>--%>
    <%--<a href="#">电影新时代</a>--%>
    <%--</div>--%>
    <%--<div class="bottomItemRightContentsLittleTag">--%>
    <%--<a href="#">屏大影院</a>--%>
    <%--<a href="#">超大屏幕</a>--%>
    <%--<a href="#">动作大电影</a>--%>
    <%--<a href="#">电影新时代</a>--%>
    <%--</div>--%>
    <%--<div class="bottomItemRightContentsLittleTag">--%>
    <%--<a href="#">屏大影院</a>--%>
    <%--<a href="#">超大屏幕</a>--%>
    <%--<a href="#">4K时代</a>--%>
    <%--<a href="#">网络电视</a>--%>
    <%--<a href="#">新4G</a>--%>
    <%--</div>--%>
    <%--<div class="bottomItemRightContentsLittleTag">--%>
    <%--<a href="#">屏大影院</a>--%>
    <%--<a href="#">电影新时代</a>--%>
    <%--</div>--%>
    <%--<div class="bottomItemRightContentsLittleTag">--%>
    <%--<a href="#">超大屏幕</a>--%>
    <%--<a href="#">新4G</a>--%>
    <%--<a href="#">动作大电影</a>--%>
    <%--<a href="#">电影新时代</a>--%>
    <%--</div>--%>
    <%--</div>--%>
    <%--<div class="bottomItemRightContents" cid="73" style="display: none" >--%>
    <%--<div class="bottomItemRightContentsLittleTag"  >--%>
    <%--<a href="#">屏大影院</a>--%>
    <%-->--%>
    <%--<a href="#">4K时代</a>--%>
    <%--<a href="#">网络电视</a>--%>
    <%--<a href="#">新4G</a>--%>
    <%--<a href="#">动作大电影</a>--%>
    <%--<a href="#">电影新时代</a>--%>
    <%--</div>--%>
    <%--<div class="bottomItemRightContentsLittleTag" >--%>
    <%--<a href="#">屏大影院</a>--%>
    <%--<a href="#">超大屏幕</a>--%>
    <%--<a href="#">动作大电影</a>--%>
    <%--<a href="#">电影新时代</a>--%>
    <%--</div>--%>
    <%--<div class="bottomItemRightContentsLittleTag">--%>
    <%--<a href="#">屏大影院</a>--%>
    <%--<a href="#">超大屏幕</a>--%>
    <%--<a href="#">4K时代</a>--%>
    <%--<a href="#">网络电视</a>--%>
    <%--<a href="#">新4G</a>--%>
    <%--<a href="#">动作大电影</a>--%>
    <%--<a href="#">电影新时代</a>--%>
    <%--</div>--%>
    <%--<div class="bottomItemRightContentsLittleTag">--%>
    <%--<a href="#">屏大影院</a>--%>
    <%--<a href="#">超大屏幕</a>--%>
    <%--<a href="#">4K时代</a>--%>
    <%--<a href="#">网络电视</a>--%>
    <%--<a href="#">新4G</a>--%>
    <%--<a href="#">动作大电影</a>--%>
    <%--<a href="#">电影新时代</a>--%>
    <%--</div>--%>
    <%--<div class="bottomItemRightContentsLittleTag">--%>
    <%--<a href="#">屏大影院</a>--%>
    <%--<a href="#">动作大电影</a>--%>
    <%--<a href="#">电影新时代</a>--%>
    <%--</div>--%>
    <%--<div class="bottomItemRightContentsLittleTag">--%>
    <%--<a href="#">屏大影院</a>--%>
    <%--<a href="#">超大屏幕</a>--%>
    <%--<a href="#">4K时代</a>--%>
    <%--<a href="#">网络电视</a>--%>
    <%--<a href="#">新4G</a>--%>
    <%--</div>--%>
    <%--<div class="bottomItemRightContentsLittleTag">--%>
    <%--<a href="#">动作大电影</a>--%>
    <%--<a href="#">电影新时代</a>--%>
    <%--</div>--%>
    <%--<div class="bottomItemRightContentsLittleTag">--%>
    <%--<a href="#">超大屏幕</a>--%>
    <%--<a href="#">4K时代</a>--%>
    <%--<a href="#">网络电视</a>--%>
    <%--<a href="#">电影新时代</a>--%>
    <%--</div>--%>
    <%--</div>--%>
    <%--<div class="bottomItemRightContents" cid="72" style="display: none" >--%>
    <%--<div class="bottomItemRightContentsLittleTag"  >--%>
    <%--<a href="#">屏大影院</a>--%>
    <%--<a href="#">超大屏幕</a>--%>
    <%--<a href="#">4K时代</a>--%>
    <%--<a href="#">网络电视</a>--%>
    <%--<a href="#">新4G</a>--%>
    <%--<a href="#">动作大电影</a>--%>
    <%--<a href="#">电影新时代</a>--%>
    <%--</div>--%>
    <%--<div class="bottomItemRightContentsLittleTag" >--%>
    <%--<a href="#">屏大影院</a>--%>
    <%--<a href="#">新4G</a>--%>
    <%--<a href="#">动作大电影</a>--%>
    <%--<a href="#">电影新时代</a>--%>
    <%--</div>--%>
    <%--<div class="bottomItemRightContentsLittleTag">--%>
    <%--<a href="#">屏大影院</a>--%>
    <%--<a href="#">网络电视</a>--%>
    <%--<a href="#">新4G</a>--%>
    <%--<a href="#">动作大电影</a>--%>
    <%--<a href="#">电影新时代</a>--%>
    <%--</div>--%>
    <%--<div class="bottomItemRightContentsLittleTag">--%>
    <%--<a href="#">屏大影院</a>--%>
    <%--<a href="#">新4G</a>--%>
    <%--<a href="#">动作大电影</a>--%>
    <%--<a href="#">电影新时代</a>--%>
    <%--</div>--%>
    <%--<div class="bottomItemRightContentsLittleTag">--%>
    <%--<a href="#">屏大影院</a>--%>
    <%--<a href="#">超大屏幕</a>--%>
    <%--<a href="#">4K时代</a>--%>
    <%--<a href="#">网络电视</a>--%>
    <%--<a href="#">新4G</a>--%>
    <%--</div>--%>
    <%--<div class="bottomItemRightContentsLittleTag">--%>
    <%--<a href="#">4K时代</a>--%>
    <%--<a href="#">网络电视</a>--%>
    <%--<a href="#">新4G</a>--%>
    <%--</div>--%>
    <%--<div class="bottomItemRightContentsLittleTag">--%>
    <%--<a href="#">屏大影院</a>--%>
    <%--<a href="#">超大屏幕</a>--%>
    <%--<a href="#">动作大电影</a>--%>
    <%--<a href="#">电影新时代</a>--%>
    <%--</div>--%>
    <%--<div class="bottomItemRightContentsLittleTag">--%>
    <%--<a href="#">网络电视</a>--%>
    <%--<a href="#">新4G</a>--%>
    <%--<a href="#">动作大电影</a>--%>
    <%--<a href="#">电影新时代</a>--%>
    <%--</div>--%>
    <%--</div>--%>
    <%--<div class="bottomItemRightContents" cid="71" style="display: none" >--%>
    <%--<div class="bottomItemRightContentsLittleTag"  >--%>
    <%--<a href="#">动作大电影</a>--%>
    <%--<a href="#">电影新时代</a>--%>
    <%--</div>--%>
    <%--<div class="bottomItemRightContentsLittleTag" >--%>
    <%--<a href="#">屏大影院</a>--%>
    <%--<a href="#">超大屏幕</a>--%>
    <%--<a href="#">4K时代</a>--%>
    <%--<a href="#">网络电视</a>--%>
    <%--<a href="#">新4G</a>--%>
    <%--<a href="#">动作大电影</a>--%>
    <%--<a href="#">电影新时代</a>--%>
    <%--</div>--%>
    <%--<div class="bottomItemRightContentsLittleTag">--%>
    <%--<a href="#">屏大影院</a>--%>
    <%--<a href="#">超大屏幕</a>--%>
    <%--<a href="#">动作大电影</a>--%>
    <%--<a href="#">电影新时代</a>--%>
    <%--</div>--%>
    <%--<div class="bottomItemRightContentsLittleTag">--%>
    <%--<a href="#">屏大影院</a>--%>
    <%--<a href="#">超大屏幕</a>--%>
    <%--<a href="#">4K时代</a>--%>
    <%--<a href="#">网络电视</a>--%>
    <%--<a href="#">新4G</a>--%>
    <%--<a href="#">电影新时代</a>--%>
    <%--</div>--%>
    <%--<div class="bottomItemRightContentsLittleTag">--%>
    <%--<a href="#">屏大影院</a>--%>
    <%--<a href="#">超大屏幕</a>--%>
    <%--<a href="#">4K时代</a>--%>
    <%--<a href="#">网络电视</a>--%>
    <%--<a href="#">新4G</a>--%>
    <%--<a href="#">动作大电影</a>--%>
    <%--<a href="#">电影新时代</a>--%>
    <%--</div>--%>
    <%--<div class="bottomItemRightContentsLittleTag">--%>
    <%--<a href="#">屏大影院</a>--%>
    <%--<a href="#">超大屏幕</a>--%>
    <%--<a href="#">网络电视</a>--%>
    <%--<a href="#">新4G</a>--%>
    <%--</div>--%>
    <%--<div class="bottomItemRightContentsLittleTag">--%>
    <%--<a href="#">屏大影院</a>--%>
    <%--<a href="#">超大屏幕</a>--%>
    <%--<a href="#">动作大电影</a>--%>
    <%--<a href="#">电影新时代</a>--%>
    <%--</div>--%>
    <%--<div class="bottomItemRightContentsLittleTag">--%>
    <%--<a href="#">超大屏幕</a>--%>

    <%--<a href="#">网络电视</a>--%>
    <%--<a href="#">新4G</a>--%>
    <%--<a href="#">动作大电影</a>--%>
    <%--<a href="#">电影新时代</a>--%>
    <%--</div>--%>
    <%--</div>--%>
    <%--<div class="bottomItemRightContents" cid="70" style="display: none" >--%>
    <%--<div class="bottomItemRightContentsLittleTag"  >--%>
    <%--<a href="#">屏大影院</a>--%>
    <%--<a href="#">超大屏幕</a>--%>
    <%--<a href="#">4K时代</a>--%>
    <%--<a href="#">新4G</a>--%>
    <%--<a href="#">动作大电影</a>--%>
    <%--<a href="#">电影新时代</a>--%>
    <%--</div>--%>
    <%--<div class="bottomItemRightContentsLittleTag" >--%>
    <%--<a href="#">屏大影院</a>--%>
    <%--<a href="#">超大屏幕</a>--%>

    <%--<a href="#">新4G</a>--%>
    <%--<a href="#">动作大电影</a>--%>
    <%--<a href="#">电影新时代</a>--%>
    <%--</div>--%>
    <%--<div class="bottomItemRightContentsLittleTag">--%>
    <%--<a href="#">屏大影院</a>--%>
    <%--<a href="#">超大屏幕</a>--%>
    <%--<a href="#">4K时代</a>--%>
    <%--<a href="#">网络电视</a>--%>
    <%--<a href="#">新4G</a>--%>
    <%--<a href="#">电影新时代</a>--%>
    <%--</div>--%>
    <%--<div class="bottomItemRightContentsLittleTag">--%>
    <%--<a href="#">屏大影院</a>--%>
    <%--<a href="#">超大屏幕</a>--%>
    <%--<a href="#">4K时代</a>--%>
    <%--<a href="#">网络电视</a>--%>
    <%--<a href="#">新4G</a>--%>
    <%--<a href="#">动作大电影</a>--%>
    <%--<a href="#">电影新时代</a>--%>
    <%--</div>--%>
    <%--<div class="bottomItemRightContentsLittleTag">--%>
    <%--<a href="#">屏大影院</a>--%>
    <%--<a href="#">4K时代</a>--%>
    <%--<a href="#">网络电视</a>--%>
    <%--<a href="#">新4G</a>--%>
    <%--<a href="#">动作大电影</a>--%>
    <%--<a href="#">电影新时代</a>--%>
    <%--</div>--%>
    <%--<div class="bottomItemRightContentsLittleTag">--%>
    <%--<a href="#">屏大影院</a>--%>
    <%--<a href="#">超大屏幕</a>--%>
    <%--<a href="#">4K时代</a>--%>
    <%--<a href="#">网络电视</a>--%>
    <%--<a href="#">新4G</a>--%>
    <%--</div>--%>
    <%--<div class="bottomItemRightContentsLittleTag">--%>
    <%--<a href="#">屏大影院</a>--%>
    <%--<a href="#">超大屏幕</a>--%>
    <%--<a href="#">电影新时代</a>--%>
    <%--</div>--%>
    <%--<div class="bottomItemRightContentsLittleTag">--%>
    <%--<a href="#">超大屏幕</a>--%>
    <%--<a href="#">4K时代</a>--%>
    <%--<a href="#">网络电视</a>--%>
    <%--<a href="#">新4G</a>--%>
    <%--<a href="#">动作大电影</a>--%>
    <%--<a href="#">电影新时代</a>--%>
    <%--</div>--%>
    <%--</div>--%>
    <%--<div class="bottomItemRightContents" cid="69" style="display: none" >--%>
    <%--<div class="bottomItemRightContentsLittleTag"  >--%>
    <%--<a href="#">屏大影院</a>--%>
    <%--<a href="#">4K时代</a>--%>
    <%--<a href="#">网络电视</a>--%>
    <%--<a href="#">新4G</a>--%>
    <%--<a href="#">动作大电影</a>--%>
    <%--<a href="#">电影新时代</a>--%>
    <%--</div>--%>
    <%--<div class="bottomItemRightContentsLittleTag" >--%>
    <%--<a href="#">屏大影院</a>--%>
    <%--<a href="#">超大屏幕</a>--%>
    <%--<a href="#">4K时代</a>--%>
    <%--<a href="#">动作大电影</a>--%>
    <%--<a href="#">电影新时代</a>--%>
    <%--</div>--%>
    <%--<div class="bottomItemRightContentsLittleTag">--%>
    <%--<a href="#">屏大影院</a>--%>
    <%--<a href="#">超大屏幕</a>--%>
    <%--<a href="#">4K时代</a>--%>
    <%--<a href="#">网络电视</a>--%>
    <%--<a href="#">新4G</a>--%>
    <%--<a href="#">动作大电影</a>--%>
    <%--<a href="#">电影新时代</a>--%>
    <%--</div>--%>
    <%--<div class="bottomItemRightContentsLittleTag">--%>
    <%--<a href="#">屏大影院</a>--%>
    <%--<a href="#">网络电视</a>--%>
    <%--<a href="#">新4G</a>--%>
    <%--<a href="#">动作大电影</a>--%>
    <%--<a href="#">电影新时代</a>--%>
    <%--</div>--%>
    <%--<div class="bottomItemRightContentsLittleTag">--%>
    <%--<a href="#">屏大影院</a>--%>
    <%--<a href="#">超大屏幕</a>--%>
    <%--<a href="#">4K时代</a>--%>
    <%--<a href="#">网络电视</a>--%>
    <%--<a href="#">动作大电影</a>--%>
    <%--<a href="#">电影新时代</a>--%>
    <%--</div>--%>
    <%--<div class="bottomItemRightContentsLittleTag">--%>
    <%--<a href="#">屏大影院</a>--%>
    <%--<a href="#">超大屏幕</a>--%>
    <%--<a href="#">4K时代</a>--%>
    <%--<a href="#">网络电视</a>--%>
    <%--<a href="#">新4G</a>--%>
    <%--</div>--%>
    <%--<div class="bottomItemRightContentsLittleTag">--%>
    <%--<a href="#">屏大影院</a>--%>
    <%--<a href="#">超大屏幕</a>--%>
    <%--<a href="#">动作大电影</a>--%>
    <%--<a href="#">电影新时代</a>--%>
    <%--</div>--%>
    <%--<div class="bottomItemRightContentsLittleTag">--%>
    <%--<a href="#">超大屏幕</a>--%>
    <%--<a href="#">4K时代</a>--%>
    <%--<a href="#">新4G</a>--%>
    <%--<a href="#">动作大电影</a>--%>
    <%--<a href="#">电影新时代</a>--%>
    <%--</div>--%>
    <%--</div>--%>
    <%--<div class="bottomItemRightContents" cid="68" style="display: none" >--%>
    <%--<div class="bottomItemRightContentsLittleTag"  >--%>
    <%--<a href="#">屏大影院</a>--%>
    <%--<a href="#">超大屏幕</a>--%>
    <%--<a href="#">4K时代</a>--%>
    <%--<a href="#">网络电视</a>--%>
    <%--<a href="#">新4G</a>--%>
    <%--<a href="#">动作大电影</a>--%>
    <%--<a href="#">电影新时代</a>--%>
    <%--</div>--%>
    <%--<div class="bottomItemRightContentsLittleTag" >--%>
    <%--<a href="#">屏大影院</a>--%>
    <%--<a href="#">超大屏幕</a>--%>
    <%--<a href="#">4K时代</a>--%>
    <%--<a href="#">网络电视</a>--%>
    <%--<a href="#">新4G</a>--%>
    <%--<a href="#">动作大电影</a>--%>
    <%--<a href="#">电影新时代</a>--%>
    <%--</div>--%>
    <%--<div class="bottomItemRightContentsLittleTag">--%>
    <%--<a href="#">屏大影院</a>--%>
    <%--<a href="#">超大屏幕</a>--%>
    <%--<a href="#">4K时代</a>--%>
    <%--<a href="#">网络电视</a>--%>
    <%--<a href="#">新4G</a>--%>
    <%--<a href="#">电影新时代</a>--%>
    <%--</div>--%>
    <%--<div class="bottomItemRightContentsLittleTag">--%>
    <%--<a href="#">屏大影院</a>--%>
    <%--<a href="#">超大屏幕</a>--%>
    <%--<a href="#">4K时代</a>--%>
    <%--<a href="#">网络电视</a>--%>
    <%--<a href="#">新4G</a>--%>
    <%--<a href="#">动作大电影</a>--%>
    <%--<a href="#">电影新时代</a>--%>
    <%--</div>--%>
    <%--<div class="bottomItemRightContentsLittleTag">--%>
    <%--<a href="#">屏大影院</a>--%>
    <%--<a href="#">超大屏幕</a>--%>
    <%--<a href="#">4K时代</a>--%>
    <%--<a href="#">网络电视</a>--%>
    <%--<a href="#">新4G</a>--%>
    <%--<a href="#">动作大电影</a>--%>
    <%--<a href="#">电影新时代</a>--%>
    <%--</div>--%>
    <%--<div class="bottomItemRightContentsLittleTag">--%>
    <%--<a href="#">屏大影院</a>--%>
    <%--<a href="#">超大屏幕</a>--%>
    <%--<a href="#">4K时代</a>--%>
    <%--<a href="#">网络电视</a>--%>
    <%--<a href="#">新4G</a>--%>
    <%--</div>--%>
    <%--<div class="bottomItemRightContentsLittleTag">--%>
    <%--<a href="#">屏大影院</a>--%>
    <%--<a href="#">超大屏幕</a>--%>
    <%--<a href="#">动作大电影</a>--%>
    <%--<a href="#">电影新时代</a>--%>
    <%--</div>--%>
    <%--<div class="bottomItemRightContentsLittleTag">--%>
    <%--<a href="#">超大屏幕</a>--%>
    <%--<a href="#">4K时代</a>--%>
    <%--<a href="#">网络电视</a>--%>
    <%--<a href="#">新4G</a>--%>
    <%--<a href="#">动作大电影</a>--%>
    <%--<a href="#">电影新时代</a>--%>
    <%--</div>--%>
    <%--</div>--%>
    <%--<div class="bottomItemRightContents" cid="67" style="display: none" >--%>
    <%--<div class="bottomItemRightContentsLittleTag"  >--%>
    <%--<a href="#">屏大影院</a>--%>
    <%--<a href="#">超大屏幕</a>--%>
    <%--<a href="#">4K时代</a>--%>
    <%--<a href="#">网络电视</a>--%>
    <%--<a href="#">新4G</a>--%>
    <%--<a href="#">动作大电影</a>--%>
    <%--<a href="#">电影新时代</a>--%>
    <%--</div>--%>
    <%--<div class="bottomItemRightContentsLittleTag" >--%>
    <%--<a href="#">屏大影院</a>--%>
    <%--<a href="#">超大屏幕</a>--%>
    <%--<a href="#">4K时代</a>--%>
    <%--<a href="#">网络电视</a>--%>
    <%--<a href="#">新4G</a>--%>
    <%--<a href="#">动作大电影</a>--%>
    <%--<a href="#">电影新时代</a>--%>
    <%--</div>--%>
    <%--<div class="bottomItemRightContentsLittleTag">--%>
    <%--<a href="#">屏大影院</a>--%>
    <%--<a href="#">新4G</a>--%>
    <%--<a href="#">动作大电影</a>--%>
    <%--<a href="#">电影新时代</a>--%>
    <%--</div>--%>
    <%--<div class="bottomItemRightContentsLittleTag">--%>
    <%--<a href="#">屏大影院</a>--%>
    <%--<a href="#">超大屏幕</a>--%>
    <%--<a href="#">4K时代</a>--%>
    <%--<a href="#">网络电视</a>--%>
    <%--<a href="#">新4G</a>--%>
    <%--<a href="#">动作大电影</a>--%>
    <%--<a href="#">电影新时代</a>--%>
    <%--</div>--%>
    <%--<div class="bottomItemRightContentsLittleTag">--%>
    <%--<a href="#">屏大影院</a>--%>
    <%--<a href="#">新4G</a>--%>
    <%--<a href="#">动作大电影</a>--%>
    <%--<a href="#">电影新时代</a>--%>
    <%--</div>--%>
    <%--<div class="bottomItemRightContentsLittleTag">--%>
    <%--<a href="#">屏大影院</a>--%>
    <%--<a href="#">超大屏幕</a>--%>
    <%--<a href="#">4K时代</a>--%>
    <%--<a href="#">网络电视</a>--%>
    <%--<a href="#">新4G</a>--%>
    <%--</div>--%>
    <%--<div class="bottomItemRightContentsLittleTag">--%>
    <%--<a href="#">屏大影院</a>--%>
    <%--<a href="#">超大屏幕</a>--%>
    <%--<a href="#">动作大电影</a>--%>
    <%--<a href="#">电影新时代</a>--%>
    <%--</div>--%>
    <%--<div class="bottomItemRightContentsLittleTag">--%>
    <%--<a href="#">超大屏幕</a>--%>
    <%--<a href="#">4K时代</a>--%>
    <%--<a href="#">动作大电影</a>--%>
    <%--<a href="#">电影新时代</a>--%>
    <%--</div>--%>
    <%--</div>--%>
    </div>
    </div>
    </div>
    </div>
    </body>
</html>
