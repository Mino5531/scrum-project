const url = "assets/php/blackjack.php"
const datatype = ""
var request;
var cards;


$("#draw-card").click(function(){
	if(cards == null){
		StartGame()
	}
	else{
		DrawCard()
	}
})

function StartGame(){
	if ($("#bet").val() == null){
		alert("Bitte geben Sie einen Einsatz ein")
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
			var data = JSON.parse(data);
			
			cards = data
			for(i = 0; i < cards.player.length; i++){
				ShowCard(cards.player[i], "#player-cards")
			}

			ShowCard(cards.bank[0], "#bank-cards")

			DisplayValues()
		}
	})
	$("#draw-card").text("Weitere Karte ziehen")
	CheckValue()
}

function DrawCard() {
	request = $.ajax({
		type: "post",
		url: url,
		data: {
			controller: "player-draw-card",
		}
	})

	request.done(function(data, status){
		if (status == "success"){
			var card = JSON.parse(data)
			ShowCard(card, "#player-cards")
			cards.player.push(card)
			DisplayValues()
			CheckValue()
		}
	})
}

function BankDrawCards(){
	ShowCard(cards.bank[1]);

	while(BankValue() < 17){
		request = $.ajax({
			type: "post",
			url: url,
			data: {
				controller: "bank-draw-card"
			}
		})

		request.done(function(data, status){
			if (status == "success"){
				var card = JSON.parse(data)
				cards.bank.push(card)
				ShowCard(card, "#bank-cards");
				DisplayValues()
			}
		})
	}
}

// functions
function ShowCard(card, location){
	let htmlIcon, htmlCard;
	switch(card.color){
		case "Clubs":
			//
		case "Spades":
			//
		case "Hearts":
			htmlIcon = "<i class='fas fa-heart'></i>"
		case "Diamonds":
			//
	}
	htmlCard = "<p>" + htmlIcon + " " + card.number + "</p>"

	$(htmlCard).appendTo(location)
}

function CheckValue(){
	const htmlBlackjack = "<p class='text-success mt-2'>Du hast einen Blackjack!</p>"
	const htmlOvershoot = "<p class='text-danger mt-2'>Verloren! Du bist über einem Kartenwert von 21 </p>"

	if(PlayerValue() >= 21){
		$("#draw-card").addClass("disabled")
		if(PlayerValue() == 21){
			$("#draw-card").after(htmlBlackjack)
		}
		else{
			$("#draw-card").after(htmlOvershoot)
		}
	}
}

function BankValue(){
	if(cards == null){
		return 0;
	}
	var value = 0
	for(let i = 0; i < cards.bank.length; i++){
		value += cards.bank[i].value
	}

	return value
}

function PlayerValue(){
	if(cards == null){
		return 0;
	}

	var value = 0
	for(let i = 0; i < cards.player.length; i++){
		value += cards.player[i].value
	}

	return value
}

function DisplayValues(){
	$("#bank-value").text(BankValue())
	$("#player-value").text(PlayerValue())
}