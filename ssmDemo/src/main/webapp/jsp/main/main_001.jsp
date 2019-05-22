<%--
  Created by IntelliJ IDEA.
  User: T430487
  Date: 2019/5/20
  Time: 14:54
  To change this template use File | Settings | File Templates.
--%>
<%--
    由于Html5不支持frameset标签，因此采用div+css实现frameset效果
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="shortcut icon" href="#"/>
    <style type="text/css">
        #head_div{
            border-bottom:1px solid black;
            margin-bottom:5px;
            height: 6%;
        }

        #body_div{
            display: inline;/*一行显示*/
        }

        #left_menu{
            width: 200px;
            float: left;/*靠左显示*/
            border-right: 1px solid black;
            height: 94%;
            resize: horizontal;	/*用户可调整元素的宽度*/
            overflow:auto;
        }

        #right_main{
            height: 94%;
        }


    </style>
</head>
<body>
    <div id="page">
        <div id="head_div">
            顶部
        </div>
        <div id="body_div">
            <div id="left_menu">
                菜单
            </div>
            <div id="right_main">
                内容
            </div>
        </div>
    </div>

</body>
</html>
