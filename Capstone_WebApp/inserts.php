<?php
	include 'database/connection.php';

	$temperature = $_POST["temperature"];
    $gas = $_POST["gas"];
    $flame= $_POST["flame"];
    $status = $_POST["status"];
    $sql="INSERT INTO `sensorReading`(`temperature`, `flame`,`gas`,`status`) VALUES ('$temperature', '$flame', '$gas','$status')";
	if(mysqli_query($conn,$sql)){
        echo "inserting succussfully";
    }else{
        echo "not successful";
    }
        
   

?>

