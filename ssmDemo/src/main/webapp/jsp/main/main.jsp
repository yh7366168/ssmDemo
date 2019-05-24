<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>系统主页面</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="shortcut icon" href="#"/>
    <style>
        /* css样式不建议使用id选择器，此处为方便暂时使用, 请见谅 */
        * {
            margin: 0;padding: 0;
        }
        html,body {
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
        <%--<iframe width="100%" height="100%" frameborder="0" src="${pageContext.request.contextPath}/jsp/main/mian_left_menu.jsp"></iframe>
        --%>
        <a href="#" onclick="reloadJsp('a')">页面1</a><br/>
        <a href="#" onclick="reloadJsp('b')">页面2</a>
    </div>
    <!-- 菜单左边界 -->
    <div id="drap-line"></div>
</div>
<div id="right">
    <iframe id="main_iframe" width="100%" height="100%" src="${pageContext.request.contextPath}/jsp/main/c.jsp"></iframe>
</div>

<script src="${pageContext.request.contextPath}/lib/jquery-3.4.1.min.js"></script>
<script>
    //获取dom函数
    function $(id) {
        return document.getElementById(id)
    }

    //设置最大/最小宽度
    var max_width = 400,
        min_width = 200;

    //获取dom
    var	drapLine = $('drap-line'),
        left = $('left'),
        right = $('right');

    //记录鼠标相对left盒子x轴位置
    var mouse_x = 0;

    //鼠标移动事件
    function mouseMove(e) {
        var e = e || window.event;
        var left_width = e.clientX - mouse_x;
        left_width = left_width < min_width ? min_width : left_width;
        left_width = left_width > max_width ? max_width : left_width;
        left.style.width = left_width + 'px';
        right.style.left = left_width + 'px';
    }
    //终止事件
    function mouseUp() {
        document.onmousemove = null;
        document.onmouseup = null;
        //localStorage设置
        localStorage.setItem('sliderWidth', left.style.width)
    }

    window.onload = function () {
        //localStorage读取
        var history_width = localStorage.getItem('sliderWidth');
        if (history_width) {
            left.style.width = history_width;
            right.style.left = history_width;
        }
        //绑定鼠标按下事件
        drapLine.onmousedown = function (e) {
            var e = e || window.event;
            //阻止默认事件
            e.preventDefault();
            mouse_x = e.clientX - left.offsetWidth;
            document.onmousemove = mouseMove;
            document.onmouseup = mouseUp;
        }
    }

    $(function () {

        function reloadJsp(url) {
            var newUrl;
            if(url == "a"){
                $("#main_iframe").attr("src","${pageContext.request.contextPath}/jsp/main/a.jsp");
            }else if(url == "b"){
                $("#main_iframe").attr("src","${pageContext.request.contextPath}/jsp/main/b.jsp");
            }else{
                alert("error!" + url );
            }

        }
    });

</script>
</body>

</html>
