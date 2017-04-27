<?php include 'common.inc.php';

	if($user->is_loggedin()!="")
	{
	
 $uname = $_SESSION["uname"];
  
?>	
		<div class="container"> 
	
	
		<h4>Content source literature for part 1</h4>

		 
		<p>Aalto, M. 2014. Minusta meiksi. Saarijärven offset Oy.</p>
		<p>Ehdin, S. 2015, Enemmän energiaa! Kohti rikasta, onnellista ja terveellistä elämää. Helsinki. Basam Books Oy.</p>
		<p>Grandell, R. 2015. Itsemyötätunto. EU. Kustannusosakeyhtiö Tammi.</p>
		<p>Hari, R & ym. 2015. Ihmisen Mieli. Tallinna: Gaudeamus Oy</p>
		<p>Kabat-Zinn, J. 2008. Kehon ja mielen viisaus. Tietoisen läsnäolon parantava voima. Helsinki. Basam Books Oy.</p>
		<p>Ollila, M-R. 2010. Johtajan parempi elämä. Juva: WS Bookwell Oy.</p>
		<p>Saaristo, T. 2000. Taikasanat: eli, Miksi antaisin anteeksi. Dialogia. </p>

		
		</div>

<?php 
 }

else {
header("Location: index.php");
}
include 'footer.inc.php';
?>	
