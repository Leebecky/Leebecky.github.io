<?php
    /* //? connection string to mysql database
        $con=mysqli_connect("localhost", "root", "", "dictionary", "3306");
    //?  checks Connection to database and returns an error message (if necessary)
    if (mysqli_connect_errno()) {
        echo "Failed to connect to MySQL:" . mysqli_connect_error();
    }
    $Letter = ["A", "B"];
    for ($i=0; $i < count($Letter) ; $i++) { 
      
        $sql = "SELECT DISTINCT word FROM entries WHERE word LIKE '$Letter[i]%'";
        $result = mysqli_query($con, $sql);
        // $wordCollection = [];
        while ($row = mysqli_fetch_assoc($result))  {
            $wordCollection[] = $row["word"];
        }
    } 

    var_dump($wordCollection);
    echo count($wordCollection); */
    $myArray = ["instructor"=>"John", "subject"=>"PHP Programming", "fee"=>"250.00"];
    $myArray2 = array("instructor"=>"John", "subject"=>"PHP Programming", "fee"=>"250.00");
    var_dump($myArray);
    echo $myArray["instructor"];
    var_dump($myArray2);
?>