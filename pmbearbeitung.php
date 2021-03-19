<?php
	session_start();
    if(!isset($_SESSION['login_user']) || !isset($_SESSION['user-id'])){
        header('location: login.html');
    }
    
    
	require ("inc.php");
	$mysqlconnection = mysqli_connect($host,$user,$passwd,$datenbank) or 
    die("Die Datenbank ist momentan nicht erreichbar! ");
    
    
	$kartennr = $_POST["kartennummer"];
	$ablaufdatum = $_POST["ablaufdatum"];
	$cvv = $_POST["cvv"];
	$rAdresse = $_POST["rechnungsadresse"];
	$rName = $_POST["rechnungsname"];
	
	$status = "not selected";
	
	$SESSION_userID = $_SESSION['user-id'];
	#$SESSION_userID = 1;
	
	if (isset ($_POST ["loeschen"])){
		$status = $_POST ["loeschen"];
	}
	
	$hinzufuegedatum = date("Y.m.d");
	
	$SESSION_kartenId = $_POST["kartenid"];
	
	if ($status == 0)
	{
		$qloeschen = "DELETE FROM `paymentmethod` WHERE `KartenId` = $SESSION_kartenId";
		$resloeschen= mysqli_query($mysqlconnection, $qloeschen);	
	}
	
	if ($status == 1) 
	{

		if ($_POST["kartennummer"]!= NULL) 
		{
			$qkartennr = "UPDATE PaymentMethod SET `Kartennummer`= '$kartennr' WHERE `KartenId` = $SESSION_kartenId";
			mysqli_query($mysqlconnection, $qkartennr);
		}
		
		if ($_POST["ablaufdatum"]!= NULL)
		{
			$qablaufdatum = "UPDATE PaymentMethod SET `Ablaufdatum` ='$ablaufdatum' WHERE `KartenId` = $SESSION_kartenId";
			$resablaufdatum= mysqli_query($mysqlconnection, $qablaufdatum);
		}
		
		if  ($_POST["cvv"]!= NULL)
		{
			$qcvv = "UPDATE PaymentMethod SET `CVV` ='$cvv' WHERE `KartenId` = $SESSION_kartenId";
			$rescvv= mysqli_query($mysqlconnection, $qcvv);
		}
		
		if  ($_POST["rechnungsadresse"]!= NULL) 
		{
			$qrAdresse = "UPDATE PaymentMethod SET `Rechnungsadresse` ='$rAdresse' WHERE `KartenId` = $SESSION_kartenId";
			$resrAdresse= mysqli_query($mysqlconnection, $qrAdresse);
		}
		
		if  ($_POST["rechnungsname"]!= NULL)
		{
			$qrName = "UPDATE PaymentMethod SET `Rechnungsname` ='$rName' WHERE `KartenId` = $SESSION_kartenId";
			$resrName= mysqli_query($mysqlconnection, $qrName);
		}
		
		
		$qhinzufuegedatum = "UPDATE PaymentMethod SET `Hinzufuegedatum` ='$hinzufuegedatum' WHERE `KartenId` = $SESSION_kartenId";
		$reshinzufuegedatum= mysqli_query($mysqlconnection, $qhinzufuegedatum);
	}
	
	if ($status == 2)
	{
		$qhinzufuegen = "INSERT INTO PaymentMethod(`Kartennummer`, `Ablaufdatum`, `CVV`, `Rechnungsadresse`, `Rechnungsname`, `Hinzufuegedatum`, `UserID`) VALUES ( '$kartennr','$ablaufdatum','$cvv','$rAdresse', '$rName','$hinzufuegedatum',$SESSION_userID)";
		$reshinzufuegen= mysqli_query($mysqlconnection, $qhinzufuegen);	

	}
	
	
	
	
	
?>
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
    <title>Payment History - Sloterino</title>
    <link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.12.0/css/all.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="assets/fonts/fontawesome5-overrides.min.css">
    <link rel="stylesheet" href="assets/css/profile.css">
    <link rel="stylesheet" href="assets/css/untitled.css">
