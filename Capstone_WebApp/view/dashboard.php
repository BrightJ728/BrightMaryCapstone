

<?php
  include('../database/connection.php');
    include ('../models/countUsers.php');
    ?>
    
    <?php
       $find_notifications = "Select * from users where status ='fire' OR status='potential fire' order by Datetime  DESC LIMIT 0,30";
       $result = mysqli_query($conn,$find_notifications);
       $count_active = '';
       $notifications_data = array(); 
       $deactive_notifications_dump = array();
        while($rows = mysqli_fetch_assoc($result)){
                $count_active = mysqli_num_rows($result);
                $notifications_data[] = array(
                            "n_id" => $rows['id'],
                            "phoneNumber"=>$rows['phoneNumber'],
                            "status"=>$rows['status'],
                            "location"=>$rows['location'],

                );
        }
        //only 30/per month specific posts
        $deactive_notifications = "Select * from users where status = 'fire' OR status='potential fire'  order by Datetime  DESC LIMIT 0,30";
        $result = mysqli_query($conn,$deactive_notifications);
        while($rows = mysqli_fetch_assoc($result)){
          $deactive_notifications_dump[] = array(
                      "n_id" => $rows['id'],
                      "phoneNumber"=>$rows['phoneNumber'],
                      "status"=>$rows['status']
          );
        }

     ?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Fire detection</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <style>
      
    </style>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.4/Chart.js"></script>
    <link href="../css/index.css" rel="stylesheet"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" type="text/css" href="../assets/css/bootstrap.min.css"/>
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@300&display=swap" rel="stylesheet">
    <script src="../assets/js/jquery.min.js"></script>
    <script src="../assets/js/bootstrap.min.js"></script>
    <style>
        body {
             margin:0 !important;
             padding:0 !important;
             box-sizing: border-box;
             font-family: 'Roboto', sans-serif;
        }
        body {
font-family: "Lato", sans-serif;
border-style: dashed;
border-left-width: 30%;
border-left-color: aqua;
//background-color:violet;
}
        .round{
          width:20px;
          height:20px;
          border-radius:50%;
          position:relative;
          background:red;
          display:inline-block;
          padding:0.3rem 0.2rem !important;
          margin:0.3rem 0.2rem !important;
          left:-18px;
          top:10px;
          z-index: 99 !important;
        }
        .round > span {
          color:white;
          display:block;
          text-align:center;
          font-size:1rem !important;
          padding:0 !important;
        }

        #list{
         
          display: none;
          top: 33px;
          position: absolute;
          right: 2%;
          background:#ffffff;
  z-index:100 !important;
    width: 25vw;
    margin-left: -37px;
   
    padding:0 !important;
    margin:0 auto !important;
    
          
        }
        .message > span {
           width:100%;
           display:block;
           color:red;
           text-align:justify;
           margin:0.2rem 0.3rem !important;
           padding:0.3rem !important;
           line-height:1rem !important;
           font-weight:bold;
           border-bottom:1px solid white;
           font-size:1.8rem !important;

        }
        .message{
          /* background:#ff7f50;
          margin:0.3rem 0.2rem !important;
          padding:0.2rem 0 !important;
          width:100%;
          display:block; */
          
        }
        .message > .msg {
           width:90%;
           margin:0.2rem 0.3rem !important;
           padding:0.2rem 0.2rem !important;
           text-align:justify;
           font-weight:bold;
           display:block;
           word-wrap: break-word;
         
          
        }
        .p-5{
          height: 180px;
          font-size: x-large;
          text-align: center;
        }
        .padd{
          padding-top: 30px;

        }
      
    </style>
    <style>
  .navcon {
	font-size: x-large;
	color: red;
  background-color: black;
}
.navcon a{
	font-size: x-large;
	color: red;
  background-color: black;
}
</style>
</head>
<body>



<!-- start graph -->
<?php
//header("refresh: 7");

    $host = 'localhost';
    $user = 'root';
    $pass = '';
    $db = 'capstone';
    $mysqli = new mysqli($host,$user,$pass,$db) or die($mysqli->error);

    $data1 = '';
    $data2 = '';
    $data3 = '';


    //query to get data from the table
    $sql = "SELECT Datetime, recordedValue, email FROM users where status='fire'  order by Datetime  DESC LIMIT 0,30";
    $result = mysqli_query($mysqli, $sql);

    //loop through the returned data
    while ($row = mysqli_fetch_array($result)) {

        $data1 = $data1 . '"'. $row['Datetime'].'",';
        $data2 = $data2 . '"'. $row['recordedValue'] .'",';
        $data3 = $data3 . '"'. $row['email'] .'",';

    }

    $data1 = trim($data1,",");
    $data2 = trim($data2,",");
    $data3 = trim($data3,",");

