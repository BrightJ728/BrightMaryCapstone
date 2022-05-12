<?php

    include 'connection.php';
    //$email='adwoa@gmail.com';
    $email = $_POST["Fs_email"];
    $sql="SELECT * FROM new_users  WHERE `Fk_email`='$email'";
    $result=mysqli_query($conn, $sql);

    if($result ->num_rows > 0){
    while($row=$result->fetch_assoc()){
      $Ite[] = $row;
      $res = json_encode($Ite);
    }
    echo $res;
}else{
  echo  "No Result Found";
}
?>   
