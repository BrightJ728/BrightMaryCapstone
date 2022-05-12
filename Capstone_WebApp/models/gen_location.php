<?php
include_once '../database/connection.php';
$location ="";
if(isset($_POST["submit"])){
    // grab form data
    $location = $_POST["location"];
  }


 $sql="SELECT * FROM users where location='$location'" ;
  $result= mysqli_query($conn,$sql)
?>
<!DOCTYPE html>
<html>
  <head>
    <title>Locations</title>
        <link rel="stylesheet" type="text/css" href="../css/location.css" />
         <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <style>
      
    </style>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.4/Chart.js"></script>
  
    <style>
           .navcon a{
	font-size: x-large;
	color: red;

}
.inner-cont{
	padding-top:1%;
	padding-bottom:4%;
	background-color:red;
	height:70px;
		background-image: url("../image/fire.jfif");

}       .navcon {
	font-size: x-large;
	color: red;
  background-color: black;
}
.navcon a{
	font-size: x-large;
	color: red;
  background-color: black;
}


    </style>
  </head>
  <body>

    
  <div class="inner-cont " >
   
   </div>
   
   <ul  class="nav navcon justify-content-end">
         <li class="nav-item">
          <a class="nav-link" href="../index.php">Home</a>
        </li>
       
          
 
          <li class="nav-item">
            <a class="nav-link" href="../view/locations.php">Locations</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="../view/street.php">Map</a>
          </li>

          <li class="nav-item">
            <a class="nav-link" href="../functions/logOut.php">Log Out</a>
          </li>
      </ul>
<?php
if (mysqli_num_rows($result) > 0) {
?>

<p>Fire cases based on different locations</p>

  <table class="table">
  
  <tr class="table table">
    <td>Username</td>
    <td>email</td>
    <td>Phone Number</td>
    <td>Location </td>

     <td>Date </td>

  </tr>
<?php
$i=0;
while($row = mysqli_fetch_array($result)) {
?>
<tr>
    <td><?php echo $row["username"]; ?></td>
    <td><?php echo $row["email"]; ?></td>
    <td><?php echo $row["phoneNumber"]; ?></td>
    <td><?php echo $row["location"]; ?></td>

        <td><?php echo $row["time"]; ?></td>

</tr>
<?php
$i++;
}
?>
</table>
 <?php
}
else{

  header("refresh:1; url=../dashboard.php");
  echo "<script> alert('Location not found')</script>";}
?>

</div>
 </body>
</html>