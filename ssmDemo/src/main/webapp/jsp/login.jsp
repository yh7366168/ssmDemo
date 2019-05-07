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

    <!-- 样式 -->
    <style type="text/css">
        .login_frild{
            font-size: 23px;
        }

        #formClz{
            width: 300px;
            height: 100px;
            padding:50px;
            border: 1px solid blue;

            margin-left: 1300px;
            margin-top: 230px;
        }

    </style>
</head>
<body>
    <form id="formClz">
        <div><span class="login_frild">用户名</span><input type="text" name="username"></div></br>
        <div><span class="login_frild">密&nbsp;&nbsp;码</span></span><input type="text" name="password"></div></br>
        <input class="login_frild" type="submit" value="登录">
    </form>
</body>
</html>
