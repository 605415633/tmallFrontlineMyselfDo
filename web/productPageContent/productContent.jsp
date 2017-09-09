<%--
  Created by IntelliJ IDEA.
  User: home-pc
  Date: 2017/7/19
  Time: 10:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <script src="../jQuery/jquery-3.2.1.js"></script>
    <link rel="stylesheet" href="../bootstrap-3.3.7-dist/css/bootstrap.min.css">
    <script src="../bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="productPageContentCss/productContentCss.css">
    <script>
        $(function () {
            $("div.evaluateDetail").hide();
            $("div.productDetailsButton a").click(function () {
                $("div.productDetail").show();
                $("div.evaluateDetail").hide();
            })
            $("div.addEvaluate a").click(function () {
                $("div.evaluateDetail").show();
                $("div.productDetail").hide();
            })
        })
    </script>
</head>
<body>
<script>
    $(function () {
        $("img.smallImg").mouseenter(function () {
            var bigImageURL=$(this).attr("bigImageURL");
            $("img.bigImg").attr("src",bigImageURL);
        });
        $("img.bigImg").load(
            function () {
                $("img.smallImg").each(function () {
                    var bigImageURL=$(this).attr("bigImageURL");
                    img=new Image();
                    img.src=bigImageURL;
                    img.onload=function () {
                        console.log(bigImageURL);
                        $("div.fashionWomenSwearTopImg img").append($(img));
                    }
                })
            }
        )
    })
</script>
<div class="fashionWomenSwearContent">
    <div class="fashionWomenSearSign">
        <img src="img/category/${p.category.id}.jpg" >
    </div>
    <div class="fashionWomenSwearProduct">
        <div class="fashionWomenSwearImg">
            <div class="fashionWomenSwearTopImg">
                <img src="img/productSingle/${p.firstProductImage.id}.jpg"  class="bigImg" style="height:350px;width:368px; ">
            </div>
            <div class="fashionWomenSwearBottomImgs">
                <c:forEach items="${p.productSingleImages}" var="pi">
                    <div class="fashionWomenSwearBottomImg">
                        <img src="img/productSingle_small/${pi.id}.jpg" class="smallImg" bigImageURL="img/productSingle/${pi.id}.jpg" style="height: 60px;width: 51px">
                    </div>
                </c:forEach>
            </div>
        </div>
        <div class="fashionWomenSwearInformation">
            <div class="firstInformation">
                <p>${p.name}</p>
            </div>
            <div class="secondInformation">
                ${p.subTitle}
            </div>
            <div class="thirdlyInformation">
                <div class="thirdlyInformationTitle">
                    <span>聚划算</span>
                    <p>此商品即将参加聚划算，<b>1天19小时</b>后开始，</p>
                </div>
                <div class="thirdlyInformationContentAll">
                    <div class="thirdlyInformationContent">
                        <img src="../img/productDebutanteImg/gouwujuan.png" style="width: 50px;height: 15px">
                        <span class="shoppingTicket">全天猫实物商品通用</span>
                        <span class="shoppingPrice">价格</span>
                        <span class="priceCount">
                            ￥<fmt:formatNumber type="number" value="${p.orignalPrice}" minFractionDigits="2"/>
                        </span>
                        <div class="salesPromotionPrice"><span>促销价</span>
                            <span class="salesPromotionCount">￥
                                <fmt:formatNumber type="number" value="${p.promotePrice}" minFractionDigits="2"/>
                            </span>
                        </div>

                    </div>
                </div>
            </div>
            <div class="fourInformation">
                <div class="salesVolume"><span>销量<b>${p.saleCount}</b></span></div>
                <span>|</span>
                <div class="salesVolume"><span>累计评价<b>${p.reviewCount}</b></span></div>
            </div>
            <script>
                $(function () {
                    var stock=${p.stock};
                    $(".count").keyup(function () {
                        var num=$(".count").val();
                        b=parseInt(num);
                        if(isNaN(b))
                            b=1;
                        if(b<=0)
                            b=1;
                        if(b>stock)
                            b=1;
                        $(".count").val(b);
                    });
                    $("button.topButton").click(function () {
                        var num=$(".count").val();
                        b=parseInt(num);
                        b++;
                        if(b>stock){
                            b=stock;
                        }
                        $(".count").val(b);
                    });
                    $("button.bottomButton").click(function () {
                        var num=$(".count").val();
                        b=parseInt(num);
                        b--;
                        if(b<=0)
                            b=1;
                        $(".count").val(b);
                    });
                })
            </script>
            <div class="fifthInformation">
                <span>数量</span><input type="text" value="1" class="count">
                <div class="fifthInformationButton">
                    <button class="topButton glyphicon glyphicon-chevron-up"></button>
                    <button class="bottomButton glyphicon glyphicon-chevron-down"></button>
                </div>
                <div class="repertory">
                    件  库存<b>${p.stock}</b>件
                </div>
            </div>
            <div class="sixInformation">
                <span>服务承诺</span>
                <a href="">正品保证</a>
                <a href="">极速退款</a>
                <a href="">增运费险</a>
                <a href="">七天无理由退换</a>
            </div>
            <div class="sevenInformation">
                <button class="nowBuy">立即购买</button>
                <button class="addCart glyphicon glyphicon-shopping-cart">&nbsp;加入购物车</button>
            </div>
        </div>
    </div>
    <div class="product">
        <div class="contentOption">
            <script>
                $(function () {
                    $("div.productDetailsButton").click(function () {
                        $("div.productDetailsButton a").css("color","red");
                        $("div.addEvaluate a").css("color","black");
                    })
                    $("div.addEvaluate").click(function () {
                        $("div.addEvaluate a").css("color","red");
                        $("div.productDetailsButton a ").css("color","black");
                    })
                })
            </script>
            <div class="productDetailsButton"><a href="#nowhere" style="color: red; border: 1px solid ;font-weight: bold">商品详情</a></div>
            <div class="addEvaluate"><a href="#nowhere" style="border: 1px solid;font-weight: bold">累计评价<b>${p.reviewCount}</b></a></div>
            <div class="productDetail">
                <div class="productIntroduce">
                    <div class="productIntroduceTitle">产品参数</div>
                    <c:forEach items="${pvs}" var="pv">
                        <span>${pv.property.name}:&nbsp;&nbsp;&nbsp;${fn:substring(pv.value,0 ,10 )}</span>
                    </c:forEach>
                </div>
                <div class="productImg">
                    <c:forEach items="${p.productDetailImages}" var="pi">
                        <img src="img/productDetail/${pi.id}.jpg" style="width: 100%;float: left">
                    </c:forEach>

                </div>
            </div>
            <div class="evaluateDetail">
                <c:forEach items="${reviews}" var="r">
                    <div class="evaluateContent">
                        <p class="evaluate">${r.content}</p>
                        <span>${r.user.anonymousName}<b>(匿名)</b></span>
                        <p class="time"><fmt:formatDate value="${r.createDate}" pattern="yyyy-MM-dd"/> </p>
                    </div>
                </c:forEach>
            </div>
        </div>
    </div>
</div>
</body>
</html>
