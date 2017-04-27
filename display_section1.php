<?php include 'common.inc.php'; 


	if($user->is_loggedin()!="")
	{
	
 
    $uname = $_SESSION["uname"];
    $sc= (int)$_GET['r'];

    $query="SELECT category3.name, results.avg, answerOption.option, results.avg_category FROM results INNER JOIN category3 ON results.avg_category=category3.category3ID INNER JOIN answerOption ON results.avg=answerOption.value WHERE results.user_name = '$uname' AND results.avg_category = '$sc'";
    try {
	    $result=$DB_con->prepare($query);
	    $result->execute();
     }
	catch(PDOException $e)	{
	     echo $e->getMessage();
	}
	$average = $result->fetchAll();
	
	$query="SELECT statement.category3ID,category3.name,statement.text,answer.value,answerOption.option FROM answer INNER JOIN statement ON answer.statementID=statement.statementID INNER JOIN category3 ON statement.category3ID=category3.category3ID INNER JOIN answerOption on answer.value=answerOption.value WHERE answer.user_name= :uname AND statement.category3ID = :sc"; 
	try {
	    $stm = $DB_con->prepare($query);	   
	    $stm->bindParam(':uname', $uname);
	    $stm->bindParam(':sc', $sc);
	    $stm->execute();	    
     	}
	catch(PDOException $e){
	     echo $e->getMessage();
	}
	$stmrecords = $stm->fetchAll();
	
    $query="SELECT * FROM resultContentEnglish WHERE `category3ID` = '$sc'";
	try {
	    $result=$DB_con->prepare($query);
	    $result->execute();
	    }
	catch(PDOException $e){
	    echo $e->getMessage();
		}	
	$content = $result->fetchAll();
	
    $query="SELECT finnish FROM exercise WHERE `category3ID` = '$sc'";
	try {
	    $result=$DB_con->prepare($query);
	    $result->execute();
	    }
	catch(PDOException $e){
	    echo $e->getMessage();
		}	
	$exercise = $result->fetchAll();
	
?>
	
<div class="container">
		<p class="question">
			<?php 		
		foreach($average as $row){
			echo "Section";echo '&nbsp';echo $sc; echo '&nbsp'; 
			echo $row[0];
			echo "<br/>";
			echo 'My average: '; 	
			echo $row[1];
			echo '&nbsp'; 
			echo "-";	
			echo $row[2];
			echo "<br/>";
			}?>
		</p>	
		
		  <a href="#answers" class="btn btn-success btn-responsive" data-toggle="collapse">Show my answers</a>
		  <div id="answers" class="collapse">
		   	<dl> 
		   	<?php
		   	foreach($stmrecords as $row){?>
				<dt><?php echo $row[2]; echo '&nbsp';?> </dt>
				<dd><?php echo $row[3]; echo '&nbsp'; echo "-"; echo $row[4]; echo "<br/>"; echo "<br/>"; ?> </dd>
			<?php
			}
			?>
		</dl>
		</div>
	
		<p>
		<?php
		foreach($content as $content) {?>
			<h4><?php  echo $content[contentTitle];?></h4> <?php
			echo "<p>";
			echo $content[content];
			echo "</p>";
			echo "<p>";
			echo $content[contentparagraph2];
			echo "</p>";?>
			<h4><?php echo $content[finnishTitle];?></h4> <?php
			echo "<p>";
			echo $content[finnish];
			echo "</p>";
			echo "<p>";
			echo $content[paragraph1];
			echo "</p>";
			echo "<p>";;
			echo $content[paragraph2];
			echo "</p>";
			echo "<p>";
			echo $content[paragraph3];
			echo "</p>";
			echo "<p>";
			echo $content[paragraph4];
			echo "</p>";
			echo "<p>";
			echo $content[paragraph5];
			echo "</p>";

			}
		?>
		</p>
		<p>
		<?php
		foreach($exercise as $exercise) {?>
			<h4>Self-image excercise</h4> <?php
			echo $exercise[0]; 
			echo "<br/>";
			}
			?>
		</p>
		<?php
	?>
		<form method="post" action="process_results.php">
			<input class="btn btn-success btn-responsive pull-right" type="submit" value="Next"/>
			<input type="hidden" name="number" value="<?php echo $sc; ?>"/>
			</form>
		</div>
	
<?php

 }

else {
header("Location: index.php");
}

include 'footer.inc.php';
?>