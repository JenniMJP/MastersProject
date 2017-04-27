<?php include 'common.inc.php';
	if($user->is_loggedin()!="")
	{
	
?>

	
		<div class="container">
			<h4>Part 1 - Self-knowledge</h4>
			<p>Mitä laaja-alaisemmin tunnemme ihmislajia käytännössä ja teoriatiedon valossa sitä paremmat mahdollisuudet meillä on muodostaa oma käsityksemme ihmisen olemuksesta ja itsestämme. Eri tieteiden välinen puuttuva keskustelu, reviirien puolustaminen ja yhteisen käsitteistön puute vaikeuttavat yksittäisten ihmisten mahdollisuuksia muodostaa kuvaa ihmisen olemuksesta ja itsestään. 
			</p>
			<p>
			Ihminen on yksilönkehityksen ja lajinkehityksen tulos (Hari ym. 2015). Tieteellisen ja kokemustiedon lisäksi meidän on tutustuttava perusteellisesti elävään ihmislajin edustajaan, itseemme, meidän kaikkiin olemassa oleviin ja mahdollisiin puoliin ja osa-alueisiin.  Synnymme jokainen kulttuuriin, joka muovaa meitä ensi hetkestä lähtien.  Sosiaalinen vuorovaikutus on elintärkeä ihmisen kehitykselle ja ihminen kuuluu elämänsä ajan, moniin sosiokulttuurisiin järjestelmiin, kuten perheeseen, parisuhteeseen, työyhteisöön, kieliryhmään ja sosiaaliluokkaan.  Sosiaalisen vuorovaikutuksen katkaiseminen tuottaa tuskaa ja eristäminen toimiikin rangaistuksena monissa yhteiskunnissa. (Hari ym. 2015.) Suhteemme luontoon ja kaikkeen elolliseen tuo näkyväksi myös sitä, mitä ihmisinä olemme.  Yksilöinä meidän on tarpeen tuntea omaa perimää, taustaa ja historiaa, sitä miten perhe, suku, eri yhteisöt ja yhteiskunta ovat meitä muovanneet ja meihin vaikuttaneet, miten ne ovat meitä ohjanneet, tukeneet ja kannatellet sekä minkälaisia haavoittavia kokemuksia, menetyksiä ja traumoja olemme elämämme aikana kohdanneet ja miten olemme nämä asiat käsitelleet. Ihmisen tietoisen ja tiedostamattoman toiminnan tutkiminen on yksi mielen tutkimisen keskeisistä ongelmista, jota pohditaan monen tieteenalan piirissä (Hari ym. 2015). Yksilön näkökulmasta tietoisuustaidoissa kehittymistä pidän keskeisenä asiana. On olennaisen tärkeää pysähtyä ihmisen ja elämän mysteerin ääreen.
			</p>
			<p>Kabat-Zinn (2008) on tullut tunnetuksi hyväksyvää tietoista läsnäoloa koskevista tutkimuksistaan. Hän toteaa kirjassaan miten Buddha pyrki katsomaan syvälle syntymän, kuoleman ja kärsimyksen väistämättömään olemukseen ja kuinka hänen oli ensin opittava ymmärtämään ja vakauttamaan käyttämänsä instrumentti, mielensä. Hän ja hänen seuraajansa ryhtyivät selvittämään syvällisiä kysymyksiä itse mielen luonnosta ja elämän olemuksesta. Pyrkimykset itsetarkkailuun, johtivat löytöihin ja heidän onnistui kartoittaa alueet, jotka ovat meille kaikille yhteisiä riippumatta itse kunkin ajatuksista, uskomuksista ja kulttuurista. Heidän käyttämänsä menetelmät ja tutkimustulokset ovat universaaleja, eikä niillä ole mitään tekemistä ismien, ideologioiden, uskonnollisuuden tai uskomusjärjestelmien kanssa. Erityisen tietoisuuden kehittäminen, hyväksyvä tietoinen läsnäolo on yhteinen väylä kyvyllemme itsetiedostukseen ja tietoisuuteen, sille mikä tekee meistä ihmisiä. Harjoituksessa on kyse huomion kiinnittämisestä siihen että motivoidumme oivaltamaan keitä todella olemme, ja että suhtaudumme elämäämme ikään kuin sillä todella olisi merkitystä itsellemme ja koko maailmalle. 
			</p>
			<p>
Sovelluksessa liikutaan edellä kuvatussa itsetuntemuksen maastossa ja painopiste on tämän hetken tutkimisessa, oman taustan ja historian tutkimiseen sovellus ei suuntaudu.  Sovellus tarjoaa mahdollisuuden tarkastella ihmisen eri ulottuvuuksia henkilökohtaisella tasolla, joka voi johtaa oman ihmiskäsityksen tarkentumiseen, syvempään itsetuntemuksen ja tämän hetkiseen kohtaan havahtumiseen. 
			</p>
			<p>
			<dl>
			<dt>Questions</dt>
			<dd>Minkälainen on ihmistä ja elämää koskeva tietoperustasi? </dd>
			<dd>Minkälainen on ihmiskäsityksesi?  </dd>
			<dd>Mitä tämän hetken tilanteesi nostaa taustastasi esiin tarkasteltavaksi? Mistä itseä tai toisia koskevasta rajoittavasta uskomuksesta haluat irrottautua tänään?</dd>
			</dl>
			</p>			

			<a href="process_section1.php?r=1" class="btn btn-success btn-responsive"> My answers and reflective feedback</a>
		</div>


<?php
 }

else {
header("Location: index.php");
}

include 'footer.inc.php';
?>