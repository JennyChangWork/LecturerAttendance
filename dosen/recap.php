<?php
require_once '../database/connection.php';
if (!isset($_GET['id_class'])) {
    echo 'Class not found';
    exit;
}
$idClass = $_GET['id_class'];
$connection = getConnection();
$sqlRecap = "SELECT student.student_name,
                SUM(CASE WHEN attendance.status = 'present' THEN 1 ELSE 0 END) as present,
                SUM(CASE WHEN attendance.status = 'permission' THEN 1 ELSE 0 END) as permission,
                SUM(CASE WHEN attendance.status = 'absent' THEN 1 ELSE 0 END) as absent,
                COUNT(attendance.id_attendance) AS total
            FROM attendance JOIN student ON attendance.id_student = student.id_student 
            WHERE attendance.id_class = ? 
            GROUP BY attendance.id_student";
$statement = $connection->prepare($sqlRecap);
$statement->execute([$idClass]);
$recap = $statement->fetchAll(PDO::FETCH_ASSOC);
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Attendance Management</title>
</head>
<body>
    <table>
        <tr>
            <td>No</td>
            <td>Name</td>
            <td>Present</td>
            <td>Permission</td>
            <td>Absent</td>
            <td>Percentage</td>
        </tr>
        <?php foreach ($recap as $i => $row): ?>
            <tr>
                <td><?= $i + 1?></td>
                <td><?= htmlspecialchars($row['student_name']) ?></td>
                <td><?= $row['present'] ?></td>
                <td><?= $row['permission']?></td>
                <td><?= $row['absent']?></td>
                <td><?= number_format($row['present']/$row['total']*100, 2)?>%</td>
            </tr>
        <?php endforeach;?>
    </table>
</body>
</html>