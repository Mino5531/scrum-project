<?php
$conn = mysqli_connect("127.0.0.1","swpuser","swpuser","swp");
if(mysqli_connect_errno()){
    die();
}
$sql = "SELECT Admin FROM User WHERE UserID = ".$_SESSION['user-id'];
$res = $conn->query($sql);
if($res->num_rows != 1){
    die("Permission denied");
}
if(isset($_POST['username']) && isset($_POST['email']) 
    && isset($_POST['first_name']) && isset($_POST['last_name']) && isset($_POST['id'])){
        $conn->query("UPDATE User SET Username = '".$_POST['username']."', Email='".$_POST['email']."',
         Vorname='".$_POST['first_name']."', Nachname='".$_POST['last_name']."' WHERE UserID = ".$_POST['id'].";");
}
else{
    if(isset($_POST['address']) && isset($_POST['city']) && isset($_POST['country']) && isset($_POST['id']) ){
    $conn->query("UPDATE User SET Addresse = '".$_POST['address']."', Stadt ='".$_POST['city']."' 
     ,Land=".$_POST['country']." WHERE UserID = ".$_POST['id'].";");
    }else{
        if(isset($_POST['del']) && isset($_POST['id'])){
            $conn->query("DELETE FROM User WHERE UserID = ".$_POST['id']);
        }else{
            if(isset($_POST['lock']) && isset($_POST['id'])){
                $conn->query("UPDATE User SET Gesperrt = ".$_POST['lock']." WHERE UserID = ".$_POST['id']);
            }else{
                http_response_code(400);
                die();
            }
        }
    }
}
echo($conn->error);
?>