<?php include 'common.inc.php'; 

	if($user->is_loggedin()!="")
	{
	
 
    $qnumber= (int)$_GET['q'];
    
    $query="SELECT * FROM openQuestions WHERE id = $qnumber";

    try {
	    $result=$DB_con->prepare($query);
	    $result->execute();
     }
	catch(PDOException $e)
	{
	     echo $e->getMessage();
	}
	
	$question = $result->fetchAll(PDO::FETCH_ASSOC);
	
	 
?>
		<div class="container">

			<form method="post" action="ueq_processopen.php">
			<?php foreach($question as $question){ ?>
				<label><?php echo $question['question']; ?></br>
				<textarea class="form-control" name ="open"></textarea></label>
			<br>
			<br>
			<?php } ?>
			<input class="btn btn-success btn-responsive pull-right" type="submit" value="Next"/>

			<input type="hidden" name="number" value="<?php echo $qnumber; ?>"/>
			
			</form>
		</div>

<?php

 }

else {
header("Location: index.php");
}

 include 'footer.inc.php';
?>