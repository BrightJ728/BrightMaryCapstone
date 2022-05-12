<?php
include "connection.php";
session_start();
	// $email="adwoa@gmail.com";
	// $password = "12345";
$email=$_POST['email'];
$password=$_POST['password'];
//$query="SELECT * FROM `users` where `email`='adwoa@gmail.com' and `password`='12345'";

$query="SELECT * FROM `usersinfo` where `email`='$email' and `password`='$password'";
$login=mysqli_query($conn,$query);
$count=mysqli_num_rows($login);
if($count==1){
    $_SESSION['login_user1']=$email;
    echo json_encode($_SESSION['login_user1']);
}
else{
	echo json_encode("Error");
}



?>
