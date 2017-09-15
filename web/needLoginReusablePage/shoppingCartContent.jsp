<%--
  Created by IntelliJ IDEA.
  User: home-pc
  Date: 2017/7/22
  Time: 11:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <script src="jQuery/jquery-3.2.1.js"></script>
    <link rel="stylesheet" href="bootstrap-3.3.7-dist/css/bootstrap.min.css">
    <script src="bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="needLoginReusablePageCSS/shoppingCartContentCss.css" >
    <script>
        var deleteOrderItem=false;
        var deleteOrderItemid=0;
        $(function () {
            $("a.deleteOrderItem").click(function () {
                deleteOrderItem=false;
                var oiid=$(this).attr("oiid");
                deleteOrderItemid=oiid;
                $("#deleteConfirmModal").modal('show');
            });

            $("button.deleteConfirmButton").click(function () {
                deleteOrderItem=true;
                $("#deleteConfirmModal").modal('hide');
            });

            $("#deleteConfirmModal").on('hidden.bs.modal',function (e) {
//              hidden.bs.modal是当模态框完全对用户隐藏时触发。
//                show.bs.modal	在调用 show 方法后触发
//                shown.bs.modal	当模态框对用户可见时触发（将等待 CSS 过渡效果完成）
//                  hide.bs.modal	当调用 hide 实例方法时触发
                if(deleteOrderItem){
                    var page="foredeleteOrderItem";
//                    这个提交给了ForeServlet的deleteOrderItem()。但是这个方法没写了
                    $.post(
                        page,
                        {"oiid":deleteOrderItemid},
                        function (result) {
                            if(result=="success"){
                                $("div.thirdlyLines[oiId="+deleteOrderItemid+"]").hide();
                            }else {
                                location.href="login.jsp";
                            }
                        }
                    )
                }
                
            })


        });
        <%--以千进制格式化金额--%>

        function formatMoney(num){
            num = num.toString().replace(/\$|\,/g,'');
            if(isNaN(num))
                num = "0";
            sign = (num == (num = Math.abs(num)));
            num = Math.floor(num*100+0.50000000001);
            cents = num%100;
            num = Math.floor(num/100).toString();
            if(cents<10)
                cents = "0" + cents;
            for (var i = 0; i < Math.floor((num.length-(1+i))/3); i++)
                num = num.substring(0,num.length-(4*i+3))+','+
                    num.substring(num.length-(4*i+3));
            return (((sign)?'':'-') + num + '.' + cents);
        }

        function syncCreateOrderButton() {
            var selectAny=false;
            $(".oks").each(function () {
                if("true"==$(this).attr("isSelects")){
                    selectAny=true;
                }
            });
            if(selectAny){
                $("div.smallCarryOutButton button").css("background-color","#c40000");
                $("div.smallCarryOutButton button").removeAttr("disabled");
                $("div.smallCarryOutButton").css("background-color","#c40000");
                $("div.bottomCarryOutButton button.createOrderButton").css("background-color","#c40000");
                $("div.bottomCarryOutButton button.createOrderButton").removeAttr("disabled");
                $("div.bottomCarryOutButton").css("background-color","#c40000");
            }
            else {
                $("div.smallCarryOutButton button").css("background-color","#AAAAAA");
                $("div.smallCarryOutButton button").attr("disabled","disabled");
                $("div.smallCarryOutButton").css("background-color","#AAAAAA");
                $("div.bottomCarryOutButton button").css("background-color","#AAAAAA");
                $("div.bottomCarryOutButton button").attr("disabled","disabled");
                $("div.bottomCarryOutButton").css("background-color","#AAAAAA");
            }
        }
        function syncSelect() {
            var selectAll=true;
            $(".oks").each(function () {
                if($(this).attr("isSelects")=="false"){
                    selectAll=false;
                }
            });
            if(selectAll){
                $("div.ok").show();
            }else {
                $("div.ok").hide();
            }
        }

        function calcCartSumPriceAndNumber() {
            var sum=0;
            var totalNumber=0;
            $("div.oks[isSelects='true']").each(function () {
                var oiId=$(this).attr("oiId");
                var price=$(".shoppingMoney[oiId="+oiId+"]").text();
                price=price.replace(/,/g,"");
                price=price.replace(/￥/g,"");
                sum +=new Number(price);
                var num=$("div.shoppingCounts input").val();
                totalNumber +=new Number(num);
            });
            $("div.productPrice").html("￥"+formatMoney(sum));
            $("div.bottomCarryOutMoney span").html("￥"+formatMoney(sum));
            $("div.haveChoiceShoppingInformation b").html(totalNumber);
        }

        function syncPrice(pid,num,price) {
            $(".shoppingCounts input[pid="+pid+"]").val(num);
            var cartProductItemSmallSumPrice=formatMoney(num*price);
            $(".shoppingMoney[pid="+pid+"]").html("￥"+cartProductItemSmallSumPrice);
            calcCartSumPriceAndNumber();
        }

        $(function () {
            var choiceCount=0;
            $("div.littleDiamonds").click(function () {
                var oiId=$(this).attr("oiId");
                var isSelects=$("div.oks[oiId="+oiId+"]").attr("isSelects");
                if(isSelects=="false"){
                    $("div.oks[oiId="+oiId+"]").show();
                    $("div.thirdlyLines[oiId="+oiId+"]").css("background-color","#FFF8E1");
                    $("div.oks[oiId="+oiId+"]").attr("isSelects","true");
                        var isSelectss=$("div.oks[oiId="+oiId+"]").attr("isSelects");
                        if(isSelectss=="true"){
                            choiceCount++;
                        }
                }else{
                    $("div.oks[oiId="+oiId+"]").hide();
                    $("div.thirdlyLines[oiId="+oiId+"]").css("background-color","white");
                        var isSelectsss=$("div.oks[oiId="+oiId+"]").attr("isSelects");
                        if(isSelectsss=="true"){
                            choiceCount--;
                        }
                    $("div.oks[oiId="+oiId+"]").attr("isSelects","false");
                }
                syncSelect();
                syncCreateOrderButton();
                calcCartSumPriceAndNumber();
            })
            $("div.littleDiamond").click(function () {
                var isSelect=$("div.ok").attr("isSelect");
                if(isSelect=="false"){
                    $("div.ok").show();

                    $("div.ok").attr("isSelect","true");
                    $(".oks").each(function () {
                        $(this).show();
                        $(this).attr("isSelects","true");
                        $("div.thirdlyLines[oiId="+$(this).attr("oiId")+"]").css("background-color","#FFF8E1");
                    });
                }
                else {
                    $("div.ok").hide();

                    $("div.ok").attr("isSelect","false");
                    $(".oks").each(function () {
                        $(this).hide();
                        $("div.thirdlyLines[oiId="+$(this).attr("oiId")+"]").css("background-color","white");
                        $(this).attr("isSelects","false");
                    })
                }
                syncCreateOrderButton();
                calcCartSumPriceAndNumber();

            })
            $("div.bottomLittleDiamond").click(function () {
                var isSelect=$("div.ok").attr("isSelect");
                if(isSelect=="false"){
                    $("div.ok").show();

                    $("div.ok").attr("isSelect","true");
                    $(".oks").each(function () {
                        $(this).show();
                        $(this).attr("isSelects","true");
                        $("div.thirdlyLines[oiId="+$(this).attr("oiId")+"]").css("background-color","#FFF8E1");
                    });
                }
                else {
                    $("div.ok").hide();

                    $("div.ok").attr("isSelect","false");
                    $(".oks").each(function () {
                        $(this).hide();
                        $("div.thirdlyLines[oiId="+$(this).attr("oiId")+"]").css("background-color","white");
                        $(this).attr("isSelects","false");
                    })
                }
                syncCreateOrderButton();
                calcCartSumPriceAndNumber();
            })
            $(".shoppingCounts input").keyup(function () {
                var pid=$(this).attr("pid");
                var stock=$("span.orderItemStock[pid="+pid+"]").text();
                var price=$("span.orderItemPromotePrice[pid="+pid+"]").text();
                var num=$(".shoppingCounts input[pid="+pid+"]").val();
                num=parseInt(num);
                if(isNaN(num))
                    num=1;
                if(num<=0)
                    num=1;
                if(num>stock)
                    num=stock;
                syncPrice(pid,num,price);
            });
            $("div.shoppingCountsAdd").click(function () {
                var pid=$(this).attr("pid");
                var stock=$("span.orderItemStock[pid="+pid+"]").text();
                var price=$("span.orderItemPromotePrice[pid="+pid+"]").text();
                var num=$(".shoppingCounts input[pid="+pid+"]").val();
                num++;
                if(num>stock)
                    num=stock;
                syncPrice(pid,num,price);
            })
            $("div.shoppingCountsReduce").click(function () {
                var pid=$(this).attr("pid");
                var stock=$("span.orderItemStock[pid="+pid+"]").text();
                var price=$("span.orderItemPromotePrice[pid="+pid+"]").text();
                var num=$(".shoppingCounts input[pid="+pid+"]").val();
                num--;
                if(num<=0)
                    num=1;
                syncPrice(pid,num,price);
            })

            $("button.createOrderButton").click(function () {
                var params="";
                $(".oks").each(function () {
                    if($(this).attr("isSelects")=="true"){
                        var oiid=$(this).attr("oiId");
                        params+="&oiid="+oiid;
                    }
                });
                params=params.substring(1);
                location.href="forebuy?"+params;
            })
        })
        
    </script>
