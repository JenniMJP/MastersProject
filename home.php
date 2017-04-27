<?php include 'common.inc.php';


	if($user->is_loggedin()!="")
	{
	

 $uname = $_SESSION["uname"];
  
?>	
		<div class="container"> 
			<div class="card card-inverse card-success mb-3 text-left">
			  <a href="background.php">
			  <div  id="block" class="card-block">
			    <img id="background" style="width:60px" style="height:60px" src="img/Background.png" alt="Background info">
			    Background
			  </div>
			  </a>
			</div>
			<div class="card card-inverse card-warning mb-3 text-left">
			  <a href="question.php?n=1">
			  <div  id="block" class="card-block">
			   <img id="self" style="width:60px" style="height:60px" src="img/Self.png" alt="Self-assessment">Self-assessment
			  </div>
			  </a>
			</div>
			<div class="card card-inverse card-danger text-left ">
			   <a href="surveyinstructions.php">
			   <div id="block" class="card-block">
			   <img id="evaluation" style="width:50px" style="height:50px" src="img/Evaluation.png" alt="Background info">
			   User-experience
			   </div>
			   </a>
			</div>
		
		</div>

<?php
 }

else {
header("Location: index.php");
}

include 'footer.inc.php';
?>	
