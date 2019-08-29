<%--
  Created by IntelliJ IDEA.
  User: T430487
  Date: 2019/6/26
  Time: 15:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include file="/jsp/common/page_util.jsp" %>
<html>
<head>
    <title>角色列表页面</title>
    <link rel="shortcut icon" href="#"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/yh_common.css">
    <style type="text/css">
        /*表头颜色*/
        .head_tr {
            background-image: url(${pageContext.request.contextPath}/img/tree_01.png);
            background-size: cover;
        }
    </style>
</head>
<body>
<!-- 操作框 -->
<div class="crudDiv">
    <div>
        <button class="add_button_clz" onclick="initRoleDetailFun()">新增</button>
    </div>
</div>
<!-- 查询框 -->
<div class="selectDiv">
    <div>
        <span>角色名</span>
        <input type="text" id="rolename_select" value="${roleVO.roleName}">
        <button id="select_button">查询</button>
        <button id="reset_button">重置</button>
    </div>
</div>
<!-- 列表 -->
<table class="common_table">
    <%--第一行 表头--%>
    <tr class="head_tr">
        <td class="countIndex" style="width: 150px"></td>
        <td style="width: 200px">角色名</td>
        <td style="width: 200px">角色描述</td>
        <td style="width: 200px">角色状态</td>
        <td style="width: 250px">操作</td>
    </tr>
    <%--遍历表格--%>
    <c:forEach var="role" items="${requestScope.roleList}" varStatus="vs">
        <tr class="info_tr">
            <td class="countIndex">${vs.count}</td>
            <td>${role.roleName}</td>
            <td>${role.roleDesc}</td>
            <td>
                <c:if test="${role.roleStatus==0}">未生效</c:if>
                <c:if test="${role.roleStatus==1}">生效</c:if>
            </td>
            <td>
                <div style="display: inline-block;height: 28px;line-height: 28px;">
                    <span>
                        <a href="#" onclick="selectDetailFun('${role.roleId}')">查询</a>
                    </span>
                    <span style="margin-left: 10px;margin-right: 5px">|</span>
                    <span>
                        <a href="#" class="delete_button_clz" value="${role.roleId}-${role.roleType}">删除</a>
                    </span>
                </div>
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

<script src="${pageContext.request.contextPath}/lib/jquery-3.4.1.min.js"></script>
<script type="text/javascript">
    /**
     * 点击“新增”按钮，跳转至新增页面
     * */
    function initRoleDetailFun() {
        $.ajax({
            type: "POST",
            url: "${pageContext.request.contextPath}/roleMenu/initRoleDetail",
            async: false,
            dataType: "text",
            success: function (result) {
                $("#right").html(result);
            }
        });
    }

    /**
     * 查询详细按钮
     * */
    function selectDetailFun(roleId) {
        $.ajax({
            type: "POST",
            url: "${pageContext.request.contextPath}/roleMenu/queryRoleMenuDetail",
            async: false,
            data: {"roleId": roleId},
            dataType: "text",
            success: function (result) {
                $("#right").html(result);
            }
        });
    }

    /**
     * 点击“删除”按钮，删除这条数据
     * */
    $(".delete_button_clz").on("click", function () {
        var valStr = $(this).attr("value");
        var roleId = valStr.split("-")[0];
        var roleType = valStr.split("-")[1];
        if(roleId == "101"){
            alertUtil("无法删除管理员角色！");
            return;
        }
        if(roleType == "0"){
            alertUtil("无法删除系统角色！");
            return;
        }
        var msg = "是否删除该角色信息？如果确认，该角色用户下的所有用户都将失效！";
        var dataArr = {"roleId": roleId};
        var url = "/role/deleteRoleByRoleId";
        confrimUtil(msg, dataArr, url);
    });

    /*查询按钮*/
    $("#select_button").on("click", function () {
        $.ajax({
            type: "POST",
            url: "${pageContext.request.contextPath}/role/queryPageList",
            async: false,
            data: {
                "roleName": $("#rolename_select").val(),
                "curPage": $("#page_input_value").val()
            },
            dataType: "text",
            success: function (result) {
                $("#right").html(result);
            }
        });
    });
    /*重置按钮*/
    $("#reset_button").on("click", function () {
        /*清空选择框*/
        $("#username_select").val("");
        $.ajax({
            type: "POST",
            url: "${pageContext.request.contextPath}/role/queryPageList",
            async: false,
            data: {"curPage": "1"},
            dataType: "text",
            success: function (data) {
                $("#right").html(data);
            }
        });
    });
    //点击图片，跳转到对应页码
    $("#to_page").on("click", function () {
        var toPage = $("#page_input_value").val();
        if (toPage < 1 || toPage >${pageBean.totalPage}) {
            alertUtil("请输入正确页码！");
            return;
        }
        $.ajax({
            type: "GET",
            url: "${pageContext.request.contextPath}/role/queryPageList",
            data: {"curPage": toPage},
            async: false,
            dataType: "text",
            success: function (result) {
                //重新加载页面
                $("#right").html(result);
            }
        });
    });

    /*页面初始化*/
    $(function () {
        var curPage = $("#page_input_value").val();
        //第一页，“上一页”按钮变成灰色, 当前页不是第一页，点击“上一页”
        if (curPage == 1) {
            $("#previous_page").attr("href", "javascript:;")
                .css("pointer-events", "none")
                .css("color", "#2b2b2bf0");
        } else {
            var previousPage = parseInt(curPage) - 1;
            $("#next_page").on("click", function () {
                $.ajax({
                    type: "GET",
                    url: "${pageContext.request.contextPath}/role/queryPageList",
                    data: {"curPage": nextPage},
                    async: false,
                    dataType: "text",
                    success: function (result) {
                        //重新加载页面
                        $("#right").html(result);
                    }
                });
            });
        }
        //最后一页，“下一页”按钮变成灰色;当前页不是最后一页，点击“下一页”
        if (curPage == ${pageBean.totalPage}) {
            $("#next_page").attr("href", "javascript:;")
                .css("pointer-events", "none")
                .css("color", "#2b2b2bf0");
        } else {
            var nextPage = parseInt(curPage) + 1;
            $("#next_page").on("click", function () {
                $.ajax({
                    type: "GET",
                    url: "${pageContext.request.contextPath}/role/queryPageList",
                    data: {"curPage": nextPage},
                    async: false,
                    dataType: "text",
                    success: function (result) {
                        //重新加载页面
                        $("#right").html(result);
                    }
                });
            });
        }
        //设置按钮权限
        userButtonRoleFun(10003);
    });
</script>