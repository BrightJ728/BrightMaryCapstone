<?php
    /* Database connection settings */
    $host = 'localhost';
    $user = 'root';
    $pass = '';
    $db = 'capstone';
    $mysqli = new mysqli($host,$user,$pass,$db) or die($mysqli->error);

    $data1 = '';
    $data2 = '';

    //query to get data from the table
    $sql = "SELECT Datetime,  id  FROM users  ";
    $result = mysqli_query($mysqli, $sql);

    //loop through the returned data
    while ($row = mysqli_fetch_array($result)) {

        $data1 = $data1 . '"'. $row['Datetime'].'",';
        $data2 = $data2 . '"'. $row['id'] .'",';
    }

    $data1 = trim($data1,",");
    $data2 = trim($data2,",");
?>

<!DOCTYPE html>
<html>
    <head>

        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <script type="text/javascript" src="Chart.bundle.min.js"></script>
        <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/admin-lte/3.0.0-alpha/js/plugins/chartjs2/Chart.bundle.min.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/admin-lte/3.0.0-alpha/js/plugins/chartjs2/Chart.bundle.min.js"></script>
        <style type="text/css">         
          
        </style>

    </head>

    <body>     
        <div class="container"> 




        <canvas id="myChart" style="width:100%;max-width:600px;  margin-top:5%;"></canvas>

            
                
        </div>
<script>
var xValues = [<?php echo $data1; ?>];
var yValues = [<?php echo $data2; ?>, ];

new Chart("myChart", {
  type: "line",
  data: {
    labels: xValues,
    datasets: [{
      fill: false,
      lineTension: 0,
      backgroundColor: "rgba(0,56,255,1.0)",
      borderColor: "rgba(35,255,255,255)",
      data: yValues
    }]
  },
  options: {
    legend: {display: true},
    scales: {
      yAxes: [{ticks: {min: 6, max:16}}],
    }
  }
});
</script>
    </body>
</html>