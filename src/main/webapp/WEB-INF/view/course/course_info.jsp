<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%--
  Created by IntelliJ IDEA.
  User: Alexander
  Date: 08.12.2020
  Time: 16:02
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html xmlns:th="http://www.thymeleaf.org">
<head>
    <title>Title</title>
</head>
<body>
<br>
<br>
<div class="container">
    <form:form modelAttribute="course_info" action="/saveCourse" method="post">
    <div class="row">
        <div class="col-md-12 col-md-offset-3 center">
            <h1 style="text-align: center;">Курс</h1>


                <input type="hidden" name="exists" value="${exists}">
                <form:hidden path="id"/>




                <div class="form-group">
                    <label for="inputName" class="control-label">Название курса</label>

                    <form:input path="name" type="text" class="form-control" id="inputName" placeholder="Название курса" />
                </div>
       <%--         <div class="form-group has-feedback">--%>
<%--                    <label for="inputTwitter" class="control-label">Twitter</label>--%>
<%--                    <div class="input-group">--%>
<%--                        <span class="input-group-addon">@</span>--%>
<%--                        <input type="text" pattern="^[_A-z0-9]{1,}$" maxlength="15" class="form-control" id="inputTwitter" placeholder="bootstraptema" required>--%>
<%--                    </div>--%>
<%--                    <span class="glyphicon form-control-feedback" aria-hidden="true"></span>--%>
<%--                    <span class="help-block with-errors">Введите ник твиттера</span>--%>

                <div class="form-group">
                    <label for="desc" class="control-label">Описание курса</label>
                    <form:input path="description" type="text" class="form-control" id="desc" placeholder="Введите писание курса"  />
                    <div class="help-block with-errors"></div>
                </div>


                <div class="form-group">
                    <label for="dateBirthday" class="control-label">Цена курса, руб</label>
                    <form:input path="price" type="number" class="form-control" id="dateBirthday" placeholder="0"  />
                    <div class="help-block with-errors"></div>
                </div>
        </div>

    </div>
    <div class="row">

                        <div class="col-md-8 col-md-offset-3 center" style="margin-top: 350px;">
                            <div class="container" >
                                <h1 style="text-align: center;">Клиенты</h1>
                                <label for="value">Введите ФИО клиента:</label>
                                <input  id='value' type="text" value=""/>
                            </div>
                            <div class="container" style="margin-top: 50px; max-height: 500px; overflow: scroll;">
                        <table id="super-table"  class="table table-striped table-bordered">
                            <thead>
                            <tr>
                                <th>FIO</th>
                                <th>Birthday</th>
                                <th>Operations</th>
                            </tr>

                            </thead>
                            <tbody>

                            <c:forEach var="person" items="${course_info.clients}">
                                <c:url var="updateButton" value="/updateClient">
                                    <c:param name="client_id" value="${person.id}"/>
                                </c:url>
                                <c:url var="deleteButton" value="/deleteClient">
                                    <c:param name="client_id" value="${person.id}"/>
                                </c:url>
                                <tr class="elements">
                                    <td><%--<input id='hidden_id'  type='hidden' value="${person.id}" name="id2"> --%>${person.name}</td>
                                    <td>${person.birthday}
                                    <input type="hidden" name="id2" value="${person.id}"> </td>
                                    <th>
                                            <%--<input type="button" value="Edit" onclick="window.location.href='${updateButton}'">--%>
                                        <button type="button" class="btn btn-danger" style="font-size: 16px;" onclick="DeleteRow( this )">Delete</button>
                                    </th>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                    </div>
                    <div>

                    </div>

                            <div class="form-group">
                                <div class="center"></div>
                                <select id="elementId">
                                    <c:forEach var="client" items="${all_clients}">
                                        <option name="${client.id}" value="${client.id}">${client.name}/${client.birthday}</option>
                                    </c:forEach>
                                </select>
                                <input  id="testbut" type="button" value="Добавить">
                            </div>

                            <div class="form-group">
                                <input class="btn btn-info center" type="submit" value="OK">
                            </div>

                            </div>


<%--                    <button class="btn btn-info btn-block text-light button-bottom-crud"   type="submit" onclick="addRow('super-table')">Add</button>--%>
                </div>












</div>
</form:form>
</div>
<script>

        function getSelectedText( select ){
            var sel = document.getElementById(select);
            var index = sel.selectedIndex;
            return sel.options[index].text;
        }
        function getSelectedValue( select ){
            var sel = document.getElementById(select);
            var index = sel.options.selectedIndex;
            return sel.options[index].value;
        }

        function addTotable(table,clients) {

            const rowCount = table.rows.length;
            var row = table.insertRow(rowCount);
            var cell1 = row.insertCell(0);
            var cell2 = row.insertCell(1);
            var cell3 = row.insertCell(2);
            const str=clients.options[clients.options.selectedIndex].text.split('/')
            cell1.innerText=str[0]
            cell2.innerText=str[1]
            var element2 = document.createElement("input");
            element2.value=clients.options[clients.options.selectedIndex].value;
            element2.type = "hidden";
            element2.name="id2";
            cell1.appendChild(element2);
            var del_but = document.createElement("button");
            del_but.className="btn btn-danger"
            del_but.style="font-size: 16px;"
            del_but.onclick=()=>{
                del_but.parentElement.closest('tr').remove()
            }
            del_but.type = "button";
            del_but.textContent='Delete'
            cell3.appendChild(del_but)
        }
        function DeleteRow( el ){
            el.parentElement.closest('tr').remove();
        }


        const clients = document.querySelector('select')


        const testbut2s = document.getElementById('testbut')
        const table2d = document.getElementById('super-table')


        testbut2s.onclick = function (){
            addTotable(document.getElementById('super-table'), document.querySelector('select'))

    }


</script>

</body>
<script type="text/javascript">
    <%@include file="/resources/scripts/script.js"%>
</script>
<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet"/>
<link rel="stylesheet" href="<c:url value="/resources/styles/MainStyles.css"/>" type="text/css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-ygbV9kiqUc6oa4msXn9868pTtWMgiQaeYH7/t7LECLbyPA2x65Kgf80OJFdroafW" crossorigin="anonymous"></script>
<script src="https://bootstraptema.ru/plugins/jquery/jquery-1.11.3.min.js"></script>
<script src="https://bootstraptema.ru/plugins/2015/b-v3-3-6/bootstrap.min.js"></script>
<script src="https://bootstraptema.ru/plugins/2016/validator/validator.min.js"></script>
</html>