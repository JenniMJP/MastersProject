<?php include 'database.php';
	
	if ($_POST) {
	   $number = $_POST['number'];
	   $uname =  $_SESSION['uname'];
	   $answer = $_POST ['open'];	  
	   $next = $number+1;
	}   
	
	$query = "SELECT * FROM openQuestions";
	
	try {
			
	    $results=$DB_con->prepare($query);
	    $results->execute();
     	}
	catch(PDOException $e)
	{
	     echo $e->getMessage();
	}
	
	$total = $results->rowCount();
	
	$query="INSERT INTO openQuestionsAnswers (user_name, questionID, answer ) VALUES (:uname, :questionID, :answer)";
	
	 try {
		    $insert=$DB_con->prepare($query);
		    $insert->execute(array(
		    "uname" => $uname,
		    "questionID" => $number,
		    "answer" => $answer
			));   
	     }
		catch(PDOException $e)
		{
		     echo $e->getMessage();
		} 
		
	
	//checking if last question
	if ($number == $total) {
		header("Location: ueq_final.php");
		exit();
	}
	else {
		header("Location: ueq_open.php?q=".$next);
	}



?>