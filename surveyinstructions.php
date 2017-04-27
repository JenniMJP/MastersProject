<?php include 'common.inc.php';
	if($user->is_loggedin()!="")
	{
	 $uname = $_SESSION["uname"];
  
?>	
		<div class="container"> 
				
		<h4>
		Please make your evaluation now.
		</h4>
		
		<p>
		For the assessment of the product, please fill out the following questionnaire. The questionnaire consists of pairs of contrasting attributes that may apply to the product. The circles between the attributes represent gradations between the opposites. You can express your agreement with the attributes by ticking the circle that most closely reflects your impression.
		</p>	

		<p>
		<br>
		<img src=img/sample.jpg>
		<br>
		<br>
		</p>
		
		<p>
		Example: This response would mean that you rate the application as more pleaseant than unpleaseant. 
		</p>
		<br>
		
		<p>
		Please decide spontaneously. Don’t think too long about your decision to make sure that you convey your original impression.
		Sometimes you may not be completely sure about your agreement with a particular attribute or you may find that the attribute does not apply completely to the particular product. 
		Nevertheless, 		please tick a circle in every line.
		</p>
		
		<p>
		<mark>It is your personal opinion that counts. Please remember: there is no wrong or right answer!  
		</mark>
		</p>
		
		<p>
		This research consists of quantitative and qualitative section. In addition to this quantitative user-experience evalution there will be a qualitative follow up section with some typical respondents. The time required to participate in the qualitative research requires about 10-15 minuuttia. 
		</p>
		
		<p>
		Please select your prefered option from below.
		</p>
		
		<form class="custom" method="post" action="consent_followup.php">
			<label><input name="choice" type="radio" value="Yes" checked="checked"/> I can be contacted for the follow up research if required</label><br>
			<label><input name="choice" type="radio" value="No"/>I cant be contacted for the follow up research</label><br><br>
			<input class="btn btn-success btn-responsive" type="submit" value="Begin the user experience evaluation"/>
			</br>
 		</form>		
		</div>

<?php 

 }

else {
header("Location: index.php");
}
include 'footer.inc.php';
?>	


