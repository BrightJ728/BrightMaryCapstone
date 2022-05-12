<?php
session_start(); 
include "../database/connection.php";
include "../models/User.php";

$error=''; 
if (isset($_POST['submit'])) {
if (empty($_POST['email']) || empty($_POST['password'])) {
$error = "email or Password is invalid";
}
else
{
$email=$_POST['email'];
$password=$_POST['password'];
$query = "SELECT email, password FROM fireservice WHERE email=? AND password=? LIMIT 1";
$password=md5($password);
$stmt = $conn->prepare($query);
$stmt -> bind_param("ss", $email, $password);
$stmt -> execute();
$stmt -> bind_result($email, $password);
$stmt -> store_result();

if ($stmt->fetch())  
{
	$_SESSION['login_user1']=$email; 
	header("location: ../dashboard.php");
} else {
$error = "email or Password is invalid";

}

mysqli_close($conn); //
}
}
?>