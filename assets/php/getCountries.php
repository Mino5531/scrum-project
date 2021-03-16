<?php 
$conn = mysqli_connect("127.0.0.1","swpuser","swpuser","swp");
if(mysqli_connect_errno()){
    die();
}
$res = $conn->query("SELECT * FROM Country;");
$rows = array();
while ($r = mysqli_fetch_assoc($res)){
    $rows[] = $r;
}
header('Content-Type: application/json');
echo json_encode($rows);
?>