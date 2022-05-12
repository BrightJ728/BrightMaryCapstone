<?php
require 'connection.php';
session_start();
$user_check=$_SESSION['login_user1'];
$query = "SELECT email FROM fireservice WHERE email = '$user_check'";
$ses_sql = mysqli_query($conn, $query);
$row = mysqli_fetch_assoc($ses_sql);
$login_session =$row['email'];


?>