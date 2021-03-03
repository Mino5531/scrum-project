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
    $bet = $_POST["bet"];

    $cards["player"] = [DrawCard(), DrawCard()];
		$cards["bank"] = [DrawCard(), DrawCard()];

    echo json_encode($cards);
}

function PlayerHitController(){
	$card = DrawCard();
	$cards["player"][] = $card;

	echo json_encode($card);
}

function BankHitController(){
	$card = DrawCard();
	$cards["bank"][] = $card;

	echo json_encode($card);
}

function EndController(){

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
    return ["color"=>"Diamonds", "number"=>"7", "value"=>7];
}

function BankValue(){
	$bank = $cards["bank"];
	$value = 0;
	for ($i=0; $i < count($bank); $i++) { 
		$value += $bank[$i]["value"];
	}
	return $value;
}

function PlayerValue(){
	$player = $cards["player"];
	$value = 0;
	for ($i=0; $i < count($player); $i++) { 
		$value += $player[$i]["value"];
	}
	return $value;
}

?>