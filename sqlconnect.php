<?php
$host = "127.0.0.1";
$user = "root";
$pw = "";
$db = "gardenproject";

$con = mysqli_connect($host, $user, $pw, $db);

if (!$con) {
    die("Verbindung fehlgeschlagen: " . mysqli_connect_error());
}
?>