<%--
  Created by IntelliJ IDEA.
  User: T430487
  Date: 2019/8/15
  Time: 16:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
    <link rel="shortcut icon" href="#"/>
</head>
<body>

</body>
</html>
<script src="${pageContext.request.contextPath}/lib/jquery-3.4.1.min.js"></script>
<script type="text/javascript">

    function returnBackListFun(url){
        $.ajax({
            type:"POST",
            url:"${pageContext.request.contextPath}"+ url,
            data:{"curPage":"1"},
            async:false,
            dataType:"text",
            success:function (data) {
                $("#right").html(data);
            }
        });
    }

    function renturnBackFun(url) {
        $.ajax({
            type:"POST",
            url:"${pageContext.request.contextPath}" + url,
            async:false,
            dataType:"text",
            success:function (data) {
                $("#right").html(data);
            }
        });
    }
</script>
