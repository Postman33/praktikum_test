<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Alexander
  Date: 06.12.2020
  Time: 0:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<html>
<head>

    <title>Title</title>

</head>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<script type="text/javascript">

    google.charts.load('current', {packages: ['corechart', 'line']});
    google.charts.setOnLoadCallback(drawBasic2);

    function drawBasic2() {

        var data = new google.visualization.DataTable();
        data.addColumn('string', 'Дата');
        data.addColumn('number', 'Ср. оценка');

        data.addRows([
            <c:forEach var="e" items="${course_marks_for_dates}">
            ['${e.key.toString()}',${e.value} ],
            </c:forEach>
        ]);

        var options = {
            hAxis: {
                title: 'Дата'
            },
            vAxis: {
                title: 'Средняя оценка'
            },
            height:600
        };

        var chart = new google.visualization.LineChart(document.getElementById('chart_div3'));

        chart.draw(data, options);
    }

    google.charts.load('current', {packages: ['corechart', 'bar']});
    google.charts.setOnLoadCallback(drawBasic);

    function drawBasic() {

        var data = google.visualization.arrayToDataTable([
            ['Студент', 'Оценка за курс'],
            <c:forEach var="e" items="${avg_points}">
            ['${e.key.name}',${e.value} ],
            </c:forEach>

        ]);

        var options = {
            title: 'Средние оценки студентов',
            chartArea: {width: '50%'},
            hAxis: {
                title: 'Оценки',
                minValue: 0
            },
            vAxis: {
                title: 'Студент'
            }
        };

        var chart = new google.visualization.BarChart(document.getElementById('chart_div'));

        chart.draw(data, options);
    }



    google.charts.load('current', {'packages':['gauge']});
    google.charts.setOnLoadCallback(drawChart);

    function drawChart() {

        var data = google.visualization.arrayToDataTable([
            ['Critter', 'Value'],
            ['Ср. оценка', ${global_mark}],
        ]);

        var options = {
            width: 400, height: 120,
            redFrom: 90, redTo: 100,
            yellowFrom:75, yellowTo: 90,
            minorTicks: 5,
            max: 100
        };

        var chart = new google.visualization.Gauge(document.getElementById('chart_div2'));

        chart.draw(data, options);

    }




</script>

<body>
<%@include file="/resources/view_library/header.jsp"%>


<div class="container">

<c:url var="ToCourse" value="/viewCourse">
    <c:param name="courseid" value="${courseid}"/>
</c:url>

<button type="button" class="btn btn-danger" style="font-size: 16px;"
        onclick="window.location.href='${ToCourse}'">Назад к курсу
</button>
</div>

    <div id="chart_div"></div>
    <div>
        <div id="chart_div2" style="width: 40%; margin-left: 45%"></div>

    </div>

    <div id="chart_div3"></div>
<%@include file="/resources/view_library/footer.jsp"%>

</body>

<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet"/>
<link rel="stylesheet" href="<c:url value="/resources/styles/MainStyles.css"/>" type="text/css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-ygbV9kiqUc6oa4msXn9868pTtWMgiQaeYH7/t7LECLbyPA2x65Kgf80OJFdroafW" crossorigin="anonymous"></script>

</html>
