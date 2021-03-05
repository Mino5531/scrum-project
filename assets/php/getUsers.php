<?php 
$conn = mysqli_connect("localhost","swpuser","swpuser","swp");
if(mysqli_connect_errno()){
    die();
}
$res= mysqli_query($conn,"SELECT Vorname,Nachname,Username,Email,Kontostand FROM User WHERE Admin = '0';");
$rows = array();
while ($r = mysqli_fetch_assoc($res)){
    $rows[] = $r;
}
header('Content-Type: application/json');
echo json_encode($rows);
?>