<%--
  Created by IntelliJ IDEA.
  User: T430487
  Date: 2019/7/12
  Time: 11:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>角色权限详细页面</title>
    <link rel="shortcut icon" href="#"/>

    <style type="text/css">
        .one_menu_tr td {
            font-size: 16px;
        }

        .two_menu_tr td {
            text-indent: 40px;
        }

        .role_detail_checkbox_tr td {
            text-indent: 40px;
            width: 200px;
        }

    </style>
</head>
<body>
<div style="margin-left: 20px;margin-top: 20px;">
    <div>
        <button style="width: 60px;height: 30px;">生效</button>
        <button style="width: 60px;height: 30px; margin-left: 20px;">维护</button>
    </div>

    <div style="margin-top: 10px;margin-bottom: 10px;">
        <span>角色名</span> <input type="text" value="" style="margin-right: 60px;">
        <span>状态</span> <input type="text" value="">
    </div>

    <div style="text-align: center; width: 100%; height: 30px;margin-bottom: 10px;">角色菜单配置</div>

    <div>
        <table>
            <tr class="one_menu_tr">
                <td>系统管理</td>
            </tr>
            <tr class="two_menu_tr">
                <td>用户管理</td>
            </tr>
            <tr class="role_detail_checkbox_tr">
                <td><input type="checkbox" id="userIsSelect">查询</td>
                <td><input type="checkbox" id="userIsAdd">新增</td>
                <td><input type="checkbox" id="userIsUpdate">修改</td>
                <td><input type="checkbox" id="userIsDelete">删除</td>
            </tr>
            <tr class="two_menu_tr">
                <td>菜单管理</td>
            </tr>
            <tr class="role_detail_checkbox_tr">
                <td><input type="checkbox">查询</td>
                <td><input type="checkbox">新增</td>
                <td><input type="checkbox">修改</td>
                <td><input type="checkbox">删除</td>
            </tr>
            <tr class="two_menu_tr">
                <td>角色管理</td>
            </tr>
            <tr class="role_detail_checkbox_tr">
                <td><input type="checkbox">查询</td>
                <td><input type="checkbox">新增</td>
                <td><input type="checkbox">修改</td>
                <td><input type="checkbox">删除</td>
            </tr>

            <tr class="one_menu_tr">
                <td>功能管理</td>
            </tr>
            <tr class="two_menu_tr">
                <td>黑名单管理</td>
            </tr>
            <tr class="role_detail_checkbox_tr">
                <td><input type="checkbox" value="">查询</td>
                <td><input type="checkbox" value="">新增</td>
                <td><input type="checkbox" value="">修改</td>
                <td><input type="checkbox" value="">删除</td>
            </tr>
            <tr class="two_menu_tr">
                <td>白名单管理</td>
            </tr>
            <tr class="role_detail_checkbox_tr">
                <td><input type="checkbox" value="">查询</td>
                <td><input type="checkbox" value="">新增</td>
                <td><input type="checkbox" value="">修改</td>
                <td><input type="checkbox" value="">删除</td>
            </tr>
        </table>

    </div>
</div>
</body>
</html>

<script src="${pageContext.request.contextPath}/lib/jquery-3.4.1.min.js"></script>
<script type="text/javascript">
    $(function () {
        isPropChecked(${roleDetailVO.userIsSelect}, $("#userIsSelect"));
        isPropChecked(${roleDetailVO.userIsAdd}, $("#userIsAdd"));
        isPropChecked(${roleDetailVO.userIsUpdate}, $("#userIsUpdate"));
        isPropChecked(${roleDetailVO.userIsDelete}, $("#userIsDelete"));
    });

    function isPropChecked(var1, var2) {
        if (var1 != null && var1 != undefined && typeof var1 == "boolean") {
            if (var1) {
                var2.prop("checked", true);
            } else {
                var2.prop("checked", false);
            }
        }
    }

</script>
