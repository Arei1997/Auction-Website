<?php

if(!isset($_SESSION['user'])){
    header("Location: register.php");   
}