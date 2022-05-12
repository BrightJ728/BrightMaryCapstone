<?php
include('../database/session.php');

if(!isset($login_session)){
header('Location: ../dashboard.php'); // Redirecting To Home Page
}
?>
<?php
include_once '../database/connection.php';
$location ="";
if(isset($_POST["submit"])){

    
    // grab form data
    $location = $_POST["location"];
    
    }
    


 $sql="SELECT * FROM users " ;
  $result= mysqli_query($conn,$sql)
?>
<!DOCTYPE html>
<html>
  <head>
    <title>cases</title>

         <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
         <link href="../css/case.css" rel="stylesheet"/>

          <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.4/Chart.js"></script>
         <style>
        .navcon {
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
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.4/Chart.js"></script>
  </head>
  <body>
 
<div></div>
   <div class="inner-cont " >

 
 </div>
 <ul  class="nav navcon justify-content-end">
         <li class="nav-item">
          <a class="nav-link" href="../index.php">Home</a>
        </li>
       
          
 
          <li class="nav-item">
            <a class="nav-link" href="locations.php">Locations</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="street.php">Map</a>
          </li>

          <li class="nav-item">
            <a class="nav-link" href="functions/logOut.php">Log Out</a>
          </li>
      </ul>
  <div class="main">

 <div class="container " >

<?php
if (mysqli_num_rows($result) > 0) {
?>
  <table class="table table">
  
  <tr class="title">
    <td>Username</td>
    <td>email</td>
    <td>Phone Number</td>
    <td>Location </td>
      

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




</tr>
<?php
$i++;
}
?>
</table>
 <?php
}



else{

    echo "No result found";
}
?>

</div>
</div>
 </body>
</html>