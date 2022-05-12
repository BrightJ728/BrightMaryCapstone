<?php
	include 'connection.php';
	$name = $_POST["name"];
    $email = $_POST["email"];
    $phone= $_POST["phone"];
    $fs_email= $_POST["Fs_email"];
    $sql="INSERT INTO `new_users`(`Name`, `email`,`phoneNumber`, `FK_email`) VALUES ('$name', '$email', '$phone', '$fs_email')";
    $insert=mysqli_query($conn, $sql);
    
if($insert){
    echo json_encode("Success");
}
else{
	echo json_encode("Error");
}
        
   

?>
