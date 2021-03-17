<?php 
session_start();
$conn = mysqli_connect("127.0.0.1","swpuser","swpuser","swp");
if(mysqli_connect_errno()){
    die();
}
if($_SERVER['REQUEST_METHOD'] == 'POST'){
    $res = $conn->query("SELECT Admin FROM User WHERE Admin = 1 AND UserID = ". $_SESSION['user-id']);
    if($res->num_rows != 1){
        http_response_code(403);
        die();
    }
    if(isset($_POST['name']) && isset($_POST['link']) && isset($_POST['mode'])){
        if($_POST['mode'] == 'update' && isset($_POST['id'])){
            $sql = 'UPDATE Game SET Name = "'.$_POST['name'].'", URL = "'.$_POST['link'].'" WHERE GameID = '.$_POST['id'];
            $conn->query($sql);
        }
        elseif($_POST['mode'] == 'create'){

        }else{
            http_response_code(400);
            die();
        }
    }
}else{
    $res = $conn->query("SELECT * FROM Game;");
    $rows = array();
    while ($r = mysqli_fetch_assoc($res)){
        $rows[] = $r;
    }
    header('Content-Type: application/json');
    echo json_encode($rows);
}
?>