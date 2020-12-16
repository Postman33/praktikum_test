<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Alexander
  Date: 06.12.2020
  Time: 0:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
        data.addColumn('string', 'date');
        data.addColumn('number', 'average point');

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
            ['Avg point', ${global_mark}],
            ['Course happy,%', ${max_param}]
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


    <div id="chart_div"></div>
    <div>
        <div id="chart_div2" style="width: 40%; margin-left: 45%"></div>

    </div>

    <div id="chart_div3"></div>

</body>


</html>
