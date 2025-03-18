<?php
// Session starten und Session-Daten anzeigen
session_start();
// var_dump($_SESSION);

// Datenbankverbindungsparameter
include("sqlconnect.php");

// Funktion zum Speichern des Spielstands
function saveGameState($user_id, $gespeicherte_textstelle, $con) {
    // Überprüfen, ob die Textstelle leer ist
    if (empty($gespeicherte_textstelle)) {
        echo "Textstelle ist leer";
        return false;
    }
    
    // Textstelle in Kapitel und Abschnitt aufteilen
    $exploded_result = explode('_', $gespeicherte_textstelle);
    if (count($exploded_result) !== 2) {
        echo "Ungültiges Format für aktuelle Textstelle";
        return false;
    }
    
    // Kapitel und Abschnitt zuweisen
    list($kapitel, $abschnitt) = $exploded_result;
    // Kapitel-ID abrufen
    $kapitelID = getKapitelID($kapitel, $abschnitt, $con);

    if ($kapitelID) {
        // Überprüfen, ob es bereits einen Fortschritt für diesen Benutzer gibt
        $check_sql = "SELECT * FROM user_progress WHERE userID = $user_id";
        $check_result = mysqli_query($con, $check_sql);

        if ($check_result && mysqli_num_rows($check_result) > 0) {
            // Eintrag existiert, also aktualisieren wir ihn
            $sql = "UPDATE user_progress SET gespeicherte_textstelle = '$gespeicherte_textstelle', kapitelID = $kapitelID WHERE userID = $user_id";
        } else {
            // Kein Eintrag vorhanden, also erstellen wir einen neuen
            $sql = "INSERT INTO user_progress (userID, gespeicherte_textstelle, kapitelID) VALUES ($user_id, '$gespeicherte_textstelle', $kapitelID)";
        }
        
        // Abfrage ausführen und Ergebnis überprüfen
        if (mysqli_query($con, $sql)) {
            return true;
        } else {
            echo "Fehler beim Speichern des Spielstands: " . mysqli_error($con);
            return false;
        }
    } else {
        echo "Kapitel-ID nicht gefunden";
        return false;
    }
}

// Funktion zum Abrufen der Kapitel-ID
function getKapitelID($kapitel, $abschnitt, $con) {
    $sql = "SELECT kapitel_id FROM kapitel WHERE kapitel = '$kapitel' AND abschnitt = '$abschnitt'";
    $erg = mysqli_query($con, $sql);

    if ($erg) {
        if (mysqli_num_rows($erg) > 0) {
            return mysqli_fetch_assoc($erg)['kapitel_id'];
        } else {
            return null;
        }
    } else {
        echo "Fehler beim Ausführen der SQL-Abfrage: " . mysqli_error($con);
        return null;
    }
}

// Überprüfen, ob erforderliche Session-Daten gesetzt sind
if (!isset($_SESSION['start_time']) || !isset($_SESSION['user_id'])) {
    die("Nicht eingeloggt oder erforderliche Session-Daten nicht gesetzt.");
}

$user_id = $_SESSION['user_id'];
$aktuelle_textstelle = isset($_SESSION['textstelle']) ? $_SESSION['textstelle'] : '';
$feedback = '';

// Überprüfen, ob das Formular abgeschickt wurde und die aktuelle Textstelle gesetzt ist
if (isset($_POST['aktuelle_textstelle']) && !empty($_POST['aktuelle_textstelle'])) {
    // POST-Daten sind gültig, also speichern wir den Spielstand
    $gespeicherte_textstelle = $_POST['aktuelle_textstelle'];
    
    if (saveGameState($user_id, $gespeicherte_textstelle, $con)) {
        $feedback = "Speichern erfolgreich";
    } else {
        $feedback = "Speichern nicht erfolgreich";  
    }
} else {
    // Falls die aktuelle Textstelle nicht gesetzt oder leer ist
    //$feedback = "Aktuelle Textstelle ist nicht gesetzt oder leer";
}

$datumzeit_ein = $_SESSION['start_time'];
$datumzeit_aus = date('Y-m-d H:i:s');
$spieldauer = strtotime($datumzeit_aus) - strtotime($datumzeit_ein);

// Überprüfen, ob ein Fortschrittseintrag für den Benutzer existiert
$sql_progress = "SELECT user_progress_id FROM user_progress WHERE userID='$user_id' LIMIT 1";
$erg_progress = mysqli_query($con, $sql_progress);

if (!$erg_progress) {
    die("Fehler bei der Abfrage: " . mysqli_error($con));
}

