<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Alexander
  Date: 06.12.2020
  Time: 0:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html xmlns:th="http://www.thymeleaf.org">
<head>
    <title>Курс - ${course.name}</title>
</head>
<body>
<div class="container">
    <h1 style="text-align: center;">Курс ${course.name} - слушатели</h1>

    <c:url var="ToCourses" value="/getMarks">
    </c:url>

    <button type="button" class="btn btn-danger" style="font-size: 16px;"
            onclick="window.location.href='${ToCourses}'">Назад к курсам
    </button>

    <h2>Введите ФИО клиента:</h2>
    <input  id='value' type="text" value=""/>
    <input id='search' type="button" value="Найти" style="margin-left:5%">
    <input id='showAll' type="button" value="Показать всех" style="margin-left:5%">
    <p>Contextual classes can be used to color table rows or table cells. The classes that can be used are: .active, .success, .info, .warning, and .danger.</p>
</div>
    <div class="container" style="margin-top: 50px; max-height: 500px; overflow: scroll;">
    <table  class="table table-striped table-bordered">
        <thead>
        <tr>
            <th>FIO</th>
            <th>Birthday</th>
            <th>Operations</th>
        </tr>

        </thead>
        <tbody>

        <c:forEach var="client" items="${clients}">
            <c:url var="viewButton" value="/viewCourse">
                <c:param name="clientid" value="${client.id}"/>
                <c:param name="courseid" value="${courseid}"/>
            </c:url>
            <c:url var="deleteButton" value="/deleteClient">
                <c:param name="client_id" value="${client.id}"/>
            </c:url>
            <tr class="elements">
                <td>${client.name}</td>
                <td>${client.birthday}</td>
                <th>
                        <%--<input type="button" value="Edit" onclick="window.location.href='${updateButton}'">--%>
                    <button type="button" class="btn btn-info" style="font-size: 16px; color: white !important;" onclick="window.location.href='${viewButton}'">View marks</button>

                </th>
            </tr>
        </c:forEach>

        </tbody>
    </table>
</div>
<div>

</div>
<input type="button" value="Add" onclick="window.location.href='/addClient'" style="margin-left: 30%"/>
</body>
<script type="text/javascript">
    <%@include file="/WEB-INF/scripts/script.js"%>
</script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-ygbV9kiqUc6oa4msXn9868pTtWMgiQaeYH7/t7LECLbyPA2x65Kgf80OJFdroafW" crossorigin="anonymous"></script>
</html>
