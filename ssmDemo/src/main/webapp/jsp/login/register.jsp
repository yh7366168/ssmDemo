<%--
  Created by IntelliJ IDEA.
  User: T430487
  Date: 2019/5/13
  Time: 9:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
    <title>注册页面</title>
    <link rel="shortcut icon" href="#"/>
    <style type="text/css">
        body{
            /*背景*/
            background-image: url("${pageContext.request.contextPath}/img/background_003.jpg");
            /*透明*/
            background-size: cover;
        }

        /*表单设置*/
        form{
            width: 270px;
            height: 440px;
            /*内边距*/
            padding-left:50px;
            padding-top: 50px;
            padding-right: 48px;
            padding-bottom: 60px;
            /*边框*/
            border: 0px;
            /*外边距*/
            margin-left: 37%;/*左外边距1200*/
            margin-top: 8%;/*上外边距300*/
        }

        /*form表单里面所有div元素*/
        form div{
            height: 30px;
            margin-bottom: 18px;
        }

        .labelClz{
            width: 80px;
            display: inline-block;
        }
    </style>
</head>

<body>
<form>
    <div>
        <label class="labelClz">用户名</label>
        <input type="text" id="username" name="username" required="required">
        <img id="userImg" src="${pageContext.request.contextPath}/img/isChecked.png"  style="width: 15px;height: 15px" hidden="hidden">
    </div>
    <div>
        <label class="labelClz">密码</label>
        <input type="text" id="password" name="password">
    </div>
    <div>
        <label class="labelClz">性别</label>
        <span>男</span><input type="radio" name="sex" checked="checked">
        <span style="margin-left: 40px;">女</span><input type="radio" name="sex">
    </div>
    <div>
        <label class="labelClz">年龄</label>
        <input type="text" id="age" name="age">
    </div>
    <div>
        <label class="labelClz">手机号</label>
        <input type="text" id="phone" name="phone">
    </div>
    <div>
        <label class="labelClz">邮箱</label>
        <input type="text" id="email" name="email">
    </div>
    <div>
        <label class="labelClz">地址</label>
        <input type="text" id="address" name="address">
    </div>
    <div>
        <input type="checkbox" name="isRead">
        <label style="font-size: 13px;margin-left: 7px">我已阅读并确认遵守用户协议！</label>
    </div>
    <div>
        <input type="submit" value="注册" style="height: 28px;width: 257px;background-color: #607d8b;color: white">
    </div>
</form>
</body>
</html>

<script src="http://libs.baidu.com/jquery/1.9.1/jquery.js"></script>
<script type="text/javascript">
    $(function () {
        //校验用户名：失去焦点时触发
        $("#username").blur(function () {
            $("#userImg").hide();
            var username = $("#username").val();
            isNull(username,"请输入用户名！")
            $.ajax({
                type:"GET",
                url:"${pageContext.request.contextPath}/user/checkUsernameIsExist",
                async:false,
                data:{"username":username},
                dataType:"text",
                success:function (message) {
                    if(message != "success"){
                        alert(message);
                    }else{
                        $("#userImg").show();
                    }s
                }
            });
        });
        //校验非空
        $("#password").blur(function () {
            isNull($("#password").val(),"请输入密码！");
        });

        function isNull(field,message) {
            if(field==null || field=="" || field==undefined){
                alert(message);
                return false
            }
            return true;
        }
        //校验
    });

</script>