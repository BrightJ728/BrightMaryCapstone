<?php
   define('HOST','localhost');
   define('PWD,'brightMary23?');
   define('USERNAME','root');
   define('DB','Capstone_Database');
   
   $conn = mysqli_connect(HOST,USERNAME,PWD,DB);
   if($conn){
       return $conn;
   }else{
       echo "Connect problem".mysqli_connect_error();
   }

?>