</head>
<body>
<div class="shoppingCartContent">
    <div class="firstLines">
        <div class="smallCarryOutButton">
            <button class="createOrderButton" disabled="disabled">结算</button>
        </div>
        <div class="productPrice">
            <b>￥0.00</b>
        </div>
        <div class="infor">
            <p>已选商品(不含运费)</p>
        </div>
    </div>
    <div class="secondLines">
        <div class="ChoiceAll">
            <div class="littleDiamond">
                <div style="display: none"  class="ok glyphicon glyphicon-ok" isSelect="false"></div>
                <%--上面这行代码是出现对号--%>
            </div>
            <span>全选</span>
        </div>
        <div class="shoppingInformation">
            <span>商品信息</span>
        </div>
        <div class="shoppingUnitPrice">
            <span>单价</span>
        </div>
        <div class="Counts">
            <span>数量</span>
        </div>
        <div class="Money">
            <span>金额</span>
        </div>
        <div class="Operation">
            <span>操作</span>
        </div>

    </div>
    <c:forEach items="${ois}" var="oi">
        <div class="thirdlyLines" oiId="${oi.id}">
            <div class="shoppingChoice">
                <div class="littleDiamonds" oiId="${oi.id}">
                    <div class="oks glyphicon glyphicon-ok" style="display: none" oiId="${oi.id}" isSelects="false"></div>
                        <%--上面这行代码是出现对号--%>
                </div>
            </div>
            <div class="shoppingCartImgs" oiId="${oi.id}">
                <img src="img/productSingle_middle/${oi.product.firstProductImage.id}.jpg" class="cartProductItemIfSelected" style="  width: 95%;height:68px" selectIt="false" oiId="${oi.id}">
            </div>
            <div class="shoppingInformation">
                <a href="foreproduct?pid=${oi.product.id}">${oi.product.name}</a>
                <div class="shoppingInformationSmallIcon">
                    <img src="img/shoppingCartSmallIcon/creditcard.png" title="支持信用卡支付">
                    <img src="img/shoppingCartSmallIcon/7day.png" title="消费者保障服务，承诺7天退款">
                    <img src="img/shoppingCartSmallIcon/promise.png" title="消费者保障服务，承诺如实描述">
                </div>
            </div>
            <div class="shoppingUnitPrice">
                <p class="one">￥<fmt:formatNumber type="number" value="${oi.product.orignalPrice}" minFractionDigits="2"/> </p>
                <p class="two">￥<fmt:formatNumber type="number" value="${oi.product.promotePrice}" minFractionDigits="2"/> </p>
            </div>
            <div class="shoppingCounts">
                <span pid="${oi.product.id}" class="hidden orderItemStock ">${oi.product.stock}</span>
                <span pid="${oi.product.id}" class="hidden orderItemPromotePrice ">${oi.product.promotePrice}</span>
                <div class="shoppingCountsAdd glyphicon glyphicon-plus" pid="${oi.product.id}" ></div>
                <input type="text" value="${oi.number}" pid="${oi.product.id}" oiId="${oi.id}">
                <div class="shoppingCountsReduce glyphicon glyphicon-minus" pid="${oi.product.id}"></div>
            </div>
            <div class="shoppingMoney" oiId="${oi.id}" pid="${oi.product.id}">
                <fmt:formatNumber type="number" value="${oi.product.promotePrice*oi.number}" minFractionDigits="2"/>
            </div>
            <a class="deleteOrderItem" href="#nowhere" oiId="${oi.id}">删除</a>

        </div>
    </c:forEach>
        <%--<div class="thirdlyLines" oiId="111">--%>
            <%--<div class="shoppingChoice">--%>
                <%--<div class="littleDiamonds " oiId="111" >--%>
                    <%--<div class="oks glyphicon glyphicon-ok" style="display: none" oiId="111" isSelects="false"></div>--%>

                <%--</div>--%>
            <%--</div>--%>
            <%--<div class="shoppingCartImgs" oiId="111">--%>
                <%--<img src="../img/menHandBagPageImg/6948.jpg" class="cartProductItemIfSelected" style="  width: 95%;height:68px" selectIt="false" oiId="111">--%>
            <%--</div>--%>
            <%--<div class="shoppingInformation">--%>
                <%--<a href="#">卡西欧正品休闲时尚优雅女士手表LTP-1391D/L钢带防水石英女表</a>--%>
                <%--<div class="shoppingInformationSmallIcon">--%>
                    <%--<img src="../img/shoppingCartSmallIcon/creditcard.png" title="支持信用卡支付">--%>
                    <%--<img src="../img/shoppingCartSmallIcon/7day.png" title="消费者保障服务，承诺7天退款">--%>
                    <%--<img src="../img/shoppingCartSmallIcon/promise.png" title="消费者保障服务，承诺如实描述">--%>
                <%--</div>--%>
            <%--</div>--%>
            <%--<div class="shoppingUnitPrice">--%>
                <%--<p class="one">￥3899.0</p>--%>
                <%--<p class="two">￥3509.1</p>--%>
            <%--</div>--%>
            <%--<div class="shoppingCounts">--%>
                <%--<span pid="123" class="hidden orderItemStock ">75</span>--%>
                <%--<span pid="123" class="hidden orderItemPromotePrice ">3509.1</span>--%>
                <%--<div class="shoppingCountsAdd glyphicon glyphicon-plus" pid="123" ></div>--%>
                <%--<input type="text" value="1" pid="123" oiId="111">--%>
                <%--<div class="shoppingCountsReduce glyphicon glyphicon-minus" pid="123"></div>--%>
            <%--</div>--%>
            <%--<div class="shoppingMoney" oiId="111" pid="123">￥3509.1</div>--%>
            <%--<a href="" class="shoppingOperation" oiId="111">删除</a>--%>
        <%--</div>--%>


    <%--<div class="thirdlyLines" oiId="112">--%>
        <%--<div class="shoppingChoice">--%>
            <%--<div class="littleDiamonds" oiId="112">--%>
                <%--<div class="oks glyphicon glyphicon-ok" style="display: none" oiId="112" isSelects="false"></div>--%>
                <%--&lt;%&ndash;上面这行代码是出现对号&ndash;%&gt;--%>
            <%--</div>--%>
        <%--</div>--%>
        <%--<div class="shoppingCartImgs" oiId="112">--%>
            <%--<img src="../img/menHandBagPageImg/6948.jpg" class="cartProductItemIfSelected" style="  width: 95%;height:68px" selectIt="false" oiId="112">--%>
        <%--</div>--%>
        <%--<div class="shoppingInformation">--%>
            <%--<a href="#">卡西欧正品休闲时尚优雅女士手表LTP-1391D/L钢带防水石英女表</a>--%>
            <%--<div class="shoppingInformationSmallIcon">--%>
                <%--<img src="../img/shoppingCartSmallIcon/creditcard.png" title="支持信用卡支付">--%>
                <%--<img src="../img/shoppingCartSmallIcon/7day.png" title="消费者保障服务，承诺7天退款">--%>
                <%--<img src="../img/shoppingCartSmallIcon/promise.png" title="消费者保障服务，承诺如实描述">--%>
            <%--</div>--%>
        <%--</div>--%>
        <%--<div class="shoppingUnitPrice">--%>
            <%--<p class="one">￥3899.0</p>--%>
            <%--<p class="two">￥3509.1</p>--%>
        <%--</div>--%>
        <%--<div class="shoppingCounts">--%>
            <%--<span pid="124" class="hidden orderItemStock ">75</span>--%>
            <%--<span pid="124" class="hidden orderItemPromotePrice ">3509.1</span>--%>
            <%--<div class="shoppingCountsAdd glyphicon glyphicon-plus" pid="124"></div>--%>
            <%--<input type="text" value="1" pid="124" oiId="112">--%>
            <%--<div class="shoppingCountsReduce glyphicon glyphicon-minus" pid="124"></div>--%>
        <%--</div>--%>
        <%--<div class="shoppingMoney" oiId="112" pid="124">￥3509.1</div>--%>
        <%--<a href="" class="shoppingOperation" oiId="111">删除</a>--%>
    <%--</div>--%>
    <%--<div class="thirdlyLines" oiId="113">--%>
        <%--<div class="shoppingChoice">--%>
            <%--<div class="littleDiamonds" oiId="113">--%>
                <%--<div class="oks glyphicon glyphicon-ok" style="display: none"oiId="113" isSelects="false"></div>--%>
                <%--&lt;%&ndash;上面这行代码是出现对号&ndash;%&gt;--%>
            <%--</div>--%>
        <%--</div>--%>
        <%--<div class="shoppingCartImgs" oiId="113">--%>
            <%--<img src="../img/menHandBagPageImg/6948.jpg" class="cartProductItemIfSelected" style="  width: 95%;height:68px" selectIt="false" oiId="113">--%>
        <%--</div>--%>
        <%--<div class="shoppingInformation">--%>
            <%--<a href="#">卡西欧正品休闲时尚优雅女士手表LTP-1391D/L钢带防水石英女表</a>--%>
            <%--<div class="shoppingInformationSmallIcon">--%>
                <%--<img src="../img/shoppingCartSmallIcon/creditcard.png" title="支持信用卡支付">--%>
                <%--<img src="../img/shoppingCartSmallIcon/7day.png" title="消费者保障服务，承诺7天退款">--%>
                <%--<img src="../img/shoppingCartSmallIcon/promise.png" title="消费者保障服务，承诺如实描述">--%>
            <%--</div>--%>
        <%--</div>--%>
        <%--<div class="shoppingUnitPrice">--%>
            <%--<p class="one">￥3899.0</p>--%>
            <%--<p class="two">￥3509.1</p>--%>
        <%--</div>--%>
        <%--<div class="shoppingCounts">--%>
            <%--&lt;%&ndash;库存和价格不显示，所以隐藏起来为hidden&ndash;%&gt;--%>
            <%--<span pid="125" class="hidden orderItemStock ">75</span>--%>
            <%--<span pid="125" class="hidden orderItemPromotePrice ">3509.1</span>--%>
            <%--<div class="shoppingCountsAdd glyphicon glyphicon-plus" pid="125"></div>--%>
            <%--<input    value="1" pid="125" oiId="113">--%>
            <%--<div class="shoppingCountsReduce glyphicon glyphicon-minus" pid="125"></div>--%>
        <%--</div>--%>
        <%--<div class="shoppingMoney" oiId="113" pid="125">￥3509.1</div>--%>
        <%--<a href="" class="shoppingOperation" oiId="113">删除</a>--%>
    <%--</div>--%>
    <div class="fourLines">
        <div class="bottomAllChoice">
            <div class="bottomLittleDiamond">
                <div class="ok glyphicon glyphicon-ok" style="display: none"></div>
                <%--上面这行代码是出现对号--%>
            </div>
            <span>全选</span>
        </div>
        <div class="bottomCarryOutButton">
            <button class="createOrderButton" disabled="disabled">结 算</button>
        </div>
        <div class="bottomCarryOutMoney">
            <span>￥0.00</span>
        </div>
        <div class="haveChoiceShoppingInformation">
            <span>已选商品 <b>0</b> 件 合计(不含运费):</span>
        </div>
    </div>

</div>
</body>
</html>
