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
    <h2>Courses</h2>
    <input type="text" value="Add"/>
    <p>Contextual classes can be used to color table rows or table cells. The classes that can be used are: .active, .success, .info, .warning, and .danger.</p>
    <div class="container" style="margin-top: 50px; max-height: 500px; overflow: scroll;">
        <table  class="table table-striped table-bordered">
            <thead>
            <tr>
                <th>CourseName</th>
                <th>Price</th>
                <th>Operations</th>
            </tr>

            </thead>
            <tbody>

            <c:forEach var="course" items="${courses}">
                <c:url var="viewButton" value="/viewCourse">
                    <c:param name="courseid" value="${course.id}"/>
                </c:url>
                <c:url var="deleteButton" value="/deleteCourse">
                    <c:param name="courseid" value="${course.id}"/>
                </c:url>
                <c:url var="viewReport" value="/viewCourseReport">
                    <c:param name="courseid" value="${course.id}"/>
                </c:url>
                <tr>
                    <td>${course.name}</td>
                    <td>${course.price}</td>
                    <th>

                            <%--<input type="button" value="Edit" onclick="window.location.href='${updateButton}'">--%>
                        <button type="button" class="btn btn-info" style="font-size: 16px; color: white !important;" onclick="window.location.href='${viewButton}'">View marks</button>
                        <button type="button" class="btn btn-primary" style="font-size: 16px; color: white !important;" onclick="window.location.href='${viewReport}'">Reports</button>

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
    </div>
    <div>

    </div>
    <button class="btn btn-info btn-block text-light button-bottom-crud"   type="submit" onclick="window.location.href='/addCourse'">Add</button>

</div>
<%--<input type="button" value="Add" onclick="window.location.href='/addCourse'" style="margin-left: 30%"/>--%>
</body>
<link rel="stylesheet" href="<c:url value="/resources/styles/main.css"/>" type="text/css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-ygbV9kiqUc6oa4msXn9868pTtWMgiQaeYH7/t7LECLbyPA2x65Kgf80OJFdroafW" crossorigin="anonymous"></script>
</html>
