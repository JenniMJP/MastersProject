<?php include 'database.php';
 	
	
	if ($_POST) {
	   $number = $_POST['number'];
	   $uname =  $_SESSION['uname'];	  
	   $next = $number+1;
	}   
	
	$query = "SELECT * FROM results WHERE `user_name` = '$uname'";
	try {	
	    $results=$DB_con->prepare($query);
	    $results->execute();
     	}
	catch(PDOException $e)
	{
	     echo $e->getMessage();
	}
	
	//setting the total amount of sections
	$total = 11;
	
	//checking if last question
	if ($number == $total) {
		header("Location: final.php");
		exit();
	} else {
		header("Location: display_section1.php?r=".$next);
	}


?>