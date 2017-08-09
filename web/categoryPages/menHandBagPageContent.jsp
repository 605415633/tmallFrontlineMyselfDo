<%--
  Created by IntelliJ IDEA.
  User: home-pc
  Date: 2017/7/18
  Time: 15:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <script src="../jQuery/jquery-3.2.1.js"></script>
    <link rel="stylesheet" href="../bootstrap-3.3.7-dist/css/bootstrap.min.css">
    <script src="../bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="../categoryPagesCss/menHandBagPageContentCss.css">
    <script>
        $(function () {
           $("div.productLine").mouseenter(function () {
               $(this).css("border-width",3);
               $(this).css("border-color","#c40000");
           }) ;
            $("div.productLine").mouseleave(function () {
                $(this).css("border-width",1);
                $(this).css("border-color","#EEEEEE");
            }) ;
        });
    </script>
</head>
<body>
<div class="menBottomHandPageContent">
    <div class="menBottomHandPageImg">
        <img src="../img/categoryProductImgTitle/72.jpg" >
    </div>
    <div class="searchNav">
        <span class="span"><a href="#">综合</a><span class="glyphicon glyphicon-arrow-down"></span></span>
        <span class="span"><a href="#">人气</a><span class="glyphicon glyphicon-arrow-down"></span></span>
        <span class="span"><a href="#">新品</a><span class="glyphicon glyphicon-arrow-down"></span></span>
        <span class="span"><a href="#">销量</a><span class="glyphicon glyphicon-arrow-down"></span></span>
        <span class="span"><a href="#">价格</a><span class="glyphicon glyphicon-resize-vertical"></span></span>
        <input type="text" placeholder="请输入" class="sortBarPrice beginPrice">
        <input type="text" placeholder="请输入" class="sortBarPrice endPrice">

        <script>
            $(function () {
                $("input.sortBarPrice").keyup(function () {
                    var num=$(this).val();
                    if(num.length==0){
                        $("div.productLine").show();
                        return;
                    }
                    num=parseInt(num);
                    if(isNaN(num))
                        num=1;
                    if(num<=0)
                        num=1;
                    $(this).val(num);
                    var begin=$("input.beginPrice").val();
                    var end=$("input.endPrice").val();
                    if(!isNaN(begin)&&!isNaN(end)){
                        $("div.productLine").hide();
                        $("div.productLine").each(function () {
                            var price=$(this).attr("price");
                            price=new Number(price);
                            if(price<=end&&price>=begin)
                                $(this).show();
                        });
                    }

                });
            });
        </script>
        <%--
        还差个JS交互
        有个排序的交互，需要提交到服务器重新获取数据，所以无法用JS去实现。
        --%>


    </div>
    <div class="ProductList">
        <div class="productRow">
            <div class="productLine" price="480.05">
                <img src="../img/menHandBagPageImg/6530.jpg" style="width: 100%;height: 190px">
                <span class="price">￥480.05</span>
                <div class="productLink">
                    <a href="#">七匹狼牛皮手包男双拉链多卡位大容量手拿包男上午休闲真皮手机包</a>
                </div>
                <div class="tmallMonopoly">
                    <a href="">天猫专卖</a>
                </div>
                <div class="productBottom">
                    <span>月成交<b>49笔</b></span>
                    <span>评价<b>17</b></span>
                </div>
                <div class="serviceIcon">
                    <a href="#"><img src="../img/menHandBagPageImg/wangwang.png" ></a>
                </div>
            </div>
            <div class="productLine" price="580">
                <img src="../img/menHandBagPageImg/6574.jpg" style="width: 100%;height: 190px">
                <span class="price">￥580.05</span>
                <div class="productLink">
                    <a href="#">七匹狼牛皮手包男双拉链多卡位大容量手拿包男上午休闲真皮手机包</a>
                </div>
                <div class="tmallMonopoly">
                    <a href="">天猫专卖</a>
                </div>
                <div class="productBottom">
                    <span>月成交<b>49笔</b></span>
                    <span>评价<b>17</b></span>
                </div>
                <div class="serviceIcon">
                    <a href="#"><img src="../img/menHandBagPageImg/wangwang.png" ></a>
                </div>
            </div>
            <div class="productLine" price="1000">
                <img src="../img/menHandBagPageImg/6651.jpg" style="width: 100%;height: 190px">
                <span class="price">￥1000.05</span>
                <div class="productLink">
                    <a href="#">七匹狼牛皮手包男双拉链多卡位大容量手拿包男上午休闲真皮手机包</a>
                </div>
                <div class="tmallMonopoly">
                    <a href="">天猫专卖</a>
                </div>
                <div class="productBottom">
                    <span>月成交<b>49笔</b></span>
                    <span>评价<b>17</b></span>
                </div>
                <div class="serviceIcon">
                    <a href="#"><img src="../img/menHandBagPageImg/wangwang.png" ></a>
                </div>
            </div>
            <div class="productLine" price="3000">
                <img src="../img/menHandBagPageImg/6695.jpg" style="width: 100%;height: 190px">
                <span class="price">￥3000.05</span>
                <div class="productLink">
                    <a href="#">七匹狼牛皮手包男双拉链多卡位大容量手拿包男上午休闲真皮手机包</a>
                </div>
                <div class="tmallMonopoly">
                    <a href="">天猫专卖</a>
                </div>
                <div class="productBottom">
                    <span>月成交<b>49笔</b></span>
                    <span>评价<b>17</b></span>
                </div>
                <div class="serviceIcon">
                    <a href="#"><img src="../img/menHandBagPageImg/wangwang.png" ></a>
                </div>
            </div>
        </div>
        <div class="productRow">
            <div class="productLine" price="200">
                <img src="../img/menHandBagPageImg/6706.jpg" style="width: 100%;height: 190px">
                <span class="price">￥200.05</span>
                <div class="productLink">
                    <a href="#">七匹狼牛皮手包男双拉链多卡位大容量手拿包男上午休闲真皮手机包</a>
                </div>
                <div class="tmallMonopoly">
                    <a href="">天猫专卖</a>
                </div>
                <div class="productBottom">
                    <span>月成交<b>49笔</b></span>
                    <span>评价<b>17</b></span>
                </div>
                <div class="serviceIcon">
                    <a href="#"><img src="../img/menHandBagPageImg/wangwang.png" ></a>
                </div>
            </div>
            <div class="productLine" price="2000">
                <img src="../img/menHandBagPageImg/6739.jpg" style="width: 100%;height: 190px">
                <span class="price">￥2000.05</span>
                <div class="productLink">
                    <a href="#">七匹狼牛皮手包男双拉链多卡位大容量手拿包男上午休闲真皮手机包</a>
                </div>
                <div class="tmallMonopoly">
                    <a href="">天猫专卖</a>
                </div>
                <div class="productBottom">
                    <span>月成交<b>49笔</b></span>
                    <span>评价<b>17</b></span>
                </div>
                <div class="serviceIcon">
                    <a href="#"><img src="../img/menHandBagPageImg/wangwang.png" ></a>
                </div>
            </div>
            <div class="productLine" price="3000">
                <img src="../img/menHandBagPageImg/6794.jpg" style="width: 100%;height: 190px">
                <span class="price">￥3000.05</span>
                <div class="productLink">
                    <a href="#">七匹狼牛皮手包男双拉链多卡位大容量手拿包男上午休闲真皮手机包</a>
                </div>
                <div class="tmallMonopoly">
                    <a href="">天猫专卖</a>
                </div>
                <div class="productBottom">
                    <span>月成交<b>49笔</b></span>
                    <span>评价<b>17</b></span>
                </div>
                <div class="serviceIcon">
                    <a href="#"><img src="../img/menHandBagPageImg/wangwang.png" ></a>
                </div>
            </div>
            <div class="productLine" price="700">
                <img src="../img/menHandBagPageImg/6816.jpg" style="width: 100%;height: 190px">
                <span class="price">￥700.05</span>
                <div class="productLink">
                    <a href="#">七匹狼牛皮手包男双拉链多卡位大容量手拿包男上午休闲真皮手机包</a>
                </div>
                <div class="tmallMonopoly">
                    <a href="">天猫专卖</a>
                </div>
                <div class="productBottom">
                    <span>月成交<b>49笔</b></span>
                    <span>评价<b>17</b></span>
                </div>
                <div class="serviceIcon">
                    <a href="#"><img src="../img/menHandBagPageImg/wangwang.png" ></a>
                </div>
            </div>
        </div>
        <div class="productRow">
            <div class="productLine" price="900">
                <img src="../img/menHandBagPageImg/6827.jpg" style="width: 100%;height: 190px">
                <span class="price">￥900.05</span>
                <div class="productLink">
                    <a href="#">七匹狼牛皮手包男双拉链多卡位大容量手拿包男上午休闲真皮手机包</a>
                </div>
                <div class="tmallMonopoly">
                    <a href="">天猫专卖</a>
                </div>
                <div class="productBottom">
                    <span>月成交<b>49笔</b></span>
                    <span>评价<b>17</b></span>
                </div>
                <div class="serviceIcon">
                    <a href="#"><img src="../img/menHandBagPageImg/wangwang.png" ></a>
                </div>
            </div>
            <div class="productLine" price="500">
                <img src="../img/menHandBagPageImg/6849.jpg" style="width: 100%;height: 190px">
                <span class="price">￥500.05</span>
                <div class="productLink">
                    <a href="#">七匹狼牛皮手包男双拉链多卡位大容量手拿包男上午休闲真皮手机包</a>
                </div>
                <div class="tmallMonopoly">
                    <a href="">天猫专卖</a>
                </div>
                <div class="productBottom">
                    <span>月成交<b>49笔</b></span>
                    <span>评价<b>17</b></span>
                </div>
                <div class="serviceIcon">
                    <a href="#"><img src="../img/menHandBagPageImg/wangwang.png" ></a>
                </div>
            </div>
            <div class="productLine" price="1500">
                <img src="../img/menHandBagPageImg/6871.jpg" style="width: 100%;height: 190px">
                <span class="price">￥1500.05</span>
                <div class="productLink">
                    <a href="#">七匹狼牛皮手包男双拉链多卡位大容量手拿包男上午休闲真皮手机包</a>
                </div>
                <div class="tmallMonopoly">
                    <a href="">天猫专卖</a>
                </div>
                <div class="productBottom">
                    <span>月成交<b>49笔</b></span>
                    <span>评价<b>17</b></span>
                </div>
                <div class="serviceIcon">
                    <a href="#"><img src="../img/menHandBagPageImg/wangwang.png" ></a>
                </div>
            </div>
            <div class="productLine" price="2300">
                <img src="../img/menHandBagPageImg/6893.jpg" style="width: 100%;height: 190px">
                <span class="price">￥2300.05</span>
                <div class="productLink">
                    <a href="#">七匹狼牛皮手包男双拉链多卡位大容量手拿包男上午休闲真皮手机包</a>
                </div>
                <div class="tmallMonopoly">
                    <a href="">天猫专卖</a>
                </div>
                <div class="productBottom">
                    <span>月成交<b>49笔</b></span>
                    <span>评价<b>17</b></span>
                </div>
                <div class="serviceIcon">
                    <a href="#"><img src="../img/menHandBagPageImg/wangwang.png" ></a>
                </div>
            </div>
        </div>
        <div class="productRow">
            <div class="productLine" price="474">
                <img src="../img/menHandBagPageImg/6937.jpg" style="width: 100%;height: 190px">
                <span class="price">￥474.05</span>
                <div class="productLink">
                    <a href="#">七匹狼牛皮手包男双拉链多卡位大容量手拿包男上午休闲真皮手机包</a>
                </div>
                <div class="tmallMonopoly">
                    <a href="">天猫专卖</a>
                </div>
                <div class="productBottom">
                    <span>月成交<b>49笔</b></span>
                    <span>评价<b>17</b></span>
                </div>
                <div class="serviceIcon">
                    <a href="#"><img src="../img/menHandBagPageImg/wangwang.png" ></a>
                </div>
            </div>
            <div class="productLine" price="1800">
                <img src="../img/menHandBagPageImg/6948.jpg" style="width: 100%;height: 190px">
                <span class="price">￥1800.05</span>
                <div class="productLink">
                    <a href="#">七匹狼牛皮手包男双拉链多卡位大容量手拿包男上午休闲真皮手机包</a>
                </div>
                <div class="tmallMonopoly">
                    <a href="">天猫专卖</a>
                </div>
                <div class="productBottom">
                    <span>月成交<b>49笔</b></span>
                    <span>评价<b>17</b></span>
                </div>
                <div class="serviceIcon">
                    <a href="#"><img src="../img/menHandBagPageImg/wangwang.png" ></a>
                </div>
            </div>
            <div class="productLine" price="6000">
                <img src="../img/menHandBagPageImg/7036.jpg" style="width: 100%;height: 190px">
                <span class="price">￥6000.05</span>
                <div class="productLink">
                    <a href="#">七匹狼牛皮手包男双拉链多卡位大容量手拿包男上午休闲真皮手机包</a>
                </div>
                <div class="tmallMonopoly">
                    <a href="">天猫专卖</a>
                </div>
                <div class="productBottom">
                    <span>月成交<b>49笔</b></span>
                    <span>评价<b>17</b></span>
                </div>
                <div class="serviceIcon">
                    <a href="#"><img src="../img/menHandBagPageImg/wangwang.png" ></a>
                </div>
            </div>
            <div class="productLine" price="500">
                <img src="../img/menHandBagPageImg/7047.jpg" style="width: 100%;height: 190px">
                <span class="price">￥500.05</span>
                <div class="productLink">
                    <a href="#">七匹狼牛皮手包男双拉链多卡位大容量手拿包男上午休闲真皮手机包</a>
                </div>
                <div class="tmallMonopoly">
                    <a href="">天猫专卖</a>
                </div>
                <div class="productBottom">
                    <span>月成交<b>49笔</b></span>
                    <span>评价<b>17</b></span>
                </div>
                <div class="serviceIcon">
                    <a href="#"><img src="../img/menHandBagPageImg/wangwang.png" ></a>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>
