const url = "assets/php/blackjack.php"
const datatype = ""
var request;


$("#bj-start").click(function(){
	StartGame()
})

var bet = 1

function StartGame(){
	request = $.ajax({
		type: "post",
		url: url,
		data: {
			controller: "start",
			bet: bet
		}
	})

	request.done(function (data, status){
		console.log("Request Status: " + status)
		if (status == "success"){
			var data = JSON.parse(data);

			var card = data
			ShowCard(card)
		}
	})
}

function ShowCard(card){
	var htmlIcon, htmlCard;
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

	$(htmlCard).appendTo("#cards")
}