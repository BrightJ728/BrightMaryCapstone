
<?php
  
  // Connect to database 
include('../database/connection.php');
  // Get all the categories from category table
  $sql = "SELECT distinct location  FROM `users`";
  $all_categories = mysqli_query($conn,$sql);
  ?>
<html>
<head>
    <link rel="stylesheet" type="text/css" href="./style.css" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">

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

}
.inner-nav {
	font-size: x-large;
	color: red;

}
.forms{
  margin-right: 15%;
  
}
.forms{
	
	padding: 0.5%;
}
    </style>
</head>
<body>
<div class="inner-cont " >
   
   </div>
  
<ul  class="nav navcon justify-content-end">
<form class="forms"method="POST" >
        <input type="text" id="current" class="fadeIn second" name="current" placeholder="Curent Location">
        <label>Select a Location</label>
        <select name="destination" id="destination">
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
        <!-- <input type="text" id="destination" class="fadeIn third" name="destination" placeholder="Destination"> -->

        <input type="submit" name = "submit" class="fadeIn fourth" value="Search">

      </form>
         <li class="nav-item">
          <a class="nav-link" href="../dashboard.php">Home</a>
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
<iframe
  width="100%"
  height="100%"
  style="border:0"
  loading="lazy"
  allowfullscreen
  <?php
  if(isset($_POST['submit']))
    {
      $current = $_POST['current'];
      $destination = $_POST['destination'];

    }else{
      $current = "Kwabenya";
      $destination = "Ashesi";
    }
      ?>
  src="https://www.google.com/maps/embed/v1/place?key=AIzaSyAl2JRwzkUXD643CMVVNv00KkrUUFDitbc
    &q=<?php echo $current?>,<?php echo $destination?>">
</iframe>
</body>
</html>
