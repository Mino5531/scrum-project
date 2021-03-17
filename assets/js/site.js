$(document).ready(LoadData)
const urlSite = "assets/php/site.php"

function LoadData(){
	LoadBalance()
	LoadUserData()
}

function LoadUserData(){
	$.ajax({
		type: "get",
		url: urlSite,
		data: {
			controller: "user"
		},
		success: function(data){
			try {
				var username = JSON.parse(data)
			} catch(error){
				JsonParseError(error, data)
				return
			}
			DisplayUsername(username)
		}
	}).done(function() {
		console.log("second success")
	}).fail(function() {
		console.log("ajax call failed")
	}).always(function() {
		console.log("complete");
	})
}

function DisplayUsername(username){
	$("#username").text(username)
}

function LoadBalance(){
	$.ajax({
		type: "get",
		url: urlSite,
		data: {
			controller: "balance",
		},
		success: function(json){
			try {
				var data = JSON.parse(json)
			} catch(error){
				JsonParseError(error, json)
				return
			}
			DisplayBalance(data.balance)
			DisplayHistory(data.history)
		}
	}).done(function() {
		console.log("second success")
	}).fail(function() {
		console.log("ajax call failed")
	}).always(function(){
		console.log("complete")
	})
}

function DisplayBalance(balance){
	$("#balance").text(balance + "$")
}

function DisplayHistory(transactions){
	var recentTransactions = document.querySelector("#recent-transactions")

	recentTransactions.innerHTML = ""

	for(let i = 0; i < transactions.length; i++){
		var history = transactions[i];

		date = stringifyDate(history.date)

		// dropdown item
		var item = document.createElement("a")
		item.className = "dropdown-item d-flex align-items-center"

		// container
		var container = document.createElement("div")
		container.className = "fw-bold"

		// Type
		var textContainer = document.createElement("div")
		textContainer.className = "text-truncate"
		var type = document.createElement("span")
		type.innerText = history.type
		textContainer.appendChild(type)
		container.appendChild(textContainer)

		// amount & date
		var paragraph = document.createElement("p")
		paragraph.className = "small text-gray-500 mb-0"
		paragraph.innerText = history.amount + "$ · " + date
		container.appendChild(paragraph)

		item.appendChild(container)
		recentTransactions.appendChild(item)
	}
}

function AjaxError(status){
	console.error("ajax call was unsuccessfull! \n\nstatus: " + status)
}

function JsonParseError(error, data){
	console.error("json could not be parsed! \n\nerror: " + error + "\n\nphp: " + data)
}

function stringifyDate(datetime){
	var date = Date.parse(datetime) / 1000
	var now = Date.parse(new Date()) / 1000

	var timestamp = now - date

	var elapsed = {
		weeks: Math.floor(timestamp / 604800),
		days: Math.floor(timestamp / 86400),
		hours: Math.floor(timestamp / 3600),
		minutes: Math.floor(timestamp / 60)
	}

	if (elapsed.weeks > 0){
		return elapsed.weeks + "w"
	}
	else if (elapsed.days > 0){
		return elapsed.days + "d"
	}
	else if (elapsed.hours > 0){
		return elapsed.hours + "h"
	}
	else if (elapsed.minutes > 0){
		return elapsed.minutes + "min"
	}
	else{
		return "now"
	}
}