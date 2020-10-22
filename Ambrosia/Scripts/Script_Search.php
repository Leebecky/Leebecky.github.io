<div id="SearchDiv">
<?php 	
	$sqlR = "SELECT Title, RecipeID FROM recipes"; 
	$sqlA = "SELECT Title, ArticleID FROM articles";
	$sqlC = "SELECT Title, ClassID FROM classes WHERE NOT TYPE ='Upcoming'";
	$resultR = mysqli_query($con, $sqlR);
	$resultA = mysqli_query($con, $sqlA);
	$resultC = mysqli_query($con, $sqlC);

  while ($rowR = mysqli_fetch_assoc($resultR)) {
    $SearchTitle = $rowR["Title"];
    $SearchID = $rowR["RecipeID"];

    echo '<div id="SearchResultsDiv" class="SearchResults">
        <a href="Scripts/Script_RecipePost.php?Recipe='.$SearchID.'"><img src="Images/Recipes/'.$SearchTitle.'"></a>
        <a class="ResultName" href="Scripts/Script_RecipePost.php?Recipe='.$SearchID.'">'.$SearchTitle.'</a>
        <input type="hidden" id="HiddenBox" class="HiddenInput" value="'.$SearchTitle.'">
    </div>';
}
  while ($rowA = mysqli_fetch_assoc($resultA)) {
    $SearchTitle = $rowA["Title"];
    $SearchID = $rowA["ArticleID"];

    echo '<div class="SearchResults">
        <a href="Scripts/Script_ArticlePost.php?Article='.$SearchID.'"><img src="Images/Articles/'.$SearchTitle.'"></a>
        <a class="ResultName" href="Scripts/Script_ArticlePost.php?Article='.$SearchID.'">'.$SearchTitle.'</a>
        <input type="hidden" id="HiddenBox" class="HiddenInput" value="'.$SearchTitle.'">
    </div>';
}
  while ($rowC = mysqli_fetch_assoc($resultC)) {
    $SearchTitle = $rowC["Title"];
    $SearchID = $rowC["ClassID"];

    echo '<div class="SearchResults">
        <a href="Scripts/Script_ClassPost.php?Classes='.$SearchID.'"><img src="Images/Classes/'.$SearchTitle.'"></a>
        <a class="ResultName" href="Scripts/Script_ClassPost.php?Classes='.$SearchID.'">'.$SearchTitle.'</a>
        <input type="hidden" id="HiddenBox" class="HiddenInput" value="'.$SearchTitle.'">
    </div>';
}
?>
</div>