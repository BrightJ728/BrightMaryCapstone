<?php
	include 'connection.php';
    
	$serial = $_POST["serial"];
    $room = $_POST["room"];
    $floor= $_POST["floor"];
    $email= $_POST["email"];

    
    $query = mysqli_query($conn, "SELECT * FROM `usersinfo`");
	if(mysqli_num_rows($query)>0){
	while($row=mysqli_fetch_assoc($query)){
 
	$email =$row['email'];
          $region = $row['region'];
	$phone =$row['phoneNumber'];
	$location =$row['location'];

 $sql="INSERT INTO `users`(`email`, `serials`, `roomName`, `floor`, `location`, `region`, `phoneNumber`) VALUES('$email', '$serial', '$room', '$floor','$location', '$region','$phone')";
	if(mysqli_query($conn,$sql)){
        echo json_encode("inserting succussfully");
    }else{
        echo json_encode("Error");
    }


}
}

?>
