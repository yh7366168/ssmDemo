<%--
  Created by IntelliJ IDEA.
  User: T430487
  Date: 2019/5/22
  Time: 16:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>测试JQuery实现带单效果</title>
</head>
<body>
    <ul>
        <li class="main">
            <a href="#">菜单1</a>
            <ul>
                <li><a href="#">子菜单1</a></li>
                <li><a href="#">子菜单2</a></li>
                <li><a href="#">子菜单3</a></li>
            </ul>
        </li>
        <li class="main">
            <a href="#">菜单2</a>
            <ul>
                <li><a href="#">子菜单1</a></li>
                <li><a href="#">子菜单2</a></li>
                <li><a href="#">子菜单3</a></li>
            </ul>
        </li>
        <li class="main">
            <a href="#">菜单3</a>
            <ul>
                <li><a href="#">子菜单1</a></li>
                <li><a href="#">子菜单2</a></li>
                <li><a href="#">子菜单3</a></li>
            </ul>
        </li>
    </ul>
</body>
</html>

<script src="${pageContext.request.contextPath}/lib/jquery-3.4.1.min.js"></script>
<script type="text/javascript">
    $(function () {


        $(".main > a").click(function () {
            var sonNode = $(".main > a").next("ul");
            sonNode.slideToggle();
        });
    });
</script>
