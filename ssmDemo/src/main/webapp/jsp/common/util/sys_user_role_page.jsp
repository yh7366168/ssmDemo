<%--
  Created by IntelliJ IDEA.
  User: T430487
  Date: 2019/8/15
  Time: 16:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
    <link rel="shortcut icon" href="#"/>
</head>
<body>

</body>
</html>
<script src="${pageContext.request.contextPath}/lib/jquery-3.4.1.min.js"></script>
<script type="text/javascript">

    function userButtonRoleFun(curMenuId) {
        /**
         * 按钮：先隐藏，然后显示具有权限的按钮
         * */
        $(".add_button_clz").prop("disabled", true);
        $(".add_button_clz").css("opacity", "0.6");

        $(".update_button_clz").prop("disabled", true);
        $(".update_button_clz").css("opacity", "0.6");

        $(".delete_button_clz").prop("disabled", true);
        $(".delete_button_clz").css("opacity", "0.6");

        $(".check_button_clz").prop("disabled", true);
        $(".check_button_clz").css("opacity", "0.6");
        /**
         * 链接<a>:
         * */
        $(".delete_a_clz").prop("disabled", true);
        $(".delete_a_clz").css("pointer-events", "none");
        $(".delete_a_clz").css("opacity", "0.6");

        <c:forEach  items="${sessionScope.roleMenuListVO}" var="roleMenuVar">
        var buttonId = ${roleMenuVar.buttonId};
        var menuId = ${roleMenuVar.menuId};
        if (menuId == curMenuId) {
            if (buttonId == 1) {
                //能看到对应的页面就表面有对应的查询权限
            } else if (buttonId == 2) {
                $(".add_button_clz").prop("disabled", false);
                $(".add_button_clz").css("opacity", "1");
            } else if (buttonId == 3) {
                $(".update_button_clz").prop("disabled", false);
                $(".update_button_clz").css("opacity", "1");
            } else if (buttonId == 4) {
                $(".delete_button_clz").prop("disabled", false);
                $(".delete_button_clz").css("opacity", "1");

                $(".delete_a_clz").prop("disabled", false);
                $(".delete_a_clz").css("pointer-events", "auto");
                $(".delete_a_clz").css("opacity", "1");
            } else if (buttonId == 5) {
                $(".check_button_clz").prop("disabled", false);
                $(".check_button_clz").css("opacity", "1");
            } else {
                //其他按钮不扩展
            }
        }
        </c:forEach>
    }

</script>
