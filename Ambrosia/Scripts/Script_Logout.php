<?php 
   session_start();

if ($_GET["logout"] == "Logout") {
   session_unset();
   session_destroy();
    Header("Location: ../Login.php");
}
?>