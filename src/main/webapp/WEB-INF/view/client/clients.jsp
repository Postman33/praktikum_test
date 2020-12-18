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
    <title>Клиенты</title>
</head>
<body>
<div class="container" >
    <h1 style="text-align: center;">Клиенты</h1>
    <label for="value">Введите ФИО клиента:</label>
    <input  id='value' type="text" value=""/>
</div>
    <div class="container" style="margin-top: 10px; max-height: 500px; overflow: scroll;">
       <table  class="table table-striped table-bordered">
        <thead>
        <tr class="header">
            <th>FIO</th>
            <th>Birthday</th>
            <th>Operations</th>
        </tr>

        </thead>
        <tbody>

        <c:forEach var="person" items="${clients}">
            <c:url var="updateButton" value="/updateClient">
                <c:param name="client_id" value="${person.id}"/>
            </c:url>
            <c:url var="deleteButton" value="/deleteClient">
                <c:param name="client_id" value="${person.id}"/>
            </c:url>
            <tr class="elements paint-row">
                <td>${person.name}</td>
                <td>${person.birthday}</td>
                <th>
                    <%--<input type="button" value="Edit" onclick="window.location.href='${updateButton}'">--%>
                        <button type="button" class="btn btn-info" style="font-size: 16px; color: white !important;" onclick="window.location.href='${updateButton}'">Update</button>
                    <button type="button" class="btn btn-danger" style="font-size: 16px;" onclick="window.location.href='${deleteButton}'">Delete</button>
                </th>
            </tr>
        </c:forEach>

        </tbody>
    </table>
</div>
<div>
    <button class="button-green"  type="submit" onclick="window.location.href='/addClient'">Add</button>

</div>

</body>
<script type="text/javascript">
    <%@include file="/resources/scripts/script.js"%>
</script>
<link rel="stylesheet" href="<c:url value="/resources/styles/MainStyles.css"/>" type="text/css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-ygbV9kiqUc6oa4msXn9868pTtWMgiQaeYH7/t7LECLbyPA2x65Kgf80OJFdroafW" crossorigin="anonymous"></script>
</html>
