<?php 
   include("Script_Connection.php");
   $Type = $_POST["PostType"];
   
        //^ General Post Details
   $Title = mysqli_real_escape_string($con, $_POST["PostTitle"]);
   $PublishDate =  mysqli_real_escape_string($con, $_POST["Date"]);
   $Author =  mysqli_real_escape_string($con, $_POST["Author"]);
   $Desc =  mysqli_real_escape_string($con, $_POST["Desc"]);
 
   //^ Checks that the General Details has been filled
    if ($Title == "" || $Author == "" || $Desc == "") {
        echo '<script>alert("Sorry, an eror was encountered! Please ensure that the correct format was used when filling in the fields.");
         window.location.href="../Admin - Post Manager.php";</script>';
        return;
    }

    //^ Input collected depends on the type of Post to be made
   if ($Type == "Recipes") {
       $Steps = mysqli_real_escape_string($con, $_POST["RecipeSteps"]);
       $Ing = mysqli_real_escape_string($con, $_POST["RecipeIng"]);
       $Tags = $_POST["PostTagsAR"];
   } else if ($Type == "Articles") {
       $Content = mysqli_real_escape_string($con, $_POST["ContentInput"]);
       $Tags = $_POST["PostTagsAR"];
  } else if ($Type == "Classes") {
       $ClassIng = mysqli_real_escape_string($con, $_POST["RecipeIng"]);
       $Tags = $_POST["PostTags"];
       $ClassType = $_POST["ClassType"];
        $VideoLink = mysqli_real_escape_string($con, $_POST["VideoLink"]);
    } 

    //^ Function converts the input string into an array then to a JSON to store in MYSQL
    function ArrayThis($Input) {

        $RemoveTags = str_replace(["<h4>", "</h4>", "<li>", "</li>"], ["*", "", "|", ""], $Input);
        $RemoveFront = ltrim($RemoveTags, "*");
        $ExplodeArray = explode("*", $RemoveFront); //? Splits the string into an array
            foreach ($ExplodeArray as $NextLevel) {
                //? Splits the string within the array into a collection of arrays
                $MultiArray[] = explode("|", $NextLevel); 
            }
        return json_encode($MultiArray, JSON_HEX_APOS); //? Encodes ' as u0027
    }

      //^ Insert statement to specific tables
    if ($Type == "Recipes") {
        $ID = 0;
        $RecipeIngJson = ArrayThis($Ing);
        $RecipeStepsJson = ArrayThis($Steps);
        do {
            //? Auto generate the ID of the post based on the existing row and 
            //? loop until no error occurs (in case of gaps between IDs)
            $ID += 1;
            $sqlCheckId = "Select RecipeID from recipes";
            $result = mysqli_query($con, $sqlCheckId);
          if (mysqli_num_rows($result) < 9) {
           $RecipeID = "R00". (mysqli_num_rows($result) + $ID);
            } else {
            $RecipeID = "R0". (mysqli_num_rows($result) + $ID);
            }
       
            $Sql = "INSERT INTO recipes (RecipeID, Title, Description, Ingredients, Steps, PublishDate, Author, Tags)
            VALUES ('$RecipeID', '$Title', '$Desc', '$RecipeIngJson', '$RecipeStepsJson', '$PublishDate', '$Author', '$Tags')";
            if (!mysqli_query($con, $Sql)) {
                echo mysqli_error($con);
                echo '<script>alert(Sorry, an error was encountered while attempting to save the recipe! Please ensure that all 
                fields has been filled according to the correct format.");
                window.location.href="../Admin - Post Manager.php";</script>';
                return;
            }
        } while (mysqli_affected_rows($con) == -1);
        $PostID = $RecipeID;
        $Preview = "Script_RecipePost.php?Recipe=" .$RecipeID;
    } 
    else if ($Type == "Articles") {
        $ID = 0;
         $ArticleJson = ArrayThis($Content);
        do {
            
            $ID += 1;
            $sqlCheckId = "Select ArticleID from articles";
            $result = mysqli_query($con, $sqlCheckId);
            if (mysqli_num_rows($result) < 9) {
           $ArticleID = "A00". (mysqli_num_rows($result) + $ID);
            } else {
            $ArticleID = "A0". (mysqli_num_rows($result) + $ID);
            }
            $Sql = "INSERT INTO articles (ArticleID, Title, Description, Content, Author, PublishDate, Tags)
            VALUES ('$ArticleID', '$Title', '$Desc', '$ArticleJson', '$Author', '$PublishDate', '$Tags')";
            if (!mysqli_query($con, $Sql)) {
                echo mysqli_error($con);
                echo '<script>alert(Sorry, an error was encountered while attempting to save the article! Please ensure that all 
                fields has been filled according to the correct format.");
                window.location.href="../Admin - Post Manager.php";</script>';
                return;
            }
        } while (mysqli_affected_rows($con) == -1);
        $Preview = "Script_ArticlePost.php?Article=".$ArticleID;
        $PostID = $ArticleID;
}
    else if ($Type == "Classes") {
        $ClassIngJson = ArrayThis($ClassIng);
      
        $ID = 0;
        do {        
            $ID += 1;
            $sqlCheckId = "Select ClassID from classes";
            $result = mysqli_query($con, $sqlCheckId);
            if (mysqli_num_rows($result) < 9) {
                $ClassID = "C00". (mysqli_num_rows($result) + $ID);
                 } else {
                 $ClassID = "C0". (mysqli_num_rows($result) + $ID);
                 }
            
            $Sql = "INSERT INTO classes (ClassID, Title, Description, Ingredients, VideoLink, Author, PublishDate, Type, Tags)
         VALUES ('$ClassID', '$Title', '$Desc', '$ClassIngJson', '$VideoLink', '$Author', '$PublishDate',
         '$ClassType','$Tags')";
        if (!mysqli_query($con, $Sql)) {
            echo mysqli_error($con);
            echo '<script>alert(Sorry, an error was encountered while attempting to save the class! Please ensure that all 
            fields has been filled according to the correct format.");
            window.location.href="../Admin - Post Manager.php";</script>';
            return;
        }
    } while (mysqli_affected_rows($con) == -1);
    $PostID = $ClassID;
    $Preview = "Script_ClassPost.php?Classes=".$ClassID;
}
    // TODO Change the hrefs
     //? If the preview button was clicked, redirect to the appropriate page
        // ! No way to navigate back ATM
        if (isset($_POST["PreviewBtn"])) {
            echo '<script>window.location.href="'.$Preview.'";</script>';
        } else { //? Else, back to Post Manager
            echo '<script>window.location.href="../Admin - Post Manager.php"; 
            alert("'.$PostID.' has been saved!");</script>'; 
        }
?>