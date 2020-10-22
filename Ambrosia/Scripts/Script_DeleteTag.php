<?php
include("Script_Connection.php");
$TagID = $_GET["TagID"];

$sql = "DELETE FROM tags WHERE TagID = '$TagID'";
if (!mysqli_query($con, $sql)) {
    echo '<script>alert("This tag is currently in use! Tags in use cannot be deleted!");
    window.location.href="../Admin - Tag Manager.php";</script>';
    return;
}
header("Location: ../Admin - Tag Manager.php");
?>