<?php

session_start();
$base_url = "http://localhost/login-code";

unset($_SESSION['logged_in']);
unset($_SESSION['account_type']);
setcookie(session_name(), "", time() - 360);
session_destroy();


// Redirect to index
header("Location: $base_url/register.php");

?>