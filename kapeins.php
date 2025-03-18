<?php
session_start();
//var_dump($_SESSION);

include("sqlconnect.php");

$_SESSION['start_time'] = date('Y-m-d H:i:s');

function saveProgress($user_id, $aktuelle_textstelle, $con) {
    $sql = "UPDATE progress SET aktuelle_textstelle = '$aktuelle_textstelle' WHERE userID = $user_id";
    if (mysqli_query($con, $sql)) {
        return true;
    } else {
        return false;
    }
}

function getTextSection($kapitel, $abschnitt, $con) {
    $sql = "SELECT content, kapitel_id FROM kapitel WHERE kapitel = $kapitel AND abschnitt = $abschnitt";
    $result = mysqli_query($con, $sql);

    if (mysqli_num_rows($result) > 0) {
        return mysqli_fetch_assoc($result);
    } else {
        return null;
    }
}

 function getCharaktereForSection($kapitel_id, $con) {
    $sql = "SELECT charaktere.bildpfad 
            FROM charaktere 
            INNER JOIN kapitel_charaktere 
            ON charaktere.charaktere_id = kapitel_charaktere.charaktereID 
            WHERE kapitel_charaktere.kapitelID = $kapitel_id";
    $result = mysqli_query($con, $sql);

    $bildpfade = [];
    if (mysqli_num_rows($result) > 0) {
         while ($row = mysqli_fetch_assoc($result)) {
            $bildpfade[] = $row['bildpfad'];
        }
    }
    return $bildpfade;
}

function getCharaktereForSection2($kapitel_id, $con) {
    $sql = "SELECT charaktere.bildpfad 
            FROM charaktere 
            INNER JOIN kapitel_charaktere2 
            ON charaktere.charaktere_id = kapitel_charaktere2.charaktereID 
            WHERE kapitel_charaktere2.kapitelID = $kapitel_id";
    $result = mysqli_query($con, $sql);

    $bildpfade2 = [];
    if (mysqli_num_rows($result) > 0) {
         while ($row2 = mysqli_fetch_assoc($result)) {
            $bildpfade2[] = $row2['bildpfad'];
        }
    }
    return $bildpfade2;
}

function getBackground($kapitel_id, $con) {
    $sql = "SELECT hg.hg_pfad 
            FROM hg 
            INNER JOIN kapitel_hg 
            ON hg.hg_id = kapitel_hg.hgID 
            WHERE kapitel_hg.kapitelID = $kapitel_id";
    $result = mysqli_query($con, $sql);

    if (mysqli_num_rows($result) > 0) {
        return mysqli_fetch_assoc($result)['hg_pfad'];
    } else {
        return null;
    }
}

function getBGMusic($kapitel_id, $con) {
    $sql = "SELECT hgmusik.hgmusikpfad 
            FROM hgmusik 
            INNER JOIN kapitel_hgmusik 
            ON hgmusik.hgmusik_id = kapitel_hgmusik.hgmusikID 
            WHERE kapitel_hgmusik.kapitelID = $kapitel_id";
    $result = mysqli_query($con, $sql);

    if (mysqli_num_rows($result) > 0) {
        return mysqli_fetch_assoc($result)['hgmusikpfad'];
    } else {
        return null;
    }
}

function loadProgress($user_id, $con) {
    $sql = "SELECT aktuelle_textstelle FROM progress WHERE userID = $user_id";
    $result = mysqli_query($con, $sql);

    if (mysqli_num_rows($result) > 0) {
        return mysqli_fetch_assoc($result)['aktuelle_textstelle'];
    } else {
        // Wenn kein Fortschritt gefunden wurde, gib einen Default-Wert zurück
        return '1_1'; // Beispiel für Kapitel 1, Abschnitt 1
    }
}

$user_id = $_SESSION['user_id'];

if ($_SERVER['REQUEST_METHOD'] === 'POST' && isset($_POST['naechste_textstelle'])) {
    // Beim Klicken auf den "Weiter"-Button: Fortschritt speichern
    $aktuelle_textstelle = $_POST['naechste_textstelle'];
    $_SESSION['textstelle'] = $aktuelle_textstelle;
    saveProgress($user_id, $aktuelle_textstelle, $con);
} else {
    // Beim ersten Laden oder anderen GET-Anfragen: Fortschritt laden oder auf den gespeicherten Fortschritt setzen
    $aktuelle_textstelle = loadProgress($user_id, $con);
    $_SESSION['textstelle'] = $aktuelle_textstelle;
}

$exploded_result = explode('_', $aktuelle_textstelle);
$kapitel = $exploded_result[0];
$abschnitt = isset($exploded_result[1]) ? $exploded_result[1] : null;

$textSection = getTextSection($kapitel, $abschnitt, $con);
$content = $textSection['content'];
$kapitel_id = $textSection['kapitel_id'];

$charaktere = getCharaktereForSection($kapitel_id, $con);
$charaktere2 = getCharaktereForSection2($kapitel_id, $con);
$hg = getBackground($kapitel_id, $con);
$hgmsk = getBGMusic($kapitel_id, $con);

?>

<!DOCTYPE html>
<html lang="de">
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="gardenstyle.css">
    <title>Visual Novel</title>
    <style>
            body {
                <?php if (!empty($hg)): ?>
                background-image: url("<?php echo $hg; ?>");
                <?php endif; ?>
            }
    </style>
</head>
<body>

<!-- Musik-Player -->

<audio id="background-music" autoplay loop>
<?php if (!empty($hgmsk)): ?>
    <source src="<?php echo $hgmsk; ?>" type="audio/mpeg">
    <?php endif; ?>
    Ihr Browser unterstützt das Audio-Element nicht.
</audio>



<div class="bigbox">
    <div class="charaktere-bilder">
        <?php if (!empty($charaktere)): ?>
            <?php foreach ($charaktere as $bildpfad): ?>
                <img src="<?php echo $bildpfad; ?>" alt="Bild">
            <?php endforeach; ?>
        <?php else: ?>
            <div style="width: 100px;"></div> <!-- Platzhalter für Bilder links -->
        <?php endif; ?>
    </div>

    <div id="novel">
        <div class="abschnitt">
            <?php echo $content; ?>
        </div>
        <?php if ($content !== null && getTextSection($kapitel, $abschnitt + 1, $con) !== null): ?>
            <form method="post">
                <input type="hidden" name="naechste_textstelle" value="<?php echo $kapitel . '_' . ($abschnitt + 1); ?>">
                <button type="submit">>></button>
            </form>
        <?php else: ?>
            <p>Keine weiteren Textstellen vorhanden.</p>
            <?php
            echo "Du wirst in 3 Sekunden weitergeleitet";
            echo '<meta http-equiv="refresh" content="3;url=landing.php">';
           endif; ?>
    </div>

    <div class="charaktere-bilder2">
        <?php if (!empty($charaktere2)): ?>
            <?php foreach ($charaktere2 as $bildpfad2): ?>
                <img src="<?php echo $bildpfad2; ?>" alt="Bild">
            <?php endforeach; ?>
        <?php else: ?>
            <div style="width: 100px;"></div> <!-- Platzhalter für Bilder rechts -->
        <?php endif; ?>
    </div>
</div>
<a href="speichern.php" class="menu-button">Menü</a>

</body>
</html>
<?php
mysqli_close($con);
?>
