<?php
session_start();
// var_dump($_SESSION);

include("sqlconnect.php");

function loadSavedProgress($user_id, $con) {
    $sql = "SELECT gespeicherte_textstelle FROM user_progress WHERE userID = $user_id";
    $erg = mysqli_query($con, $sql);

    if (mysqli_num_rows($erg) > 0) {
        return mysqli_fetch_assoc($erg)['gespeicherte_textstelle'];
    } else {
        return 'noch kein Spielstand vorhanden';
    }
}

$user_id = $_SESSION['user_id'];
$gespeicherte_textstelle = loadSavedProgress($user_id, $con);
$exploded_result = explode('_', $gespeicherte_textstelle);
$kapitel = $exploded_result[0];
$abschnitt = isset($exploded_result[1]) ? $exploded_result[1] : null;

$sql = "SELECT gesamtspieldauer FROM spielzeit";
$zeit = mysqli_query($con, $sql);

if (mysqli_num_rows($zeit) > 0) {
    $spielzeit = mysqli_fetch_assoc($zeit)['gesamtspieldauer'];
} else {
    $spielzeit = 'noch keine Spielzeit vorhanden';
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Spielstand laden</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #000000;
            background-size: cover;
            margin: 0;
            padding: 0;
            background-repeat: no-repeat;
            background-attachment: fixed;
            background-position: center;
            display: flex;
            flex-direction: column;
            align-items: center;
            height: 100vh;
            color: #ffffff;
            justify-content: center;
        }

        h1 {
            margin-top: 20px;
            text-align: center;
            color: #ffffff;
        }

        .message-box {
            background-color: rgba(255, 255, 255, 0.8);
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
            text-align: center;
            max-width: 600px;
            width: 100%;
            margin-top: 20px;
        }

        .message-box p {
            margin: 10px 0;
            color: #000000;
        }

        .buttons-container {
            display: flex;
            flex-direction: column;
            align-items: center;
            margin-top: 20px;
        }

        .buttons-container button,
        .buttons-container a {
            margin: 10px;
            padding: 10px 20px;
            font-size: 16px;
            border-radius: 5px;
            background-color: #074521;
            color: white;
            border: none;
            cursor: pointer;
            text-decoration: none;
            text-align: center;
        }

        .buttons-container button:hover,
        .buttons-container a:hover {
            background-color: #94e18b;
        }

        .logout-button {
            position: absolute;
            top: 10px;
            right: 10px;
            padding: 10px 20px;
            font-size: 16px;
            border-radius: 5px;
            background-color: #074521;
            color: white;
            border: none;
            cursor: pointer;
        }

        .logout-button:hover {
            background-color: #94e18b;
        }
    </style>
</head>
<body>

<h1>Spielstand laden</h1>

<div class="message-box">
    <p><?php echo "Kapitel " . $kapitel . ", Abschnitt " . $abschnitt . "<br>"; ?></p>
    <p><?php echo "Spielzeit: " . $spielzeit; ?></p>
</div>

<div class="buttons-container">
    <a href="laden.php">Spielstand laden</a>
</div>

</body>
</html>
