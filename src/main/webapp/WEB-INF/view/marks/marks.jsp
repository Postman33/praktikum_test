<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
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
    <title>Оценки ${client.name}</title>
</head>
<body>
<div class="container" >
    <h1 style="text-align: center;" >Оценки за курс {${course.name}} клиента {${client.name}} </h1>
    <c:url var="ToCourse" value="/viewCourse">
        <c:param name="courseid" value="${course.id}"/>
    </c:url>

    <button type="button" class="btn btn-danger" style="font-size: 16px;"
            onclick="window.location.href='${ToCourse}'">Назад к курсу
    </button>
</div>
    <%--    <h2>Введите ФИО клиента:</h2>--%>
    <%--    <input  id='value' type="text" value=""/>--%>
    <%--    <input id='search' type="button" value="Найти" style="margin-left:5%">--%>
    <%--    <input id='showAll' type="button" value="Показать всех" style="margin-left:5%">--%>
    <%--    <p>Contextual classes can be used to color table rows or table cells. The classes that can be used are: .active, .success, .info, .warning, and .danger.</p>--%>
    <div class="container" style="margin-top: 50px; max-height: 500px; overflow: scroll;">
    <table class="table table-striped table-bordered">
        <thead>
        <tr>
            <th>Заголовок</th>
            <th>Оценка /100</th>
            <th>Дата</th>
            <th>Операции</th>
        </tr>
        </thead>
        <tbody>

        <form:form modelAttribute="marks" method="post" action="/updateMark">
        <c:forEach var="mark" items="${marks.marks}" varStatus="i">
            <%--            <c:url var="updateMarkWithoutNewRow" value="/updateMark">--%>
            <%--                <c:param name="courseid" value="${mark.courseid}"/>--%>
            <%--                <c:param name="clientid" value="${mark.clientid}"/>--%>
            <%--                <c:param name="update" value="${false}"/>--%>
            <%--            </c:url>--%>



            <tr class="elements">
                <td><input name="marks[${i.index}].header" type="text" value="${mark.header}"></td>
                <td><input min="0" max="100"  name="marks[${i.index}].mark" type="number" value="${mark.mark}"></td>
                <td><input name="marks[${i.index}].date" type="date" value="${mark.date}">
                    <input type="hidden" name="marks[${i.index}].courseid" value="${mark.courseid}">
                    <input type="hidden" name="marks[${i.index}].clientid" value="${mark.clientid}">
                    <input type="hidden" name="marks[${i.index}].id" value="${mark.id}">
                </td>
                <th>
                    <button type="button" class="btn btn-danger" style="font-size: 16px;"
                            onclick="window.location.href=''">-
                    </button>
                </th>
            </tr>
        </c:forEach>

        </tbody>
    </table>
</div>
<div>

    <div class="form-group container" style="margin-top: 30px;">
        <table class="table table-striped table-bordered">
            <thead>
            <tr>
                <th>Заголовок</th>
                <th>Оценка 0/100</th>
                <th>Дата</th>
                <th>Операции</th>
            </tr>
            </thead>
            <tbody>
            <tr class="elements">
                <td><input name="mark.primarykey[1].header" type="text"></td>
                <td><input  min="0" max="100" name="mark.primarykey[1].mark" type="number"></td>
                <td><input name="mark.primarykey[1].date" type="date"></td>
                <th>
                    <button type="button" class="btn btn-info" style="font-size: 16px; color: white !important;">+
                    </button>
                </th>
            </tr>
            </tbody>
        </table>
    </div>
    <button class="btn btn-info btn-block text-light btn-mt-5" style="margin-left:15%; font-size: 20px; width: 70%"
            type="submit" onclick="">Save
    </button>
    </form:form>

    <%--    <div class="form-group">--%>
    <%--        <input class="btn btn-info" type="submit" value="OK">--%>
    <%--    </div>--%>

</div>

</body>
<script type="text/javascript">
    <%@include file="/WEB-INF/scripts/script.js"%>
</script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet"
      integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ygbV9kiqUc6oa4msXn9868pTtWMgiQaeYH7/t7LECLbyPA2x65Kgf80OJFdroafW"
        crossorigin="anonymous"></script>
</html>
