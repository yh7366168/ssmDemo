<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <%--<meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">--%>
    <title>系统主页面</title>
    <link rel="shortcut icon" href="#"/>
    <style>
        /* css样式不建议使用id选择器，此处为方便暂时使用, 请见谅 */
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
            width: 220px;
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
            background-color: #999;
            cursor: e-resize;
        }

        #right {
            position: absolute;
            top: 88px;
            right: 0;
            bottom: 0;
            left: 220px;
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

    /*
     * 菜单拉伸效果：
     * 1、鼠标在上面改变鼠标形状
     * 2、按下鼠标触发事件
     * 3、鼠标移动改变菜单窗口大小
     * 4、鼠标松开触发事件
     * */
    var max_width = 500;
    var min_width = 200;
    var move_x = 0;
    var left = document.getElementById("left");
    var right = document.getElementById("right");
    var drapLine = document.getElementById("drap-line");

    window.onload = function () {
        var isDown = false;
        /*鼠标按下时*/
        drapLine.onmousedown = function (e) {
            var e = e || window.event;
            isDown = true;
            //e.preventDefault();
            if(e.stopPropagation()){
                e.stopPropagation();
            }else{
                e.cancelable = true;
            }
            move_x = e.clientX - left.offsetWidth;
        }

        /*鼠标移动的时候*/
        document.onmousemove = function (e) {
            //阻止冒泡事件
            if(e.stopPropagation()){
                e.stopPropagation();
            }else{
                e.cancelable = true;
            }
            if(isDown){
                var e = e || window.event;
                var left_width = e.clientX - move_x;
                left_width = left_width < min_width ? min_width : left_width;
                left_width = left_width > max_width ? max_width : left_width;
                left.style.width = left_width + 'px';
                right.style.left = left_width + 'px';
            }
        }

        /*鼠标松开时*/
        document.onmouseup = function () {

            isDown = false;
        }

        return false;
    }

</script>
