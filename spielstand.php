<?php
session_start();
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Spielstand</title>
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

        .buttons-container button {
            margin: 10px;
            padding: 10px 20px;
            font-size: 16px;
            border-radius: 5px;
            background-color: #074521;
            color: white;
            border: none;
            cursor: pointer;
        }

        .buttons-container button:hover {
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
<?php
// Verbindung zur Datenbank herstellen
include("sqlconnect.php");

if (!isset($_SESSION['start_time']) || !isset($_SESSION['user_id'])) {
    die("Nicht eingeloggt oder erforderliche Session-Daten nicht gesetzt.");
}

$datumzeit_ein = $_SESSION['start_time'];
$datumzeit_aus = date('Y-m-d H:i:s');
$spieldauer = strtotime($datumzeit_aus) - strtotime($datumzeit_ein);

// progress_id aus der progress-Tabelle abrufen
$user_id = $_SESSION['user_id'];
$sql_progress = "SELECT progress_id FROM progress WHERE userID='$user_id' LIMIT 1";
$erg_progress = mysqli_query($con, $sql_progress);

if (mysqli_num_rows($erg_progress) > 0) {
    $row_progress = mysqli_fetch_assoc($erg_progress);
    $_SESSION['progress_id'] = $row_progress['progress_id'];
} else {
    echo "keine Spielzeit vorhanden";
}

$progress_id = $_SESSION['progress_id'];
$sql_get_total = "SELECT gesamtspieldauer FROM spielzeit WHERE progressID='$progress_id ' ORDER BY spielzeit_id DESC LIMIT 1";
$erg = mysqli_query($con, $sql_get_total);
$gesamtspieldauer = 0;

if (mysqli_num_rows($erg) > 0) {
    $row = mysqli_fetch_assoc($erg);
    $gesamtspieldauer = $row['gesamtspieldauer'];
}

$neue_gesamtspieldauer = $gesamtspieldauer + $spieldauer;

$sql_spielzeit = "INSERT INTO spielzeit (progressID, datumzeit_ein, datumzeit_aus, spieldauer, gesamtspieldauer)
                 VALUES ('$progress_id', '$datumzeit_ein', '$datumzeit_aus', '$spieldauer', '$neue_gesamtspieldauer')";

$message = "";
if (mysqli_query($con, $sql_spielzeit)) {
    $message = "Spielzeit erfolgreich gespeichert!";
} else {
    $message = "Error: " . $sql_spielzeit . "<br>" . mysqli_error($con);
}

mysqli_close($con);
?>

<h1>Spielstand</h1>

<div class="message-box">
    <p><?php echo $message; ?></p>
</div>

<div class="buttons-container">
    <form action="spielstand.php" method="post">
        <input type="hidden" name="user_id" value="123">
        <input type="hidden" name="kapitel" value="1">
        <input type="hidden" name="abschnitt" value="5">
        <button type="submit">Spielstand speichern</button>
    </form>
    <form action="logout.php" method="post">
        <button type="submit" name="logout" class="logout-button">Logout</button>
    </form>
</div>

</body>
</html>
