<?php
session_start();

include 'connection.php';
if(isset($_SESSION['login_user1'])){
$user_check=$_SESSION['login_user1'];
$query = "SELECT email FROM users WHERE email = '$user_check'";
$ses_sql = mysqli_query($conn, $query);
$row = mysqli_fetch_assoc($ses_sql);
$login_session =$row['email'];
echo json_encode($_SESSION['login_user1']);
}

?>