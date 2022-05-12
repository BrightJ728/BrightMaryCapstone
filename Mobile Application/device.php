<?php
include('../database/session.php');

if(!isset($login_session)){
header('Location: login.php'); // Redirecting To Home Page
}
?>



<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" type="text/css" href="../css/style.css">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" integrity="sha384-HSMxcRTRxnN+Bdg0JdbxYKrThecOKuH5zCYotlSAcp1+c8xmyTe9GYg1l9a69psu" crossorigin="anonymous">  <script type="text/javascript" src="js/jquery.min.js"></script>

    <title>Fire service Portal</title>
</head>
<body>
<div class="container" style="margin-top: 4%; margin-bottom: 2%;">
      <div class="col-md-5 col-md-offset-4">
      <div class="panel panel-primary">
        <div class="panel-heading"> Fire Service Account </div>
        <div class="panel-body">
          
       

        <form id="form" role ="form "class="form"  action="../functions/add_device.php" method="POST" enctype="multipart/form-data">
            <?php
            if(isset($_SESSION["errors"])){
                $errors = $_SESSION["errors"];

                // loop and display errors
                foreach($errors as $error){
                    ?>
                        <small style="color: red"> <?= $error."<br>"; ?> </small>
                    <?php
                }
            }
            // destroy session after displaying errors
        ?>

        
          
             <div class="row">
          <div class="form-group col-xs-12">              
         <label for="details">Sensor Details</label>
                 <div class="input-group">

                <input class="form-control"  type="text" placeholder="Sensor Details" id="details" name="details">
                <small id='detailError'></small>
                <span class="input-group-btn">
                <label class="btn btn-primary"><span class="glyphicon glyphicon-user" aria-hidden="true"></label>
            </span>
            </div>
            </div>
            </div>

       
        <div class="row">
          <div class="form-group col-xs-12">                
          <label for="serial">serial Number</label>
                      <div class="input-group">

                <input class="form-control"  type="text" placeholder="Enter Serial Number" id="serial" name="serial">
                <small id='serialError'></small>
                <span class="input-group-btn">
                <label class="btn btn-primary"><span class="glyphicon glyphicon-user" aria-hidden="true"></label>

            </span>
            </div>
            </div>
            </div>
           <div class="row">
          <div class="form-group col-xs-12"> 
                <label for="room">Room Name</label>
                            <div class="input-group">

                <input class="form-control"  type="text" placeholder="room" id="room" name="room">
                <small id='room'></small>
                <span class="input-group-btn">
                <label class="btn btn-primary"><span class="glyphicon glyphicon-user" aria-hidden="true"></label>
            </span>
            </div>
            </div>

            </div> 
            <div class="row">

          <div class="form-group col-xs-12"> 
                <label for="room">Floor</label>
                    <div class="input-group">

                <input class="form-control"  type="text" placeholder="floor" id="floor" name="floor">
                <small id='floor'></small>
                <span class="input-group-btn">
                <label class="btn btn-primary"><span class="glyphicon glyphicon-user" aria-hidden="true"></label>
            </span>
            </div>
            </div>
            </div>
                   
            <small id='success'></small>
            <button type="submit" id='submitBtn' name="submit">Submit</button>
            
        </form>
  
</div>
        
      </div>
      </div>
      
    </div>
    </div>

    <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
    <script src="./script.js"></script>
</body>
</html>