// Wenn kein Eintrag vorhanden ist, einen neuen erstellen
if (mysqli_num_rows($erg_progress) > 0) {
    $row_progress = mysqli_fetch_assoc($erg_progress);
    $_SESSION['user_progress_id'] = $row_progress['user_progress_id'];
} else {
    // Neuen Eintrag in user_progress erstellen
    $sql_insert_progress = "INSERT INTO user_progress (userID, gespeicherte_textstelle, kapitelID) VALUES ('$user_id', '$aktuelle_textstelle', NULL)";
    if (mysqli_query($con, $sql_insert_progress)) {
        $_SESSION['user_progress_id'] = mysqli_insert_id($con);
    } else {
        die("Fehler beim Erstellen des Fortschrittseintrags: " . mysqli_error($con));
    }
}

$user_progress_id = $_SESSION['user_progress_id'];

// Gesamtspieldauer abrufen und aktualisieren
$sql_get_total = "SELECT gesamtspieldauer FROM spielzeit WHERE user_progressID='$user_progress_id' ORDER BY spielzeit_id DESC LIMIT 1";
$erg = mysqli_query($con, $sql_get_total);
$gesamtspieldauer = 0;

if (mysqli_num_rows($erg) > 0) {
    $row = mysqli_fetch_assoc($erg);
    $gesamtspieldauer = $row['gesamtspieldauer'];
}

$neue_gesamtspieldauer = $gesamtspieldauer + $spieldauer;

// Spielzeit in die Datenbank einfügen
$sql_spielzeit = "INSERT INTO spielzeit (user_progressID, datumzeit_ein, datumzeit_aus, spieldauer, gesamtspieldauer)
                 VALUES ('$user_progress_id', '$datumzeit_ein', '$datumzeit_aus', '$spieldauer', '$neue_gesamtspieldauer')";

if (mysqli_query($con, $sql_spielzeit)) {
    // echo "Spielzeit erfolgreich gespeichert!";
} else {
    echo "Error: " . $sql_spielzeit . "<br>" . mysqli_error($con);
}

// Verbindung zur Datenbank schließen
mysqli_close($con);

// Funktion zum Formatieren der Zeit in Stunden und Minuten
function formatTime($seconds) {
    $hours = floor($seconds / 3600);
    $minutes = floor(($seconds % 3600) / 60);
    return sprintf('%02d:%02d', $hours, $minutes);
}

$formatted_spieldauer = formatTime($spieldauer);
$formatted_gesamtspieldauer = formatTime($neue_gesamtspieldauer);
?>

<!DOCTYPE html>
<html lang="de">
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="gardenstyle.css">
    <title>Speichern des Spielstands</title>
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

        #feedback {
            background-color: rgba(255, 255, 255, 0.8);
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            width: 80%;
            max-width: 400px;
            text-align: center;
            color: #000000;
        }

        .styledbox {
            background-color: rgba(255, 255, 255, 0.8);
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            width: 80%;
            max-width: 400px;
            text-align: left;
            margin-top: 20px;
            color: #000000;
        }

        form {
            margin-top: 20px;
        }

        button {
            padding: 10px 20px;
            font-size: 16px;
            background-color: #074521;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }

        button:hover {
            background-color: #94e18b;
        }

        a {
            margin-top: 20px;
            padding: 10px 20px;
            font-size: 16px;
            border-radius: 5px;
            background-color: #074521;
            color: white;
            border: none;
            text-decoration: none;
            cursor: pointer;
        }

        a:hover {
            background-color: #94e18b;
        }
    </style>
</head>
<body>

<div id="feedback">
    <form method="post">
        <input type="hidden" name="aktuelle_textstelle" value="<?php echo htmlspecialchars($aktuelle_textstelle, ENT_QUOTES, 'UTF-8'); ?>">
        <button type="submit">Speichern</button>
        <?php 
        echo $feedback;
        if ($feedback == "Speichern erfolgreich" || $feedback == "Speichern nicht erfolgreich") {
            echo "Du wirst in 3 Sekunden weitergeleitet";
            echo '<meta http-equiv="refresh" content="3;url=landing.php">';
        }
        ?>
    </form>
</div>

<div class="styledbox">   
    <p><?php echo "Anfang der aktuellen Spielsession: " . $datumzeit_ein . "<br>"; ?></p>
    <p><?php echo "Ende der aktuellen Spielsession: " . $datumzeit_aus . "<br>"; ?></p>
    <p><?php echo "Dauer der aktuellen Spielsession: " . $formatted_spieldauer . "<br>"; ?></p>
    <p><?php echo "Gesamte Spielzeit: " . $formatted_gesamtspieldauer; ?></p>
</div>

<a href="landing.php">Hauptmenü</a>

</body>
</html>
