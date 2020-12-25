<%--
  Created by IntelliJ IDEA.
  User: Alexander
  Date: 08.12.2020
  Time: 19:06
  To change this template use File | Settings | File Templates.
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Alexander
  Date: 06.12.2020
  Time: 0:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>

<html>
<head>
    <title>Title</title>
</head>
<body>
<%@include file="/resources/view_library/header.jsp"%>
<div class="container" >
    <h1 style="text-align: center;">Учителя</h1>
    <label for="value">Введите ФИО учителя:</label>
    <input  id='value' type="text" value=""/>
</div>

<div class="container" style="margin-top: 10px; max-height: 500px; overflow: scroll;">
    <table  class="table table-striped table-bordered" >
        <thead>
        <tr class="header">
            <th>FIO</th>
            <th>Birthday</th>
            <th>Operations</th>
        </tr>

        </thead>
        <tbody>

        <c:forEach var="person" items="${teachers}">
            <c:url var="updateButton" value="/updateTeacher">
                <c:param name="teacher_id" value="${person.id}"/>
            </c:url>
            <c:url var="deleteButton" value="/deleteTeacher">
                <c:param name="teacher_id" value="${person.id}"/>
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
    <button class="button-green" type="submit" onclick="window.location.href='/addTeacher'">Add</button>
</div>

<%@include file="/resources/view_library/footer.jsp"%>

</body>
<script type="text/javascript">
    <%@include file="/resources/scripts/script.js"%>
</script>
<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet"/>
<link rel="stylesheet" href="<c:url value="/resources/styles/MainStyles.css"/>" type="text/css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-ygbV9kiqUc6oa4msXn9868pTtWMgiQaeYH7/t7LECLbyPA2x65Kgf80OJFdroafW" crossorigin="anonymous"></script>
</html>
