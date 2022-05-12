<?php
	$dbhost = "localhost";
	$dbuser = "root";
	$dbpass = "brightMary23?";
	$dbname = "Capstone_Database";

	//Create Connection
	$conn = new mysqli($dbhost, $dbuser, $dbpass, $dbname) or die($conn->connect_error);

	return $conn;

?>
