<?php
	include 'connection.php';
    $password= $_POST["newPassword"];
    $email= $_POST["email"];
    $query = mysqli_query($conn, "SELECT * FROM `users` WHERE `email`='$email'");
				$fetch = mysqli_fetch_array($query);
                $email =$fetch['email'];

        $sql = ("UPDATE `users` SET `password`='$password' WHERE `email`='$email'");
        $update=mysqli_query($conn, $sql);
    
        if($update){
        echo json_encode("Success");
    }else{
        echo json_encode("Error");
    }
        
   

?>
