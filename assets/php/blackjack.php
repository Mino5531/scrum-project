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
		case "player-draw-card":
				PlayerDrawCardController();
				break;
}

// controller
function StartController(){
    $bet = $_POST["bet"];

    $cards["player"] = [DrawCard(), DrawCard()];
		$cards["bank"] = [DrawCard(), DrawCard()];

    echo json_encode($cards);
}

function PlayerDrawCardController(){
	$card = DrawCard();
	$cards["player"][] = $card;

	echo json_encode($card);
}

// functions
function DrawCard(){
    return ["color"=>"Hearts", "number"=>"8", "value"=>8];
}

?>