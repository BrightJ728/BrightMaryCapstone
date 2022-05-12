<?php
include "connection.php";

// $email="adwoa@gmail.com";

// $oldNum="000004";
// $newNum="1111";

$email=$_POST['Fs_email'];

$oldNum=$_POST['oldNumber'];
$newNum=$_POST['newNumber'];
$query = "SELECT email, phoneNumber FROM users WHERE email='$email' AND phoneNumber='$oldNum' LIMIT 1";
$sql=mysqli_query($conn,$query);
$count=mysqli_num_rows($sql);
if($count==1){  

 $sql = ("UPDATE `users` SET `phoneNumber`='$newNum' WHERE `email`='$email' AND `phoneNumber`='$oldNum'");
		$result = mysqli_query($conn, $sql);
	if($result){
		echo json_encode("Success");
		}
	else {
		
		echo json_encode("Error");

		}

} else {
		
		echo json_encode("Errors");

}

mysqli_close($conn); 


?>
