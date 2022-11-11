<?php

if(!isset($_SESSION['user'])){
    header("Location: $base_url/register.php");   
}