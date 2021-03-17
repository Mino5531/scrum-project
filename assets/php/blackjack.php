<?php

session_start();

$controller = $_POST["controller"];

require("inc.php");
//header('Content-Type: application/json');
// variables
$bet;
$cards = ["player"=>[], "bank"=>[]];

// link to controller
switch ($controller) {
    case "start":
      	StartController();
		break;
	case "player-hit":
		PlayerHitController();
		break;
	case "bank-hit":
		BankHitController();
		break;
	case "end":
		EndController();
		break;
	case "blackjack":
		BlackjackController();
		break;
}

// controller
function StartController(){
	global $cards;
    $bet = $_POST["bet"];

    $cards["player"] = [DrawCard(), DrawCard()];
	$cards["bank"] = [DrawCard(), DrawCard()];

    echo json_encode($cards);
}

function PlayerHitController(){
	global $cards;
	$card = DrawCard();
	$cards["player"][] = $card;

	echo json_encode($card);
}

function BankHitController(){
	global $cards;
	$card = DrawCard();
	$cards["bank"][] = $card;

	echo json_encode($card);
}

function EndController(){

	global $cards, $bet;

	$cards = $_POST["cards"];
	$bet = $_POST["bet"];

	if (PlayerValue() > 21){
		Loss();
	}
	else if (BankValue() > 21){
		Win();
	}
	else if (PlayerValue() > BankValue()){
		Win();
	}
	else{
		Loss();
	}
}

function BlackjackController(){
	global $cards, $bet;

	$cards = $_POST["cards"];
	$bet = $_POST["bet"];

	if(count($cards["player"]) == 2 && PlayerValue() == 21){
		Blackjack();
		return;
	}
}

// functions
function DrawCard(){
	global $conn;

	$i = rand(1, 52);
	$sql = "SELECT Color, Face, Value FROM Card WHERE Id=$i";

	$result = mysqli_query($conn, $sql);
	if (mysqli_num_rows($result) > 0){
		$card = mysqli_fetch_assoc($result);
		return $card;
	}
}

function BankValue(){
	global $cards;
	$bank = $cards["bank"];
	$value = 0;
	for ($i=0; $i < count($bank); $i++) { 
		$value += $bank[$i]["Value"];
	}
	return $value;
}

function PlayerValue(){
	global $cards;
	$player = $cards["player"];
	$value = 0;
	for ($i=0; $i < count($player); $i++) { 
		$value += $player[$i]["Value"];
	}
	return $value;
}


function Win(){
	global $bet;

	$amount = $bet;

	$msg = "You've won! $amount$ will be transfered to your account";
	$win = true;

	AddBalance($amount);

	echo json_encode(["msg"=>$msg, "win"=>$win]);
}

function Loss(){
	global $bet;
	$amount = $bet;
	$msg = "You've lost! $amount$ will be subtracted from your account balance";
	$win = false;

	SubtractBalance($amount);

	echo json_encode(["msg"=>$msg, "win"=>$win]);
}

function Blackjack(){
	global $bet;

	$amount = $bet * 1.5;

	$msg = "Blackjack! $amount$ will be transfered to your account";
	AddBalance($amount);
	$win = true;

	echo json_encode(["msg"=>$msg, "win"=>$win]);
}

function Balance(){
	global $conn;
	$userId = $_SESSION["user-id"];
	
	$sql = "SELECT Kontostand FROM User WHERE UserID = $userId";
	$result = mysqli_query($conn, $sql);

	if(mysqli_num_rows($result) == 1){
		$row = mysqli_fetch_assoc($result);
		return $row["Kontostand"];
	}
}

function SubtractBalance($value){
	global $conn;
	$userId = $_SESSION["user-id"];

	$balance = Balance() - $value;

	$sql = "UPDATE User SET Kontostand = $balance WHERE UserID = $userId";
	if(mysqli_query($conn, $sql)){
		$sql = "INSERT INTO PaymentHistory SET Datum = (SELECT NOW()), Betrag = -$value, Typ = 'Blackjack', UserID = $userId";
		mysqli_query($conn, $sql);
	}
}

function AddBalance($value){
	global $conn;
	$userId = $_SESSION["user-id"];

	$balance = Balance() + $value;

	$sql = "UPDATE User SET Kontostand = $balance WHERE UserID = $userId";
	if (mysqli_query($conn, $sql)){
		$sql = "INSERT INTO PaymentHistory SET Datum = (SELECT NOW()), Betrag = $value, Typ = 'Blackjack', UserID = $userId";
		mysqli_query($conn, $sql);
	}
}
?>