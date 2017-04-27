<?php include 'database.php';

	   $uname =  $_SESSION['uname'];

	
	
	$query="INSERT INTO consentResearch (user_name) VALUES (:uname)";
	
	 try {
		    $insert=$DB_con->prepare($query);
		    $insert->execute(array(
		    "uname" => $uname
			));   
	     }
		catch(PDOException $e)
		{
		     echo $e->getMessage();
		} 
		
	header("Location: home.php");

?>