<?php include 'common.inc.php';
	if($user->is_loggedin()!="")
	{
	
?>

	
		<div class="container">
			<p>User-experience evaluation has been completed</p>
			
			<h4>Thank you for the participation and your valuable contribution</h4><br>

			<form class="custom" method="post" action="finalize.php">
			
			Age-group</br>
			<select class="form-control" name="age">
			  <option value="Notchosen">Select</option>
			  <option value="1">18-20</option>
			  <option value="2">21-30</option>
			  <option value="3">31- 40</option>
			  <option value="4">41-50</option>
			  <option value="5">51-60</option>
			  <option value="6">61-70</option>
			  <option value="7">71-80</option>
			  <option value="9">81- </option>
			  <option value="Noanswer">I prefer not to answer</option>
			</select>	
			</br>	
			
			Gender
			<select class="form-control" name="gender">
			  <option value="Notchosen">Select</option>
			  <option value="male">Male</option>
			  <option value="female">Female</option>
			  <option value="other">Other</option>
			  <option value="Noanswer">I prefer not to answer</option>
			</select>	
			</br>	
			
			The device used
			<select class="form-control" name="device">
			  <option value="Notchosen">Select</option>
			  <option value="iPhone">Phone iPhone</option>
			  <option value="androidPhone">Phone Android</option>
			  <option value="otherphone">Phone Other</option>
			  <option value="iPad">Tablet iPad</option>
			  <option value="tabletandroid">Tablet Android</option>
			  <option value="tabletother">Tablet Other</option>
			  <option value="desktop">Desktop/Laptop</option>
			</select>
			</br>	
						
			The browser used</br>
			<select class="form-control" name="browser">
			  <option value="Notchosen">Select</option>
			  <option value="idk">I dont know</option>
			  <option value="chrome">Google Chrome</option>
			  <option value="safari">Firefox</option>
			  <option value="safari">Safari</option>			  
			  <option value="opera">Opera</option>
			  <option value="ie">Internet Explorer</option>
			  <option value="other">Other</option>
			</select>
			</br>	
			
			I would like to receive the reflective feedback through email</br>
			<select class="form-control" name="sendemail">
			  <option value="Notchosen">Select</option>
			  <option value="No">No</option>
			  <option value="Yes">Yes</option>  
			</select>
			</br>	
			
			Remove my self-assessment answers now</br>
			<select class="form-control" name="remove">
			  <option value="Notchosen">Select</option>
			  <option value="No">No</option>
			  <option value="Yes">Yes</option>
			</select>
			</br>	
				
			<input class="btn btn-success btn-responsive" type="submit" value="Save and sign out"/>
			

 		</form>			
						
		</div>

<?php
 }

else {
header("Location: index.php");
}

include 'footer.inc.php';
?>

