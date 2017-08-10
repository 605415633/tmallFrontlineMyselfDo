<%--
  Created by IntelliJ IDEA.
  User: home-pc
  Date: 2017/8/6
  Time: 18:13
  To change this template use File | Settings | File Templates.
--%>
<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" language="java"
    pageEncoding="UTF-8" isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <script src="../../jQuery/jquery-3.2.1.js"></script>
    <link rel="stylesheet" href="../../bootstrap-3.3.7-dist/css/bootstrap.min.css">
    <script src="../../bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="../css/back/style.css">

    <script>
        function checkEmpty(id , name) {
            var value=$("#"+id).val();//获取以.id为开头的值。
            if(value.length==0){
                alert(name+"不能为空");
                $("#"+id)[0].focus();
                return false;
            }
            return true;
        }

        function checkNumber(id, name) {
            var value= $("#"+id).val();
            if(value.length==0){
                alert(name+"不能为空");
                $("#"+id)[0].focus();
                return false;
            }
            if(isNaN(value)){
                alert(name+"必须是数字");
                $("#"+id)[0].focus();
                return false;
            }
            return true;
        }
        
        function checkInt(id ,name) {
            var value=$("#"+id).val();
            if(value.length==0){
                alert(name+"不能为空");
                $("#"+id)[0].focus();
                return false;
            }
            if(parseInt(value)!=value){
                alert(name+"必须是整数");
                $("#"+id)[0].focus();
                return false;
            }
            return true;
        }
        $(function () {
            $("a").click(function () {
                var deleteLink=$(this).attr("deleteLink");
                console.log(deleteLink);
                if(deleteLink=="true"){
                    var confirmDelete=confirm("确认要删除");
                    if(confirmDelete)
                        return true;
                    else
                        return false;
                }
            })
        })

    </script>
</head>
<body>
</body>
</html>
