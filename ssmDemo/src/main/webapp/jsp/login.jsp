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

    <!-- CSS样式 -->
    <style type="text/css">

        .login_frild{
            font-size: 23px;
            height: 28px;
        }

        /*表单*/
        #formClz{
            width: 270px;
            height: 160px;

            /*内边距*/
            padding-left:50px;
            padding-top: 50px;
            padding-right: 48px;
            padding-bottom: 60px;

            border: 1px solid yellowgreen;

            margin-left: 1200px;/*左外边距*/
            margin-top: 300px;/*上外边距*/

            background-color: white;
        }

        /*登录按钮*/
        #login_button{
            width:260px;
            height: 30px;
            background: dodgerblue;
            color: white;
            font-size: 20px;
        }

        /*form表单中每一行的高度*/
        .form_div{
            height: 30px;
            margin-bottom: 18px;
        }

        body{
            /*背景颜色*/
            background-image: url(../img/background_002.jpg);
            /*背景图片完全覆盖背景区域*/
            background-size: cover;
        }
    </style>
    <!-- 引入jquery的jar-->
    <script src="${pageContext.request.contextPath}/js/jquery-3.4.1.min.js"/>

    <script type="text/javascript">

    </script>
    
</head>
<body>
    <form id="formClz">
        <div class="login_frild form_div">
            <span>用户名</span>&nbsp;&nbsp;
            <input type="text" name="username" style="height: 29px;">
        </div>
        <div class="login_frild form_div">
            <span>密&nbsp;&nbsp;&nbsp;码</span>&nbsp;&nbsp;
            <input type="text" name="password" style="height: 29px;">
        </div>
        <div class="form_div">
            <input id="login_button" type="submit" value="登录">
        </div>
        <div class="form_div">
            <a href="">忘记密码?</a>
            <a href="" style="margin-left: 120px">用户注册</a>
        </div>
    </form>
</body>
</html>
