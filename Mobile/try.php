<?php
	include 'connection.php';
    
	$serial = $_POST["serial"];
    $room = $_POST["room"];
    $floor= $_POST["floor"];
    $email= $_POST["email"];

    
    $query = mysqli_query($conn, "SELECT * FROM usersinfo");
	if(mysqli_num_rows($query)>0){
	while($row=mysqli_fetch_assoc($query)){
 
				$email =$row['email'];
              $region = $row['region'];
	$phone =$row['phoneNumber'];
	$location =$row['location'];
 $sql="INSERT INTO `users`(`serials`,`room', `floor`, `email`,`phoneNumber`, `location`,`region`, `location`, `region`) VALUES ('$serial', '$room', 'floor','$email', '$phone', '$location','$region','$password')";
	if(mysqli_query($conn,$sql)){
        echo "inserting succussfully";
    }else{
        echo "not successful";
    }

}}

?>
