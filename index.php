<?php
require_once 'database/connection.php';
session_start();
if (isset($_POST['login'])) {
    $username = $_POST['username'];
    $password = $_POST['password'];
    $connection = getConnection();
    $sql = "SELECT * FROM lecturer WHERE username = ?";
    $statement = $connection->prepare($sql);
    $statement->execute([$username]);
    $user = $statement->fetch(PDO::FETCH_ASSOC);
    if ($user) {
        if (password_verify($password, $user['password'])) {
            $_SESSION['lecturername'] = $user['lecturer_name'];
            $_SESSION['username'] = $user['username'];
            $_SESSION['login'] = true;
            header('Location: dosen/dashboard.php');
            exit;
        } else {
            $message = "Incorrect password";
        }
    } else {
        $message = "Username not found";
    }
}

if (isset($_SESSION['login'])) {
    header('Location: dosen/dashboard.php');
    exit;
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Attendance Management</title>
</head>
<body>
    <div class="container">
        <div class="container2">
            <form action="" method="post">
                <label for="username">Username : </label><br>
                    <input type="text" name="username" id="username"><br>
                <label for="password">Password : </label><br>
                    <input type="password" name="password" id="password"><br>
                <input type="submit" value="Login" name="login">
                <p>Don't have an account? <b><a href="login/register.php">Register</a></b></p>
            </form>
        </div>
    </div>
    <?php if (isset($message)) : ?>
        <p style="color: red;"><?= $message?></p>
    <?php endif; ?>
</body>
</html>