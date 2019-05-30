<%--
  Created by IntelliJ IDEA.
  User: T430487
  Date: 2019/5/30
  Time: 11:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
    <link rel="shortcut icon" href="#"/>
</head>
<body>
<c:forEach items="${resultMapList}" var="entry" varStatus="vs">
    <div>
        <c:out value="${entry.key}"></c:out>
    </div>
    <div>
        <c:forEach items="${entry.value}" var="menu" varStatus="vs2">
            <div>
                <c:out value="${menu.menuName}"></c:out>
            </div>
        </c:forEach>
    </div>

</c:forEach>
</body>
</html>
