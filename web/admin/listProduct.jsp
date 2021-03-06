<%--
  Created by IntelliJ IDEA.
  User: home-pc
  Date: 2017/8/23
  Time: 10:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    <%@include file="../include/admin/adminNavigator.jsp"%>
    <%@include file="../include/admin/adminHeader.jsp"%>
    <script>
        $(function() {
            $("#addForm").submit(function() {
                if (!checkEmpty("name", "产品名称"))
                    return false;
          if (!checkEmpty("subTitle", "小标题"))
              return false;
                if (!checkNumber("orignalPrice", "原价格"))
                    return false;
                if (!checkNumber("promotePrice", "优惠价格"))
                    return false;
                if (!checkInt("stock", "库存"))
                    return false;
                return true;
            });
        });
    </script>
</head>
<body>
<div class="workingArea">

        <ol class="breadcrumb">
            <li><a href="admin_category_list">所有分类</a></li>
            <li><a href="admin_product_list?id=${c.id}">${c.name}</a></li>
            <li class="active">产品管理</li>
        </ol>

    <div class="listDataTableDiv">
        <table class="table table-bordered table-condensed table-striped table-hover">
            <thead>
            <tr class="success">
                <th>ID</th>
                <th>图片</th>
                <th>产品名称</th>
                <th>产品小标题</th>
                <th>原价格</th>
                <th>优惠价格</th>
                <th>库存数量</th>
                <th>图片管理</th>
                <th>设置属性</th>
                <th>编辑</th>
                <th>删除</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${ps}" var="p">
                <tr>
                    <td>${p.id}</td>
                    <td>
                        <c:if test="${!empty p.firstProductImage}">
                            <img src="../img/productSingle/${p.firstProductImage.id}.jpg" style="height: 35px;width: 60px">
                        </c:if>
                    </td>
                    <td>${p.name}</td>
                    <td>${p.subTitle}</td>
                    <td>${p.orignalPrice}</td>
                    <td>${p.promotePrice}</td>
                    <td>${p.stock}</td>
                    <td><a href="admin_productImage_list?pid=${p.id}"><span class="glyphicon glyphicon-picture"></span></a></td>
                    <td><a href="admin_product_editPropertyValue?id=${p.id}"><span class="glyphicon-th-list glyphicon"></span></a></td>
                    <td><a href="admin_product_edit?id=${p.id}"><span class="glyphicon-edit glyphicon"></span></a></td>
                    <td><a deleteLink="true" href="admin_product_delete?id=${p.id}" ><span class="glyphicon-trash glyphicon"></span></a></td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
    <div class="pageDiv">
        <%@include file="../include/admin/adminPage.jsp"%>
    </div>
    
    <div class="addDiv panel-warning panel">
        <div class="panel-heading">新增产品</div>
        <div class="panel-body">
            <form method="post" action="admin_product_add">
                <table class="addTable">
                    <tr>
                        <td>产品名称</td>
                        <td><input type="text" class="form-control" name="name" id="name"></td>
                    </tr>
                    <tr>
                        <td>产品小标题</td>
                        <td><input type="text" name="subTitle" id="subTitle" class="form-control"></td>
                    </tr>
                    <tr>
                        <td>原价格</td>
                        <td><input type="text" name="orignalPrice" id="orignalPrice" value="" class="form-control"></td>
                    </tr>
                    <tr>
                        <td>优惠价格</td>
                        <td><input type="text" name="promotePrice" id="promotePrice" value="" class="form-control"></td>
                    </tr>
                    <tr>
                        <td>库存</td>
                        <td><input type="text" name="stock" id="stock" class="form-control"></td>
                    </tr>

                    <tr class="submitTR">
                        <td colspan="2" align="center">
                            <input type="hidden" name="cid"  value="${c.id}">
                            <button type="submit" class="btn-success btn">提 交</button>
                        </td>
                    </tr>
                </table>
            </form>
        </div>
    </div>
</div>
</body>
</html>
