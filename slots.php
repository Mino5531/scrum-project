<!--slots.php-->

<?php
session_start()
?>

<HTML>
 <HEAD>
	 <TITLE>Slots Game</TITLE>
 </HEAD>


 <BODY>
	 <?php
	 # Verbindung zur Datenbank aufbauen
	 require ("inc.php");
	 $con = mysqli_connect($host, $user, $passwd, $datenbank)
	 or die ("Fehler: " . mysqli_connect_error());
	 ?>
	 
	 <p> Slots drehen, um zu gewinnen! </p> 
	 <p> Ihr Gewinn ist abhängig davon, wie viele gleiche Symbole Sie ziehen </p>
	 
	 </br>
	 </br>
	 
	 <?php
	 # zufällige Auswahl der Slot-Ergebnisse
	 # der Variablenname 'result' wird im Folgenden als Ausgabe eines einzelnen Slots verwendet
	 $allSlotResults = [];
	 for ($i=1; $i<=3; $i++) {
		 echo ("$i . Slot:");
		 ?>
		 
		 </br>
		 
		 <?php 
		 # mögliche Slot-Ergebnisse Zufallszahl zwischen 1 und 7
		 $possibleSlotResults = range(1, 7);
		 shuffle($possibleSlotResults);
		 $result = array_shift($possibleSlotResults);
		 
		 echo ("</br> $result </br> </br>");
		 
		 array_push ($allSlotResults, $result);
		 ?>

		 </br>
		 </br>
		 
	 <?php
	 }
	 
	 # Ergebnisse werden sortiert (aufsteigend)
	 asort($allSlotResults);
	 
	 $result1 = array_shift($allSlotResults);
	 $result2 = array_shift($allSlotResults);
	 $result3 = array_shift($allSlotResults);
	 
	 # Vergleich der Slots -> Anzahl der gleichen Slots
	 $anzahlGleicheSlots = 0;
	 
	 if ($result1 == $result2) {
		  if ($result1 == $result3) {
			  $anzahlGleicheSlots = 3;
		  }
		  else {
			  $anzahlGleicheSlots = 2;
		  }
	 }
	 elseif ($result2 == $result3) {
		  $anzahlGleicheSlots = 2;
	 }
	 
	 echo ("$anzahlGleicheSlots Ihrer Slots zeigen das gleiche Symbol");
	 
	 # abhängig von der Anzahl der gleichen Slots wird ein GewinnFaktor definiert, mit dem der mögliche Gewinn multipliziert wird
	 if ($anzahlGleicheSlots == 0) {
		  $gewinnFaktor = 0;
	 }
	 elseif ($anzahlGleicheSlots == 2) {
		  $gewinnFaktor = 0.1;

	 }
	 elseif ($anzahlGleicheSlots == 3) {
		  $gewinnFaktor = 1;
	 }
	 
#### USERID MUSS NOCH ZU SESSIONID GEÄNDERT WERDEN
# Zeile 92 statt 93 verwenden
	 # $SESSION_userID = $_SESSION['UserID'];
	 $SESSION_userID = 1;
	 
	 # Definition des größt möglichen Gewinns
	 $qMoeglicherGewinn = "SELECT Gewinn FROM Game WHERE gameID=2";
	 $resMoeglicherGewinn = mysqli_query($con, $qMoeglicherGewinn);
	 
		 $row = mysqli_fetch_assoc($resMoeglicherGewinn); 
		 if(!$row) {
			echo "no rows\n";
		 }
		 $moeglicherGewinn = $row["Gewinn"];
	 
	 # Definition des Einsatzes
	 $qEinsatz = "SELECT Mindesteinsatz FROM Game WHERE gameID=2";
	 $resEinsatz = mysqli_query($con, $qEinsatz);
	 
		 $row = mysqli_fetch_assoc($resEinsatz); 
		 if(!$row) {
			echo "no rows\n";
		 }
		 $einsatz = $row["Mindesteinsatz"];
	 
	 # Definition des alten Kontostands
	 $qKontostand = "SELECT Kontostand FROM User WHERE UserID=$SESSION_userID";
	 $resKontostand = mysqli_query($con, $qKontostand);
	 
		 $row = mysqli_fetch_assoc($resKontostand); 
		 if(!$row) {
			echo "no rows\n";
		 }
		 $alterKontostand = $row["Kontostand"];
	
	 # Definition Gewinn und neuer Kontostand	 
	 $gewinn = $moeglicherGewinn * $gewinnFaktor;
	 
	 $neuerKontostand = $alterKontostand - $einsatz + $gewinn;
	 
	 echo ("</br>Sie gewinnen $gewinn €");
		 
	 $qNeuerKontostand = "UPDATE User SET `Kontostand`=$neuerKontostand WHERE UserID=$SESSION_userID";
	 mysqli_query($con, $qNeuerKontostand);
	 
	 ?>
	 
	 </br></br>
	 <a href="/slots.php">Erneut spielen</a>
	 
	 
 </BODY>
</HTML>
