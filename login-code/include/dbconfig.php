<?php


$mysqli = new mysqli("localhost", "root", "", "mydatabase");
$base_url = "http://localhost/login-code";


if ($mysqli -> connect_errno) {
  echo "Failed to connect to MySQL: " . $mysqli -> connect_error;
  exit();
}