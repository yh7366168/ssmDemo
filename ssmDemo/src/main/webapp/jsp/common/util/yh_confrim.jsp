<%--
  Created by IntelliJ IDEA.
  User: T430487
  Date: 2019/7/1
  Time: 11:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
    <title>确认弹框</title>
    <link rel="shortcut icon" href="#"/>
    <style type="text/css">
        /*遮幕层*/
        #confirm_bg{
            display: none;
            position: absolute;
            top: 0%;
            left: 0%;
            width: 100%;
            height: 100%;
            background-color: black;
            z-index:1001;
            -moz-opacity: 0.7;
            opacity:.70;
            filter: alpha(opacity=70);
        }
        /*显示层*/
        #confirm_info{
            display: none;
            position: absolute;
            top: 28%;
            left: 36%;
            width: 19%;
            height: 19%;
            padding: 0;
            border: 8px solid #E8E9F7;
            background-color: white;
            z-index:1002;
            overflow: auto;
        }
        #confirm_info p{
            margin-top: 30px;
            width: 100%;
            text-align: center;
            font-size: 19px;
        }
        #confirm_info button{
            width: 60px;
            height: 28px;
        }
        .confirm_info_button_div{
            margin-top: 10%;
            margin-left: 22%;
        }

        .closeImg{
            height: 15px;
            width: 15px;
            margin-top: 2px;
            margin-right: 1px;
            float: right;
            cursor: pointer;
        }
    </style>
    
    <script src="${pageContext.request.contextPath}/lib/jquery-3.4.1.min.js"></script>
    <script type="text/javascript">
        var confrim_yes_url;
        /*重写confrim方法*/
        function confrimUtil(msg) {
            document.getElementById("confirm_bg").style.display = "block";
            document.getElementById("confirm_info").style.display = "block";
            if(msg != null || msg!=undefined){
                var p_msg = document.getElementById("confirm_info_msg");
                p_msg.innerText = msg;
            }
        }
        function confrimYes() {
            document.getElementById("confirm_bg").style.display = "none";
            document.getElementById("confirm_info").style.display = "none";
        }
        function confrimCancal() {
            document.getElementById("confirm_bg").style.display = "none";
            document.getElementById("confirm_info").style.display = "none";
        }

    </script>
</head>
<body>
<!-- 遮幕1 -->
<div id="confirm_bg"></div>
<!-- 弹出窗口:confrim -->
<div id="confirm_info" class="" style="border-style: double">
    <div style="width: 100%;height: 20px;margin: 0;padding: 0;background-color: #c7c7c7;">
        <span>操作提示：</span>
        <img class="closeImg" src="${pageContext.request.contextPath}/img/unchecked.png" onclick="confrimCancal()">
    </div>
    <p id="confirm_info_msg">是否确认？</p>
    <div class="confirm_info_button_div">
        <button onclick="confrimYes('123')">确认</button>
        <button onclick="confrimCancal()" style="margin-left: 35px">取消</button>
    </div>
</div>

</body>
</html>
