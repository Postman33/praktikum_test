<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%--
  Created by IntelliJ IDEA.
  User: Alexander
  Date: 08.12.2020
  Time: 16:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<link rel="stylesheet" href="https://bootstraptema.ru/plugins/2015/bootstrap3/bootstrap.min.css" />
<script src="https://bootstraptema.ru/plugins/jquery/jquery-1.11.3.min.js"></script>
<script src="https://bootstraptema.ru/plugins/2015/b-v3-3-6/bootstrap.min.js"></script>
<script src="https://bootstraptema.ru/plugins/2016/validator/validator.min.js"></script>

<br>
<br>
<div class="container">
    <div class="row">
        <div class="col-md-6 col-md-offset-3">


            <form:form modelAttribute="client_info" action="/saveClient">

                <form:hidden path="id"/>
                <div class="form-group">
                    <label for="inputName" class="control-label">Имя клиента</label>
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