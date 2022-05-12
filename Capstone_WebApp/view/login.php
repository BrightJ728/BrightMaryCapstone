 <?php
include('../functions/login.php'); // Includes Login Script


   if(isset($_SESSION['login_user1'])){
header("location: ../dashboard.php"); 
}
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login page </title>

    <link href="../style.css" rel="stylesheet">
    <style>  body {
font-family: "Lato", sans-serif;
border-left-width: 30%;
border-left-color: aqua;
}</style>
</head>
<body>
<div class="wrapper fadeInDown">
    <div id="formContent">
      <!-- Tabs Titles -->
      <h2 class="active"> Log In </h2>
      <a href="signUp.php"><h2 class="inactive underlineHover">Sign Up </h2></a>
  
      <!-- Icon -->
    
  
      <!-- Login Form -->
      <form method="POST" >
        <input type="text" id="email" class="fadeIn second" name="email" placeholder="Email">
        <input type="password" id="password" class="fadeIn third" name="password" placeholder="password">
  
<input type="submit" name = "submit" class="fadeIn fourth" value="Log In"></a>
      </form>
  
      
  
    </div>
  </div>

</body>



</html>
