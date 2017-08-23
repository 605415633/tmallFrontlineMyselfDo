<%--
  Created by IntelliJ IDEA.
  User: home-pc
  Date: 2017/8/20
  Time: 16:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    <%@include file="../include/admin/adminHeader.jsp"%>
    <%@include file="../include/admin/adminNavigator.jsp"%>
    <script>
        $(function(){
            $(".addFormSingle").submit(function(){
                if(checkEmpty("filepathSingle","图片文件")){
                    $("#filepathSingle").value("");
                    return true;
                }
                return false;
            });
            $(".addFormDetail").submit(function(){
                if(checkEmpty("filepathDetail","图片文件"))
                    return true;
                return false;
            });
        });

    </script>
</head>
<body>
<div class="workingArea">
    <ol class="breadcrumb">
        <li><a href="admin_category_list">所有分类</a></li>
        <li><a href="admin_product_list?cid=${p.category.id}">${p.category.name}</a></li><!--这个是展示所有产品的链接 -->
        <li class="active">${p.name}</li>
        <li class="active">产品图片管理</li>
    </ol>
    <table class="addPictureDiv" align="center">
        <tr>
            <td class="addPictureTableTD">
                <div>
                    <div class="panel panel-warning addPictureDiv">
                        <div class="panel-heading">
                            新增产品<b class="text-primary">单个</b>图片
                        </div>
                        <div class="panel-body">
                            <form class="addFormSingle" action="admin_productImage_add" method="post" enctype="multipart/form-data">
                                <table class="addTable">
                                    <tr>
                                        <td>请选择本地图片 尺寸400×400 为佳</td>
                                    </tr>
                                    <tr>
                                        <td><input id="filepathSingle" type="file" name="filepath"></td>
                                    </tr>
                                    <tr class="submitTR">
                                        <td>
                                            <input type="hidden" name="type" value="type_single">
                                            <input type="hidden" name="pid" value="${p.id}">
                                            <button type="submit" class="btn btn-success">提供</button>
                                        </td>
                                    </tr>
                                </table>
                            </form>
                        </div>
                    </div>
                    <table class="table table-striped table-bordered table-hover table-condensed">
                        <thead>
                        <tr class="success">
                            <th>ID</th>
                            <th>产品详情图片缩略图</th>
                            <th>删除</th>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${pisSingle}" var="pi">
                            <tr>
                                <td>${pi.id}</td>
                                <td><a title="查看原图" href="../img/productSingle/${pi.id}.jpg"><img src="../img/productSingle/${pi.id}.jpg" height="50px"></a></td>
                                <td><a href="admin_productImage_delete?id=${pi.id}" deleteLink="true">
                                    <span class="glyphicon-trash glyphicon"></span>
                                </a></td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>
            </td>
            <td class="addPictureTableTD">
                <div>
                    <div class="panel panel-warning addPictureDiv">
                        <div class="panel-heading">
                            新增产品 <b class="text-primary">详情</b>图片
                        </div>
                        <div class="panel-body">
                            <form class="addFormDetail" action="admin_productImage_add" method="post" enctype="multipart/form-data">
                                <table class="addTable">
                                    <tr>
                                        <td>请选择本地图片 宽度790为佳</td>
                                    </tr>
                                    <tr><td><input type="file" name="filepath" id="filepathDetail"></td></tr>
                                    <tr class="submitTR">
                                        <td class="center">
                                            <input type="hidden" name="type" value="type_detail">
                                            <input type="hidden" name="pid" value="${p.id}">
                                            <button type="submit" class="btn-success btn">提交</button>
                                        </td>
                                    </tr>
                                </table>
                            </form>
                        </div>
                    </div>


                        <table class="table table-bordered table-hover table-condensed table-striped">
                            <thead>
                            <tr class="success">
                                <th>ID</th>
                                <th>产品详情图片缩略图</th>
                                <th>删除</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach items="${pisDetail}" var="pi">
                                <tr>
                                    <td>${pi.id}</td>
                                    <td><a href="../img/productDetail/${pi.id}.jpg"><img
                                           style="height: 40px" src="../img/productDetail/${pi.id}.jpg" alt=""></a></td>
                                    <td><a href="admin_productImage_delete?id=${pi.id}" deleteLink="true">
                                        <span class="glyphicon glyphicon-trash"></span>
                                    </a></td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                </div>
            </td>
        </tr>
    </table>

</div>
<%@include file="../include/admin/adminFooter.jsp"%>
</body>
</html>
