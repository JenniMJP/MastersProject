<?php include 'common.inc.php';
	if($user->is_loggedin()!="")
	{
 $uname = $_SESSION["uname"];
  
?>	
	<div class="container"> 
	<h4> Maisterin tutkinto tutkimusprojektin tiedot </h4>
	<p> Projektin nimi: Itsearviointi web-sovellus prototyypin kehittäminen ja arviointi. Prototyppin tarkoituksena on mahdollistaa itsetuntemuksen syventämistä ja siten vaikuttaa yleiseen hyvinvointiin.</p>
	<p>Tämän tutkimuksen tarkoituksena on pyrkiä arvioimaan voidaanko mobiiliteknologiaa hyödyntää itsetuntemuksen syventämisessä ja selvittää mobiiliteknologian käyttöön liittyviä haasteita ja kehitysmahdollisuuksia.</p>
	
	<p>Tutkimukseen osallistuminen vaatii noin 35-45 minuuttia ja se koostuu 2 vaiheesta. Aika voi olla pidempi, mikäli käytät enemmän aikaa palautetekstien perusteellisempaan lukemiseen. 
	<ul>
	<li> • Prototyyppi: Minäkuvan itsearviointi ja siihen liittyvä aineisto
	</li>
	<li> • Käyttökokemuksen arviointi
	</li>
	</ul>
	</p>
	<p>Tutkimukseen osallistuminen on tarkoitus suorittaa mobiililaitteen ja selaimen kautta. Mitään muita vaatimuksia käytölle ei ole, sovelluksen tulisi toimia kaikissa selaimissa ja laitteissa.
	</p>
	<p>Kaikki kerätyt tiedot pidetään luottamuksellisina ja tallennetaan vain tutkimuksen ajaksi. Tiedot tallennetaan salasanalla suojattuna sähköisessä muodossa ja ovat vain tutkijan käytettävissä. Kaikki tiedot poistetaan, kun tutkimus on saatu päätökseen. Osallistujia ei voi tunnistaa julkaistusta tutkimuksesta.
	</p>
	<p>
	Voit halutessasi poistaa itsearviointivastauksesi testikäytön lopussa. Tutkimus kohdistuu ainoastaan sovelluksen käyttökokemus arvioihin. Käyttökokemus arvionnin lopussa tutkimukseen osallistujan on mahdollista pyytää lähettämään palautetekstit sähköpostitse.	
	</p>
	<p>Osallistuminen tutkimukseen on täysin vapaaehtoista ja kaikki osallistujat voivat peruuttaa osallistumisensa milloin tahansa ilman rajoituksia.
	</p>
	
	<p>Itsearvionti perustuu osallistujan elämäntilanteeseen, on mahdollista, että se saattaa aktivoida tunteita. Näissä tilanteissa on hyvä keskustella ystävien, perheenjäsenten tai ammattilaisten kanssa.</p>

	<p>Mikäli osallistujalla on kysymyksiä tutkimukseen liittyen, ne voi lähettää tutkijan sähköpostiosoitteeseen jenni.pakkila81@gmail.com </p>
	
	
		<p>Tutkija: Jenni Päkkilä, puhelin: +447534250105, sähköposti:jenni.pakkila81@gmail.com</p>
		<p>Tutkimuksen ohjaaja: Graeme McRobbie, sähköposti: Graeme.McRobbie@uws.ac.uk</p>
		<p>Eettinen koordinattori:  Daune West, sähköposti: Daune.WEST@uws.ac.uk</p>
		
		<a href="consent_form.php" class="start">Return to the consent form</a>
		
		</div>

<?php 
 }

else {
header("Location: index.php");
}

include 'footer.inc.php';
?>	

