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
    <table id="tab_ser" class="table table-striped table-bordered">
        <thead>
        <tr>
            <th>Header</th>
            <th>Mark</th>
            <th>Date</th>
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
                <td>${mark.primaryKey.date}</td>
                <th><%--<input type="button" value="Edit" onclick="window.location.href='${updateButton}'">--%>
                    <button type="button" class="btn btn-info" style="font-size: 16px; color: white !important;" onclick="window.location.href='${updateButton}'">Update</button>
                    <button type="button" class="btn btn-danger" style="font-size: 16px;" onclick="window.location.href='${deleteButton}'">Delete</button>
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
            <td><input name="mark.primarykey[1].header" type="text"></td>
            <td><input type="number"></td>
            <td><input type="date"></td>
            <th><%--<input type="button" value="Edit" onclick="window.location.href='${updateButton}'">--%>
                <button id='add_but' type="button" class="btn btn-info" style="font-size: 16px; color: white !important;">+</button>

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
    const tab_elements=document.querySelectorAll('input')
    const table_ser=document.getElementById('tab_ser')
    const add_but=document.getElementById('add_but')
    console.dir(tab_elements)
    console.dir(table_ser)
    add_but.onclick=()=>{
        add(tab_elements,table_ser)
    }

    but.onclick=()=>{

    }
    function add(tab_elements,table_ser){
        const rowCount = table_ser.rows.length;

        var element1 = document.createElement("input");
        element1.value=tab_elements[3].value
        element1.name='marks['+rowCount+'].header'
        element1.type='text'



        var element2 = document.createElement("input");
        element2.name='marks['+rowCount+'].mark'
        element2.value=tab_elements[4].value
        element2.type='number'

        var element3 = document.createElement("input");
        element3.name='marks['+rowCount+'].date'
        element3.value=tab_elements[5].value
        element3.type='date'


        var element4 = document.createElement("input");
        element4.value= ${c}
            element4.name='marks['+rowCount+'].clientdid'
        element4.type='hidden'

        var element5 = document.createElement("input");
        element5.value=${courseid}
            element5.name='marks['+rowCount+'].courseid'
        element5.type='hidden'


        var del_but = document.createElement("button");
        del_but.onclick=()=>{
            del_but.parentElement.closest('tr').remove()
        }
        del_but.type = "button";
        del_but.textContent='Delete'


        var row = table_ser.insertRow(rowCount);
        var cell1 = row.insertCell(0);
        var cell2 = row.insertCell(1);
        var cell3 = row.insertCell(2);
        var cell4 = row.insertCell(3);

        cell1.appendChild(element1)
        cell1.appendChild(element4)
        cell1.appendChild(element5)
        cell2.appendChild(element2)
        cell3.appendChild(element3)
        cell4.appendChild(del_but)
    }
   // </%@include file="/WEB-INF/scripts/script_for_marks.js"%>
</script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-ygbV9kiqUc6oa4msXn9868pTtWMgiQaeYH7/t7LECLbyPA2x65Kgf80OJFdroafW" crossorigin="anonymous"></script>
</html>
