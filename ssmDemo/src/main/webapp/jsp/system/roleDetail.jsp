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
        <button id="roleDetail_update_button" style="width: 60px;height: 30px; "
                onclick="updateRoleFun()">维护
        </button>
        <button id="roleDetail_save_button" style="width: 60px;height: 30px; display: none"
                onclick="saveUserRoleFun()">保存
        </button>
        <button id="roleDetail_return_button" style="width: 60px;height: 30px;margin-right: 20px;"  onclick="">返回</button>
    </div>
    <div style="margin-top: 10px;margin-bottom: 10px;">
        <span>角色名</span> <input type="text" value="${selectRoleId}" style="margin-right: 16px;" disabled="disabled">
    </div>
    <div style="text-align: center; width: 100%; height: 20px;">角色菜单配置</div>
    <div>
        <table>
            <c:forEach items="${roleDetailListVO}" var="roleDetailVar" varStatus="vs">
                <tr class="one_menu_tr">
                    <td>${roleDetailVar.firstMenuName}</td>
                </tr>
                <c:forEach items="${roleDetailVar.secondMenuList}" var="secondMenuListVar">
                    <tr class="two_menu_tr">
                        <td>${secondMenuListVar.secondMenuName}</td>
                    </tr>
                    <tr class="role_detail_checkbox_tr">
                        <c:forEach items="${secondMenuListVar.buttonList}" var="buttonVar">
                            <c:if test="${buttonVar.isChecked==true}">
                                <td><input type="checkbox" value="${buttonVar.buttonAlias}"
                                           checked="checked">${buttonVar.buttonName}</td>
                            </c:if>
                            <c:if test="${buttonVar.isChecked==false}">
                                <td><input type="checkbox" value="${buttonVar.buttonAlias}">${buttonVar.buttonName}</td>
                            </c:if>
                        </c:forEach>
                    </tr>
                </c:forEach>
            </c:forEach>
        </table>
    </div>
</div>

</body>
</html>

<script src="${pageContext.request.contextPath}/lib/jquery-3.4.1.min.js"></script>
<script type="text/javascript">
    /**
     * 初始化页面
     * */
    $(function () {
        //页面上所有复选框不可点击
        $("input[type=checkbox]").attr("disabled", true);
    });

    /**
     * 点击“维护”按钮，显示“保存”按钮
     * */
    function updateRoleFun() {
        $("#roleDetail_update_button").css("display", "none");
        $("#roleDetail_save_button").css("display", "inline");
        $("input[type=checkbox]").attr("disabled", false);
    }

    /**
     * 点击保存，成功后“保存”按钮消失，“维护”按钮出现
     * */
    function saveUserRoleFun() {
        var checkBoxValueArr = $("input[type=checkbox]");
        var dataStr = "";
        for (var i = 0; i < checkBoxValueArr.length; i++) {
            if (checkBoxValueArr[i].checked) {
                dataStr = dataStr + checkBoxValueArr[i].value + ";";
            }
        }
        console.log("dataStr: " + dataStr)
        $.ajax({
            type: "post",
            url: "${pageContext.request.contextPath}/roleMenu/saveRoleMenu",
            async: false,
            data: {
                "roleId": ${selectRoleId},
                "dataStr": dataStr
            },
            success: function (data) {
                $("#roleDetail_save_button").css("display", "none");
                $("#roleDetail_update_button").css("display", "inline");
            }
        });
    }

    /**
     * 点击复选按钮。如果是查询按钮，取消选中，其他的按钮自动取消；
     * */
</script>
