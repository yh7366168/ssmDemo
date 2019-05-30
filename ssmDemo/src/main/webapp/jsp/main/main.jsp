<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>系统主页面</title>
    <link rel="shortcut icon" href="#"/>
    <style>
        /*--------整体布局----------*/
        html, body {
            height: 100%;
            margin: 0;
            padding: 0;
        }

        body {
            position: relative;
        }

        .top {
            width: 100%;
            height: 88px;
            background-image: url(${pageContext.request.contextPath}/img/menu_top.png);
            background-size: cover;
            opacity: 0.7;
        }

        .leftDiv {
            position: absolute;
            top: 88px;
            right: 0;
            bottom: 0;
            left: 0;
            width: 240px;
        }

        .menuDiv {
            width: 97%;
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

        .rightDiv {
            position: absolute;
            top: 88px;
            right: 0;
            bottom: 0;
            left: 240px;
        }

        /*--------菜单树----------*/
        .menuDiv {
            background-color: white;
            width: 100%;
            height: 100%;
        }
        .menuDiv ul, li {
            /*消除ul和li前面的小圆点*/
            list-style: none;
            padding: 0px;
        }
        /*清楚子菜单的缩进*/
        menuDiv ul {
            margin: 0;
            padding: 0;
        }
        /*设置一级菜单的背景颜色*/
        .main > a {
            /*消除链接下面的下划线*/
            text-decoration: none;
            background-color: #c1d8c7;
            font-size: 18px;
            color: black;
            display: block;
            width: 200px;
            padding-top: 3px;
            margin-left: 20px;
            text-align: left;
        }

        /*二级菜单*/
        .menu a {
            text-decoration: none;
            background-color: white;
            margin-left: 40px;
            font-size: 16px;
            display: block;
            padding-top: 3px;
            width: 180px;
            text-align: left;
        }
    </style>
</head>

<body>
<!-- 顶部导航 -->
<div class="top">

</div>
<!-- 左侧菜单栏 -->
<div id="left" class="leftDiv">
    <div id="menu" class="menuDiv">
        <ul class="menu_tree">
            <c:forEach items="${resultMapList}" var="entry" varStatus="vs">
                <li class="main">
                    <a href="#"><c:out value="${entry.key}"></c:out></a>
                    <ul class="menu">
                        <c:forEach items="${entry.value}" var="menu" varStatus="vs2">
                            <li>
                                <a href="#"><c:out value="${menu.menuName}"></c:out></a>
                            </li>
                        </c:forEach>
                    </ul>
                </li>
            </c:forEach>
        </ul>
    </div>
    <!-- 菜单左边界 -->
    <div id="drap-line" draggable="true"></div>
</div>
<div id="right" class="rightDiv">

</div>

</body>
</html>
<script src="${pageContext.request.contextPath}/lib/jquery-3.4.1.min.js"></script>
<script>
    $(function () {
        /*------菜单树----*/
        $(".main > ul").slideUp(0);
        $(".main > a").click(function () {
            var thisNode = $(this).next("ul");
            //先关闭所有的
            $(".main > ul").slideUp(1);
            //再打开
            thisNode.slideDown();
        });
    });

    var startPageX = 0;
    var endPageX = 0;
    var left = document.getElementById("left");
    var right = document.getElementById("right");
    var drapLine = document.getElementById("drap-line");
    window.onload = function () {
        /*
        * 鼠标开始拖动时触发
        * */
        drapLine.ondragstart = function (e) {
            startPageX = e.pageX;
        }
        /*
        * 鼠标拖动后触发
        * */
        drapLine.ondragend = function (e) {
            endPageX = e.pageX;
            if (endPageX != startPageX) {
                if (endPageX < 200) {
                    endPageX = 200;
                } else if (endPageX > 310) {
                    endPageX = 310;
                }
                left.style.width = endPageX + 'px';
                right.style.left = endPageX + 'px';
            }
        }


        // drapLine.ondrag = function (e) {
        //     if(e.stopPropagation()){
        //         e.stopPropagation();
        //     }else{
        //         e.cancelable = true;
        //     }
        //     var width = e.pageX<0?-e.pageX:e.pageX;
        //     console.log("当前鼠标坐标x：" + e.pageX + " 原鼠标坐标x1：" + startPageX + " width:" + width)
        //     if(width != startPageX){
        //         if(width < 200){
        //             width = 200;
        //         }else if(width > 310){
        //             width = 310;
        //         }
        //         left.style.width = width + 'px';
        //         right.style.left = width + 'px';
        //     }
        // }
    }
</script>
