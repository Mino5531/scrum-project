<?php
session_destroy();
header("Location: landing.html");
setcookie("email", $email, time()- 3600);
setcookie("password", $password, time() - 3600);
header("location:landing.html");
?>