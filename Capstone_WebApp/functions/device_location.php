<?php
//connect to database class
require_once (dirname(__FILE__)).'/../controllers/UserController.php';

// keeping track of errors
$errors = array();

// check if button is clicked
if(isset($_POST["submit"])){
    // grab form data
    $location = $_POST["location"];
    $region = $_POST["region"];
     
    // validate data

    // check if fields are empty
    if(empty($location)){array_push($errors, "location is required");}
    if(empty($region)){array_push($errors, "region is required");}

   
    // if form is fine
    if(count($errors) == 0){
        // upload image

        // check if uploaded successfully and then add new user
        // note we are storing the path to the image in the database
        
            $add_location = device_locations($location, $region);

            // check if user is registered
            if(!$add_location){
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
        header("location: ../view/device_location.php");
    }
    
}