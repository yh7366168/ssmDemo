<%--
  Created by IntelliJ IDEA.
  User: T430487
  Date: 2019/5/28
  Time: 17:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html id="menuList_html">
<head>
    <title>菜单列表界面</title>
    <link rel="shortcut icon" href="#"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/yh_common.css">
    <style type="text/css">
        td {
            width: 200px;
        }

        .countIndex {
            width: 122px;
        }

        /*表头眼色*/
        .head_tr {
            /*background-color: #b2dd5c;*/
            background-image: url(${pageContext.request.contextPath}/img/tree_01.png);
            background-size: cover;
        }

    </style>
</head>
<body>
<div class="crudDiv">
    <button>新增</button>
</div>
<!-- 查询区域 -->
<div class="selectDiv">
    <span>菜单名称</span>
    <input type="text" id="menu_name_select" value="${menuDto.menuName}">
    <span style="margin-left: 20px">菜单级别</span>
    <select id="menu_level_select" value="${menuDto.menuLevel}" style="margin-left: 8px; width: 100px">
        <option value="0"></option>
        <option value="1" ${menuDto.menuLevel eq '1'?'selected':''}>一级菜单</option>
        <option value="2" ${menuDto.menuLevel eq '2'?'selected':''}>二级菜单</option>
    </select>
    <button id="select_button">查询</button>
    <button id="reset_button">重置</button>
</div>

<table class="common_table">
    <%--第一行 表头--%>
    <tr class="head_tr">
        <td class="countIndex"></td>
        <td>菜单名称</td>
        <td>菜单级别</td>
        <td>菜单状态</td>
    </tr>
    <%--遍历表格--%>
    <c:forEach var="menu" items="${requestScope.menuList}" varStatus="vs">
        <tr>
            <td class="countIndex">${vs.count}</td>
            <td>
                <a href="#" style="text-decoration: none;color: blue;">${menu.menuName}</a>
            </td>
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
<%--翻页--%>
<div class="page_div">
    <span>
        <a href="#" id="previous_page" style="color: blue">上一页</a>
    </span>
    <span class="page_input_div">
        第&nbsp;<input type="text" id="page_input_value" value="${pageBean.curPage}" style="width: 30px;text-align: center">&nbsp;页</span>
    <span>
        <a href="#" style="color: blue">下一页</a>
    </span>
    <span>共${pageBean.totalPage}页</span>
    <span>共${pageBean.totalCount}条</span>
</div>
</body>
</html>

<script src="${pageContext.request.contextPath}/lib/jquery-3.4.1.min.js"></script>
<script type="text/javascript">
    /*查询按钮*/
    $("#select_button").on("click", function () {
        $.ajax({
            type: "POST",
            url: "${pageContext.request.contextPath}/menu/queryMenuListByParams",
            async: false,
            data: {
                "menuName": $("#menu_name_select").val(),
                "menuLevel": $("#menu_level_select").val(),
                "curPage": $("#page_input_value").val()
            },
            dataType: "text",
            success: function (result) {
                $("#right").html(result);
            },
            error: function () {
                alert("error!")
            }
        });
    });

    /*重置按钮*/
    $("#reset_button").on("click", function () {
        /*清空选择框*/
        $("#menu_name_select").val("");
        $("#menu_level_select").val("");
        $.ajax({
            type:"GET",
            url:"${pageContext.request.contextPath}/menu/queryPageList",
            async: false,
            data:{"curPage":"1"},
            dataType:"text",
            success:function (data) {
                $("#right").html(data);
            }
        });
    });

    /*所有资源加载完毕之后执行*/
    window.onload = function () {

    }


</script>