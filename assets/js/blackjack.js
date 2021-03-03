const url = "assets/php/blackjack.php"
const datatype = ""
var request, cards, cache


$("#hit").click(function(){
	if(cards == null){
		StartGame()
	}
	else{
		Hit()
	}
})

$("#stand").click(function(){
	Bank()
})

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
			cards = JSON.parse(data)

			cache = cards.bank.pop()

			for(i = 0; i < cards.player.length; i++){
				ShowCard(cards.player[i], "#player-cards")
			}

			ShowCard(cards.bank[0], "#bank-cards")

			DisplayValues()
		}
	})
	$("#hit").text("Hit")
	$("#stand").show()
	CheckValue()
}

function Hit() {
	request = $.ajax({
		type: "post",
		url: url,
		data: {
			controller: "player-hit",
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

function Bank(){
	DisableButtons()
	console.log(cards.bank)
	cards.bank.push(cache)
	ShowCard(cards.bank[1])
	BankHit()
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
			var card = JSON.parse(data)
			cards.bank.push(card)
			ShowCard(card, "#bank-cards");
			DisplayValues()

			if(BankValue() < 17){
				BankHit();
			}
		}
	})
}

function EndGame(){
	request = $.ajax({
		type: "post",
		url: url,
		data: {
			controller: "end"
		}
	})

	request.done(function(data, status){
		if (status == "success"){
			console.log(data)
		}
	})
}

// functions
function ShowCard(card, location){
	let htmlIcon, htmlCard;
	switch(card.color){
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
	htmlCard = '<h5 class="my-3 text-dark">' + htmlIcon + ' ' + card.number + '</h5>'

	$(htmlCard).appendTo(location)
}

function CheckValue(){
	const htmlBlackjack = "<p class='text-success mt-4'>Blackjack!</p>"
	const htmlOvershoot = "<p class='text-danger mt-4'>Bust! Your cards are worth more than 21</p>"

	if(PlayerValue() >= 21){
		if(PlayerValue() == 21){
			$("#buttons").after(htmlBlackjack)
		}
		else{
			$("#buttons").after(htmlOvershoot)
		}
	}
	Bank();
}

function DisableButtons(){
	$("#hit").addClass("disabled")
	$("#stand").addClass("disabled")
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