<?php 

session_start();
require("inc.php");

$userid = $_SESSION["user-id"];

if($userid == null){
	die();
}

if ( $_FILES['file']['error'] > 0 ) {
	echo 'Error: ' . $_FILES['file']['error'] . '<br>';
}
else {
	$img = addslashes(file_get_contents($_FILES['file']['tmp_name']));
	$sql = "UPDATE User SET Profilbild='{$img}' WHERE UserID=$userid";
	if (mysqli_query($conn, $sql)){
		echo true;
		return;
	}
	else{
		echo false;
		return;
	}
}

?>