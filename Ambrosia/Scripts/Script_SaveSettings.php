<?php 
session_start();
    include("Script_Connection.php");
    $UserID = $_SESSION["UserID"];
        
    if (isset($UserID)) {
        //^ Setting the Theme
        $Dark = $_POST["EnableDarkMode"];
        $Light = $_POST["EnableLightMode"];

        if ($Dark == "Enabled") {
           $_SESSION["Theme"] = "Ambrosia_Dark_Mode.css";
           $Theme = "Dark";
        } else if ($Light == "Disabled") {
            $_SESSION["Theme"] = "Ambrosia.css";
            $Theme = "Light";
        }

        //^ Changing Passwords
        if ($_POST["CurrentPassword"] != "") {
            $CurrentPass = $_POST["CurrentPassword"];
            $NewPass = $_POST["NewPassword"];
            $ConfirmPass = $_POST["ConfirmNew"];
            $sqlPass = "SELECT Password FROM user_account WHERE UserID = '$UserID'";
            $result = mysqli_query($con, $sqlPass);
            $row = mysqli_fetch_assoc($result);

            if ($CurrentPass == $row["Password"]) {
                if (strlen($NewPass) < 4) {
                    echo '<script>alert("Your password is too short! Please enter a password of at least 4 characters");
                    window.location.href="../User - Settings.php";</script>';
                    exit();
                } else if ($NewPass == $ConfirmPass) {
                    $sqlChangePass = "UPDATE user_account SET Password = '$NewPass' WHERE UserID = '$UserID'";
                    mysqli_query($con, $sqlChangePass);
                } else {
                    echo '<script>alert("New passwords do not match! Changes were not saved.");
                    window.location.href="../User - Settings.php";</script>';
                    exit();
                }
            } else if ($CurrentPass !== $row["Password"]) {
                echo '<script>alert("Current password is incorrect! Changes were not saved.");
                window.location.href="../User - Settings.php";</script>';
                exit();
            }      
    } 

        //^ Profile
        $FullName = $_POST["FullName"];
        $Email = $_POST["Email"];
        $PhoneNum = $_POST["PhoneNo"];
        $Address = $_POST["Address"];
        $CardNum = $_POST["CardNum"];
        $SecurityQ = $_POST["SecurityQ"];
        $SecurityA = $_POST["SecurityA"];
          if ($_POST["NewsletterSub"] == "on") {
            $Newsletter = "1";
        } else {
            $Newsletter = "0";
        }

        if (stripos($Email, "@") === FALSE || stripos($Email, ".com") === FALSE) {
            echo '<script>
            alert("Please ensure that your email address contains @ and .com!");
            window.location.href="../User - Settings.php";
            </script>';
            exit();
        }
        if (ctype_digit($PhoneNum) == FALSE) {
            echo '<script>
            alert("Please ensure that your phone number does not contain any letters!");
            window.location.href="../User - Settings.php";
            </script>';
            exit();
        }

        //^ Forces a security question to be selected
        if ($SecurityQ == 0) {
           echo '<script>
            alert("Please select a security question!");
            window.location.href="../User - Settings.php";
            document.getElementById("SecurityQ").focus();
            </script>';
        exit();
        }

    $sqlSaveSettings = "UPDATE user_account SET FullName = '$FullName',
    Email = '$Email', PhoneNumber = '$PhoneNum', Address = '$Address',
    CardNumber = '$CardNum', Newsletter = '$Newsletter', SecurityQuestion = '$SecurityQ',
    SecurityAnswer = '$SecurityA', Theme = '$Theme' WHERE UserID = '$UserID'";

    if (mysqli_query($con, $sqlSaveSettings)) {
        echo '<script>
        alert("Profile successfully updated!");
        window.location.href="../User - Settings.php";
        </script>';
    }
}
?>