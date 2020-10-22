<html>

<body>
    
<form method="GET" action="Scripts/Script_RecipePost.php">
	<div class="post" id="RecipePost">
			<!-- The hidden input contains the RecipeID which is sent through GET
			to Script_RecipePost.php which displays the record according to RecipeID -->
			<input type="hidden" name="Recipe" value="<?php echo $RecipeID;?>">
		
		<input type="Image" src="Images/Recipes/<?php echo $RecipeTitle;?>" 
		alt="<?php echo $RecipeTitle; ?>" class="post-image" name="RecipeImg">
			<div class="post-preview">	

				<h2><button class="PostName" type="submit" name="RecipeName"><?php echo $RecipeTitle; ?>
				</button></h2>
				<i class="far fa-user"><?php echo $Author; ?></i>
				&nbsp;
				<i class="far user"><?php echo $PublishDate; ?></i>
				<p class="preview-text">
					<?php echo $Description; ?>
				</p>
				<button type="submit" class="btn read-more" name="RecipeLink">Read More</button>
			 
			</div>
</form>
	</div>
</body></html>