<?php 
session_start();
    
    //? Fetches results from user_account/Admin database
    if (isset($_POST["LoginBtn"])) 
    {   include("Script_Connection.php");
        $username = mysqli_real_escape_string($con, $_POST["Username"]);
        $password = mysqli_real_escape_string($con, $_POST["Password"]);
        $sqlAdmin = "SELECT Username, Password from admin where Username = '$username' 
        AND Password = '$password'";
        $Admin = mysqli_query($con, $sqlAdmin);
        
         //^ Admin
        if (mysqli_num_rows($Admin) == 1) {
            header("Location: ../Admin - User Manager.php");
            $_SESSION["Username"] = $username;
            $_SESSION["Admin"] = "AdminLoggedIn";
        } else {
            //^ Users
            $sql = "SELECT UserID, Username, Password, Theme from user_account 
            where Username = '$username' and Password = '$password'";
            $validation = mysqli_query($con, $sql);
            $row = mysqli_fetch_assoc($validation);
            $UserID = $row["UserID"];
            $Theme = $row["Theme"];
        
            //^ There is a result where Username and Password match (for Users)
            if (mysqli_num_rows($validation) == 1) 
            {
                $sqlSecurityQuestion = "SELECT SecurityQuestion from user_account 
                where Username = '$username' AND SecurityQuestion = 0";
                $checkSecurity = mysqli_query($con, $sqlSecurityQuestion);
                if (mysqli_num_rows($checkSecurity) == 1) { 
                    //? If no security question has been set, redirect the user to the Settings page
                    echo '<script>alert("Please set a security password to be able to use the Forgot Password function");
                    window.location.href="../User - Settings.php"; </script>';
                } else {
                    //? If security question has already been set, go straight to the Main page
                    header("Location: ../User - Main.php");
                }

               $_SESSION["Username"] = $username;
               $_SESSION["UserID"] = $UserID;
              
                if ($Theme == "Light") {
                    $_SESSION["Theme"] = "Ambrosia.css";
                } else if ($Theme == "Dark") {
                    $_SESSION["Theme"] = "Ambrosia_Dark_Mode.css";
                }

            } else { //^ Username and Password do not match
               echo '<script>alert("Your username or password was incorrect.");
               window.location.href="../Login.php";</script>';
            }
            mysqli_close($con);
    }}
?>  