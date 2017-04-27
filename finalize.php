<?php include 'database.php';
	
	if ($_POST) {
	  
	   $uname =  $_SESSION['uname'];
    	   $age  = $_POST['age'];
  	   $gender  = $_POST['gender'];
  	   $device  = $_POST['device'];
  	   $browser = $_POST['browser'];	   
  	   $sendemail  = $_POST['sendemail'];
  	   $remove  = $_POST['remove'];

	} 
	
	$query="INSERT INTO final (user_name, age, gender, device, browser, sendemail, remove) VALUES (:uname, :age, :gender, :device, :browser, :sendemail, :remove)";
	
	 try {
		    $insert=$DB_con->prepare($query);
		    $insert->execute(array(
		    "uname" => $uname, 	
		    "age" => $age,
		    "gender" => $gender, 	
		    "device" => $device, 		    
		    "browser" => $browser, 	    
		    "sendemail" => $sendemail, 
		    "remove" => $remove
			));   
	     }
		catch(PDOException $e)
		{
		     echo $e->getMessage();
		} 
	
	if (stripos($remove, "Yes") !== false) {
	
	
	
	$query="DELETE FROM answer WHERE `user_name` = '$uname'"; 		
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
	
	$query="DELETE FROM results WHERE `user_name` = '$uname'"; 
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
	
	}
	
	header("Location: logout.php");
?>	