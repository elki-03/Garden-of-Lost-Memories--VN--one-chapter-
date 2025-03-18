<?php
session_start();
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Hauptmenü</title>
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
            justify-content: space-evenly;
            align-items: center;
            height: 100vh;
            color: #ffffff;
        }

        h1 {
            margin-top: 20px;
            text-align: center;
            color: #ffffff;
        }

        .menu-container {
            background-color: rgba(255, 255, 255, 0.8);
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
            text-align: center;
            max-width: 400px;
            width: 100%;
            margin-top: 20px;
        }

        .menu-container table {
            width: 100%;
            margin-bottom: 160px;
        }

        .menu-container td {
            padding: 10px;
            border-bottom: 1px solid #ccc;
        }

        .menu-container td a {
            text-decoration: none;
            color: #074521;
        }

        .menu-container td a:hover {
            text-decoration: underline;
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

        .transparent-image {
            position: absolute;
            bottom: 10px;
            left: 10px;
            width: 661px;
            height: 377px;
            /* opacity: 0.5; */
        }
    </style>
</head>
<body>

<audio id="background-music" autoplay loop>
    <source src="hgmusik\Myuu-Daydream.mp3" type="audio/mpeg">
    Ihr Browser unterstützt das Audio-Element nicht.
</audio>

<img src="katetouch.png" alt="Transparent Image" class="transparent-image">

<h1>Hauptmenü</h1>

<div class="menu-container">
    <table>
        <tr>
            <td><a href="kapeins.php">Kapitel 1</a></td>
        </tr>
        <tr>
            <td><a href="ladenseitedavor.php">Zum Spielstand</a></td>
        </tr>
    </table>
    <form action="logout.php" method="post">
        <button type="submit" name="logout" class="logout-button">Logout</button>
    </form>
</div>

</body>
</html>
