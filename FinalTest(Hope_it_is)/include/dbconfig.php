<?php


$mysqli = new mysqli("localhost", "mytest", "mypassword", "mydatabase");


if ($mysqli -> connect_errno) {
  echo "Failed to connect to MySQL: " . $mysqli -> connect_error;
  exit();
}