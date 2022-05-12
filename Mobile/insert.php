<?php
	include 'connection.php';

	$username = $_POST["username"];
    $email = $_POST["email"];
    $location= $_POST["location"];
    $region=$_POST["region"];
    $phone = $_POST["phone"];
    $password = $_POST["password"];
    $sql="INSERT INTO `usersinfo`(`username`, `email`,`phoneNumber`, `location`,`region`, `password`) VALUES ('$username', '$email', '$phone', '$location','$region','$password')";
	if(mysqli_query($conn,$sql)){
        echo "inserting succussfully";
    }else{
        echo "not successful";
    }
        
   

?>
