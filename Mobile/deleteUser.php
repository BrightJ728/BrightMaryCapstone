<?php
include_once 'connection.php';

$email = $_POST['email'];
$sql = "DELETE FROM new_users WHERE Fk_email=' $email'";
if (mysqli_query($conn, $sql)) {
    echo json_encode('Success');
} else {
    echo json_encode('Error');
}
mysqli_close($conn);
?>
