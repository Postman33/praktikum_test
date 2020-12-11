<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Alexander
  Date: 11.12.2020
  Time: 15:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <c:forEach var="mark" items="${marks}">

        ${mark.primaryKey.date}
        ${mark.primaryKey.clientid}
        ${mark.primaryKey.courseid}
        ${mark.primaryKey.mark}
        ${mark.primaryKey.header}


    </c:forEach>
</body>
</html>
