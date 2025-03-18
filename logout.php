<?php
session_start();

 
   // $_POST['logout'];

    session_unset();
    session_destroy();
    $_SESSION="";

    header("Location: login.php");
    exit(); 
?>
