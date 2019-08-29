<%--
  Created by IntelliJ IDEA.
  User: T430487
  Date: 2019/7/12
  Time: 11:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include file="/jsp/common/page_util.jsp" %>
<html>
<head>
    <title>添加角色</title>
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
        button {
            width: 60px;
            height: 30px;
            margin-right: 20px;
        }
    </style>
</head>
<body>
<div style="margin-left: 45px;margin-top: 30px;">
    <div style="margin-bottom: 20px">
        <button id="roleDetail_save_button"
                onclick="saveUserRoleFun()">保存
        </button>
        <button id="roleDetail_update_button" style="display: none">维护</button>
        <button id="roleDetail_save_button_second" style="display: none">保存2</button>
        <button id="roleDetail_return_button"  onclick="returnBackListFun('/role/queryPageList')">返回</button>
    </div>
    <div style="margin-top: 20px;margin-bottom: 20px;">
        <span>角色名</span> <input type="text" value="" id="role_name_input" style="margin-right: 16px;text-indent: 10px;margin-right: 20px" >
        <span>角色描述</span><input type="text" value="" id="role_desc_input" style="margin-left:16px;text-indent: 10px ">
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
     * 点击保存，保存角色信息
     * */
    function saveUserRoleFun() {
        //角色名必填
        var roleName = $("#role_name_input").val();
        if(roleName == undefined || roleName==null || roleName.trim()==""){
            alertUtil("请输入角色名！");
            return;
        }
        //角色名唯一
        var checkFlag = false;
        $.ajax({
            type:"POST",
            url:"${pageContext.request.contextPath}/role/checkRoleName",
            data:{"roleName" : roleName },
            async:false,
            dataType:"text",
            success:function (resultStr) {
                if(resultStr != "success"){
                    alertUtil(resultStr);
                }else{
                    checkFlag = true;
                }
            }
        });
        if(checkFlag){
            var checkBoxValueArr = $("input[type=checkbox]");
            var dataStr = "";
            for (var i = 0; i < checkBoxValueArr.length; i++) {
                if (checkBoxValueArr[i].checked) {
                    dataStr = dataStr + checkBoxValueArr[i].value + ";";
                }
            }
            if(dataStr == ""){
                alertUtil("请选择权限！");
                return;
            }
            var roleDesc = $("#role_desc_input").val();
            if(roleDesc == undefined || roleDesc==null || roleDesc.trim()==""){
                roleDesc = "无";
            }
            $.ajax({
                type: "post",
                url: "${pageContext.request.contextPath}/roleMenu/addRoleMenu",
                async: false,
                data: {
                    "roleName":roleName,
                    "roleDesc":roleDesc,
                    "dataStr": dataStr
                },
                success: function (data) {
                    $("#roleDetail_save_button").css("display", "none");
                    $("input[type=checkbox]").prop("disabled", true);
                    $("input[type=text]").prop("disabled", true);
                }
            });
        }
    }


    /**
     * 点击复选框。
     * 选中复选框：查询复选框必须自动处于选中状态；
     * 取消复选框：如果是查询，取消“选中”状态时同tr的其他复选框自动取消“选中”状态。
     * */
    $("input[type=checkbox]").on("click", function () {
        var valStrArr =  $(this).val().split("-");
        var allCheckBox = $("input[type=checkbox]");
        if ($(this).is(":checked")) {
            if(valStrArr[2] != 1){
                for(var i=0;i<allCheckBox.length; i++){
                    var otherValStrArr = allCheckBox[i].value.split("-");
                    //选中其他复选框，查询按钮自动选中
                    if(valStrArr[1] == otherValStrArr[1] && otherValStrArr[2]==1){
                        allCheckBox[i].checked = true;
                    }
                }
            }
        } else {
            if (valStrArr[2] == 1) {
                for (var i = 0; i < allCheckBox.length; i++) {
                    if (allCheckBox[i].checked) {
                        var otherValStrArr = allCheckBox[i].value.split("-");
                        //取消查询复选框选中状态，其他复选框自动取消选中状态
                        if (valStrArr[1] == otherValStrArr[1] && otherValStrArr[2] != 1) {
                            allCheckBox[i].checked = false;
                        }
                    }
                }
            }
        }
    });
</script>
