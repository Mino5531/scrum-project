// variables

const url = "assets/php/blackjack.php"
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
	if ($("#bet").val() == "" || $("#bet").val() == 0){
		alert("Please enter your bet")
		return
	}
	$("#bet").prop("disabled", true)

	request = $.ajax({
		type: "post",
		url: url,
		data: {
			controller: "start",
			bet: $("#bet").val()
		}
	})

	request.done(function (data, status){
		if (status == "success"){
			try {
				cards = JSON.parse(data)
			} catch (error) {
				jsonParseError(error, data)
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
			CheckValue()
		}
		else{
			ajaxError(status)
			return
		}
	})
}

function Blackjack(){
	request = $.ajax({
		type: "post",
		url: url,
		data: {
			controller: "blackjack",
			cards: cards
		}
	})

	request.done(function(data, status){
		if (status == "success"){
			// code
			try {
				var data = JSON.parse(data);
			} catch (error) {
				jsonParseError(error, data)
				return
			}
			var msg = data.msg
			var balance = data.balance;

			$("#result-msg").text(msg)
		}
		else{
			ajaxError(status)
		}
	})
}

function Hit() {
	PushCard();
	request = $.ajax({
		type: "post",
		url: url,
		data: {
			controller: "player-hit",
		}
	})

	request.done(function(data, status){
		if (status == "success"){
			try {
				var card = JSON.parse(data)
			} catch (error) {
				jsonParseError(error, data)
				return
			}
			var card = JSON.parse(data)
			ShowCard(card, "#player-cards")
			cards.player.push(card)
			DisplayValues()
			CheckValue()
		}
		else{
			ajaxError(status)
			return
		}
	})
}

function Bank(){
	DisableButtons()
	PushCard()
	if (BankValue() < 17){
		BankHit()
	}
	EndGame()
}

function BankHit(){
	request = $.ajax({
		type: "post",
		url: url,
		data: {
			controller: "bank-hit"
		}
	})

	request.done(function(data, status){
		if (status == "success"){
			try {
				var card = JSON.parse(data)
			} catch (error) {
				jsonParseError(error, data);
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
		else{
			ajaxError(status)
			return
		}
	})
}

function EndGame(){
	request = $.ajax({
		type: "post",
		url: url,
		data: {
			controller: "end",
			cards: cards,
			bet: $("#bet").val()
		}
	})

	request.done(function(data, status){
		if (status == "success"){
			try {
				var data = JSON.parse(data)
			} catch (error) {
				jsonParseError(error, data);
				return
			}
			// code:
			var msg = data.msg;
			var balance = data.balance;
			var win = data.win;

			if (win){
				$("#result-msg").addClass("text-success")
			}
			else{
				$("#result-msg").addClass("text-danger")
			}
			$("#result-msg").text(msg)

			EnableButtons()
			$("#hit").hide()
			$("#stand").hide()

			$("#restart").show()
		}
		else{
			ajaxError(status)
			return
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

function ajaxError(status){
	console.error("ajax call was unsuccessfull! \n\nstatus: " + status)
}

function jsonParseError(error, data){
	console.error("json could not be parsed! \n\nerror: " + error + "\n\nphp: " + data)
}

function PushCard(){
	if (cache != null){
		cards.bank.push(cache)
		DisplayValues()
		ShowCard(cache, "#bank-cards")
		cache = null;
	}
}