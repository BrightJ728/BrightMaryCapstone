<?php




function Users(){
require 'database/connection.php';

if (mysqli_connect_errno())
  {
  echo "Failed to connect to MySQL: " . mysqli_connect_error();
  }
$sql="select count(distinct id) from users";
$result=mysqli_query($conn,$sql);
$row=mysqli_fetch_array($result);
echo "$row[0]";
mysqli_close($conn);
}

function firecases(){
require 'database/connection.php';

	$sql="select count('status') from users where status='fire'";
$result = mysqli_query($conn, $sql);  
$row = mysqli_fetch_array($result);  
echo "$row[0]";
mysqli_close($conn);
}
function locations(){
require 'database/connection.php';

$sql2 = "select count( distinct location) from users ";
$result = mysqli_query($conn, $sql2);  
$row = mysqli_fetch_array($result);  
echo "$row[0]";
mysqli_close($conn);
} 

?>


