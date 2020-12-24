<%--
  Created by IntelliJ IDEA.
  User: Alexander
  Date: 08.12.2020
  Time: 19:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Alexander
  Date: 06.12.2020
  Time: 0:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Учителя</title>
</head>
<body>

<div class="container" >
    <h1 style="text-align: center;">Учителя</h1>
    <label for="value">Введите ФИО учителя:</label>
    <input  id='value' type="text" value=""/>
</div>

<div class="container" style="margin-top: 50px; max-height: 500px; overflow: scroll;">
    <table  class="table table-striped table-bordered" >
        <thead>
        <tr class="header">
            <th>ФИО</th>
            <th>Дата рождения</th>
            <th>Операции</th>
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
                    <button type="button" class="btn btn-info" style="font-size: 16px; color: white !important;" onclick="window.location.href='${updateButton}'">Обновить</button>
                    <button type="button" class="btn btn-danger" style="font-size: 16px;" onclick="
                            const f=confirm('Вы действительно хотите удалить преподавателя?')
                            if(f)
                            window.location.href = '${deleteButton}'">Удалить</button>
                </th>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>
    <button class="button-green" type="submit" onclick="window.location.href='/addTeacher'">Добавить</button>
</div>

</body>
<script type="text/javascript">
    <%@include file="/resources/scripts/script.js"%>
</script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link rel="stylesheet" href="<c:url value="/resources/styles/MainStyles.css"/>" type="text/css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-ygbV9kiqUc6oa4msXn9868pTtWMgiQaeYH7/t7LECLbyPA2x65Kgf80OJFdroafW" crossorigin="anonymous"></script>
</html>
