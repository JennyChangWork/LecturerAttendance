<?php
function getConnection():PDO 
{
    $host = "localhost";
    $username = "root";
    $port = 3306;
    $password = "";
    $database = "attendacemanagement";
    return new PDO("mysql:host=$host;port=$port;dbname=$database", $username, $password);
}

try {
    $connection = getConnection();
    $connection = null;
} catch (PDOException $exception) {
    echo "Failed connect to database " . $exception->getMessage();
}
?>