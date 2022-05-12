<?php
include('../database/session.php');

  
  // Connect to database 
include('../database/connection.php');
  // Get all the categories from category table
  $sql = "SELECT  distinct location  FROM `users`";
  $all_categories = mysqli_query($conn,$sql);
  $sql2 = "SELECT  distinct region FROM `users`";
  $regions = mysqli_query($conn,$sql2);

if(!isset($login_session)){
header('Location: login.php'); // Redirecting To Home Page
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
    <title>Locations</title>
    <link rel="stylesheet" type="text/css" href="../css/location.css" />

         <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">

         
         <style>
           .navcon a{
	font-size: large;
	color: red;
  background-color: black;

}
.inner-nav {
	font-size:small;
	color: red;
  background-color: black;

}
.forms,input{
  margin-right: 10%;
  background-color: black;

}
.forms{
	
	padding: 0.5%;
}
body {
font-family: "Lato", sans-serif;
border-left-width: 30%;
border-left-color: aqua;
//background-color: black;
}
    </style>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.4/Chart.js"></script>
  </head>
  <body>
  
   <div class="inner-cont " >
   </div>
   <div class="inner-nav " >
   <ul  class="nav navcon justify-content-end">
  <form class="d-flex  forms" method="POST" action="../models/gen_location.php">
    <!-- <input type="text" id="location" class="form-control me-2" name="location" placeholder="Search  Location"> -->
    <!-- <label>Filter Location </label> -->
        <select name="location" id="location">
            <?php 
           
                while ($category = mysqli_fetch_array($all_categories,MYSQLI_ASSOC)):; 
            ?>
                <option value="<?php echo $category["location"];
                    // The value we usually set is the primary key
                ?>">
                    <?php echo $category["location"];
                        // To show the category name to the user
                    ?>
                </option>
            <?php 
                endwhile; 
                // While loop must be terminated
            ?>
        </select>       
    <input type="submit" name = "submit" class="fadeIn fourth" value="Filter location">
 </form>
     
  <form class="d-flex forms" method="POST" action="../models/region.php">
    <!-- <input type="text" id="region" class="form-control me-2" name="region" placeholder="Search  Region"> -->
        <select name="region" id="region">
            <?php 
           
                while ($reg = mysqli_fetch_array($regions,MYSQLI_ASSOC)):; 
            ?>
                <option value="<?php echo $reg["region"];
                    // The value we usually set is the primary key
                ?>">
                    <?php echo $reg["region"];
                        // To show the category name to the user
                    ?>
                </option>
            <?php 
                endwhile; 
                // While loop must be terminated
            ?>
        </select>    
    <input type="submit" name = "submit" class="fadeIn fourth"  value="Filter region">
 </form>
         <li class="nav-item">
          <a class="nav-link" href="../index.php">Home</a>
        </li>
       
          
          <li class="nav-item">
            <a class="nav-link" href="firecases.php">Fire Cases</a>
          </li>
          

          <li class="nav-item">
            <a class="nav-link" href="../functions/logOut.php">Log Out</a>
          </li>
      </ul>
   </div>
      <br>
  <div class="main">
   
 <div class="container " >

<?php
if (mysqli_num_rows($result) > 0) {
?>
  <table class="table table-hover">
  
  <tr class="title">
  <td>username</td>

    <td>email</td>
    <td>Phone Number</td>
    <td>Location </td>
        <td>Region </td>

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
        <td><?php echo $row["region"]; ?></td>

        <td><?php echo $row["Datetime"]; ?></td>

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
 </body>
</html>
