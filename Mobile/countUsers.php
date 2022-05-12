<?php

function firecases(){
require 'connection.php';

	$sql="select count('status') from users where status='fire'";
$result = mysqli_query($conn, $sql);  
$row = mysqli_fetch_array($result);  
echo "$row[0]";
mysqli_close($conn);
}
function locations(){
require 'connection.php';

$sql2 = "select count( distinct location) from users ";
$result = mysqli_query($conn, $sql2);  
$row = mysqli_fetch_array($result); 
$result="$row[0]"; 
echo  json_encode();
mysqli_close($conn);
} 

?>


