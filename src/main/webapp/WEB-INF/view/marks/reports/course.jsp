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

    // Load the Visualization API and the corechart package.
    // google.charts.load('current', {'packages':['corechart']});
    //
    // // Set a callback to run when the Google Visualization API is loaded.
    // google.charts.setOnLoadCallback(drawChart);
    //
    // // Callback that creates and populates a data table,
    // // instantiates the pie chart, passes in the data and
    // // draws it.
    // function drawChart() {
    //     // Create the data table.
    //     var data = new google.visualization.DataTable();
    //     data.addColumn('string', 'Topping');
    //     data.addColumn('number', 'Slices');
    //     data.addRows([
    //         ['Mushrooms', 3],
    //         ['Onions', 1],
    //         ['Olives', 1],
    //         ['Zucchini', 1],
    //         ['Pepperoni', 2]
    //     ]);
    //
    //     // Set chart options
    //     var options = {'title':'How Much Pizza I Ate Last Night',
    //         'width':400,
    //         'height':300};
    //
    //     // Instantiate and draw our chart, passing in some options.
    //     var chart = new google.visualization.PieChart(document.getElementById('chart_div'));
    //     chart.draw(data, options);
    // }

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
    ${min_client.name} имеет низкую оценку по курсу ${min_course.name} с данными

    Header ${min_mark.header}
    Mark ${min_mark.mark}

    <div id="chart_div"></div>
    <div>
        <div id="chart_div2" style="width: 40%; margin-left: 55%"></div>

    </div>

</body>


</html>
