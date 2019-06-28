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

        #user_info_div{
            position: absolute;
            width: 500px;
            left: 28%;
            top:30%;
        }

    </style>
</head>
<body id="user_body">
<!-- 操作框 -->
<div class="crudDiv">
    <div>
        <button>用户审核</button>
        <button>删除</button>
    </div>
</div>
<!-- 查询框 -->
<div class="selectDiv">
    <div>
        <span>用户名</span>
        <input type="text" id="username_select" value="${userDto.username}">
        <button id="select_button">查询</button>
        <button id="reset_button">重置</button>
    </div>
</div>
<!-- 列表 -->
<table class="common_table">
    <%--第一行 表头--%>
    <tr class="head_tr">
        <td class="countIndex"><input type="checkbox" id="check_box_head"></td>
        <td>用户名</td>
        <td>性别</td>
        <td>最后一次登录时间</td>
        <td>是否生效</td>
    </tr>
    <%--遍历表格--%>
    <c:forEach var="user" items="${requestScope.userList}" varStatus="vs">
        <tr class="info_tr">
            <td class="countIndex"><input type="checkbox" class="table_checkbox"></td>
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

<!-- 弹出窗口 -->
<div id="user_info_div" style="border-style: double">
    <div>
        <p>是否删除？</p>
        <button id="user_info_div_confirm">确认</button>
        <button id="user_info_div_cancal">取消</button>
    </div>
</div>

<script src="${pageContext.request.contextPath}/lib/jquery-3.4.1.min.js"></script>
<script type="text/javascript">

    $(function () {
        $("#user_info_div").hide();
    });
    $(".info_tr a").on("click", function () {
        var username = $(this).html();
        console.log("username = " + username);
        $("#user_body div").hide();
        $("#user_info_div").show();
    });
    $("#user_info_div_confirm").on("click", function () {
        $("#user_info_div").hide();
        $("#user_body div").show();
    });
    $("#user_info_div_cancal").on("click", function () {
        $("#user_info_div").hide();
        $("#user_body div").show();
    });

    /*查询按钮*/
    $("#select_button").on("click", function () {
        $.ajax({
            type: "POST",
            url: "${pageContext.request.contextPath}/user/queryUserPageList",
            async: false,
            data: {
                "userName": $("#username_select").val(),
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
            type:"POST",
            url:"${pageContext.request.contextPath}/user/queryUserPageList",
            async: false,
            data:{"curPage":"1"},
            dataType:"text",
            success:function (data) {
                $("#right").html(data);
            }
        });
    });
    /**
     * 表头复选框
     * */
    $("#check_box_head").on("click", function () {
        var isCheck = $("#check_box_head").is(":checked");
        if(isCheck){
            $("#check_box_head").prop("checked",true);
            $(".table_checkbox").prop("checked",true);
        }else{
            $("#check_box_head").prop("checked",false);
            $(".table_checkbox").prop("checked",false);
        }
    });
    /**
     * 列表内复选框
     * */
    $(".table_checkbox").on("click", function () {
        var i = 0;
        $(".table_checkbox").each(function () {
            if($(this).is(":checked")){
                i++;
            }
        });
        if(i>0){
            $("#check_box_head").prop("checked", false);
        }
        if(i==${pageBean.curPageCount}){
            $("#check_box_head").prop("checked",true);
        }
    });
    /*分页*/
    $(function () {
        var curPage = $("#page_input_value").val();
        //第一页，“上一页”按钮变成灰色
        if(curPage == 1){
            $("#previous_page").attr("href","javascript:;")
                .css("pointer-events","none")
                .css("color","#2b2b2bf0");
        }
        //最后一页，“下一页”按钮变成灰色
        if(curPage == ${pageBean.totalPage}){
            $("#next_page").attr("href","javascript:;")
                .css("pointer-events","none")
                .css("color","#2b2b2bf0");
        }
        //当前页不是最后一页，点击“下一页”
        if(curPage != ${pageBean.totalPage}){
            var nextPage = parseInt(curPage)  + 1;
            $("#next_page").on("click",function () {
                $.ajax({
                    type:"GET",
                    url:"${pageContext.request.contextPath}/user/queryUserPageList",
                    data:{"curPage" : nextPage},
                    async:false,
                    dataType:"text",
                    success:function (result) {
                        //重新加载页面
                        $("#right").html(result);
                    }
                });
            });
        }
        //当前页不是第一页，点击“上一页”
        if(curPage != 1){
            var previousPage = parseInt(curPage) - 1;
            $("#next_page").on("click",function () {
                $.ajax({
                    type:"GET",
                    url:"${pageContext.request.contextPath}/user/queryUserPageList",
                    data:{"curPage" : nextPage},
                    async:false,
                    dataType:"text",
                    success:function (result) {
                        //重新加载页面
                        $("#right").html(result);
                    }
                });
            });
        }
        //点击图片，跳转到对应页码
        $("#to_page").on("click", function () {
            var toPage = $("#page_input_value").val();
            console.log("toPage = " + toPage)
            if(toPage<1 || toPage>${pageBean.totalPage}){
                alert("请输入正确页码！");
                return;
            }
            $.ajax({
                type:"GET",
                url:"${pageContext.request.contextPath}/user/queryUserPageList",
                data:{"curPage" : toPage},
                async:false,
                dataType:"text",
                success:function (result) {
                    //重新加载页面
                    $("#right").html(result);
                }
            });
        });
    });
</script>