<?php
//connect to database class
require_once (dirname(__FILE__)).'/../controllers/UserController.php';
session_start();

// keeping track of errors
$errors = array();

// check if button is clicked
if(isset($_POST["submit"])){
    // grab form data
    $name = $_POST["name"];
    $email = $_POST["email"];
      $phone= $_POST["phone"];
          
    // validate data

    // check if fields are empty
    if(empty($name)){array_push($errors, "name is required");}
    if(empty($email)){array_push($errors, "email is required");}
    if(empty($phone)){array_push($errors, "password is required");}
  
  
    // if form is fine
    if(count($errors) == 0){
        // upload image

        // check if uploaded successfully and then add new user
        // note we are storing the path to the image in the database
        
            $register_user = new_user($name, $email, $phone);

            // check if user is registered
            if(!$register_user){
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
        header("location: ../add_new_user.php");
    }
    
}