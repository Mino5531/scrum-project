<?php

$servername = "127.0.0.1";
$username = "swpuser";
$password = "swpuser";
$dbname = "swp";

$conn = mysqli_connect($servername, $username, $password, $dbname);

if (!$conn) {
	die("Connection failed: " . mysqli_connection_error());
} 

?>