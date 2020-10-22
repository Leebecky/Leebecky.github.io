<?php
    include("Script_Connection.php");
    //^ Script to Delete User when the Admin clicks the Delete User button
    $Details = $_POST["ID"];
    $sqlUserManager = "DELETE FROM user_account WHERE UserID = '$Details'";
    mysqli_query($con, $sqlUserManager);
    header("Location: ../Admin - User Manager.php"); 
?>