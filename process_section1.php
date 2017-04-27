<?php include 'database.php';

 	$uname = $_SESSION["uname"];
 	$x = 0;
 	$sc= (int)$_GET['r'];
 	
 	

//calculate and insert overall average

	try {
		$stm = $DB_con->prepare("SELECT * FROM results WHERE avg_category=:avgcat AND user_name= :uname");	   
		$stm->bindParam(':uname', $uname);
		$stm->bindParam(':avgcat', $x);
		$stm->execute();

	}
		catch(PDOException $e)	{
		     echo $e->getMessage();
		}
	$stmrecords = $stm->fetchAll();	
	
	if (empty($stmrecords)){
	
	try {
	    $stm = $DB_con->prepare("SELECT  `user_name`, FORMAT(AVG(`value`),0) FROM answer WHERE user_name=:uname");
	    $stm->bindParam(':uname', $uname);
	    $stm->execute();
     	}
	catch(PDOException $e){
	    echo $e->getMessage();
	}

	$stmrecords = $stm->fetchAll();
	foreach($stmrecords as $row)
	{
	$avg = $row[1];	
	}
			
	try {
		    $stm = $DB_con->prepare("INSERT INTO results (user_name, avg, avg_category) VALUES (:uname, :avg, :avgcat)");
		    $stm->execute(array(
			    "uname" => $uname,
			    "avg" => $avg,
			    "avgcat" => $x
				));   
	     	}
		catch(PDOException $e)	{
		     echo $e->getMessage();
		}
	}	
	
//calculate all averages

	$x = 1; 
	
	while($x <= 11) {
	
		
		try {
			$stm = $DB_con->prepare("SELECT * FROM results WHERE avg_category=:avgcat AND user_name= :uname");	   
			$stm->bindParam(':uname', $uname);
			$stm->bindParam(':avgcat', $x);
			$stm->execute();
		}
			catch(PDOException $e)	{
			     echo $e->getMessage();
			}
		$stmrecords = $stm->fetchAll();	
		
		if (empty($stmrecords)){
	
		try {
		    $stm = $DB_con->prepare("SELECT `user_name`,FORMAT(AVG(value),0) FROM answer INNER JOIN statement ON answer.statementID=statement.statementID WHERE statement.category3ID = '$x' AND answer.user_name= :uname");	   
		    $stm->bindParam(':uname', $uname);
		    $stm->execute();
	     	}
		catch(PDOException $e)	{
		     echo $e->getMessage();
		}
		$stmrecords = $stm->fetchAll();
		foreach($stmrecords as $row)
		{
 		$avg1 = $row[1];
		}

		try {
		    $stm = $DB_con->prepare("INSERT INTO results (user_name, avg, avg_category) VALUES (:uname, :avg, :avgcat)");
		    $stm->execute(array(
			    "uname" => $uname,
			    "avg" => $avg1,
			    "avgcat" => $x
				));   
	     	}
		catch(PDOException $e)	{
		     echo $e->getMessage();
		}
		} else {
		
		try {
		    $stm = $DB_con->prepare("SELECT `user_name`,FORMAT(AVG(value),0) FROM answer INNER JOIN statement ON answer.statementID=statement.statementID WHERE statement.category3ID = '$x' AND answer.user_name= :uname");	   
		    $stm->bindParam(':uname', $uname);
		    $stm->execute();
	     	}
		catch(PDOException $e)	{
		     echo $e->getMessage();
		}
		$stmrecords = $stm->fetchAll();
		foreach($stmrecords as $row)
		{
 		$avg1 = $row[1];
		}
		
		try {
		    $stm = $DB_con->prepare("UPDATE results SET avg = $avg1 WHERE user_name=$uname AND avg_category=$x");
		    $stm->execute(array(
			    "avg" => $avg1
				));   
	     	}
		catch(PDOException $e)	{
		     echo $e->getMessage();
		}
		
		}
	 $x++;
	} 
	
		//redirect to results
	header("Location: display_section1.php?r=1");

	

?>