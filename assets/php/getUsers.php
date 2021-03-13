<?php 
$conn = mysqli_connect("127.0.0.1","swpuser","swpuser","swp");
if(mysqli_connect_errno()){
    die();
}
$sql = "SELECT Admin FROM User WHERE UserID = ". "1";//$_SESSION['user-id'];
$res = $conn->query($sql);
if($res->num_rows != 1){
    http_response_code(403);
    die();
}
if(isset($_GET['id'])){
    $res= $conn->query("SELECT Vorname,Nachname,Username,Email,Addresse,Stadt,Land,Gesperrt FROM User WHERE Admin = '0' AND UserID = ".$_GET['id'].";");
}else{
    $res= $conn->query("SELECT UserID,Vorname,Nachname,Username,Email,Kontostand,Land FROM User WHERE Admin = '0';");
}
$rows = array();
while ($r = mysqli_fetch_assoc($res)){
    $rows[] = $r;
}
header('Content-Type: application/json');
echo json_encode($rows);
?>