<?php include 'common.inc.php';

	if($user->is_loggedin()!="")
	{
	
 
    $qnumber= (int)$_GET['q'];
    $pnumber= $qnumber-1;
    
    $query="SELECT * FROM ueq WHERE ueqID = $qnumber";

    try {
	    $result=$DB_con->prepare($query);
	    $result->execute();
     }
	catch(PDOException $e)
	{
	     echo $e->getMessage();
	}
	
	$question = $result->fetchAll(PDO::FETCH_ASSOC);
	
	 
    $optionquery="SELECT * FROM ueqOption";

    try {
			
	    $options=$DB_con->prepare($optionquery);
	    $options->execute();
     }
	catch(PDOException $e)
	{
	     echo $e->getMessage();
	}
?>
		<div class="container">
			<div class="current">Attribute pair <?php echo $qnumber;?> / 26</div>
			<p></p>
			<form method="post" action="ueq_process.php">
			<table>
			<tr>
			<td style="text-align: center" >1</td>
			<td style="text-align: center" >2</td>
			<td style="text-align: center" >3</td>
			<td style="text-align: center" >4</td>
			<td style="text-align: center" >5</td>
			<td style="text-align: center" >6</td>
			<td style="text-align: center" >7</td>
			</tr>			
			<tr>
			<?php foreach($question as $question){
				foreach($options as $options){?>
					<td style="text-align: center" class="scale-option">
					<input class="ueqchoices" name="choice" type="radio" value="<?php echo $options['value']; ?>"/></input></td>
					<?php } ?>
					</tr>
					</table>
					<table>
					<tr>
					<td colspan="4" class="scale-start"><?php echo $question['scale_start'];?></td>
					<td colspan="3" style="text-align: right" class="scale-end"><?php echo $question['scale_end'];?></td>
					</tr>
					<?php } ?>
			
			</table>
			<br>
			<br>
			<input type="hidden" name="" value=""/>
			<input class="btn btn-success btn-responsive pull-right" type="submit" value="Next"/>

			<input type="hidden" name="number" value="<?php echo $qnumber; ?>"/>
			
			</form>
		</div>

<?php  }

else {
header("Location: index.php");
}

include 'footer.inc.php';
?>