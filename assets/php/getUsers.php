<?php 
session_start();
$conn = mysqli_connect("127.0.0.1","swpuser","swpuser","swp");
if(mysqli_connect_errno()){
    die();
}
$sql = "SELECT Admin FROM User WHERE Admin = 1 AND UserID = ".$_SESSION['user-id'];
$res = $conn->query($sql);
if($res->num_rows != 1){
    http_response_code(403);
    die();
}
if(isset($_GET['id'])){
    if(isset($_GET['img'])){
        $sql = "SELECT Profilbild FROM User WHERE UserID=".$_GET['id'];
        $result = mysqli_query($conn, $sql);

        if(mysqli_num_rows($result) == 1){
            $row = mysqli_fetch_assoc($result);
            $imagedb = $row["Profilbild"];
            if ($imagedb == null){
                $image = null;
            }
            else{
                $image = base64_encode($imagedb);
            }

            $array = ["img"=>$image];
            header('Content-Type: application/json');
            echo json_encode($array);
            http_response_code(200);
            die();
        }
    }else{
        $res= $conn->query("SELECT Vorname,Nachname,Username,Email,Addresse,Stadt,Land,Gesperrt FROM User WHERE Admin = '0' AND UserID = ".$_GET['id'].";");
    }
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