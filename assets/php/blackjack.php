<?php

$controller = $_POST["controller"];

// variables
$bet;
$cards;

// link to controller
switch ($controller) {
    case "start":
        StartController();
}

// controller
function StartController(){
    $bet = $_POST["bet"];

    $card = DrawCard();

    echo json_encode($card);
}

// functions
function DrawCard(){
    return ["color"=>"Hearts", "number"=>"7", "value"=>10];
}

?>