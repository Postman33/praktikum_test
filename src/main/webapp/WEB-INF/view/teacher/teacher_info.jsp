<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
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
    <title>Клиенты</title>
</head>
<body>
<%@include file="/resources/view_library/header.jsp"%>
<br>
<br>
<div class="container">
    <div class="row">
        <div class="col-md-6 col-md-offset-3 center">


            <form:form modelAttribute="teacher_info" action="/saveTeacher">

                <form:hidden path="id"/>
                <div class="form-group">
                    <label for="inputName" class="control-label">Имя учителя</label>
                    <form:input path="name" type="text" class="form-control" id="inputName" placeholder="Введите имя" />
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
                    <label for="dateBirthday" class="control-label">Дата рождения</label>
                    <form:input path="birthday" type="date" class="form-control" id="dateBirthday" placeholder="Email"  />
                    <div class="help-block with-errors"></div>
                </div>

                <div class="form-group">
                    <div class="checkbox">
                        <label>
                            <input type="checkbox" id="terms" data-error="Прежде чем оправить данные" required>
                            Докажите что Вы человек
                        </label>
                        <div class="help-block with-errors"></div>
                    </div>

                </div>
                <div class="form-group">
                    <input type="submit" value="OK">

                </div>

            </form:form>

        </div>
    </div>
</div>
<div style="margin-top:650px;">
</div>
<%@include file="/resources/view_library/footer.jsp"%>

</body>
<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet"/>
<link rel="stylesheet" href="<c:url value="/resources/styles/MainStyles.css"/>" type="text/css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-ygbV9kiqUc6oa4msXn9868pTtWMgiQaeYH7/t7LECLbyPA2x65Kgf80OJFdroafW" crossorigin="anonymous"></script>
<script src="https://bootstraptema.ru/plugins/jquery/jquery-1.11.3.min.js"></script>
<script src="https://bootstraptema.ru/plugins/2015/b-v3-3-6/bootstrap.min.js"></script>
<script src="https://bootstraptema.ru/plugins/2016/validator/validator.min.js"></script>