<%--
  Created by IntelliJ IDEA.
  User: T430487
  Date: 2019/6/26
  Time: 15:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>用户列表页面</title>
    <link rel="shortcut icon" href="#"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/yh_common.css">
    <style type="text/css">
        td {
            width: 200px;
        }
        .countIndex {
            width: 122px;
        }
        /*表头颜色*/
        .head_tr {
            /*background-color: #b2dd5c;*/
            background-image: url(${pageContext.request.contextPath}/img/tree_01.png);
            background-size: cover;
        }
    </style>
</head>
<body>
<!-- 操作框 -->
<div class="crudDiv">
    <button>新增</button>
    <button>修改</button>
    <button>删除</button>
</div>
<!-- 查询框 -->
<div class="selectDiv">
    <span>用户名</span>
    <input type="text">
    <button id="select_button">查询</button>
    <button id="reset_button">重置</button>
</div>
<!-- 列表 -->
<table class="common_table">
    <%--第一行 表头--%>
    <tr class="head_tr">
        <td class="countIndex"></td>
        <td>用户名</td>
        <td>性别</td>
        <td>最后一次登录时间</td>
        <td>是否生效</td>
    </tr>
    <%--遍历表格--%>
    <c:forEach var="user" items="${requestScope.userList}" varStatus="vs">
        <tr>
            <td class="countIndex">${vs.count}</td>
            <td>
                <a href="#" style="text-decoration: none;color: blue;">${user.username}</a>
            </td>
            <td>
                <c:if test="${user.sex==0}">男</c:if>
                <c:if test="${user.sex==1}">女</c:if>
            </td>
            <td>${user.lastLoginTime}</td>
            <td>
                <c:if test="${user.userStatus==true}">未生效</c:if>
                <c:if test="${user.userStatus==false}">生效</c:if>
            </td>
        </tr>
    </c:forEach>
</table>
<!-- 分页框 -->
<div class="page_div">
    <span>
        <a href="#" id="previous_page" style="color: blue">上一页</a>
    </span>
    <span class="page_input_div">
        第&nbsp;<input type="text" id="page_input_value" value="${pageBean.curPage}"
                      style="width: 30px;text-align: center">&nbsp;页
    </span>
    <img id="to_page" src="${pageContext.request.contextPath}/img/next_page.png"
         style="position: absolute;height: 19px;padding-top: 3px;cursor: pointer">
    <span>
        <a href="#" id="next_page" style="color: blue;margin-left: 31px;">下一页</a>
    </span>
    <span>共${pageBean.totalPage}页</span>
    <span>共${pageBean.totalCount}条</span>
</div>
</body>
</html>
