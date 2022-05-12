<?php
//connect to database class
include 'db_connection.php';
include "connection.php";

class User extends db_connection {
    // registers new user
    public function register($username, $email, $phone, $location,$region, $password){
        $sql = "INSERT INTO `users`(`username`, `email`,`phoneNumber`, `location`,`region`, `password`) VALUES ('$username', '$email', '$phone', '$location','$region','$password')";

        return $this->db_query($sql);


    }
    public function register_crew($username, $email, $phone,$location, $password){
      $sql = "INSERT INTO `fireservice`(`branchName`, `email`,`phoneNumber`, `location`, `password`) VALUES ('$username', '$email', '$phone', '$location','$password')";

      return $this->db_query($sql);


  }
    public function devices($details, $serial, $room, $floor){
     			include('session.php');

    $query = mysqli_query($conn, "SELECT * FROM `users` WHERE `email`='$_SESSION[login_user1]'") or die(mysqli_error());
				$fetch = mysqli_fetch_array($query);
 
				$email =$fetch['email'];
        $sql = ("UPDATE `users` SET `sensorDetails`='$details',`serials`='$serial',`roomName`='$room',`floor`='$floor' WHERE `email`='$email'");

        return $this->db_query($sql);



    }
    
      public function new_user($name, $phone, $email){
     			include('session.php');

    $query = mysqli_query($conn, "SELECT * FROM `users` WHERE `email`='$_SESSION[login_user1]'") or die(mysqli_error());
				$fetch = mysqli_fetch_array($query);
    			$id =$fetch['id'];
                $fk_email =$fetch['email'];
                echo "id";
        $sql = "INSERT INTO `new_users`(`user_id`, `FK_email`, `Name`, `email`,`phoneNumber`) VALUES ('$id','$fk_email','$name', '$email', '$phone')";
        $_SESSION['login_user1']=$fk_email; 
        return $this->db_query($sql);


    }


    function location($location, $sregion){

    include('session.php');

    $query = mysqli_query($conn, "SELECT * FROM `users` WHERE `email`='$_SESSION[login_user1]'") or die(mysqli_error());
				$fetch = mysqli_fetch_array($query);

				$email =$fetch['email'];
        $sql = ("UPDATE `users` SET `location`='$location',`region`='$region' WHERE `email`='$email'");

        return $this->db_query($sql);
        }
}