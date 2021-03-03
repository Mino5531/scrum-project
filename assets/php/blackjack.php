<?php

$controller = $_POST["controller"];

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
		return;
	}
	if (PlayerValue() == 21){
		Blackjack();
		return;
	}
	if (BankValue() > 21){
		Win();
		return;
	}
	if (PlayerValue() > BankValue()){
		Win();
		return;
	}
	else{
		Loss();
		return;
	}
}

// functions
function DrawCard(){
    return ["color"=>"Diamonds", "number"=>"8", "value"=>8];
}

function BankValue(){
	global $cards;
	$bank = $cards["bank"];
	$value = 0;
	for ($i=0; $i < count($bank); $i++) { 
		$value += $bank[$i]["value"];
	}
	return $value;
}

function PlayerValue(){
	global $cards;
	$player = $cards["player"];
	$value = 0;
	for ($i=0; $i < count($player); $i++) { 
		$value += $player[$i]["value"];
	}
	return $value;
}


function Win(){
	global $bet;

	$amount = $bet;

	$msg = "You've won! $amount$ will be transfered to your account";

	echo json_encode($msg);
}

function Loss(){
	$msg = "You've lost!";

	echo json_encode($msg);
}

function Blackjack(){
	global $bet;

	$amount = $bet * 1.5;

	$msg = "Blackjack! $amount$ will be transfered to your account";
}

?>