<?php 
    include("Script_Connection.php");
    $UserID = $_SESSION["UserID"];
    $sqlLoadSettings = "SELECT * FROM user_account WHERE UserID = '$UserID'";

    $result = mysqli_query($con, $sqlLoadSettings);

    $row = mysqli_fetch_assoc($result); //returns an array of the selected row
    $FullName = $row["FullName"];
    $Email = $row["Email"];
    $PhoneNum = $row["PhoneNumber"];
    $Address = $row["Address"];
    $Newsletter = $row["Newsletter"];
    $CardNum = $row["CardNumber"];
    $SecurityQ = $row["SecurityQuestion"];
    $SecurityA = $row["SecurityAnswer"];
    $Theme = $row["Theme"];
  
    mysqli_close($con);
?>