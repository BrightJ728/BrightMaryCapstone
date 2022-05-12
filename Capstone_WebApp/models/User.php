<?php
//connect to database class
require_once (dirname(__FILE__)).'/../database/db_connection.php';

				require'../database/connection.php';

class User extends db_connection {
    // registers new user
    public function register($email,  $location, $password){
      $password = md5($password);
        $sql = "INSERT INTO `fireservice`(`email`, `location`, `password`) VALUES ( '$email', '$location','$password')";

        return $this->db_query($sql);


    }

    public function devices($details, $serial, $room, $floor){
     			include('../database/session.php');

    $query = mysqli_query($conn, "SELECT * FROM `users` WHERE `email`='$_SESSION[login_user1]'");
				$fetch = mysqli_fetch_array($query);
 
				$email =$fetch['email'];
        $sql = ("UPDATE `users` SET `sensorDetails`='$details',`serials`='$serial',`roomName`='$room',`floor`='$floor' WHERE `email`='$email'");

        return $this->db_query($sql);



    }
    
      public function new_user($name, $phone, $email){
     			include('../database/session.php');

    $query = mysqli_query($conn, "SELECT * FROM `users` WHERE `email`='$_SESSION[login_user1]'");
				$fetch = mysqli_fetch_array($query);
    			$id =$fetch['id'];
                $fk_email =$fetch['email'];
                echo "id";
        $sql = "INSERT INTO `new_users`(`user_id`, `FK_email`, `Name`, `email`,`phoneNumber`) VALUES ('$id','$fk_email','$name', '$email', '$phone')";
        $_SESSION['login_user1']=$fk_email; 
        return $this->db_query($sql);


    }


    function location($location, $sregion){

    include('../database/session.php');

    $query = mysqli_query($conn, "SELECT * FROM `users` WHERE `email`='$_SESSION[login_user1]'");
				$fetch = mysqli_fetch_array($query);

				$email =$fetch['email'];
        $sql = ("UPDATE `users` SET `location`='$location',`region`='$region' WHERE `email`='$email'");

        return $this->db_query($sql);
        }
}