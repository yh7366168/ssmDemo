<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <%--<meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">--%>
    <title>系统主页面</title>
    <link rel="shortcut icon" href="#"/>
    <style>
        * {
            margin: 0;
            padding: 0;
        }

        html, body {
            height: 100%;
            text-align: center;
        }

        body {
            position: relative;
        }

        .top {
            width: 100%;
            height: 88px;
            /*background-color: #ccc;*/
            background-image: url(${pageContext.request.contextPath}/img/menu_top.png);
            background-size: cover;
            /*图片透明度
            filter:alpha(opacity:70);*/
            opacity: 0.7;
        }

        #left {
            position: absolute;
            top: 88px;
            right: 0;
            bottom: 0;
            left: 0;
            width: 240px;
        }

        #menu {
            width: 100%;
            height: 100%;
        }

        #drap-line {
            position: absolute;
            top: 0;
            right: 0;
            width: 4px;
            height: 100%;
            background-color: #e8e2a9;
            margin-left: 2px;
            margin-right: 2px;
            cursor: e-resize;
        }

        #right {
            position: absolute;
            top: 88px;
            right: 0;
            bottom: 0;
            left: 240px;
        }
    </style>
</head>

<body>
<!-- 顶部导航 -->
<div class="top">

</div>
<div id="left">
    <div id="menu">
        <div id="div1">页面1</div>
        <div>页面2</div>
    </div>
    <!-- 菜单左边界 -->
    <div id="drap-line"></div>
</div>
<div id="right">
    <iframe id="main_iframe" width="100%" height="100%" src="${pageContext.request.contextPath}/jsp/main/c.jsp"></iframe>
</div>

</body>
</html>
<script src="${pageContext.request.contextPath}/lib/jquery-3.4.1.min.js"></script>
<script>
    $(function () {
        $("#div1").click(function () {
            $("#main_iframe").attr("src","${pageContext.request.contextPath}/jsp/main/a.jsp");
        });

    });

    window.onload = function () {
        var startPageX = 0;
        var left = document.getElementById("left");
        var right = document.getElementById("right");
        var drapLine = document.getElementById("drap-line");
        /*
        * 鼠标开始拖动时触发
        * */
        drapLine.ondragstart = function (ev) {
            startPageX = ev.pageX;
        }
        /*
        * 鼠标拖动触发
        * */
        drapLine.ondrag = function (e) {
            if(e.stopPropagation()){
                e.stopPropagation();
            }else{
                e.cancelable = true;
            }
            var width = e.pageX<0?-e.pageX:e.pageX;
            console.log("当前坐标x：" + width + " 原坐标x1：" + startPageX)
            if(width != startPageX){
                if(width < 200){
                    width = 200;
                }else if(width > 310){
                    width = 310;
                }
                left.style.width = width + 'px';
                right.style.left = width + 'px';
            }
        }
    }

</script>