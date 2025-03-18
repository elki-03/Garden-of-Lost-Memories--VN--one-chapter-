<?php
session_start();
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Login</title>
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

        .login-container {
            background-color: #ffffff;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
            text-align: center;
            max-width: 400px;
            width: 100%;
        }

        .login-container form {
            display: flex;
            flex-direction: column;
        }

        .login-container label {
            margin-bottom: 5px;
            text-align: left;
        }

        .login-container input[type="text"],
        .login-container input[type="password"] {
            padding: 10px;
            margin-bottom: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }

        .login-container input[type="submit"],
        .login-container input[type="reset"] {
            padding: 10px;
            margin-top: 10px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            background-color: #074521;
            color: white;
        }

        .login-container input[type="submit"]:hover,
        .login-container input[type="reset"]:hover {
            background-color: #94e18b;
        }

        .login-container a {
            display: block;
            margin-top: 10px;
            color: #074521;
            text-decoration: none;
        }

        .login-container a:hover {
            text-decoration: underline;
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

if (!$con) {
    die("Connection failed: " . mysqli_connect_error());
}

$message = "";

if (isset($_POST['user']) && isset($_POST['pw'])) {
    $user = $_POST["user"];
    $pw = $_POST["pw"];

    $sql = "SELECT * FROM user WHERE username ='$user'";
    $erg = mysqli_query($con, $sql);

    if (mysqli_num_rows($erg) > 0) {
        $row = mysqli_fetch_assoc($erg);
        $hashed = $row['passwort'];

        if (password_verify($pw, $hashed)) {
            $_SESSION['user'] = $row['username'];
            $_SESSION['user_id'] = $row['user_id']; 
            $user_id = $_SESSION['user_id'];
            $message = "Login erfolgreich<br>Du wirst in 3 Sekunden weitergeleitet";
            echo '<meta http-equiv="refresh" content="3;url=landing.php">';
        } else {
            $message = "Falsches Passwort";
        }
    } else {
        $message = "Benutzername nicht gefunden";
    }
}
mysqli_close($con);
?>

<audio id="background-music" autoplay loop>
    <source src="hgmusik\Myuu-Daydream.mp3" type="audio/mpeg">
    Ihr Browser unterstützt das Audio-Element nicht.
</audio>

<h2>Login</h2>
<div class="login-container">
    <?php if ($message != ""): ?>
        <div class="message-box"><?php echo $message; ?></div>
    <?php endif; ?>
    <form action="login.php" method="post">
        <label for="user">Username</label>
        <input type="text" required name="user" id="user" /><br />
        <label for="pw">Passwort</label>
        <input type="password" required name="pw" id="pw" /><br />
        <input type="submit" value="Einloggen" />
        <input type="reset" value="Zurücksetzen" />
    </form>
    <br>
    <a href="registrieren.php">Noch nicht registriert?</a>
</div>

</body>
</html>
