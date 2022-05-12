<?php
//connect to database class
require_once (dirname(__FILE__)).'/../controllers/UserController.php';

// keeping track of errors
$errors = array();

// check if button is clicked
if(isset($_POST["submit"])){
    // grab form data
    $details = $_POST["details"];
    $serial = $_POST["serial"];
      $room= $_POST["room"];
            $floor= $_POST["floor"];
    // validate data

    // check if fields are empty
    if(empty($details)){array_push($errors, "details is required");}
    if(empty($serial)){array_push($errors, "serial is required");}
    if(empty($room)){array_push($errors, "room is required");}
    if(empty($floor)){array_push($errors, "floor 2 is required");}

   
    // if form is fine
    if(count($errors) == 0){
        // upload image

        // check if uploaded successfully and then add new user
        // note we are storing the path to the image in the database
        
            $add_device = add_devices($details, $serial, $room, $floor);

            // check if user is registered
            if(!$add_device){
                echo "failed";
            }else{
                // redirect
                echo "success";
                header("location: ../dashboard.php");

            }
        
    }else{
        session_start();
        // store errors inside session
        $_SESSION["errors"] = $errors;
        //print_r($errors);
        header("location: ../view/device.php");
    }
    
}