<%--
  Created by IntelliJ IDEA.
  User: home-pc
  Date: 2017/7/27
  Time: 17:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <script src="../jQuery/jquery-3.2.1.js"></script>
    <link rel="stylesheet" href="../bootstrap-3.3.7-dist/css/bootstrap.min.css">
    <script src="../bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="../settleAccountsPageCss/settleAccountsCss.css">
</head>
<body>
<div class="settleAccountsContent">
    <div class="topImg">
        <img class="topImg1" src="../img/settleAccountPageImg/simpleLogo.png" >
        <img class="topImg2" src="../img/settleAccountPageImg/buyflow.png" >
    </div>
    <div class="shippingAddress">
        <div class="shippingAddressTitle">输入收货地址</div>
        <div class="shippingAddressContent">
            <div class="detailAddress">
                <span>详细地址<b>*</b></span>
                    <input type="text" placeholder="建议您如实填写详细收货地址，例如街道名称,门牌号码，楼层和房间号等信息">
            </div>
            <div>
                <span>邮政编码</span><input type="text" placeholder="如果您不清楚邮政区号，请填写00000">
            </div>
            <div>
                <span>收货人姓名<b>*</b></span><input type="text" placeholder="长度不超过25个字符">
            </div>
            <div>
                <span>手机号码<b>*</b></span><input type="text" placeholder="请输入11位手机号">
            </div>
        </div>
    </div>
    <div class="affirmOrderInformation">
        <div class="affirmOrderInformationTitle">确认订单信息</div>
        <div class="orderItemList">
            <div class="orderItemListTitle">
                <div class="storeInformation">
                    <img src="../img/settleAccountPageImg/tmallbuy.png" style="height: 14px">
                    店铺：天猫店铺<span class="spanGif"></span>
                </div>
                <div class="orderItemListSinglePrice">单价</div>
                <div class="orderItemListCounts">数量</div>
                <div class="orderItemListSubtotal">小计</div>
                <div class="modeOfDistribution">配送方式</div>
            </div>
            <div class="orderItemListContent">
                <div class="orderItemInformation">
                    <img src="../img/settleAccountPageImg/4608.jpg" style="height: 50px">
                    <span>【阿里智能】Philips/飞利浦 HR1897/30破壁微榨原汁机 多功能家用果汁榨汁机</span>
                    <img class="renzheng" src="../img/settleAccountPageImg/renzheng.png" alt="">
                </div>
                <div class="shoppingSinglePrice"><span>￥2474.25</span></div>
                <div class="shoppingCounts"><span>1</span></div>
                <div class="shoppingSubtotal"><span>￥2474.25</span></div>
                <div class="orderItemInformation">
                    <img src="../img/settleAccountPageImg/4608.jpg" style="height: 50px">
                    <span>【阿里智能】Philips/飞利浦 HR1897/30破壁微榨原汁机 多功能家用果汁榨汁机</span>
                    <img class="renzheng" src="../img/settleAccountPageImg/renzheng.png" alt="">
                </div>
                <div class="shoppingSinglePrice"><span>￥2474.25</span></div>
                <div class="shoppingCounts"><span>1</span></div>
                <div class="shoppingSubtotal"><span>￥2474.25</span></div>
            </div>

            <div class="orderItemListContentModeOfDistribution">
                <div>
                    <span class="glyphicon glyphicon-record"></span>
                    普通配送 <select >
                    <option value="">快递免邮费</option></select>
                </div>
            </div>
        </div>
    </div>
    <script>
        $(function () {
            $("div.buyerLeaveWords img").click(function () {
                $(this).hide();
                $("div.buyerLeaveWords div textarea").show();
                $("b.reminder").show();
                $(this).parent("div.buyerLeaveWords").css("height",110);
            })
        })
    </script>
    <div class="buyerLeaveWords">
        <div>
            <b>给卖家留言：</b>
            <img src="../img/settleAccountPageImg/leaveMessage.png" >
            <textarea name="" id="" cols="50" rows="2" style="display: none"></textarea>
            <b class="reminder" style="display: none">还可以输入200个字符</b>
        </div>
        <span>店铺合计(含运费): ￥4,157.25</span>
    </div>
    <div class="payments">
        <div class="money">实付款:<b>4,157.25</b></div>
        <button class="submitOrder">提交订单</button>
    </div>
</div>
</body>
</html>
