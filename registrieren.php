<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Registrierung</title>
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
            justify-content: center;
            align-items: center;
            height: 100vh;
            flex-direction: column;
        }

        h2 {
            color: #ffffff;
            margin-bottom: 20px;
        }

        .registration-container {
            background-color: #ffffff;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
            text-align: center;
            max-width: 400px;
            width: 100%;
        }

        .registration-container form {
            display: flex;
            flex-direction: column;
        }

        .registration-container label {
            margin-bottom: 5px;
            text-align: left;
        }

        .registration-container input[type="text"],
        .registration-container input[type="password"] {
            padding: 10px;
            margin-bottom: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }

        .registration-container input[type="submit"],
        .registration-container input[type="reset"] {
            padding: 10px;
            margin-top: 10px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            background-color: #074521;
            color: white;
        }

        .registration-container input[type="submit"]:hover,
        .registration-container input[type="reset"]:hover {
            background-color: #94e18b;
        }

        .message-box {
            margin-bottom: 20px;
            padding: 10px;
            background-color: #f0f0f0;
            border: 1px solid #ccc;
            border-radius: 5px;
            color: #074521;
            font-weight: bold;
            text-align: center;
        }
    </style>
</head>
<body>

<?php
$host = "127.0.0.1";
$user = "root";
$pw = "";
$db = "gardenproject";

$con = mysqli_connect($host, $user, $pw, $db);

$message = "";

if (isset($_POST['userreg']) && isset($_POST['pwreg'])) {
    $user = $_POST["userreg"];
    $pw = $_POST["pwreg"];

    if (!$con) {
        die("Verbindung fehlgeschlagen: " . mysqli_connect_error());
    }

    if ($con) {
        $hashed = password_hash($pw, PASSWORD_DEFAULT);

        $sql = "INSERT INTO user (username, passwort) VALUES ('$user', '$hashed')";

        if (mysqli_query($con, $sql)) {
            $message = "Wilkommen, $user, du bist jetzt registriert!<br>Du wirst in 3 Sekunden zur Login-Seite weitergeleitet";
            echo '<meta http-equiv="refresh" content="3;url=login.php">';
        } else {
            $message = "Fehler: " . mysqli_error($con);
        }
    }
    mysqli_close($con);
}
?>

<h2>Registrierung</h2>
<div class="registration-container">
    <?php if ($message != ""): ?>
        <div class="message-box"><?php echo $message; ?></div>
    <?php endif; ?>
    <form action="registrieren.php" method="post">
        <label for="userreg">Username</label>
        <input type="text" required name="userreg" id="userreg" /><br />
        <label for="pwreg">Passwort</label>
        <input type="password" required name="pwreg" id="pwreg" /><br />
        <input type="submit" value="Registrieren" />
        <input type="reset" value="Zurücksetzen" />
    </form>
</div>

</body>
</html>
