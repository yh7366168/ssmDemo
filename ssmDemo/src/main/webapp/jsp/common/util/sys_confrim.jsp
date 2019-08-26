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
        .bg_clz{
            display: none;
            position: absolute;
            top: 0%;
            left: 0%;
            width: 100%;
            height: 100%;
            background-color: black;
            z-index:1001;
            opacity:0.3;
        }
        /*显示层*/
        .window_info_clz{
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
            border-style: double;
        }
        .window_info_clz p{
            margin-top: 30px;
            width: 100%;
            text-align: center;
            font-size: 19px;
        }
        .confirm_info_button_div button{
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
        /**
         * 重写confirm方法,点击“确认”按钮触发指定方法
         * msg 页面提示信息；dataArr 参数数组；url cofirmYes触发方法
         * */
        function confrimUtil(msg, dataArr, url) {
            console.log(msg + " " + dataStr + " " + url)
            document.getElementById("bg").style.display = "block";
            document.getElementById("confirm_info").style.display = "block";
            if(msg != null || msg!=undefined){
                var p_msg = document.getElementById("confirm_message");
                p_msg.innerText = msg;
                $("#ajax_data_input").attr("value", dataArr);
                $("#ajax_url_input").attr("value", url);
            }
        }
        /**
         * 点击“确认”按钮，触发方法
         * */
        function confrimYes() {
            document.getElementById("bg").style.display = "none";
            document.getElementById("confirm_info").style.display = "none";
            var dataArr = $("#ajax_data_input").val();
            var url = $("#ajax_url_input").val();
            $.ajax({
                type:"POST",
                url:"${pageContext.request.contextPath}" + url,
                data:dataArr,
                async:false,
                dataType:"text",
                success:function (result) {
                    $("#right").html(result);
                },
                error:function (result) {
                    console.log("confrimYes-error");
                }
            });
        }
        function confrimCancal() {
            document.getElementById("bg").style.display = "none";
            document.getElementById("confirm_info").style.display = "none";
        }

        /*重写alert方法*/
        function alertUtil(msg) {
            document.getElementById("bg").style.display = "block";
            document.getElementById("alert_info").style.display = "block";
            if(msg!=null || msg!=undefined){
                var p_alert_message = document.getElementById("alert_message");
                p_alert_message.innerText = msg;
            }
        }
        function alertYes() {
            document.getElementById("bg").style.display = "none";
            document.getElementById("alert_info").style.display = "none";
        }
        function alertCancal() {
            document.getElementById("bg").style.display = "none";
            document.getElementById("alert_info").style.display = "none";
        }

        /*重写prompt方法*/
        function promptUtil(msg) {
            document.getElementById("bg").style.display = "block";
            document.getElementById("prompt_info").style.display = "block";
            if(msg!=null || msg!=undefined){
                var prompt_div = document.getElementById("prompt_message_div");
                prompt_div.innerText = msg;
            }
        }
        function promptYes() {
            document.getElementById("bg").style.display = "none";
            document.getElementById("prompt_info").style.display = "none";
        }
        function promptCancal() {
            document.getElementById("bg").style.display = "none";
            document.getElementById("prompt_info").style.display = "none";
        }
    </script>
</head>
<body>
<!-- 遮幕1 -->
<div id="bg" class="bg_clz" style=""></div>
<!-- 弹出窗口:confrim 确认框-->
<div id="confirm_info" class="window_info_clz">
    <div style="width: 100%;height: 20px;margin: 0;padding: 0;background-color: #c7c7c7;">
        <span>操作提示：</span>
        <img class="closeImg" src="${pageContext.request.contextPath}/img/unchecked.png" onclick="confrimCancal()">
    </div>
    <p id="confirm_message">是否确认？</p>
    <div class="confirm_info_button_div">
        <button onclick="confrimYes()">确认</button>
        <button onclick="confrimCancal()" style="margin-left: 35px">取消</button>
    </div>
    <div style="display: none">
        <!-- ajax传参 -->
        <input id="ajax_data_input" type="text" value="">
        <!-- ajax路由 -->
        <input id="ajax_url_input" type="text" value="">
    </div>
</div>

<!-- 弹出窗口:alert 提示框-->
<div id="alert_info" class="window_info_clz">
    <div style="width: 100%;height: 20px;margin: 0;padding: 0;background-color: #c7c7c7;">
        <span>操作提示：</span>
        <img class="closeImg" src="${pageContext.request.contextPath}/img/unchecked.png" onclick="alertCancal()">
    </div>
    <p id="alert_message">是否确认？</p>
    <div class="confirm_info_button_div" style="margin-left: 38%">
       <button onclick="alertYes()" style="margin-left: 0">确认</button>
    </div>
</div>

<!-- 弹出窗口:prompt 输入框-->
<div id="prompt_info" class="window_info_clz">
    <div style="width: 100%;height: 20px;margin: 0;padding: 0;background-color: #c7c7c7;">
        <span>操作提示：</span>
        <img class="closeImg" src="${pageContext.request.contextPath}/img/unchecked.png" onclick="promptCancal()">
    </div>
    <div style="width: 100%;margin: 0;padding: 0;margin-top: 10%">
        <div id="prompt_message_div">请输入：</div>
        <input type="text" id="prompt_message" value="" style="width: 100%;height: 24px;">
    </div>
    <div class="confirm_info_button_div">
        <button onclick="promptYes()">确认</button>
        <button onclick="promptCancal()" style="margin-left: 35px">取消</button>
    </div>
</div>

</body>
</html>
