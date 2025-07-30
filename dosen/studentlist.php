<?php
require_once '../database/connection.php';
if (!isset($_GET['id_class'])) {
    echo 'Class not found';
    exit;
}

$idClass = $_GET['id_class'];
$connection = getConnection();

$statement = $connection->prepare("SELECT class_name FROM class WHERE id_class = ?");
$statement->execute([$idClass]);
$className = $statement->fetchColumn();

$sql = "SELECT student.id_student, student.student_name FROM student JOIN student_class ON student.id_student = student_class.id_student JOIN class ON class.id_class = student_class.id_class WHERE class.id_class = ?";
$statement = $connection->prepare($sql);
$statement->execute([$idClass]);
$students = $statement->fetchAll(PDO::FETCH_ASSOC);

if ($_SERVER['REQUEST_METHOD'] == "POST") {
    $date = $_POST["date"];
    foreach ($_POST['status'] as $idStudent => $status) {
        $sql = "INSERT INTO attendance (id_class, id_student, date, status) VALUES (?, ?, ?, ?)";
        $statement = $connection->prepare($sql);
        $statement->execute([$idClass, $idStudent, $date, $status]);
    }
    header("Location: dashboard.php");
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
        <h3><?= $className ?></h3>
        <input type="date" name="date" id="date" required>
        <table>
            <tr>
                <td>No</td>
                <td>Name</td>
                <td>Present</td>
                <td>Permission</td>
                <td>Absent</td>
            </tr>
            <?php foreach ($students as $i => $student): ?>
                <tr>
                    <td><?= $i + 1?></td>
                    <td><?= htmlspecialchars($student['student_name']) ?></td>
                    <td><input type="radio" name="status[<?= $student['id_student']?>]" value="present"></td>
                    <td><input type="radio" name="status[<?= $student['id_student']?>]" value="permission"></td>
                    <td><input type="radio" name="status[<?= $student['id_student']?>]" value="absent"></td>
                </tr>
            <?php endforeach;?>
        </table>
        <button type="submit">Submit</button>
    </form>
</body>
</html>