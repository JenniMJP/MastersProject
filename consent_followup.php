<?php include 'database.php';

	if ($_POST) {
	   $uname =  $_SESSION['uname'];
	   $choice = $_POST ['choice'];	  
	}   

	
	$query="INSERT INTO consentFollowup (user_name, choice) VALUES (:uname, :choice)";
	
	 try {
		    $insert=$DB_con->prepare($query);
		    $insert->execute(array(
		    "uname" => $uname, 
		    "choice" => $choice
			));   
	     }
		catch(PDOException $e)
		{
		     echo $e->getMessage();
		} 
		
	header("Location: ueq_question.php?q=1");
?>	