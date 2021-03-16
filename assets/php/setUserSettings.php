<?php 
session_start();
$conn = mysqli_connect("127.0.0.1","swpuser","swpuser","swp");
if(mysqli_connect_errno()){
    die();
}

if(isset($_POST['username']) && isset($_POST['email']) 
    && isset($_POST['first_name']) && isset($_POST['last_name'])){
        $conn->query("UPDATE User SET Username = '".$_POST['username']."', Email='".$_POST['email']."',
         Vorname='".$_POST['first_name']."', Nachname='".$_POST['last_name']."' WHERE UserID = ".$_SESSION['user-id'].";");
         $_SESSION['username'] = $_POST['username'];
}
else{
    if(isset($_POST['address']) && isset($_POST['city']) && isset($_POST['country'])){
    $conn->query("UPDATE User SET Addresse = '".$_POST['address']."', Stadt ='".$_POST['city']."' 
     ,Land=".$_POST['country']." WHERE UserID = ".$_SESSION['user-id'].";");
    }else{
        http_response_code(400);
        die();    
    }
}
echo($conn->error);

?>