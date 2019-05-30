<%--
  Created by IntelliJ IDEA.
  User: T430487
  Date: 2019/5/22
  Time: 16:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>main-left</title>
    <link rel="shortcut icon" href="#"/>
    <style type="text/css">
        .menu_tree{
            background-color: white;
            width: 100%;
            height: 100%;
        }

        ul li{
            /*消除ul和li前面的小圆点*/
            list-style: none;
        }

        /*清楚子菜单的缩进*/
        ul{
            margin: 0;
            padding: 0;
        }

        /*设置一级菜单的背景颜色*/
        .main > a{
            /*消除链接下面的下划线*/
            text-decoration: none;
            background-color: #c1d8c7;
            font-size: 18px;
            color: black;
            display: block;
            width: 200px;
            padding-top: 3px;
        }

        /*二级菜单*/
        .menu a{
            text-decoration: none;
            background-color: white;
            margin-left: 20px;
            font-size: 16px;
            display: block;
            padding-top: 3px;
            width: 180px;
        }
    </style>
</head>
<body>
    <ul class="menu_tree">
        <c:forEach items="${resultMapList}" var="entry" varStatus="vs">
            <li class="main">
                <a href="#"><c:out value="${entry.key}"></c:out></a>
                <ul class="menu">
                    <c:forEach items="${entry.value}" var="menu" varStatus="vs2">
                        <li>
                            <a href="#"><c:out value="${menu.menuName}"></c:out></a>
                        </li>
                    </c:forEach>
                </ul>
            </li>
        </c:forEach>
    </ul>

</body>
</html>

<script src="${pageContext.request.contextPath}/lib/jquery-3.4.1.min.js"></script>
<script type="text/javascript">
    $(function () {
        $(".main > ul").slideUp(0);
        $(".main > a").click(function () {
            var thisNode = $(this).next("ul");
            //先关闭所有的
            $(".main > ul").slideUp(1);
            //再打开
            thisNode.slideDown();
        });
    });
</script>