?>
<!-- end of graph -->
  <div class="inner-cont " >
   
 </div>
      <ul  class="nav justify-content-end navcon">
      <li class="nav-item">
          <a class="nav-link" href="../index.php">Home</a>
        </li>
          
          <li class="nav-item">
            <a class="nav-link" href="firecases.php">Fire Cases</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="locations.php">Locations</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="street.php">Map</a>
          </li>

          
  <li class="nav-item">
            <a class="nav-link">notifications</a>
                                <li><i class="fa fa-bell"   id="over" data-value ="<?php echo $count_active;?>" style="z-index:-99 !important;font-size:32px;color:white;margin:0.5rem 0.4rem !important;"></i></li>
                    <?php if(!empty($count_active)){?>
                    <div class="round" id="bell-count" data-value ="<?php echo $count_active;?>"><span ><?php echo $count_active; ?></span></div>
                    <?php }?>
                     
                    <?php if(!empty($count_active)){?>
                      <div id="list">
<li><a style=" margin-right:10%; text-decoration:none;"href="./dashboard.php"><span >&#8592;</span></a>Notifications</li>

                       <?php
                          foreach($notifications_data as $list_rows){?>
                            <li id="message_items">
                            <div class="message alert alert-warning" data-id=<?php echo $list_rows['n_id'];?>>
                              <span> <?php   echo " Fire Status: ", " ", $list_rows['status'];?></span>
                              <div class="msg">
                                <p><?php 
                           echo $list_rows['phoneNumber'];
                           echo "<br>";
                                  echo $list_rows['location'];
                                ?></p>
                              </div>
                            </div>
                            </li>
                         <?php }
                       ?> 
                       </div> 
                     <?php }else{?>
                        <div id="list">
                        <?php
                          foreach($deactive_notifications_dump as $list_rows){?>
                            <li id="message_items">

                            <div class="message alert alert-danger" data-id=<?php echo $list_rows['n_id'];?>>
                              <span><?php echo $list_rows['email'];?></span>
                              <div class="msg">
                                <p>

                                  <?php 
                                  echo $list_rows['location'];
                                ?></p>
                              </div>
                            </div>
                            </li>
                         <?php }
                       ?>
                        <!--old Messages-->
                     
                     <?php } ?>
                     
                     </div>
                          </li>
                          <li class="nav-item">
            <a class="nav-link" href="../functions/logOut.php">Log Out</a>
          </li>
      </ul>




<!-- <div></div> -->
 <div class="main">
<div class="container " >

<h3>Dashboard: Fire Fighter's Portal</h3>

  <div class="row row-cols-3 row-cols-lg-4 g-4 g-lg-4">
   <div class="col">
       <a class="dash" href="view/users.php" id="users"> 
    <div class="p-5 border bg-primary" > <br>Total Users <br> <?= Users(); ?><br> </div>
   </a></div>
    <div class="col">
    <a href="view/firecases.php" id="cases">
      <div class="p-5 border bg-danger"><br>Fire Detected <br> <?= firecases(); ?></div>
    </a></div>
    <div class="col">
    <a href="view/locations.php" id="locations">
      <div class="p-5 border bg-success"><br>Locations <br> <?= locations(); ?></div>
    </a></div>
    
    <div class="col">
    <a href="street.php" id="chats">
      <div class="p-5 padd border bg-secondary"> <br>Map <br></div>
    </div></a>
    
  </div>
<br>
<br>
<br>
<h3 style="color:red; font-weight:bold">Analytics: Number of Fire incidents per Months</h3>

<canvas id="myChart" style="width:100%; max-width:90%; color:white;background-color:black; "></canvas>

</div>

</div>
<br>
<br>

<!-- graph -->
<script>
var xValues = [<?php echo $data1; ?>];
var yValues = [<?php echo $data2; ?>, ];
var lValues = [<?php echo $data3; ?>, ];


new Chart("myChart", {
  type: "line",
  data: {
    labels: xValues,
    datasets: [{
      fill: false,
      lineTension: 0,
      backgroundColor: "rgba(25,56,255,1.0)",
      borderColor: "rgba(5,255,255,255)",
      data: yValues
    }]
  },
  options: {
    legend: {display: false},
    scales: {
      yAxes: [{ticks: {min: 0, max:100}}],
    }
  }
});
</script>
<!-- <script>
var xValues = [50,60,70,80,90,100,110,120,130,140,150];
var yValues = [7,8,8,9,9,9,10,11,14,14,15];

new Chart("myChart", {
  type: "line",
  data: {
    labels: xValues,
    datasets: [{
      fill: false,
      lineTension: 0,
      backgroundColor: "rgba(0,56,255,1.0)",
      borderColor: "rgba(35,25,255,255)",
      data: yValues
    }]
  },
  options: {
    legend: {display: true},
    scales: {
      yAxes: [{ticks: {min: 6, max:16}}],
    }
  }
});
</script> -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>

<script>
$(document).ready(function(){
    var ids = new Array();
    $('#over').on('click',function(){
           $('#list').toggle();  
       });

   //Message with Ellipsis
   $('div.msg').each(function(){
       var len =$(this).text().trim(" ").split(" ");
      if(len.length > 12){
         var add_elip =  $(this).text().trim().substring(0, 65) + "…";
         $(this).text(add_elip);
      }
     
}); 


   $("#bell-count").on('click',function(e){
        e.preventDefault();

        let belvalue = $('#bell-count').attr('data-value');
        
        if(belvalue == ''){
         
          console.log("inactive");
        }else{
          $(".round").css('display','none');
          $("#list").css('display','block');
          
          // $('.message').each(function(){
          // var i = $(this).attr("data-id");
          // ids.push(i);
          
          // });
          //Ajax
          $('.message').click(function(e){
            e.preventDefault();
              $.ajax({
                url:'./connection/deactive.php',
                type:'POST',
                data:{"id":$(this).attr('data-id')},
                success:function(data){
                 
                    console.log(data);
                    location.reload();
                }
            });
        });
     }
   });

   $('#notify').on('click',function(e){
        e.preventDefault();
        var name = $('#notifications_name').val();
        var ins_msg = $('#message').val();
        if($.trim(name).length > 0 && $.trim(ins_msg).length > 0){
          var form_data = $('#frm_data').serialize();
        $.ajax({
          url:'./connection/insert.php',
                type:'POST',
                data:form_data,
                success:function(data){
                    location.reload();
                }
        });
        }else{
          alert("Please Fill All the fields");
        }
      
       
   });
});
</script>
</body>
</html>
