<?php
include 'database/connection.php';
$model = $_POST["results"];
$sql = "INSERT INTO `models`(`data`) VALUES ('$model')";
	if(mysqli_query($conn, $sql)){
		echo "inserting successfully";
	}else{
		echo "not successful";
	}
?>
