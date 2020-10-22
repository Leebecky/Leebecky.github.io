<!-- The Image and Title are both hyperlinks -->
<html>
	<div id="SubscribedClass" class="<?php echo $Tag; ?>">
		<form method="GET" action="Scripts/Script_ClassPost.php">
		<input type="Image" src="Images/Classes/<?php echo $ClassTitle; ?>"
			alt="<?php echo $ClassTitle;?>" class="ClassImage" name="ClassImg">

		<!-- The hidden input contains the ClassID which is sent via GET to
			Script_ClassPost.php -->
			<input type="hidden" name="Classes" value="<?php echo $ClassID;?>">

			<h4><button class="RecipeName" type="submit" name="ClassName"><?php echo $ClassTitle; ?>
			</button></h4>
		</form>

		<div class="Class-info">
			<i class="far fa-user"><?php echo $Author; ?></i>
			<i class="far fa-calendar"><?php echo $PublishDate; ?></i>
			<p class="PreviewText">
			<?php echo $Description; ?>
			</p>
		</div>
	</div>	


</html>