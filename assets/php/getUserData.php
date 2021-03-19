<?php 
session_start();
$conn = mysqli_connect("127.0.0.1","swpuser","swpuser","swp");
if(mysqli_connect_errno()){
    die();
}
$res = $conn->query("SELECT UserID,Vorname,Nachname,Username,Kontostand,Admin,Email,Passwort,Addresse,Stadt,Land,Gesperrt FROM User Where UserID = ".$_SESSION['user-id'].";");
$rows = array();
while ($r = mysqli_fetch_assoc($res)){
    $rows[] = $r;
}
header('Content-Type: application/json');
echo json_encode($rows);
?>