</head>

<body id="page-top">
    <div id="wrapper">
        <nav class="navbar navbar-dark align-items-start sidebar sidebar-dark accordion bg-gradient-primary p-0">
            <div class="container-fluid d-flex flex-column p-0"><a class="navbar-brand d-flex justify-content-center align-items-center sidebar-brand m-0" href="#">
                    <div class="sidebar-brand-icon"><i class="fab fa-viacoin"></i></div>
                    <div class="sidebar-brand-text mx-3"><span>Sloterino</span></div>
                </a>
                <hr class="sidebar-divider my-0">
                <ul class="navbar-nav text-light" id="accordionSidebar">
                    <li class="nav-item"><a class="nav-link" href="index.html"><i class="fa fa-gamepad"></i><span>Games</span></a></li>
                    <li class="nav-item"><a class="nav-link" href="profile.html"><i class="fas fa-user"></i><span>Profile</span></a></li>
                    <li class="nav-item"></li>
                    <li class="nav-item"></li>
                    <li class="nav-item"></li>
                </ul>
                <div class="text-center d-none d-md-inline"><button class="btn rounded-circle border-0" id="sidebarToggle" type="button"></button></div>
            </div>
        </nav>
        <div class="d-flex flex-column" id="content-wrapper">
            <div id="content">
                <nav class="navbar navbar-light navbar-expand bg-white shadow mb-4 topbar static-top">
                    <div class="container-fluid"><button class="btn btn-link d-md-none rounded-circle me-3" id="sidebarToggleTop" type="button"><i class="fas fa-bars"></i></button>
                        <ul class="navbar-nav flex-nowrap ms-auto">
                            <li class="nav-item dropdown d-sm-none no-arrow"><a class="dropdown-toggle nav-link" aria-expanded="false" data-bs-toggle="dropdown" href="#"><i class="fas fa-search"></i></a>
                                <div class="dropdown-menu dropdown-menu-end p-3 animated--grow-in" aria-labelledby="searchDropdown">
                                    <form class="me-auto navbar-search w-100">
                                        <div class="input-group"><input class="bg-light form-control border-0 small" type="text" placeholder="Search for ...">
                                            <div class="input-group-append"><button class="btn btn-primary py-0" type="button"><i class="fas fa-search"></i></button></div>
                                        </div>
                                    </form>
                                </div>
                            </li>
                            <li class="nav-item dropdown no-arrow mx-1">
                                <div class="nav-item dropdown no-arrow"><a class="dropdown-toggle nav-link" aria-expanded="false" data-bs-toggle="dropdown" href="#"></a>
                                    <div class="dropdown-menu dropdown-menu-end dropdown-list animated--grow-in">
                                        <h6 class="dropdown-header">alerts center</h6><a class="dropdown-item d-flex align-items-center" href="#">
                                            <div class="me-3">
                                                <div class="bg-primary icon-circle"><i class="fas fa-file-alt text-white"></i></div>
                                            </div>
                                            <div><span class="small text-gray-500">December 12, 2019</span>
                                                <p>A new monthly report is ready to download!</p>
                                            </div>
                                        </a><a class="dropdown-item d-flex align-items-center" href="#">
                                            <div class="me-3">
                                                <div class="bg-success icon-circle"><i class="fas fa-donate text-white"></i></div>
                                            </div>
                                            <div><span class="small text-gray-500">December 7, 2019</span>
                                                <p>$290.29 has been deposited into your account!</p>
                                            </div>
                                        </a><a class="dropdown-item d-flex align-items-center" href="#">
                                            <div class="me-3">
                                                <div class="bg-warning icon-circle"><i class="fas fa-exclamation-triangle text-white"></i></div>
                                            </div>
                                            <div><span class="small text-gray-500">December 2, 2019</span>
                                                <p>Spending Alert: We've noticed unusually high spending for your account.</p>
                                            </div>
                                        </a><a class="dropdown-item text-center small text-gray-500" href="#">Show All Alerts</a>
                                    </div>
                                </div>
                            </li>
                            <li class="nav-item dropdown no-arrow mx-1">
                                <div class="nav-item dropdown no-arrow"><a class="dropdown-toggle nav-link" aria-expanded="false" data-bs-toggle="dropdown" href="#" style="color: rgb(84,85,96);">43$</a>
                                    <div class="dropdown-menu dropdown-menu-end dropdown-list animated--grow-in">
                                        <h6 class="dropdown-header">Recent Transactions</h6><a class="dropdown-item d-flex align-items-center" href="#">
                                            <div class="fw-bold">
                                                <div class="text-truncate"><span>Game: Lotto</span></div>
                                                <p class="small text-gray-500 mb-0">-54$ · 2w ago</p>
                                            </div>
                                        </a><a class="dropdown-item d-flex align-items-center" href="#">
                                            <div class="fw-bold">
                                                <div class="text-truncate"><span>Game: Roulette</span></div>
                                                <p class="small text-gray-500 mb-0">+13$ · 2w ago</p>
                                            </div>
                                        </a><a class="dropdown-item d-flex align-items-center" href="#">
                                            <div class="fw-bold">
                                                <div class="text-truncate"><span>Deposit</span></div>
                                                <p class="small text-gray-500 mb-0">+100$ · 3w ago</p>
                                            </div>
                                        </a><a class="dropdown-item text-center small text-gray-500" href="#">Show all transactions</a>
                                    </div>
                                </div>
                                <div class="shadow dropdown-list dropdown-menu dropdown-menu-end" aria-labelledby="alertsDropdown"></div>
                            </li>
                            <div class="d-none d-sm-block topbar-divider"></div>
                            <li class="nav-item dropdown no-arrow">
                                <div class="nav-item dropdown no-arrow"><a class="dropdown-toggle nav-link" aria-expanded="false" data-bs-toggle="dropdown" href="#"><span class="d-none d-lg-inline me-2 text-gray-600 small">Username</span><img class="border rounded-circle img-profile" src="assets/img/avatars/avatar1.jpeg"></a>
                                    <div class="dropdown-menu shadow dropdown-menu-end animated--grow-in"><a class="dropdown-item" href="#"><i class="fas fa-user fa-sm fa-fw me-2 text-gray-400"></i>&nbsp;Profile</a><a class="dropdown-item" href="#"><i class="fas fa-cogs fa-sm fa-fw me-2 text-gray-400"></i>&nbsp;Settings</a><a class="dropdown-item" href="#"><i class="fas fa-list fa-sm fa-fw me-2 text-gray-400"></i>&nbsp;Activity log</a>
                                        <div class="dropdown-divider"></div><a class="dropdown-item" href="#"><i class="fas fa-sign-out-alt fa-sm fa-fw me-2 text-gray-400"></i>&nbsp;Logout</a>
                                    </div>
                                </div>
                            </li>
                        </ul>
                    </div>
                </nav>
                <div class="container-fluid">
                    <h3 class="text-dark mb-1">Payment Methods</h3>
                    <P> Payment methods updated!</P>
                    <A HREF="pmausgabe.php" NAME="x">to your payment methods</A>

                </div>
                
            </div>
            <footer class="bg-white sticky-footer">
                <div class="container my-auto">
                    <div class="text-center my-auto copyright"><span>Copyright © Sloterino 2021</span></div>
                </div>
            </footer>
        </div><a class="border rounded d-inline scroll-to-top" href="#page-top"><i class="fas fa-angle-up"></i></a>
    </div>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/5.0.0-beta2/js/bootstrap.bundle.min.js"></script>
    <script src="assets/js/games.js"></script>
    <script src="assets/js/theme.js"></script>
</body>

</html>
