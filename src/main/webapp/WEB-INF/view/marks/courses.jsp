<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Alexander
  Date: 06.12.2020
  Time: 0:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<html xmlns:th="http://www.thymeleaf.org">
<head>
    <title>Title</title>
</head>
<body>
<%@include file="/resources/view_library/header.jsp"%>
<div class="container">
    <h1 style="text-align: center;">Оценки - курсы</h1>
    <label for="value">Введите название курса:</label>
    <input id='value' type="text" value=""/>
</div>
<div class="container">
    <div class="container" style="margin-top: 10px; max-height: 500px; overflow: scroll;">
        <table class="table table-striped table-bordered">
            <thead>
            <tr class="header">
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
                <tr class="elements paint-row">
                    <td>${course.name}</td>
                    <td>${course.price}</td>
                    <th>
                            <%--<input type="button" value="Edit" onclick="window.location.href='${updateButton}'">--%>
                        <button type="button" class="btn btn-info" style="font-size: 16px; color: white !important;"
                                onclick="window.location.href='${viewButton}'">View marks
                        </button>
                        <button type="button" class="btn btn-primary" style="font-size: 16px; color: white !important;"
                                onclick="window.location.href='${viewReport}'">Reports
                        </button>

                    </th>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
    <div>

    </div>


</div>
<%--<input type="button" value="Add" onclick="window.location.href='/addCourse'" style="margin-left: 30%"/>--%>
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
