<?php
	include 'connection.php';
   include('database/session.php'); 
  
 $status=$_POST['status'];
    $email= $login_session;

    
    $query = mysqli_query($conn, "SELECT * FROM `users` WHERE `email`='$email'");
				$fetch = mysqli_fetch_array($query);
 
				$email =$fetch['email'];
        $sql = ("UPDATE `users` SET `status`='status' ");
        $update=mysqli_query($conn, $sql);
    
        if($update){
        echo json_encode("Success");
    }else{
        echo json_encode("Error");
    }
        
   

?>
