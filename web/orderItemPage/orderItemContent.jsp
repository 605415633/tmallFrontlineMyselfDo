<%--
  Created by IntelliJ IDEA.
  User: home-pc
  Date: 2017/7/27
  Time: 6:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <script src="../jQuery/jquery-3.2.1.js"></script>
    <link rel="stylesheet" href="../bootstrap-3.3.7-dist/css/bootstrap.min.css">
    <script src="../bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="../orderItemPageCss/orderItemPageCss.css">
    <script>
        $(function () {
            $("a[orderStatus]").click(function () {
                var orderStatus=$(this).attr("orderStatus");
                if(orderStatus=="allOrder"){
                    $("div[orderStatus]").show();
                }else{
                    $("div[orderStatus]").hide();
                    $("div[orderStatus="+orderStatus+"]").show();
                }
                $("div.orderOptions div").removeClass("selectOrderType");
                $(this).parent("div").addClass("selectOrderType");
//                这里的this是指a[orderStatus]。
                /**
                 * 这里没有给删除按钮添加任何脚本，等到了后台处理的时候，一起弄。
                  */

            })
        })
    </script>
</head>

<body>
<div class="orderItemContent">
    <div class="orderOptions">
        <div class="selectOrderType">
            <a href="#" orderStatus="allOrder">所有订单</a>
        </div>
        <div><a href="#" orderStatus="stayPayment">待付款</a></div>
        <div><a href="#" orderStatus="stayDeliverGoods">待发货</a></div>
        <div><a href="#" orderStatus="stayGetGoods">待收货</a></div>
        <div class="noRightBorder">
            <a href="#" orderStatus="stayEvaluate">待评价</a>
        </div>
        <div class="orderTypeLastOne">
        </div>
    </div>
    <div class="allOrderTitle">
        <span class="baby">宝贝</span>
        <span class="singlePrice">单价</span>
        <span class="productCount">数量</span>
        <span class="actualPayment">实付款</span>
        <span class="tradingOperations">交易操作</span>
    </div>
    <div class="orderItem" orderStatus="stayPayment" >
        <div class="orderItemFirstLine">
            <div class="orderItemTitle">
                <span class="date">2017-07-06 20:16:31</span>
                <span class="orderNum">订单号: 201707062016316821289</span>
            </div>
            <div class="tmallShoppingMall">
                <img src="../img/orderItemSmallIocn/confirmOrderTmall.png" style="height: 12px" >天猫商场
            </div>
            <div class="andMeContact"></div>
            <a href="#" class="delete">
                <span class="tranSize glyphicon glyphicon-trash"></span>
            </a>
        </div>
        <div class="orderItemSecondLine">
            <div class="orderItemImg">
                <img src="../img/orderItemImg/5870.jpg" style="height: 75px">
            </div>
            <div class="orderItemIntroduce">
                <a href="#">宾格手表正品女式精钢腕表大表盘全自动机械表防水情侣表女表真皮</a>
                <img src="../img/orderItemSmallIocn/renzheng.png" style="height: 18px;">
            </div>
            <div class="orderItemPrice">
                <span class="firstPrice">￥488.00</span>
                <span>￥341.60</span>
            </div>
            <div class="orderItemCounts">
                1
            </div>
            <div class="andContactMe">
                <span class="price">￥341.60</span>
                <span>(含运费：￥0.00)</span>
            </div>
            <div class="okTakeOverGoods">
                <button>付款</button>
            </div>
        </div>
        <div class="orderItemSecondLine">
            <div class="orderItemImg">
                <img src="../img/orderItemImg/5870.jpg" style="height: 75px">
            </div>
            <div class="orderItemIntroduce">
                <a href="#">宾格手表正品女式精钢腕表大表盘全自动机械表防水情侣表女表真皮</a>
                <img src="../img/orderItemSmallIocn/renzheng.png" style="height: 18px;">
            </div>
            <div class="orderItemPrice">
                <span class="firstPrice">￥488.00</span>
                <span>￥341.60</span>
            </div>
            <div class="orderItemCounts">
                1
            </div>
            <div class="andContactMe">
                <span class="price">￥341.60</span>
                <span>(含运费：￥0.00)</span>
            </div>
            <div class="okTakeOverGoods">
                <button>付款</button>
            </div>
        </div>


    </div>
    <div class="orderItem" orderStatus="stayDeliverGoods">
        <div class="orderItemFirstLine">
            <div class="orderItemTitle">
                <span class="date">2017-07-06 20:16:31</span>
                <span class="orderNum">订单号: 201707062016316821289</span>
            </div>
            <div class="tmallShoppingMall">
                <img src="../img/orderItemSmallIocn/confirmOrderTmall.png" style="height: 12px" >天猫商场
            </div>
            <div class="andMeContact"></div>
            <a href="#" class="delete">
                <span class="tranSize glyphicon glyphicon-trash"></span>
            </a>
        </div>
        <div class="orderItemSecondLine">
            <div class="orderItemImg">
                <img src="../img/orderItemImg/5870.jpg" style="height: 75px">
            </div>
            <div class="orderItemIntroduce">
                <a href="#">宾格手表正品女式精钢腕表大表盘全自动机械表防水情侣表女表真皮</a>
                <img src="../img/orderItemSmallIocn/renzheng.png" style="height: 18px;">
            </div>
            <div class="orderItemPrice">
                <span class="firstPrice">￥488.00</span>
                <span>￥341.60</span>
            </div>
            <div class="orderItemCounts">
                1
            </div>
            <div class="andContactMe">
                <span class="price">￥341.60</span>
                <span>(含运费：￥0.00)</span>
            </div>
            <div class="okTakeOverGoods">
                <button>确认收货</button>
            </div>
        </div>

    </div>
    <div class="orderItem" orderStatus="stayGetGoods">
        <div class="orderItemFirstLine">
            <div class="orderItemTitle">
                <span class="date">2017-07-06 20:16:31</span>
                <span class="orderNum">订单号: 201707062016316821289</span>
            </div>
            <div class="tmallShoppingMall">
                <img src="../img/orderItemSmallIocn/confirmOrderTmall.png" style="height: 12px" >天猫商场
            </div>
            <div class="andMeContact"></div>
            <a href="#" class="delete">
                <span class="tranSize glyphicon glyphicon-trash"></span>
            </a>
        </div>
        <div class="orderItemSecondLine">
            <div class="orderItemImg">
                <img src="../img/orderItemImg/5870.jpg" style="height: 75px">
            </div>
            <div class="orderItemIntroduce">
                <a href="#">宾格手表正品女式精钢腕表大表盘全自动机械表防水情侣表女表真皮</a>
                <img src="../img/orderItemSmallIocn/renzheng.png" style="height: 18px;">
            </div>
            <div class="orderItemPrice">
                <span class="firstPrice">￥488.00</span>
                <span>￥341.60</span>
            </div>
            <div class="orderItemCounts">
                1
            </div>
            <div class="andContactMe">
                <span class="price">￥341.60</span>
                <span>(含运费：￥0.00)</span>
            </div>
            <div class="okTakeOverGoods">
                <button>确认收货</button>
            </div>
        </div>


    </div>
    <div class="orderItem" orderStatus="stayEvaluate" >
        <div class="orderItemFirstLine">
            <div class="orderItemTitle">
                <span class="date">2017-07-06 20:16:31</span>
                <span class="orderNum">订单号: 201707062016316821289</span>
            </div>
            <div class="tmallShoppingMall">
                <img src="../img/orderItemSmallIocn/confirmOrderTmall.png" style="height: 12px" >天猫商场
            </div>
            <div class="andMeContact"></div>
            <a href="#" class="delete">
                <span class="tranSize glyphicon glyphicon-trash"></span>
            </a>
        </div>
        <div class="orderItemSecondLine">
            <div class="orderItemImg">
                <img src="../img/orderItemImg/5870.jpg" style="height: 75px">
            </div>
            <div class="orderItemIntroduce">
                <a href="#">宾格手表正品女式精钢腕表大表盘全自动机械表防水情侣表女表真皮</a>
                <img src="../img/orderItemSmallIocn/renzheng.png" style="height: 18px;">
            </div>
            <div class="orderItemPrice">
                <span class="firstPrice">￥488.00</span>
                <span>￥341.60</span>
            </div>
            <div class="orderItemCounts">
                1
            </div>
            <div class="andContactMe">
                <span class="price">￥341.60</span>
                <span>(含运费：￥0.00)</span>
            </div>
            <div class="stayEvaluate">
                <button>评价</button>
            </div>
        </div>
        <div class="orderItemSecondLine">
            <div class="orderItemImg">
                <img src="../img/orderItemImg/5870.jpg" style="height: 75px">
            </div>
            <div class="orderItemIntroduce">
                <a href="#">宾格手表正品女式精钢腕表大表盘全自动机械表防水情侣表女表真皮</a>
                <img src="../img/orderItemSmallIocn/renzheng.png" style="height: 18px;">
            </div>
            <div class="orderItemPrice">
                <span class="firstPrice">￥488.00</span>
                <span>￥341.60</span>
            </div>
            <div class="orderItemCounts">
                1
            </div>
            <div class="andContactMe">
                <span class="price">￥341.60</span>
                <span>(含运费：￥0.00)</span>
            </div>
            <div class="stayEvaluate">
                <button>评价</button>
            </div>
        </div>


    </div>
</div>
</body>
</html>
