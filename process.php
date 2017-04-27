<?php include 'database.php';

	if (!isset($_SESSION['score'])) {
	   $_SESSION['score'] = 0;
	}
	
	if ($_POST) {
	   $number = $_POST['number'];
	   $a = $_POST['check'];
	   $uname =  $_SESSION['uname'];
	   $selected_choice = $_POST ['choice'];	  
	   $next = $number+1;
	}   
	
	if($a==1) {
	
		$v1 = $_POST ['value1'];
		$v2 = $_POST ['value2'];
		$v3 = $_POST ['value3'];
		
	$query="INSERT INTO valuesAnswer (user_name, value1, value2, value3 ) VALUES (:uname, :value1, :value2,:value3)";
	
	 try {
		    $insert=$DB_con->prepare($query);
		    $insert->execute(array(
		    "uname" => $uname,
		    "value1" => $v1,
		    "value2" => $v2,
		    "value3" => $v3
			));   
	     }
		catch(PDOException $e)
		{
		     echo $e->getMessage();
		} 
			
	}else {
	
	$query = "SELECT * FROM statement";
	try {	
	    $results=$DB_con->prepare($query);
	    $results->execute();
     	}
	catch(PDOException $e)
	{
	     echo $e->getMessage();
	}
	
	$total = $results->rowCount();
	
	$query = "SELECT * FROM statement WHERE category2ID = 1";
	try {	
	    $results=$DB_con->prepare($query);
	    $results->execute();
     	}
	catch(PDOException $e)
	{
	     echo $e->getMessage();
	}
	
	$section1 = $results->rowCount();
	
	
	//check if answer already exists	
	try {
		$stm = $DB_con->prepare("SELECT * FROM answer WHERE statementID=:number AND user_name= :uname");	   
		$stm->bindParam(':uname', $uname);
		$stm->bindParam(':number', $number);
		$stm->execute();
	}
		catch(PDOException $e)	{
		     echo $e->getMessage();
		}
	$stmrecords = $stm->fetchAll();	
	
	//check if answer does not exist insert	
	if (empty($stmrecords)){
	
	$query="INSERT INTO answer (user_name, value, statementID) VALUES (:uname, :value, :statement)";
	
	 try {
		    $insert=$DB_con->prepare($query);
		    $insert->execute(array(
		    "uname" => $uname,
		    "value" => $selected_choice,
		    "statement" => $number
			));   
	     }
		catch(PDOException $e)
		{
		     echo $e->getMessage();
		} 
	}
	
	else {
	try {
  
		    $stm = $DB_con->prepare("UPDATE answer SET `value` = :selected WHERE user_name= :uname AND statementID = :number");
		    $stm->bindParam(':uname', $uname);
		    $stm->bindParam(':number', $number);
		    $stm->execute(array(
		    "value" => $selected_choice
			));  
	     	}
		catch(PDOException $e)	{
		     echo $e->getMessage();
		}
	
	}	
	}
	
	//checking if last question
	if ($number == $total) {
		header("Location: final.php");
		exit();
	} elseif ($number == $section1){
		header("Location: section1.php");
		exit();
	} else {
		header("Location: question.php?n=".$next);
	}


?>