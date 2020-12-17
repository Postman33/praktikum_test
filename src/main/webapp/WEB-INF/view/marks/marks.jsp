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
<div class="container">
    <h1 style="text-align: center;">Оценки за курс <i>${course.name}</i> клиента <i>${client.name}</i> </h1>
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
    <table id="tab_ser" class="table table-striped table-bordered">
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
                <td><input min="0" max="100" name="marks[${i.index}].mark" type="number" value="${mark.mark}" onchange="">

                </td>
                <td><input name="marks[${i.index}].date" type="date" value="${mark.date}">
                    <input type="hidden" name="marks[${i.index}].courseid" value="${mark.courseid}">
                    <input type="hidden" name="marks[${i.index}].clientid" value="${mark.clientid}">
                    <input type="hidden" name="marks[${i.index}].id" value="${mark.id}">
                </td>
                <th>
                    <button type="submit" name="action" value="delete ${mark.id}" class="btn btn-danger" style="font-size: 16px;" >-
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
                <th>Header</th>
                <th>Mark</th>
                <th>Date</th>
                <th>Operations</th>
            </tr>
            </thead>
            <tbody>
            <tr id="tab_ele" class="elements">
                <td><input name="Header_" type="text" value="Работа"></td>
                <td><input name="Mark_" min="0" max="100" type="number" value="0"> <c:if test="${mark_errors==1}">Оценка от 0 до 100!</c:if></td>
                <td><input name="Date_"  type="date" value="2020-12-12">
                    <input type="hidden" name="courseid_" value="${course.id}">
                    <input type="hidden" name="clientid_" value="${client.id}">
                </td>

                <th><%--<input type="button" value="Edit" onclick="window.location.href='${updateButton}'">--%>
                    <button id='add_but' class="btn btn-info"  name="action" value="addnew"  type="submit"
                            style="font-size: 16px; color: white !important;">+
                    </button>

                </th>
            </tr>


            </tbody>
        </table>
    </div>


    <button class="btn btn-info btn-block text-light btn-mt-5" style="margin-left:15%; font-size: 20px; width: 70%"
         name="action" value="no"   type="submit" onclick="">Save
    </button>
    </form:form>

    <%--    <div class="form-group">--%>
    <%--        <input class="btn btn-info" type="submit" value="OK">--%>
    <%--    </div>--%>

</div>

</body>
<script type="text/javascript">
    const tab_elements = document.querySelector('#tab_ele input')
    const table_ser = document.getElementById('tab_ser')
    const add_but = document.getElementById('add_but')
    console.dir(tab_elements)
    console.dir(table_ser)
    // add_but.onclick = () => {
    //     add(tab_elements, table_ser)
    // }

    function add(tab_elements, table_ser) {
        const rowCount = table_ser.rows.length-1;
        var element1 = document.createElement("input");
        element1.value = document.getElementById("header_").value
        element1.name = 'marks[' + rowCount + '].header'
        element1.type = 'text'
        var element2 = document.createElement("input");
        element2.name = 'marks[' + rowCount + '].mark'
        element2.value = document.getElementById("mark_").value
        element2.type = 'number'
        var element3 = document.createElement("input");
        element3.name = 'marks[' + rowCount + '].date'
        element3.value = document.getElementById("date_").value
        element3.type = 'date'
        var element4 = document.createElement("input");
        element4.value = ${client.id}
            element4.name = 'marks[' + rowCount + '].clientid'
        element4.type = 'hidden'

        var element5 = document.createElement("input");
        element5.value = ${course.id}
        element5.name = 'marks[' + rowCount + '].courseid'

        element5.type = 'hidden'

        // var element6 = document.createElement("input");
        // element6.value = 0
        // element6.name = 'marks[' + rowCount + '].id'
        // element6.type = 'hidden'

        var del_but = document.createElement("button");
        del_but.onclick = () => {
            del_but.parentElement.closest('tr').remove()
        }
        del_but.type = "button";
        del_but.textContent = 'Delete'
        var row = table_ser.insertRow(rowCount+1);
        var cell1 = row.insertCell(0);
        var cell2 = row.insertCell(1);
        var cell3 = row.insertCell(2);
        var cell4 = row.insertCell(3);
        cell1.appendChild(element1)

        cell2.appendChild(element2)
        cell3.appendChild(element3)
        cell3.appendChild(element4)
        cell3.appendChild(element5)
       // cell3.appendChild(element6)
        cell4.appendChild(del_but)
    }


</script>
<%-- <%@include file="/WEB-INF/scripts/script_for_marks.js"%>--%>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet"
      integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ygbV9kiqUc6oa4msXn9868pTtWMgiQaeYH7/t7LECLbyPA2x65Kgf80OJFdroafW"
        crossorigin="anonymous"></script>
<link rel="stylesheet" href="<c:url value="/resources/styles/main.css"/>" type="text/css">
</html>
