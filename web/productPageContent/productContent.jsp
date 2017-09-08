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
    <link rel="stylesheet" href="../productPageContentCss/productContentCss.css">
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
        <img src="../img/productDebutanteImg/68.jpg" >
    </div>
    <div class="fashionWomenSwearProduct">
        <div class="fashionWomenSwearImg">
            <div class="fashionWomenSwearTopImg">
                <img src="../img/productDebutanteImg/8619.jpg "  class="bigImg" style="height:350px;width:368px; ">
            </div>
            <div class="fashionWomenSwearBottomImgs">
                <div class="fashionWomenSwearBottomImg ">
                    <img src="../img/productDebutanteImg/8616.jpg" class="smallImg" bigImageURL="../img/productDebutanteImg/8616.jpg" style="height: 60px;width: 51px">
                </div>
                <div class="fashionWomenSwearBottomImg img2">
                    <img src="../img/productDebutanteImg/8617.jpg" class="smallImg" bigImageURL="../img/productDebutanteImg/8617.jpg" style="height: 60px;width: 51px">
                </div>
                <div class="fashionWomenSwearBottomImg img3">
                    <img src="../img/productDebutanteImg/8618.jpg" class="smallImg" bigImageURL="../img/productDebutanteImg/8618.jpg" style="height: 60px;width: 51px">
                </div>
                <div class="fashionWomenSwearBottomImg img4">
                    <img src="../img/productDebutanteImg/8619.jpg" class="smallImg" bigImageURL="../img/productDebutanteImg/8619.jpg" style="height: 60px;width: 51px">
                </div>
                <div class="fashionWomenSwearBottomImg img5">
                    <img src="../img/productDebutanteImg/8620.jpg" class="smallImg" bigImageURL="../img/productDebutanteImg/8620.jpg" style="height: 60px;width: 51px">
                </div>
            </div>
        </div>
        <div class="fashionWomenSwearInformation">
            <div class="firstInformation">
                <p>名媛2016新款女装夏两件套裤韩版雪纺七分裤阔腿休闲时尚套装女</p>
            </div>
            <div class="secondInformation">
                <span>高端定制</span>
                <span>高档棉麻</span>
                <span>现货即发</span>
                <span>加购物车</span>
                <span>领优惠券</span>
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
                        <span class="priceCount">￥399.00</span>
                        <div class="salesPromotionPrice"><span>促销价</span>
                            <span class="salesPromotionCount">￥<b>379.05</b></span>
                        </div>

                    </div>
                </div>
            </div>
            <div class="fourInformation">
                <div class="salesVolume"><span>销量<b>50</b></span></div>
                <span>|</span>
                <div class="salesVolume"><span>累计评价<b>19</b></span></div>
            </div>
            <script>
                $(function () {
                    var stock=66;
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
                        if(b>66){
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
                    件  库存<b>66</b>件
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
            <div class="addEvaluate"><a href="#nowhere" style="border: 1px solid;font-weight: bold">累计评价<b>19</b></a></div>
            <div class="productDetail">
                <div class="productIntroduce">
                    <div class="productIntroduceTitle">产品参数</div>
                    <span class="first">构成成分：聚酯纤维100%</span>
                    <span class="first">品牌: Emyche/艾米秋</span>
                    <span class="first">货号: 129668</span>
                    <span class="second">尺码: L M S XL X </span>
                    <span class="second">上市年份季节: 2016年夏季 </span>
                    <span class="second">颜色分类: 白色 黑色 浅蓝 </span>
                    <span class="third">适用年龄: 18-25周岁</span>
                </div>
                <div class="productImg">
                    <img src="../img/productDebutanteImg/8626.jpg" style="width: 100%;float: left">
                    <img src="../img/productDebutanteImg/8622.jpg" style="width: 100%;float: left">
                    <img src="../img/productDebutanteImg/8623.jpg" style="width: 100%;float: left">
                    <img src="../img/productDebutanteImg/8624.jpg" style="width: 100%;float: left">
                    <img src="../img/productDebutanteImg/8625.jpg" style="width: 100%;float: left">
                    <img src="../img/productDebutanteImg/8621.jpg" style="width: 100%;float: left">
                </div>
            </div>
            <div class="evaluateDetail">
                <div class="evaluateContent">
                    <p class="evaluate">不错的购物，包装很精细，布料也不错舒服，因为之前一直购买品牌装，
                        很好的一次网购，生完宝宝刚刚一个多月我一百五十斤穿2XL不错</p>
                    <span>哀****莉<b>（匿名）</b></span>
                    <p class="time">2016-08-10</p>
                </div>
                <div class="evaluateContent">
                    <p class="evaluate">不错的购物，包装很精细，布料也不错舒服，因为之前一直购买品牌装，
                        很好的一次网购，生完宝宝刚刚一个多月我一百五十斤穿2XL不错</p>
                    <span>哀****莉<b>（匿名）</b></span>
                    <p class="time">2016-08-10</p>
                </div>
                <div class="evaluateContent">
                    <p class="evaluate">不错的购物，包装很精细，布料也不错舒服，因为之前一直购买品牌装，
                        很好的一次网购，生完宝宝刚刚一个多月我一百五十斤穿2XL不错</p>
                    <span>哀****莉<b>（匿名）</b></span>
                    <p class="time">2016-08-10</p>
                </div>
                <div class="evaluateContent">
                    <p class="evaluate">不错的购物，包装很精细，布料也不错舒服，因为之前一直购买品牌装，
                        很好的一次网购，生完宝宝刚刚一个多月我一百五十斤穿2XL不错</p>
                    <span>哀****莉<b>（匿名）</b></span>
                    <p class="time">2016-08-10</p>
                </div>
                <div class="evaluateContent">
                    <p class="evaluate">不错的购物，包装很精细，布料也不错舒服，因为之前一直购买品牌装，
                        很好的一次网购，生完宝宝刚刚一个多月我一百五十斤穿2XL不错</p>
                    <span>哀****莉<b>（匿名）</b></span>
                    <p class="time">2016-08-10</p>
                </div>
                <div class="evaluateContent">
                    <p class="evaluate">不错的购物，包装很精细，布料也不错舒服，因为之前一直购买品牌装，
                        很好的一次网购，生完宝宝刚刚一个多月我一百五十斤穿2XL不错</p>
                    <span>哀****莉<b>（匿名）</b></span>
                    <p class="time">2016-08-10</p>
                </div>
                <div class="evaluateContent">
                    <p class="evaluate">不错的购物，包装很精细，布料也不错舒服，因为之前一直购买品牌装，
                        很好的一次网购，生完宝宝刚刚一个多月我一百五十斤穿2XL不错</p>
                    <span>哀****莉<b>（匿名）</b></span>
                    <p class="time">2016-08-10</p>
                </div>
                <div class="evaluateContent">
                    <p class="evaluate">不错的购物，包装很精细，布料也不错舒服，因为之前一直购买品牌装，
                        很好的一次网购，生完宝宝刚刚一个多月我一百五十斤穿2XL不错</p>
                    <span>哀****莉<b>（匿名）</b></span>
                    <p class="time">2016-08-10</p>
                </div>
                <div class="evaluateContent">
                    <p class="evaluate">不错的购物，包装很精细，布料也不错舒服，因为之前一直购买品牌装，
                        很好的一次网购，生完宝宝刚刚一个多月我一百五十斤穿2XL不错</p>
                    <span>哀****莉<b>（匿名）</b></span>
                    <p class="time">2016-08-10</p>
                </div>
                <div class="evaluateContent">
                    <p class="evaluate">不错的购物，包装很精细，布料也不错舒服，因为之前一直购买品牌装，
                        很好的一次网购，生完宝宝刚刚一个多月我一百五十斤穿2XL不错</p>
                    <span>哀****莉<b>（匿名）</b></span>
                    <p class="time">2016-08-10</p>
                </div>
                <div class="evaluateContent">
                    <p class="evaluate">不错的购物，包装很精细，布料也不错舒服，因为之前一直购买品牌装，
                        很好的一次网购，生完宝宝刚刚一个多月我一百五十斤穿2XL不错</p>
                    <span>哀****莉<b>（匿名）</b></span>
                    <p class="time">2016-08-10</p>
                </div>
                <div class="evaluateContent">
                    <p class="evaluate">不错的购物，包装很精细，布料也不错舒服，因为之前一直购买品牌装，
                        很好的一次网购，生完宝宝刚刚一个多月我一百五十斤穿2XL不错</p>
                    <span>哀****莉<b>（匿名）</b></span>
                    <p class="time">2016-08-10</p>
                </div>
                <div class="evaluateContent">
                    <p class="evaluate">不错的购物，包装很精细，布料也不错舒服，因为之前一直购买品牌装，
                        很好的一次网购，生完宝宝刚刚一个多月我一百五十斤穿2XL不错</p>
                    <span>哀****莉<b>（匿名）</b></span>
                    <p class="time">2016-08-10</p>
                </div>
                <div class="evaluateContent">
                    <p class="evaluate">不错的购物，包装很精细，布料也不错舒服，因为之前一直购买品牌装，
                        很好的一次网购，生完宝宝刚刚一个多月我一百五十斤穿2XL不错</p>
                    <span>哀****莉<b>（匿名）</b></span>
                    <p class="time">2016-08-10</p>
                </div>
                <div class="evaluateContent">
                    <p class="evaluate">不错的购物，包装很精细，布料也不错舒服，因为之前一直购买品牌装，
                        很好的一次网购，生完宝宝刚刚一个多月我一百五十斤穿2XL不错</p>
                    <span>哀****莉<b>（匿名）</b></span>
                    <p class="time">2016-08-10</p>
                </div>
                <div class="evaluateContent">
                    <p class="evaluate">不错的购物，包装很精细，布料也不错舒服，因为之前一直购买品牌装，
                        很好的一次网购，生完宝宝刚刚一个多月我一百五十斤穿2XL不错</p>
                    <span>哀****莉<b>（匿名）</b></span>
                    <p class="time">2016-08-10</p>
                </div>
                <div class="evaluateContent">
                    <p class="evaluate">不错的购物，包装很精细，布料也不错舒服，因为之前一直购买品牌装，
                        很好的一次网购，生完宝宝刚刚一个多月我一百五十斤穿2XL不错</p>
                    <span>哀****莉<b>（匿名）</b></span>
                    <p class="time">2016-08-10</p>
                </div>
                <div class="evaluateContent">
                    <p class="evaluate">不错的购物，包装很精细，布料也不错舒服，因为之前一直购买品牌装，
                        很好的一次网购，生完宝宝刚刚一个多月我一百五十斤穿2XL不错</p>
                    <span>哀****莉<b>（匿名）</b></span>
                    <p class="time">2016-08-10</p>
                </div>
                <div class="evaluateContent">
                    <p class="evaluate">不错的购物，包装很精细，布料也不错舒服，因为之前一直购买品牌装，
                        很好的一次网购，生完宝宝刚刚一个多月我一百五十斤穿2XL不错</p>
                    <span>哀****莉<b>（匿名）</b></span>
                    <p class="time">2016-08-10</p>
                </div>


            </div>

        </div>
    </div>
</div>
</body>
</html>
