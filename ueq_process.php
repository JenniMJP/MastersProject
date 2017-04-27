<?php include 'database.php'; ?>
 	$total = 26;
<?php
	if (!isset($_SESSION['score'])) {
	   $_SESSION['score'] = 0;
	  
	}
	
	if ($_POST) {
	   $number = $_POST['number'];
	   $uname =  $_SESSION['uname'];
	   $selected_choice = $_POST ['choice'];	  
	   $next = $number+1;
	}   
	
	$query = "SELECT * FROM ueq";
	
	try {
			
	    $results=$DB_con->prepare($query);
	    $results->execute();
     	}
	catch(PDOException $e)
	{
	     echo $e->getMessage();
	}
	
	$total = $results->rowCount();
	
	$query="INSERT INTO ueqAnswer (user_name, ueqValue, ueqQuestionID) VALUES (:uname, :value, :ueq)";
	
	 try {
		    $insert=$DB_con->prepare($query);
		    $insert->execute(array(
		    "uname" => $uname,
		    "value" => $selected_choice,
		    "ueq" => $number
			));   
	     }
		catch(PDOException $e)
		{
		     echo $e->getMessage();
		} 
		
	
	//checking if last question
	if ($number == $total) {
		header("Location: ueq_open.php?q=1");
		exit();
	}
	else {
		header("Location: ueq_question.php?q=".$next);
	}



?>