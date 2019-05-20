<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/5/7/007
  Time: 20:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>登录页面</title>
    <link rel="shortcut icon" href="#"/>
    <!-- CSS样式 -->
    <style type="text/css">

        /*表单*/
        form{
            width: 270px;
            height: 160px;

            /*内边距*/
            padding-left:50px;
            padding-top: 50px;
            padding-right: 48px;
            padding-bottom: 60px;

            border: 2px solid #8BC34A;
            /*border: 0px;*/
            margin-left: 60%;/*左外边距1200*/
            margin-top: 15%;/*上外边距300*/

            background:transparent;
        }


        /*登录按钮*/
        #login_button{
            width:260px;
            height: 30px;
            background: #dcc9ba;
            color: #468620;
            font-size: 20px;
        }

        /*form表单中每一行的高度*/
        .form_div{
            height: 30px;
            margin-bottom: 18px;
        }

        .labelClz{
            font-size: 20px;
            width: 80px;
            height: 30px;
            display: inline-block;
        }

        body{
            /*背景颜色*/
            background-image: url(${pageContext.request.contextPath}/img/background_002.jpg);
            /*背景图片完全覆盖背景区域*/
            background-size: cover;
        }
    </style>
</head>
<body>
    <form method="get">
        <div class="form_div">
            <label class="labelClz">用户名</label>
            <input type="text" id="username" name="username" style="height: 28px;width: 175px">
        </div>
        <div class="form_div">
            <label class="labelClz">密码</label>
            <input type="text" id="password" name="password" style="height: 28px;width: 175px">
        </div>
        <div class="form_div">
            <input id="login_button" type="submit" value="登录">
        </div>
        <div class="form_div">
            <a href="${pageContext.request.contextPath}/jsp/test/easyUI_test.jsp">忘记密码?</a>
            <a href="${pageContext.request.contextPath}/jsp/login/register.jsp" style="margin-left: 120px">用户注册</a>
        </div>
    </form>

    <!-- 引入jquery的jar-->
    <script src="http://libs.baidu.com/jquery/1.9.1/jquery.js"></script>
    <script type="text/javascript">
        $("form").submit(function () {
            var name = $("#username").val();
            var password = $("#password").val();

            if(name=="" || name==null || name ==undefined){
                alert("用户名不能为空！请输入用户名！");
                return false;
            } else if(password=="" || password==null || password==undefined){
                alert("用户密码不能为空！请输入密码！");
                return false;
            }else{
                $.ajax({
                    url:"${pageContext.request.contextPath}/user/loginCheckUser",
                    type:"GET",
                    async:false,
                    data:{"username":name, "password":password},
                    contentType: 'text/json,charset=utf-8',
                    dataType:"text",
                    success:function (result) {
                        result = decodeURI(result)
                        if(result=="success"){
                            //登录成功跳转系统主页
                            window.location.href="main.jsp";
                        }else{
                            //后台校验失败，显示结果！
                            alert(result);
                        }
                    }
                });
                return true;
            }
    });

    </script>
</body>
</html>
