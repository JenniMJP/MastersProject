<?php include 'common.inc.php';
 //session_start();
 $uname = $_SESSION["uname"];
  
?>	

<script type="text/javascript">
    function get_action(form) {
        form.action = document.querySelector('input[name = "x"]:checked').value;;
    }
</script>

		<div class="container"> 
		<p>
		<h4> ELECTRONIC CONSENT:</h4>
		<p>Before proceeding to the prototype read the project information <a href="information_sheet.php"> here</a>
		</p>
		<p>By choosing "I will participate in the research" </br> 
		I will confirm that:</p>
		• I have read the project information and I am aware of the purpose of the research</br>
     		• I have been given the opportunity to ask questions</br>  			
    		• I understand that I can withdraw the participation at any point without any consecuenses</br>
    		• I am 18 or over</br>
    		• I particate in this research voluntarily</br></br>
  		<p>	
    		If you do not wish to particapte in the research select "I will not participate in the research" option
		</p> 


		<form name = "consent" method="get" onsubmit="get_action(this);">
		<div class = "checkboxes" required="required">
		<label>
		<input id = "x"  name="x" type="radio" value="consent_start.php" checked="checked"/> I will participate in the research</label><br>		
		<label>
		<input id = "x"  name="x" type="radio" value="logout.php"/> I will not participate in the research</label><br><br>
		</div>
		<input class="btn btn-success btn-responsive" id = "submit1" type="submit" value="Select"><br>			
 		</form>		
	

		</div>

<?php include 'footer.inc.php';
?>	