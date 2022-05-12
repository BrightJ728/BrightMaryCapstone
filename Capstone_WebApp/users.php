<?php
require_once ("database/db_connection.php");
$query = "SELECT * FROM users LIMIT 1, 30";
$res = mysqli_query($connect,$query);
?>










