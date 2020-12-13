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
<div class="container" style="margin-top: 50px; max-height: 500px; overflow: scroll;">
    <h1>Clients</h1>
    <h2>Введите ФИО клиента:</h2>
    <input  id='value' type="text" value=""/>
    <input id='search' type="button" value="Найти" style="margin-left:5%">
    <input id='showAll' type="button" value="Показать всех" style="margin-left:5%">
    <p>Contextual classes can be used to color table rows or table cells. The classes that can be used are: .active, .success, .info, .warning, and .danger.</p>
    <table  class="table table-striped table-bordered">
        <thead>
        <tr>
            <th>FIO</th>
            <th>Header</th>
            <th>Operations</th>
        </tr>

        </thead>
        <tbody>



        <c:forEach var="mark" items="${marks}">
            <c:url var="updateMarkWithoutNewRow" value="/updateMark">
                <c:param name="courseid" value="${mark.primaryKey.courseid}"/>
                <c:param name="clientid" value="${mark.primaryKey.clientid}"/>
                <c:param name="update" value="${false}"/>
            </c:url>

            <c:url var="updateMarkWithNewRow" value="/updateMark">
                <c:param name="courseid" value="${mark.primaryKey.courseid}"/>
                <c:param name="clientid" value="${mark.primaryKey.clientid}"/>
                <c:param name="update" value="${true}"/>
            </c:url>

            <tr class="elements">
                <td>${mark.primaryKey.header}</td>
                <td>${mark.primaryKey.mark}</td>
                <th><%--<input type="button" value="Edit" onclick="window.location.href='${updateButton}'">--%>
                    <button type="button" class="btn btn-info" style="font-size: 16px; color: white !important;" onclick="window.location.href='${updateButton}'">Update</button>
                    <button type="button" class="btn btn-danger" style="font-size: 16px;" onclick="window.location.href='${deleteButton}'">Delete</button>
                </th>
            </tr>
        </c:forEach>

        <tr class="elements">
            <td>${mark.primaryKey.header}</td>
            <td>${mark.primaryKey.mark}</td>
            <th><%--<input type="button" value="Edit" onclick="window.location.href='${updateButton}'">--%>
                <button type="button" class="btn btn-info" style="font-size: 16px; color: white !important;" onclick="window.location.href='${updateButton}'">Update</button>
                <button type="button" class="btn btn-danger" style="font-size: 16px;" onclick="window.location.href='${deleteButton}'">Delete</button>
            </th>
        </tr>


        </tbody>
    </table>
</div>
<div>

    <div class="form-group container" style="margin-top: 30px;">
        <table class="table table-striped table-bordered">
            <thead>
            <tr>
                <th>Header</th>
                <th>Date</th>
                <th>Operations</th>
            </tr>
            </thead>
        <tbody>
        <tr class="elements">
            <td>00</td>
            <td>0</td>
            <th><%--<input type="button" value="Edit" onclick="window.location.href='${updateButton}'">--%>
                <button type="button" class="btn btn-info" style="font-size: 16px; color: white !important;" onclick="window.location.href='${updateButton}'">+</button>

            </th>
        </tr>


        </tbody>
        </table>
    </div>

<%--    <div class="form-group">--%>
<%--        <input class="btn btn-info" type="submit" value="OK">--%>
<%--    </div>--%>
    <button class="btn btn-info btn-block text-light btn-mt-5" style="margin-left:15%; font-size: 20px; width: 70%"  type="submit" onclick="">Save</button>
</div>

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
