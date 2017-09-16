<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
    <link rel="stylesheet" href="../needLoginReusablePageCSS/boughtPageCss.css">
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
            <a href="#nowhere" orderStatus="allOrder">所有订单</a>
        </div>
        <div><a href="#nowhere" orderStatus="stayPayment">待付款</a></div>
        <div><a href="#nowhere" orderStatus="stayDeliverGoods">待发货</a></div>
        <div><a href="#nowhere" orderStatus="stayGetGoods">待收货</a></div>
        <div class="noRightBorder">
            <a href="#nowhere" orderStatus="stayEvaluate">待评价</a>
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
    <c:forEach items="${os}" var="o">
        <div class="orderItem" orderStatus="${o.status}" oid="${o.id}">
            <div class="orderItemFirstLine">
                <div class="orderItemTitle">
                    <span class="date"><fmt:formatDate value="${o.createDate}" pattern="yyyy-MM-dd HH:mm:ss"/></span>
                    <span class="orderNum">订单号：${o.orderCode}</span>
                </div>
                <div class="tmallShoppingMall">
                    <img src="../img/site/orderItemTmall.png" style="height: 12px">天猫商场
                </div>
                <div class="andMeContact"></div>
                <a href="#" class="delete">
                    <span class="tranSize glyphicon glyphicon-trash"></span>
                </a>
            </div>
            <c:forEach items="${o.orderItems}" var="oi" varStatus="st">
                <div class="orderItemSecondLine">
                    <div class="orderItemImg">
                        <img src="../img/productSingle_middle/${oi.product.firstProductImage.id}.jpg" style="height: 75px">
                    </div>
                    <div class="orderItemIntroduce">
                        <a href="foreproduct?pid=${oi.product.id}">${oi.product.name}</a>
                        <img src="../img/orderItemSmallIocn/renzheng.png" style="height: 18px;">
                    </div>
                    <div class="orderItemPrice">
                        <span class="firstPrice">￥<fmt:formatNumber type="number" value="${oi.product.orignalPrice}" minFractionDigits="2"/> </span>
                        <span>￥<fmt:formatNumber type="number" value="${oi.product.promotePrice}" minFractionDigits="2"/></span>
                    </div>

                </div>
                <c:if test="${st.count==1}">
                    <div class="orderItemCounts">
                            ${o.totalNumber}
                    </div>
                    <div class="andContactMe">
                        <span class="price">￥${o.total}</span>
                        <span>(含运费：￥0.00)</span>
                    </div>
                    <div class="okTakeOverGoods">
                        <c:if test="${o.status=='waitConfirm'}">
                            <a href="foreconfirmPay?oid=${o.id}">
                                <button>确认收货</button>
                            </a>
                        </c:if>
                        <c:if test="${o.status=='waitPay'}">
                            <a href="alipay.jsp?oid=${o.id}&total=${o.total}">
                                <button>付款</button>
                            </a>
                        </c:if>
                        <c:if test="${o.status=='waitDelivery'}">
                            <span>待发货</span>
                            <button class="btn btn-info btn-sm ask2delivery" link="admin_order_delivery?id=${o.id}">催卖家发货</button>
                        </c:if>
                        <c:if test="${o.status=='waitReview'}">
                            <a href="forereview?oid=${o.id}">
                                <button class="orderListItemReview">评价</button>
                            </a>
                        </c:if>
                </c:if>



            </c:forEach>

        </div>
    </c:forEach>


</div>
</div>
</body>
</html>
