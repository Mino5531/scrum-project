// variables

const urlBlackjack = "assets/php/blackjack.php"
var request, cards, cache

// event listeners

$("#hit").click(function(){
	if(cards == null){
		StartGame()
	}
	else{
		Hit()
	}
})

$("#stand").click(function() {
	Bank()
})

// event handlers

function StartGame(){
	if (isNaN($("#bet").val())|| $("#bet").val() <= 0){  // überprüft die Eingabe auf gültigkeit
		$("#invalid-bet").show()
		setTimeout(function () {
			$('#invalid-bet').fadeOut('slow');
		}, 2000);
		return
	}
	if (parseFloat($("#bet").val()) > parseFloat(balance) ){
		$("#insufficient-funds").show()
		setTimeout(function () {
			$('#insufficient-funds').fadeOut('slow');
		}, 2000);
		return
	}
	$("#bet").prop("disabled", true)

	$.ajax({ // sendet einen POST request an blackjack.php
		type: "post",
		url: urlBlackjack,
		data: {
			controller: "start",
			bet: $("#bet").val()
		},
		success: function(data){
			try {
				cards = JSON.parse(data)
			} catch (error) {
				JsonParseError(error, data)
				return
			}
			cache = cards.bank.pop()

			for(i = 0; i < cards.player.length; i++){
				ShowCard(cards.player[i], "#player-cards")
			}

			ShowCard(cards.bank[0], "#bank-cards")

			DisplayValues()

			$("#hit").text("Hit")
			$("#stand").show()

			if(PlayerValue == 21){
				Blackjack()
				return
			}
			CheckValue()
		}
	})
}

function Blackjack(){
	$.ajax({
		type: "post",
		url: urlBlackjack,
		data: {
			controller: "blackjack",
			cards: cards
		},
		success: function(response){
			try {
				var data = JSON.parse(response);
			} catch (error) {
				JsonParseError(error, data)
				return
			}

			DisplayOutcome(true, data.msg)
		}
	})
}

function Hit() {
	PushCard()

	$.ajax({
		type: "post",
		url: urlBlackjack,
		data: {
			controller: "player-hit",
		},
		success: function (data){
			try {
				var card = JSON.parse(data)
			} catch (error) {
				JsonParseError(error, data)
				return
			}
			var card = JSON.parse(data)
			ShowCard(card, "#player-cards")
			cards.player.push(card)
			DisplayValues()
			CheckValue()
		}
	})
}

function Bank(){
	DisableButtons()
	PushCard()
	if (BankValue() < 17){
		BankHit()
	}
	else{
		EndGame()
	}
}

function BankHit(){
	$.ajax({
		type: "post",
		url: urlBlackjack,
		data: {
			controller: "bank-hit"
		},
		success: function(data){
			try {
				var card = JSON.parse(data)
			} catch (error) {
				JsonParseError(error, data);
				return
			}
			cards.bank.push(card)
			ShowCard(card, "#bank-cards");
			DisplayValues()

			if(BankValue() < 17){
				BankHit();
			}
			else{
				EndGame()
			}
		}
	})
}

function EndGame(){
	request = $.ajax({
		type: "post",
		url: urlBlackjack,
		data: {
			controller: "end",
			cards: cards,
			bet: $("#bet").val()
		},
		success: function(data){
			try {
				var data = JSON.parse(data)
			} catch (error) {
				JsonParseError(error, data);
				return
			}
			// code:

			DisplayOutcome(data.win, data.msg)

			EnableButtons()
			$("#hit").hide()
			$("#stand").hide()
			$("#restart").show()
			LoadBalance()
		}
	})
}

// functions
function ShowCard(card, location){
	let htmlIcon, htmlCard;
	switch(card.Color){
		case "Clubs":
			htmlIcon = '<i class="bi bi-suit-club-fill text-dark"></i>'
			break
		case "Spades":
			htmlIcon = '<i class="bi bi-suit-spade-fill text-dark"></i>'
			break
		case "Hearts":
			htmlIcon = '<i class="bi bi-suit-heart-fill text-danger"></i>'
			break
		case "Diamonds":
			htmlIcon = '<i class="bi bi-suit-diamond-fill text-danger"></i>'
			break
	}
	htmlCard = '<h5 class="my-3 text-dark">' + htmlIcon + ' ' + card.Face + '</h5>'

	$(htmlCard).appendTo(location)
}

function CheckValue(){
	if(PlayerValue() >= 21){
		if(PlayerValue() == 21 && cards.player.length == 2){
			Blackjack()
			return;
		}
		else if(PlayerValue() > 21){
			DisableButtons()
		}
		Bank()
	}
}

function DisableButtons(){
	$("#hit").addClass("disabled")
	$("#stand").addClass("disabled")
}

function EnableButtons(){
	$("#hit").removeClass("disabled")
	$("#stand").removeClass("disabled")
}

function BankValue(){
	if(cards == null){
		return 0;
	}
	var value = 0
	for(let i = 0; i < cards.bank.length; i++){
		value += parseInt(cards.bank[i].Value)
	}

	return value
}

function PlayerValue(){
	if(cards == null){
		return 0;
	}

	var value = 0
	for(let i = 0; i < cards.player.length; i++){
		value += parseInt(cards.player[i].Value)
	}

	return value
}

function DisplayValues(){
	$("#bank-value").text(BankValue())
	$("#player-value").text(PlayerValue())
}

function PushCard(){
	if (cache != null){
		cards.bank.push(cache)
		DisplayValues()
		ShowCard(cache, "#bank-cards")
		cache = null;
	}
}

function DisplayOutcome(win, msg){ // win: bool, msg: string
	if (win){
		$("#win").show()
		$("#win-text").text(msg)
		setTimeout(function () {
			$('#win').fadeOut('slow');
		}, 2000);
	}
	else{
		$("#loss").show()
		$("#loss-text").text(msg)
		setTimeout(function () {
			$('#loss').fadeOut('slow');
		}, 2000);
	}
}