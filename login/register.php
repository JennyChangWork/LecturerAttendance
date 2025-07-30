<?php
    require_once '../database/connection.php';
    if (isset($_POST['create'])) {
        $username = $_POST['username'];
        $password = $_POST['password'];
        $lecturername = $_POST['lecturername'];
        $email = $_POST['email'];
        $passwordVerify = $_POST['passwordverify'];
        $connection = getConnection();

        if (trim($username) && trim($password) && trim($passwordVerify) && trim($lecturername) && trim($email)  != ""){
            if ($password == $passwordVerify) {
                $checkUserSql = "SELECT * FROM lecturer WHERE username = ?";
                $statement = $connection->prepare($checkUserSql);
                $statement->execute([$username]);
                $user = $statement->fetch(PDO::FETCH_ASSOC);
                if ($user) {
                    $message = "Username is already taken. Please choose another";
                } else {    
                    $hashedPassword = password_hash($password, PASSWORD_DEFAULT);
                    $connection = getConnection();
                    $sql = "INSERT INTO lecturer (username, password, lecturer_name, lecturer_email) VALUES (?, ?, ?, ?)";
                    $statement = $connection->prepare($sql);
                    if ($statement->execute([$username, $hashedPassword, $lecturername, $email])) {
                        $message = "Account created successfully";
                        header("Location: ../index.php");
                    } else {
                        $message = "Failed to create account. Please try again";
                    }
                }
            } else {
                $message = "Passwords do not match";
            }
        }
        else {
            $message = "Please fill in all fields";
        }
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
    <form action="" method="post">
        <label for="lecturername">Name : </label><br>
            <input type="text" name="lecturername" id="lecturername"><br>
        <label for="email">Email : </label><br>
            <input type="email" name="email" id="email"><br>
         <label for="username">Username : </label><br>
            <input type="text" name="username" id="username"><br>
        <label for="password">Password : </label><br>
            <input type="password" name="password" id="password"><br>
        <label for="passwordverify">Password verification : </label><br>
            <input type="password" name="passwordverify" id="passwordverify"><br>
        <input type="submit" value="Create Account" name="create">
    </form>
    <?php if (isset($message)) : ?>
        <p style="color: red;"><?= $message?></p>
    <?php endif; ?>
</body>
</html>