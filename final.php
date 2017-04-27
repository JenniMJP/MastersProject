<?php include 'common.inc.php';

	if($user->is_loggedin()!="")
	{

?>



	
		<div class="container">
			<h4> The prototype test has been completed </h4>
			<p> Next please assess the user-experience of using the prototype<p/>
			<br>
			<br>
			<a href="surveyinstructions.php" class="btn btn-success">Proceed to user experience evaluation </a>
		</div>

<?php

 }

else {
header("Location: index.php");
}

 include 'footer.inc.php';
?>