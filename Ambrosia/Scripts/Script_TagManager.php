<?php 
    include("Script_Connection.php");
    $TagName = $_POST["HiddenTag"];

    $id = 0;
    do {
    $sqlSelect = "SELECT TagID FROM tags";
    $result = mysqli_query($con, $sqlSelect);
    $id++;

    if (mysqli_num_rows($result) < 9 ) {
        $TagID = "T00". (mysqli_num_rows($result)+ $id);
    } else {
        $TagID = "T0". (mysqli_num_rows($result)+ $id);
    } 
    
    $sql = "INSERT INTO tags (TagID, Name) VALUES
    ('$TagID','$TagName')";
    mysqli_query($con, $sql);
} while (mysqli_affected_rows($con) == "-1");

mysqli_close($con);
header("Location: ../Admin - Tag Manager.php");
?>