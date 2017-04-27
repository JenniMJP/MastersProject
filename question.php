<?php include 'common.inc.php';

	if($user->is_loggedin()!="")
	{
	

    $snumber= (int)$_GET['n'];
    $a= 0;
     
    $query="SELECT * FROM statement WHERE statementID = $snumber";

    try {
	    $result=$DB_con->prepare($query);
	    $result->execute();
     }
	catch(PDOException $e)
	{
	     echo $e->getMessage();
	}
	
	$question = $result->fetchAll(PDO::FETCH_ASSOC);
	
	 
    $optionquery="SELECT * FROM answerOption";

    try {
			
	    $options=$DB_con->prepare($optionquery);
	    $options->execute();
     }
	catch(PDOException $e)
	{
	     echo $e->getMessage();
	}

    $valuequery="SELECT * FROM valuesQuestion";
    try {
			
	    $values1=$DB_con->prepare($valuequery);
	    $values1->execute();
     }
	catch(PDOException $e)
	{
	     echo $e->getMessage();
	}
	
    $valuequery="SELECT * FROM valuesQuestion";
    try {
			
	    $values2=$DB_con->prepare($valuequery);
	    $values2->execute();
     }
	catch(PDOException $e)
	{
	     echo $e->getMessage();
	}
    
    $valuequery="SELECT * FROM valuesQuestion";
    try {	
	    $values3=$DB_con->prepare($valuequery);
	    $values3->execute();
     }
	catch(PDOException $e)
	{
	     echo $e->getMessage();
	}
	
?>
		<div class="container">
			<div class="current">Statement <?php echo $snumber;?> / 53</div>
			<p class="question">
				<?php foreach($question as $question){?>
				<h6><?php
				echo $question['text'];?></h6><?php
				$b = $question['isMultipleChoice'];
				}
				?>
			</p>
			
			
			<form class="custom" method="post" action="process.php">
								
			<?php if ($b == 0) { 
				    $a= 1;?>
					<select name="value1">
					<option value="">Select value 1</option>
					<?php foreach($values1 as $values1){?>
			                	<option value="<?php echo $values1['value']; ?>"><?php echo $values1['value']; ?></option>
			                       <?php
			                 	}
						?>
				        </select>
				        <br>
				        <br>
				        				        
				        <select name="value2">
				        <option value="">Select value 2</option>
					<?php foreach($values2 as $values2){?>
			                	<option value="<?php echo $values2['value']; ?>"><?php echo $values2['value']; ?></option>
			                       <?php
						}
						?>
				        </select>
				        <br><br>
				        				        
				       	<select name="value3">
				        <option value="">Select value 3</option>
					<?php foreach($values3 as $values3){?>
			                	<option value="<?php echo $values3['value']; ?>"><?php echo $values3['value']; ?></option>
			                       <?php
						}
						?>
				        </select>
				        <br><br>				             
                
			<?php } else { ?>		
							
			<div class="choices">
				<?php foreach($options as $options){?>
				<label>
				<input name="choice" type="radio" value="<?php echo $options['value']; ?>"/> <?php echo $options['value']; echo '&nbsp'; echo '-'; echo '&nbsp'; echo $options['option']; ?></label></br>
				<?php
				}
				?>
			</div>
			<?php } ?>		
			</br>		
			<input class="btn btn-success btn-responsive" type="submit" value="Next"/>
			<input type="hidden" name="number" value="<?php echo $snumber; ?>"/>
			<input type="hidden" name="check" value="<?php echo $a; ?>"/>
			</br>
			</form>
		</div>
		

<?php }

else {
header("Location: index.php");
}

include 'footer.inc.php';
?>