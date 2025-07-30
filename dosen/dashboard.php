<?php
session_start();
require_once '../database/connection.php';
if (!isset($_SESSION['login'])) {
    header("Location: ../index.php");
    exit;
}

$username = $_SESSION["username"];
$connection = getConnection();
$sql = "SELECT * FROM lecturer WHERE username = ?";
$statement = $connection->prepare($sql);    
$statement->execute([$_SESSION['username']]);
$lecturer = $statement->fetch(PDO::FETCH_ASSOC);
$idLecturer = $lecturer['id_lecturer'];
$lecturerName = $lecturer['lecturer_name'];

$sql = 'SELECT class.class_name, class.id_class, class.semester, GROUP_CONCAT(DISTINCT department.department_name SEPARATOR ", ") AS major, class.day, class.time_start, class.time_end FROM class LEFT JOIN class_department ON class.id_class = class_department.id_class LEFT JOIN department ON class_department.id_department = department.id_department WHERE class.id_lecturer = ? GROUP BY class.id_class ORDER BY class.semester';
$statement = $connection->prepare($sql);
$statement->execute([$idLecturer]);
$class = $statement->fetchAll();

$today = "Monday";
$sqlTooday = "SELECT * FROM class WHERE id_lecturer = ? AND day = ?";
$statement = $connection->prepare($sqlTooday);
$statement->execute([$idLecturer , $today]);
$todayClass = $statement->fetchAll();

?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Attendance Managements</title>
</head>
<body>
    <h1>Welcome, <?= $_SESSION['lecturername'];?></h1>
    <h4>Today Class</h4>
    
    <table border="1">
        <tr>
            <th>No</th>
            <th>Class</th>
            <th>Time Start</th>
            <th>Time End</th>
            <th>Student</th>
        </tr>
        <?php if (count($todayClass) > 0) : ?>
            <?php foreach ($todayClass as $i => $row) : ?>
            <tr>
                <td><?= $i + 1?></td>
                <td><?= htmlspecialchars($row['class_name'])?></td>
                <td><?= htmlspecialchars($row['time_start'])?></td>
                <td><?= htmlspecialchars($row['time_end'])?></td>
                <td><a href="studentlist.php?id_class=<?=$row['id_class']?>">Click Here</a></td>
            </tr>
            <?php endforeach ?>
        <?php else : ?> 
            <tr> <td colspan="5">No classes today</td></tr>
            <?php endif; ?>
    </table>

    <h4>All Class</h4>
    <table border="1">
        <tr>
            <th>No</th>
            <th>Class</th>
            <th>Semester</th>
            <th>Major</th>
            <th>Day</th>
            <th>Time Start</th>
            <th>Time End</th>
            <th>Recap</th>
        </tr>
        <?php if (count($class) > 0): ?>
            <?php foreach ($class as $i => $row): ?>
                <tr>
                    <td><?= $i + 1 ?></td>
                    <td><?= htmlspecialchars($row['class_name']) ?></td>
                    <td><?= htmlspecialchars($row['semester']) ?></td>
                    <td><?= htmlspecialchars($row['major']) ?></td>
                    <td><?= htmlspecialchars($row['day']) ?></td>
                    <td><?= htmlspecialchars(string: $row['time_start']) ?></td>
                    <td><?= htmlspecialchars($row['time_end']) ?></td>
                    <td><a href="recap.php?id_class=<?=$row['id_class']?>">Click Here</a></td>
                </tr>
            <?php endforeach ?>
        <?php else: ?>
            <tr><td colspan="4">-</td></tr>
        <?php endif ?>
    </table>
    <a href="../login/logout.php">Logout</a>
</body>
</html>