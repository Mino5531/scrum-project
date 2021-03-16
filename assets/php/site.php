<?php
session_start();

$_SESSION["user-id"] = 1;

$controller = $_POST["controller"];

include_once("inc.php");


switch ($controller) {
	case "balance":
		BalanceController();
		break;
	case "user":
		UserController();
		break;
}

// controller

function BalanceController(){
	global $conn;
	$userId = $_SESSION["user-id"];

	$sql = "SELECT Kontostand FROM User WHERE UserID = $userId";
	$result = mysqli_query($conn, $sql);

	if(mysqli_num_rows($result) == 1){
		$row = mysqli_fetch_assoc($result);
		$balance = $row["Kontostand"];

		$sql = "SELECT Datum, Betrag, Typ FROM PaymentHistory WHERE UserID = $userId ORDER BY Datum DESC LIMIT 3";
		$result = mysqli_query($conn, $sql);

		$history = [];
		
		if(mysqli_num_rows($result) > 0){
			while($row = mysqli_fetch_assoc($result)){
				$payment = ["date"=>$row["Datum"], "amount"=>$row["Betrag"], "type"=>$row["Typ"]];
				$history[] = $payment; 
			}
			$data = ["balance"=>$balance, "history"=>$history];
			echo json_encode($data);
		}
	}
}

function UserController(){
	global $conn;
	$userId = $_SESSION["user-id"];

	$sql = "SELECT Username FROM User WHERE UserID = $userId";
	$result = mysqli_query($conn, $sql);

	if(mysqli_num_rows($result) == 1){
		$row = mysqli_fetch_assoc($result);
		$username = $row["Username"];

		echo json_encode($username);
	}

	// Falls Profilbilder eingebaut werden sollen müssen sie in dieser Funktion noch ergänzt werden 
}