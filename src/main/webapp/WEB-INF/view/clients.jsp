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
    <title>Title</title>
</head>
<body>
<div class="container">
    <h2>Clients</h2>
    <input type="text" value="Add"/>
    <p>Contextual classes can be used to color table rows or table cells. The classes that can be used are: .active, .success, .info, .warning, and .danger.</p>
    <table  class="table">
        <thead>
        <tr>
            <th>FIO</th>
            <th>Birthday</th>
            <th>Operations</th>
        </tr>

        </thead>
        <tbody>
        ${2+3}
        <c:forEach var="person" items="${clients}">
            <c:url var="updateButton" value="/updateClient">
                <c:param name="client_id" value="${person.id}"/>
            </c:url>
            <c:url var="deleteButton" value="/deleteClient">
                <c:param name="client_id" value="${person.id}"/>
            </c:url>
            <tr>
                <td>${person.name}</td>
                <td>${person.birthday}</td>
                <th>


                    <%--<input type="button" value="Edit" onclick="window.location.href='${updateButton}'">--%>
                        <button type="button" class="btn btn-info" style="font-size: 16px; color: white !important;" onclick="window.location.href='${updateButton}'">Update</button>
                    <button type="button" class="btn btn-danger" style="font-size: 16px;" onclick="window.location.href='${deleteButton}'">Delete</button>
                </th>
            </tr>
        </c:forEach>
        <tr class="success">
            <td>Success</td>
            <td>Doe</td>
            <td>-</td>
        </tr>
        <tr class="danger">
            <td>Danger</td>
            <td>Moe</td>
            <td>-</td>

        </tr>
        <tr class="info">
            <td>Info</td>
            <td>Dooley</td>
            <td>-</td>
        </tr>
        <tr class="warning">
            <td>Warning</td>
            <td>Refs</td>
            <td>-</td>
        </tr>
        <tr class="active">
            <td>Active</td>
            <td>Activeson</td>
            <td>-</td>
        </tr>
        </tbody>
    </table>
    <button class="btn btn-info btn-block text-light" style="font-size: 20px;"  type="submit" onclick="window.location.href='/addClient'">Add</button>
    <input type="button" value="Add" onclick="window.location.href='/addClient'" style="margin-left: 30%"/>
</div>

</body>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-ygbV9kiqUc6oa4msXn9868pTtWMgiQaeYH7/t7LECLbyPA2x65Kgf80OJFdroafW" crossorigin="anonymous"></script>
</html>
