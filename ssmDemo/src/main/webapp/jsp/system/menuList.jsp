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
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/yh_common.css">
    <style type="text/css">
        .selectDiv{
            width: 910px;
            height: 30px;
            margin-left: 20px;
            margin-top: 20px;
        }

        .selectDiv span{
            margin-right: 8px;
        }

        .selectDiv button{
            margin-left: 20px;
            background-color: #aae369;
            width: 80px;
        }
    </style>
</head>
<body>
    <div class="crudDiv">
        <button>新增</button>
        <button>修改</button>
        <button>删除</button>
    </div>
    <!-- 查询区域 -->
    <div class="selectDiv">
        <span>菜单名称</span>
        <input type="text" value="" id="menu_name">
        <span style="margin-left: 20px">菜单级别</span>
        <input type="text" value="" id="menu_level">
        <button>查询</button>
        <button>重置</button>
    </div>

    <table class="common_table">
        <%--第一行 表头--%>
        <tr class="head_tr">
            <td></td>
            <td>菜单名称</td>
            <td>菜单级别</td>
            <td>菜单状态</td>
        </tr>
        <%--遍历表格--%>
        <c:forEach var="menu" items="${requestScope.menuList}" varStatus="vs">
            <tr>
                <td><input type="checkbox" value="${menu.menuId}"></td>
                <td><c:out value="${menu.menuName}"></c:out></td>
                <td>
                    <c:if test="${menu.menuLevel==1}">一级菜单</c:if>
                    <c:if test="${menu.menuLevel==2}">二级菜单</c:if>
                </td>
                <td>
                    <c:if test="${menu.menuStatus==0}">未生效</c:if>
                    <c:if test="${menu.menuStatus==1}">生效</c:if>
                </td>
            </tr>
        </c:forEach>
    </table>
</body>
</html>
