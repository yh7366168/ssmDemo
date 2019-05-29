<%--
  Created by IntelliJ IDEA.
  User: T430487
  Date: 2019/5/28
  Time: 17:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>菜单列表界面</title>
    <link rel="shortcut icon" href="#"/>
</head>
<body>
    <table>
        <%--第一行 表头--%>
        <tr>
            <td></td>
            <td>菜单名</td>
            <td>菜单级别</td>
        </tr>
        <%--遍历表格--%>
        <c:forEach var="menu" items="${requestScope.menuList}" varStatus="vs">
            <tr>
                <td><input type="checkbox" value="${menu.menuId}"></td>
                <td><c:out value="${menu.menuName}"></c:out></td>
                <td><c:out value="${menu.menuLevel}"></c:out></td>
            </tr>
        </c:forEach>
    </table>
</body>
</html>
