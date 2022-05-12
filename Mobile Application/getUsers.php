<?php
 
// Importing DatabaseConfig.php file.
include 'connection.php';
 
// Creating MySQL Connection.
 
 // Getting the received ID in JSON Format into $json variable.

 
 // Populate ID fraom JSON $obj array and store into $ID variable.
 //$email = $POST["Fs_email"];
 $email ="adwoa@gmail.com";
 //Fetching the selected record as per ID.
 
  $sql="select * from new_users  WHERE Fk_email='$email'";
  $result=mysqli_query($conn,$sql);

if ($result->num_rows >0) {
 
 while($row= $result->fetch_assoc()) {
 $Ite[] = array($row);
 $res = json_encode($Ite);
 

 }
 
 echo $res;


}else {
	
 echo "No Results Found.";
 
}
 
 

?>
