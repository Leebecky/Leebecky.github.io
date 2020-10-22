<?php 
    include("Script_Connection.php");

    $UserID = $_POST["IdUser"];
    $ClassID = $_POST["IdClass"];
    $sqlRefund = "DELETE FROM subscription WHERE UserID = '$UserID' AND ClassID = '$ClassID'";
    mysqli_query($con, $sqlRefund);
    header("Location: ../Admin - Payment Manager.php");

?>