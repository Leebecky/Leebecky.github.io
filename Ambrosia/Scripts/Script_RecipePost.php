<?php
session_start();

	$RecipeID = $_GET["Recipe"];
	
    include("Script_Connection.php");
	// ? Selects and displays the recipe's data
    $sql = "SELECT * FROM recipes WHERE RecipeID = '$RecipeID'";
    $result = mysqli_query($con, $sql);
    $row = mysqli_fetch_assoc($result);
    $Ingredients = json_decode($row["Ingredients"], true);
    $Steps = json_decode($row["Steps"], true);
    $Description = $row["Description"];
	$RecipeTitle = $row["Title"];
	$RecipeID = $row["RecipeID"];

	//? Selects and displays Tag Names in the sidebar
	$sqlTag = "SELECT * FROM tags";
	$resultTag = mysqli_query($con, $sqlTag);

	// ? If user is not logged in, display a warning message
	if (empty($_SESSION["UserID"])) {
		$UserID = "";
		$condition = "Deleted";
		if(isset($_GET["BookmarkBtn"])) {
			$condition = "Invalid";
		}
	}
	 else {
		$UserID = $_SESSION["UserID"];
	
	$sqlCheck = "SELECT * FROM bookmarks WHERE RecipeID = '$RecipeID' AND UserID = '$UserID'";
	$resultCheck = mysqli_query($con, $sqlCheck);
	// ? Checks the database if the recipe has been bookmarked by the user and displays accordingly
	if ((mysqli_affected_rows($con) == 0)) {
		$condition = "Deleted";
	} else if (mysqli_affected_rows($con) == 1) {
		$condition = "Created"; 		
	}

	// ? If the bookmark button was clicked, toggles bookmark in database
	if (isset($_GET["BookmarkBtn"])) {
		
		if (mysqli_affected_rows($con) == 0) {
			$sqlBookmark = "INSERT INTO bookmarks (RecipeID, UserID) VALUES ('$RecipeID', '$UserID')";
		 mysqli_query($con, $sqlBookmark);
			$condition = "Created";
		} else if (mysqli_affected_rows($con) == 1) {
			$sqlDelete = "DELETE FROM bookmarks WHERE RecipeID = '$RecipeID' AND UserID = '$UserID'";
		 	mysqli_query($con, $sqlDelete);
			$condition = "Deleted";
		}
	}
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
	<!-- Style-->
	<link href="../<?php echo $_SESSION['Theme']; ?>" rel="stylesheet" type="text/css">
	<script src="../Ambrosia.js"></script>
	<!-- Font Awesome-->
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.13.1/css/all.css" integrity="sha384-xxzQGERXS00kBmZW/6qxqJPyxW3UR0BPsL4c8ILaIWXva5kFi7TxkIIaMiKtqV1Q" crossorigin="anonymous">
	
	<!-- Google Fonts-->
	<link href="https://fonts.googleapis.com/css2?family=Caveat+Brush&display=swap" rel="stylesheet">
	<link rel="icon" href="../Images/Logo/Ambrosia Logo.ico">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	
	<title><?php echo $RecipeTitle;?></title>
</head>
<body class="PostBody" onload="Bookmarks('<?php echo $condition; ?>')">
	<?php include("HeaderForScripts.php"); ?>
	<!-- Content -->
	<div class="browse-content clearfix"></div>
	
	<!-- Content -->
		<div class="browse-content clearfix">
		
		<!-- Main Content Recipes  -->
			<div id="PostRecipeContent" class="main-content single">
			<!-- Bookmark -->
			<form method="GET" action="Script_RecipePost.php">
			
			<!-- The hidden input contains the RecipeID which is sent through GET
			to Script_RecipePost.php which displays the record according to RecipeID -->
			<input type="hidden" name="Recipe" value="<?php echo $RecipeID;?>">
		
				<input type="submit" name="BookmarkBtn" id="BookmarkBtn" value="">
				<i class="fas fa-bookmark large-icon" id="BookmarkIcon"></i>
				</form>

				<!-- Recipe Content -->
			<h1 class="post-title"><?php echo $RecipeTitle; ?></h1>
            <img class="RecipeImg" src="../Images/Recipes/<?php echo $RecipeTitle; ?>.jpg">
			<p class="RecipeDesc"><?php echo $Description; ?></p>
				<div class="post-content">
                    <div id="Ingredients">
                    <h2>Ingredients</h2>
                    <ul>
						<?php  
							 foreach($Ingredients as $IngType => $IngArray) {
                                echo '<h4>'.$IngArray[0].'</h4>';
                            for ($i=1; $i < count($IngArray); $i++) {
                                echo '<li>'.$IngArray[$i].'</li>';
                            } 
                        }  ?>
                    </ul>
                    </div>

                    <div id="Instructions">
                    <h2>Instructions</h2>
					<ol>
						<?php 
							foreach($Steps as $Section => $StepArray) {
								echo '<h4>'.$StepArray[0].'</h4></ol><ol>';
							for ($i=1; $i < count($StepArray); $i++) {
								$DecodeStep = Decode($StepArray);
							echo '<li>'.$DecodeStep[$i].'</li><br>';
							} 
						} 
						 ?>
                    </ol>
                    </div>
				</div>
			</div>		
		<!-- //Main Content Recipes -->
			
			<!-- Sidebar -->
			<div class="sidebar single">
					<div class="section popular">
						<h2 class="section-title">Popular</h2>
							<ul>
								<?php 
								$sqlSidebar = "SELECT RecipeID, Title FROM recipes WHERE NOT RecipeID = '$_GET[Recipe]' 
								ORDER BY RAND() LIMIT 6";
								$resultSide = mysqli_query($con, $sqlSidebar);
									while ($rowSide = mysqli_fetch_assoc($resultSide)) {
										$SideRecipeID = $rowSide["RecipeID"];
										$SideTitleR = $rowSide["Title"];
										echo '<li><a href="Script_RecipePost.php?Recipe='.$SideRecipeID.'">'.$SideTitleR.'</a></li>';
									}
								?>
							</ul>
					</div>
			
					<div class="section topics">
						<h2 class="section-title">Topics</h2>
							<ul>
								<?php
								//^ Tag filters for recipes
								while ($rowT = mysqli_fetch_assoc($resultTag)) {
									$TagName = $rowT["Name"];
									$TagID = $rowT["TagID"];
									echo '<li><a href="../Main_Recipe Browse.php?TagID='.$TagID.'"
									name="TagList">'.$TagName.'</a></li>';
								}					
								?>
							</ul>
					</div>
			</div>
			<!-- //Sidebar -->
			
		</div>	
	<!-- //Content -->
	
	<!-- Footer -->
	<?php include("../Footer.php"); ?>
	<!-- //Footer -->
	
	<!-- JQuery-->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js" integrity="sha512-bLT0Qm9VnAYZDflyKcBaQ2gg0hSYNQrJ8RilYldYQ1FxQYoCLtUjuuRuZo+fjqhx/qtq/1itJ0C2ejDxltZVFg==" crossorigin="anonymous"></script>
	
	<!-- Slick Carousel-->
	<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
		
	<!-- Custom Script -->
	<script src="../External JS.js"></script>
	
</body>
</html>