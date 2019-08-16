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
            width: 250px;
        }
        tr {
            height: 30px;
        }
    </style>
</head>
<body>
<div style="margin-left: 45px;margin-top: 30px;">
    <div style="margin-bottom: 20px">
        <button id="roleDetail_update_button" style="width: 60px;height: 30px; margin-right: 20px;"
                onclick="updateRoleFun()">维护
        </button>
        <button id="roleDetail_save_button" style="width: 60px;height: 30px; margin-left: 20px; display: none"
                onclick="">保存
        </button>
        <button id="roleDetail_return_button" style="width: 60px;height: 30px;" onclick="">返回</button>
    </div>
    <div style="margin-top: 10px;margin-bottom: 10px;">
        <span>角色名</span> <input type="text" value="" style="margin-right: 16px;" disabled="disabled">
    </div>
    <div style="text-align: center; width: 100%; height: 20px;">角色菜单配置</div>
    <div>
        <table>
            <!-- 模块一 系统管理-->
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
            <tr>********************************************************</tr>
            <c:forEach items="${roleDetailListVO}" var="roleDetailVar">
                <tr class="one_menu_tr">
                    <td>${roleDetailVar.firstMenuName}</td>
                </tr>
                <tr class="two_menu_tr">
                    <td>${roleDetailVar.secondMenuName}</td>
                </tr>
                <tr class="role_detail_checkbox_tr">
                    <c:forEach items="${roleDetailVar.buttonList}" var="buttonVar">
                        <td><input type="checkbox" value="${buttonVar.buttonAlias}">${buttonVar.buttonName}</td>
                    </c:forEach>
                </tr>

            </c:forEach>
        </table>
    </div>
</div>
</body>
</html>

<script src="${pageContext.request.contextPath}/lib/jquery-3.4.1.min.js"></script>
<script type="text/javascript">
    $(function () {

    });

</script>
