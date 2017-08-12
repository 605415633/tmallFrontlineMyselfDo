<%--
  Created by IntelliJ IDEA.
  User: home-pc
  Date: 2017/8/7
  Time: 10:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include file="../include/admin/adminHeader.jsp"%>
<%@include file="../include/admin/adminNavigator.jsp"%>
<html>
<head>
    <script>
        $(function () {
            $("#addForm").submit(function () {
                if(!checkEmpty("name","分类图片"))
                    return false;
                if(!checkEmpty("categoryPic","分类图片"))
                    return false;
                return true;
            })
        })
    </script>
    <title>分类管理</title>
</head>
<body>
<div class="workingArea">
    <h1 class="label label-info">分类管理</h1>
    <br>
    <br>

    <div class="listDataTableDiv">
        <table class="table table-bordered table-striped table-hover table-condensed ">
            <thead>
            <tr class="success">
                <th>ID</th>
                <th>图片</th>
                <th>分类名称</th>
                <th>属性管理</th>
                <th>产品管理</th>
                <th>编辑</th>
                <th>删除</th>
                <%--这里不懂<thead>标签的意思--%>
            </tr>
            </thead>
            <tbody>
            <%--这里不懂<tbody>标签的意思--%>
            <c:forEach items="${thecs}" var="c">
                <tr>
                    <td>${c.id}</td>
                    <td><img src="../img/categoryProductImgTitle/${c.id}.jpg" style="width: 150px; height:40px"></td>
                    <td>${c.name}</td>
                    <td><a href="admin_property_list?cid=${c.id}"><span class="glyphicon glyphicon-th-list"></span></a></td>
                    <td><a href="admin_product_list?cid=${c.id}"><span class="glyphicon glyphicon-shopping-cart"></span></a></td>
                    <td><a href="admin_category_edit?id=${c.id}"><span class="glyphicon glyphicon-edit"></span></a></td>
                    <td><a deleteLink="true" href="admin_category_delete?id=${c.id}"><span class="glyphicon glyphicon-trash"></span></a></td>

                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>

    <div class="pageDiv">
        <%@include file="../include/admin/adminPage.jsp"%>
    </div>

    <div class="panel panel-warning  addDiv">
        <div class="panel-heading">新增分类</div>
        <div class="panel-body">
            <form method="post" id="addForm" action="admin_category_add" enctype="multipart/form-data">
                <table class="addTable">
                    <tr>
                        <td>分类名称</td>
                        <td><input id="name" name="name" type="text" class="form-control"></td>
                    </tr>
                    <tr>
                        <td>分类图片</td>
                        <td>
                            <input id="categoryPic" type="file"  accept="image/*" name="filepath" />
                        </td>
                    </tr>
                    <tr class="submitTR">
                        <%--colspan合并列--%>
                        <td colspan="2" align="center">
                            <button type="submit" class="btn btn-success">提交</button>
                        </td>

                    </tr>
                </table>
            </form>
        </div>
    </div>
</div>
<%@include file="../include/admin/adminFooter.jsp"%>
</body>
</html>
