<HTML>
<HEAD>
	<meta charset = "utf-8"/>
 <TITLE>Lotto 6 aus 49</TITLE>
</HEAD>
<BODY>
<H1>Die Gewinnzahlen</H1>

<?php
#Verbindung mit der Datenbank
require ("inc.php");
  $mysqlconnection = mysqli_connect($host,$user,$passwd,$datenbank) or 
    die("Die Datenbank ist momentan nicht erreichbar! ");


	# x wird in diesem Code als hochzählbare Variable für for-Schleifen genutzt

	$Zahl1 = $_POST["zahl1"];
	$Zahl2 = $_POST["zahl2"];
	$Zahl3 = $_POST["zahl3"];
	$Zahl4 = $_POST["zahl4"];
	$Zahl5 = $_POST["zahl5"];
	$Zahl6 = $_POST["zahl6"];
	
	$getippteZahlen = [$Zahl1, $Zahl2, $Zahl3, $Zahl4, $Zahl5, $Zahl6] ;
	$alleRichtige = [];
	$Ende = false;
	$gewonnenerPreis = 0;

	#Überprüfung Doppelte
	$set = [];
	foreach ($getippteZahlen as $zahl)
	{
		if (in_array($zahl, $set)) 
		{
			echo("Ihre ausgewählten Zahlen waren nicht einzigartig. Bitte wählen Sie neu.");
			$Ende = true;
			break;
		}
		
		else 
		{
			$set[] = $zahl; 
		}
	}

	
	if ($Ende == false) #falls keine Zahl doppelt war
	{
				
		#Zufallszahlen
		$alleZahlen = range (1,49);
		shuffle ($alleZahlen);
		
		$lottoZahlen = array_slice($alleZahlen, 0,6);
		sort($lottoZahlen);
		
		for ($x = 0; $x < 6; $x++  )
		{
			$y = $x +1;
			echo "Die $y. Lottozahl ist $lottoZahlen[$x] <BR>";
		}

		#Überprüfung der Übereinstimmungen
		for($x=0; $x<6; $x++)
		{
			if(in_array($getippteZahlen[$x] ,$lottoZahlen))
			{
			array_push ($alleRichtige, $getippteZahlen[$x]);
			}
		}
		
		#Ausgabe der Richtigen
		if (count($alleRichtige) >  0)
		{
			echo ("</BR>Ihre Richtigen:</BR>");
	
		
			for ($x=0; $x<count($alleRichtige); $x++)
			{
				echo ("$alleRichtige[$x] ");
			}

			#Preisberechnung
			$qgewinn = "SELECT Gewinn FROM game WHERE GameID = 1";
		  
			$Hauptgewinn= mysqli_query($mysqlconnection, $qgewinn);
		  
					$row = mysqli_fetch_assoc($Hauptgewinn); 
					if(!$row) {
						echo "no rows\n";
					}
					$gewinn = $row["Gewinn"];
							
			
			if (count($alleRichtige) ==  2)
			{
				$gewonnenerPreis = $gewinn / 62500; 
			}
			
			if (count($alleRichtige) ==  3)
			{
				$gewonnenerPreis = $gewinn / 15625;
			}
			
			if (count($alleRichtige) ==  4)
			{
				$gewonnenerPreis = $gewinn / 2000;
			}
			
			if (count($alleRichtige) ==  5)
			{
				$gewonnenerPreis = $gewinn / 50;
			}
			
			if (count($alleRichtige) ==  6)
			{
				$gewonnenerPreis = $gewinn;
			}
			
			if (count($alleRichtige) > 1)
			{
			echo ("<BR> <BR> Sie haben $gewonnenerPreis € gewonnen!");
			}	
		}
		
		if ((count($alleRichtige)) ==0 or (count($alleRichtige)) ==1 )
		{
				echo ("<BR> <BR>Sie haben leider nichts gewonnen!");
		}
	}
		
		#Kontostand aktualisieren
		$qKonto = " SELECT Kontostand FROM User WHERE UserID = 1 ";
		$resKonto= mysqli_query($mysqlconnection, $qKonto);
				
				$row = mysqli_fetch_assoc($resKonto); 
				if(!$row) {
					echo "no rows\n";
				}
				$Kontostand = $row["Kontostand"];
				
		$qEinsatz = " SELECT Mindesteinsatz FROM Game WHERE Name = 'Lotto'";
		$resEinsatz= mysqli_query($mysqlconnection, $qEinsatz);
				
				$row = mysqli_fetch_assoc($resEinsatz); 
				if(!$row) {
					echo "no rows\n";
				}
				$Einsatz = $row["Mindesteinsatz"];
				
				$neuerKontostand = $Kontostand - $Einsatz + $gewonnenerPreis;
				
		
		$qneuerStand = "UPDATE User SET `Kontostand` =$neuerKontostand WHERE UserID = 1";
	 
		$Einsatz= mysqli_query($mysqlconnection, $qneuerStand);			



?>	

<BR>
<BR>
<BR>
<BR>

<A HREF="lotto.html" NAME="x">neue Zahlen auswählen</A>
</BODY>

</HTML>
