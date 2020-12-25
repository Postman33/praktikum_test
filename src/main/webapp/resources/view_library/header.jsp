<%--
  Created by IntelliJ IDEA.
  User: Timur Nasibov (c)
  Date: 18.12.2020
  Time: 12:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<c:url var="clients4" value="/clients">
</c:url>

<c:url var="courses4" value="/courses">
</c:url>
<c:url var="teachers4" value="/teachers">
</c:url>
<c:url var="marks4" value="/getMarks">
</c:url>

<nav class="navbar navbar-expand-lg navbar-light" style="background-color: rgba(44, 106, 165,0.33); margin-bottom: 20px;">
    <div class="container">
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav">
                <li class="nav-item">
<%--                    <a class="btn btn-success" href="#">--%>
<%--                        <i class="fa fa-user"></i> Клиенты</a>--%>
    <button type="button" class="btn btn-labeled btn-danger" onclick="window.location.href='${clients4}'">
        <span class="btn-label"><i class="fa fa-user"></i></span>Клиенты</button>
                </li>

                <li class="nav-item">
                    <button type="button" class="btn btn-labeled btn-info" onclick="window.location.href='${teachers4}'">
                        <span class="btn-label"><i class="fa fa-user"></i></span>Учителя</button>
                </li>
                <li class="nav-item">
                    <button type="button" class="btn btn-labeled btn-success" onclick="window.location.href='${courses4}'">
                        <span class="btn-label"><i class="fa fa-leaf"></i></span>Курсы</button>
                </li>
                <li class="nav-item">
                    <button type="button" class="btn btn-labeled btn-primary" onclick="window.location.href='${marks4}'">
                        <span class="btn-label"><i class="fa fa-snowflake-o"></i></span>Оценки</button>
                </li>
            </ul>
        </div>
    </div>
</nav>