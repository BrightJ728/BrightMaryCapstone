<?php
//connect to User class
require_once (dirname(__FILE__)).'/../models/User.php';

function register_new_user($email,  $location, $password){
    // create a new instance of the object
    $user = new User;

    // run the query
    $register_user = $user->register( $email,  $location, $password);

    // check if it worked
    if($register_user){
        return $register_user;
    }else{
        return false;
    }

}


function add_devices($details, $serial, $room, $floor){
    $user = new User;

    // run the query
    $add_device = $user->devices($details, $serial, $room, $floor);

    // check if it worked
    if($add_device){
        return $add_device;
    }else{
        return false;
    }

}
function new_user($name, $email, $phone){

$user = new User;

    // run the query
    $add_new_user= $user->new_user($name, $email, $phone);

    // check if it worked
    if($add_new_user){
        return $add_new_user;
    }else{
        return false;
    }

}

function device_locations($ocation, $sregion){

$user = new User;

    // run the query
    $add_location= $user->location($ocation, $sregion);

    // check if it worked
    if($add_location){
        return $add_location;
    }else{
        return false;
    }

}