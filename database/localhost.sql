-- phpMyAdmin SQL Dump
-- version 4.0.10.18
-- https://www.phpmyadmin.net
--
-- Host: localhost:3306
-- Generation Time: Apr 26, 2017 at 07:57 PM
-- Server version: 5.6.35-cll-lve
-- PHP Version: 5.6.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `ic_dbconnect`
--

-- --------------------------------------------------------

--
-- Table structure for table `ic_users`
--

CREATE TABLE IF NOT EXISTS `ic_users` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(255) NOT NULL,
  `user_email` varchar(60) NOT NULL,
  `user_pass` varchar(255) NOT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `user_name` (`user_name`),
  UNIQUE KEY `user_email` (`user_email`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(255) NOT NULL,
  `user_email` varchar(60) NOT NULL,
  `user_pass` varchar(255) NOT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `user_name` (`user_name`),
  UNIQUE KEY `user_email` (`user_email`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `user_name`, `user_email`, `user_pass`) VALUES
(1, 'test', 'test@test', '123');
--
-- Database: `innercompass`
--

-- --------------------------------------------------------

--
-- Table structure for table `accessLog`
--

CREATE TABLE IF NOT EXISTS `accessLog` (
  `memberId` int(11) NOT NULL,
  `pageUrl` text CHARACTER SET latin1 NOT NULL,
  `numVisits` int(11) NOT NULL,
  `lastAccess` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Dumping data for table `accessLog`
--

INSERT INTO `accessLog` (`memberId`, `pageUrl`, `numVisits`, `lastAccess`) VALUES
(1, 'index.php', 27, '0000-00-00 00:00:00'),
(1, 'view_abouts.php', 3, '0000-00-00 00:00:00'),
(1, 'view_news.php', 2, '0000-00-00 00:00:00'),
(1, 'view_recordings.php', 1, '0000-00-00 00:00:00'),
(1, 'edit_gallery.php', 1, '0000-00-00 00:00:00'),
(1, 'view_tour.php', 1, '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `answer`
--

CREATE TABLE IF NOT EXISTS `answer` (
  `answerID` int(32) NOT NULL AUTO_INCREMENT,
  `user_name` text CHARACTER SET latin1 NOT NULL,
  `statementID` int(255) NOT NULL,
  `value` int(10) NOT NULL,
  PRIMARY KEY (`answerID`),
  UNIQUE KEY `answerID` (`answerID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `answerOption`
--

CREATE TABLE IF NOT EXISTS `answerOption` (
  `answerOptionID` int(32) NOT NULL AUTO_INCREMENT,
  `option` text CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `finnish` text CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `value` int(10) NOT NULL,
  `valueReversed` int(10) NOT NULL,
  PRIMARY KEY (`answerOptionID`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=8 ;

--
-- Dumping data for table `answerOption`
--

INSERT INTO `answerOption` (`answerOptionID`, `option`, `finnish`, `value`, `valueReversed`) VALUES
(1, 'Strongly Disagree', 'Täysin eri mieltä', 1, 7),
(2, 'Disagree', 'Erimieltä', 2, 6),
(3, 'Slightly Disagree', 'Jokseenkin eri mieltä', 3, 5),
(4, 'Neither Agree nor Disagree', 'Ei samaa eikä eri mieltä', 4, 4),
(5, 'Slightly Agree', 'Jokseenkin samaa mieltä', 5, 3),
(6, 'Agree', 'Samaa mieltä', 6, 2),
(7, 'Strongly Agree', 'Täysin samaa mieltä', 7, 1);

-- --------------------------------------------------------

--
-- Table structure for table `category1`
--

CREATE TABLE IF NOT EXISTS `category1` (
  `category1ID` int(32) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `finnish` varchar(255) NOT NULL,
  `description` text NOT NULL,
  PRIMARY KEY (`category1ID`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `category1`
--

INSERT INTO `category1` (`category1ID`, `name`, `finnish`, `description`) VALUES
(1, 'Self', 'Itse', ''),
(2, 'Relationships', 'Ihmissuhteet', ''),
(3, 'Current life', 'Nykyinen elämä', ''),
(4, 'Inner and outer guidance', 'Ulkoinen ja sisäinen johdatus', ''),
(5, 'View of self and life', 'Kuva itsestä ja elämästä', '');

-- --------------------------------------------------------

--
-- Table structure for table `category2`
--

CREATE TABLE IF NOT EXISTS `category2` (
  `category2ID` int(32) NOT NULL AUTO_INCREMENT,
  `category1ID` int(32) NOT NULL,
  `name` varchar(255) NOT NULL,
  `finnish` varchar(255) NOT NULL,
  `description` text NOT NULL,
  PRIMARY KEY (`category2ID`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=9 ;

--
-- Dumping data for table `category2`
--

INSERT INTO `category2` (`category2ID`, `category1ID`, `name`, `finnish`, `description`) VALUES
(2, 1, 'Physical level', 'Fyysinen taso', ''),
(1, 1, 'Self image and taking actions that are supporting self', 'Minäkuva ja itsen parhaaksi toimiminen', '');

-- --------------------------------------------------------

--
-- Table structure for table `category3`
--

CREATE TABLE IF NOT EXISTS `category3` (
  `category3ID` int(32) NOT NULL AUTO_INCREMENT,
  `category2ID` int(32) NOT NULL,
  `category1ID` int(32) NOT NULL,
  `name` varchar(255) NOT NULL,
  `finnish` varchar(255) NOT NULL,
  `description` text NOT NULL,
  PRIMARY KEY (`category3ID`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=18 ;

--
-- Dumping data for table `category3`
--

INSERT INTO `category3` (`category3ID`, `category2ID`, `category1ID`, `name`, `finnish`, `description`) VALUES
(1, 1, 1, 'Integrity', 'Integriteetti', ''),
(2, 1, 1, 'Self-esteem', 'Itsetunto', ''),
(3, 1, 1, 'Habits and actions that support self', 'Tavat ja toiminta itsen parhaaksi', ''),
(4, 1, 1, 'Experience of current life', 'Tämän hetken kokemus elämästä\r\n', ''),
(5, 1, 1, 'Self-compassion', 'Itsemyötätunto', ''),
(6, 1, 1, 'Forgiveness awareness', 'Anteeksiantotietoisuus', ''),
(7, 1, 1, 'Loving yourself', 'Itsen rakastaminen', ''),
(8, 1, 1, 'Own strengts', 'Oma voima', ''),
(9, 1, 1, 'Responsibility', 'Vastuu', ''),
(10, 1, 1, 'Values', 'Arvot', ''),
(11, 1, 5, 'Time management skills', 'Aikataidot', ''),
(12, 2, 1, 'Excercise', 'Liikunta', ''),
(13, 2, 1, 'Breathing', 'Hengitys', ''),
(14, 2, 1, 'Nutrition and water', 'Ravinto ja vesi', ''),
(15, 2, 1, 'Nutrition and water: body PH level\r\n', 'Ravinto ja vesi: kehon pH taso:\r\n', ''),
(16, 2, 1, 'Immune system and nutritional supplements', 'Immuunipuolustus ja ravintolisät', '');

-- --------------------------------------------------------

--
-- Table structure for table `consentFollowup`
--

CREATE TABLE IF NOT EXISTS `consentFollowup` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(255) NOT NULL,
  `choice` varchar(255) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `consentResearch`
--

CREATE TABLE IF NOT EXISTS `consentResearch` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(255) NOT NULL,
  `consent_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=74 ;

--
-- Dumping data for table `consentResearch`
--

INSERT INTO `consentResearch` (`id`, `user_name`, `consent_time`) VALUES
(1, 'turdusmerula', '2017-04-01 09:48:14'),
(2, 'Jenni', '2017-04-01 09:51:31'),
(3, 'turdusmerula', '2017-04-01 09:55:06'),
(4, 'turdusmerula', '2017-04-01 10:28:01'),
(5, 'turdusmerula', '2017-04-01 10:34:55'),
(6, 'Riku', '2017-04-01 10:59:53'),
(7, 'karoliinahallenberg@hotmail.com ', '2017-04-01 12:10:34'),
(8, 'turdusmerula', '2017-04-01 14:21:01'),
(9, 'jenni', '2017-04-01 14:46:14'),
(10, 'jenni', '2017-04-01 14:46:38'),
(11, 'Katja', '2017-04-01 14:56:08'),
(12, 'terhi.kivikoski@gmail.com', '2017-04-01 14:58:27'),
(13, 'turdusmerula', '2017-04-01 15:17:05'),
(14, 'turdusmerula', '2017-04-01 15:22:48'),
(15, 'mietoinen@hotmail.com', '2017-04-01 15:31:35'),
(16, 'MariSa', '2017-04-01 15:38:23'),
(17, 'maria', '2017-04-01 15:45:36'),
(18, 'Katja', '2017-04-01 15:50:19'),
(19, 'tuominensusanna@gmail.com', '2017-04-01 16:23:51'),
(20, 'Nette', '2017-04-01 17:06:49'),
(21, 'satu.tuomainen@wippies.com', '2017-04-01 17:18:58'),
(22, 'Annika', '2017-04-01 19:02:26'),
(23, 'Blondi', '2017-04-01 19:30:07'),
(24, 'Annika', '2017-04-01 20:10:04'),
(25, 'Tepsu', '2017-04-02 06:35:16'),
(26, 'Alma Virtanen ', '2017-04-02 06:58:01'),
(27, 'Cintti', '2017-04-02 07:38:01'),
(28, 'Tepsu', '2017-04-02 08:41:26'),
(29, 'Annekuu', '2017-04-02 08:44:00'),
(30, 'napsu', '2017-04-02 08:45:28'),
(31, 'mavi', '2017-04-02 09:04:10'),
(32, 'susanna.kytovaara@netikka.fi', '2017-04-02 14:51:59'),
(33, 'turdusmerula', '2017-04-02 15:25:43'),
(34, 'karonen.anne@gmail.com', '2017-04-02 15:52:05'),
(35, 'tapio.karonen@gmail.com', '2017-04-02 16:44:53'),
(36, 'terhi.kivikoski@gmail.com', '2017-04-02 16:50:09'),
(37, 'Helmi', '2017-04-02 19:16:53'),
(38, 'Virpi-Marja', '2017-04-02 19:44:26'),
(39, 'HelHe', '2017-04-03 09:25:59'),
(40, 'miina', '2017-04-03 10:39:59'),
(41, 'miina', '2017-04-03 10:47:24'),
(42, 'Toi1', '2017-04-03 14:29:59'),
(43, 'jenni', '2017-04-03 15:26:27'),
(44, 'marja-liisa', '2017-04-03 16:05:30'),
(45, 'Anitta', '2017-04-03 17:11:20'),
(46, 'Helmi', '2017-04-03 17:32:15'),
(47, 'anne.alhava@tukena.fi', '2017-04-03 17:40:36'),
(48, 'Mirjaelina@gmail.com', '2017-04-03 17:40:44'),
(49, 'arjakuur@dnainternet.net', '2017-04-03 18:06:40'),
(50, 'Janina', '2017-04-03 18:39:40'),
(51, 'Johanna ', '2017-04-04 06:28:44'),
(52, 'jenni', '2017-04-04 08:35:04'),
(53, 'pavi', '2017-04-04 09:04:55'),
(54, 'Jpiikki', '2017-04-04 16:08:32'),
(55, 'Johanna ', '2017-04-04 17:34:04'),
(56, 'pavi', '2017-04-04 18:30:57'),
(57, 'Eliisa', '2017-04-05 05:36:12'),
(58, 'turdusmerula', '2017-04-05 08:40:54'),
(59, 'Maruzela', '2017-04-05 14:08:32'),
(60, 'Riitta Vuorinen', '2017-04-05 17:35:02'),
(61, 'satu.haiko@gmail.com', '2017-04-05 18:47:29'),
(62, 'elina', '2017-04-06 08:27:31'),
(63, 'Kuusinainen', '2017-04-06 13:49:06'),
(64, 'sannan', '2017-04-06 16:36:50'),
(65, 'riikka.kunnas@outlook.com', '2017-04-06 17:40:43'),
(66, 'riikka.kunnas@outlook.com', '2017-04-07 14:37:37'),
(67, 'Anne Niemelä', '2017-04-07 16:36:02'),
(68, 'jenni', '2017-04-13 17:01:25'),
(69, 'jenni', '2017-04-13 17:21:09'),
(70, 'jenni', '2017-04-13 18:05:41'),
(71, 'jenni', '2017-04-13 18:09:55'),
(72, 'jenni', '2017-04-14 12:18:34'),
(73, 'jenni', '2017-04-14 12:33:27');

-- --------------------------------------------------------

--
-- Table structure for table `exercise`
--

CREATE TABLE IF NOT EXISTS `exercise` (
  `excerciseID` int(11) NOT NULL AUTO_INCREMENT,
  `category1ID` int(11) NOT NULL,
  `category2ID` int(11) NOT NULL,
  `category3ID` int(11) NOT NULL,
  `content` text CHARACTER SET latin1 NOT NULL,
  `finnish` text CHARACTER SET latin1 NOT NULL,
  PRIMARY KEY (`excerciseID`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `exercise`
--

INSERT INTO `exercise` (`excerciseID`, `category1ID`, `category2ID`, `category3ID`, `content`, `finnish`) VALUES
(1, 1, 1, 11, '', 'Voit vahvistaa minäkuvaasi seuraavan Ehdin (2015) kirjasta löytyvän harjoituksen avulla.  Asetu istumaan tai makaamaan ja rentouta itsesi. Vedä pari kertaa syvään henkeä ja lähetä päästä varpaisiin aaltoja ja anna rentouden levitä joka paikkaan. Sano hiljaa itsellesi: ilmaisen itseäni itseeni uskoen ja olen selkeä muita kohtaan. Toista lausetta samaan aikaan useita kertoja kun liikutat silmiä oikealta vasemmalle suljettujen luomien takana. Anna silmien olla aloillaan ja toista lausetta useita kertoja, kunnes se tuntuu todelta. Voit jatkaa harjoituksella siten, että elävöität mieleesi itsesi ensin lapsena ja seuraavaksi teini-ikäisenä ja palaa lopuksi takaisin aikuiseen itseesi. Toista lausetta jokaisen ikävaiheen kohdalla samalla tavalla silmiä liikuttaen. Kun tunnet olevasi valmis, palaa hitaasti valvetilaan. Venyttele, vedä henkeä syvään, anna olkapäiden pudota, nosta rintakehä ylös ja tunne ylpeyttä siitä, kuka olet ja että voit jakaa sen muiden kanssa. Toista harjoitusta jonkin aikaa ja tee havaintoja siitä, mitä tapahtuu. Silmien liikuttaminen liittyy EMRD silmänliikehoidon ideaan, jolloin työstetään asiaa molemmissa aivopuoliskoissa. \r\n');

-- --------------------------------------------------------

--
-- Table structure for table `final`
--

CREATE TABLE IF NOT EXISTS `final` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(255) NOT NULL,
  `age` int(11) NOT NULL,
  `gender` varchar(255) NOT NULL,
  `device` text NOT NULL,
  `browser` text NOT NULL,
  `sendemail` varchar(255) NOT NULL,
  `remove` varchar(255) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `level`
--

CREATE TABLE IF NOT EXISTS `level` (
  `levelID` int(32) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `desciption` text NOT NULL,
  PRIMARY KEY (`levelID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `openQuestions`
--

CREATE TABLE IF NOT EXISTS `openQuestions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `question` text NOT NULL,
  `finnish` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `openQuestions`
--

INSERT INTO `openQuestions` (`id`, `question`, `finnish`) VALUES
(1, 'Verbal description of user experience', 'Kuvaa sanallisesti sovelluksen käyttökokemustasi?'),
(2, 'What did you like most about the product?', 'Mistä pidit eniten sovelluksessa?'),
(3, 'What did you like least about the product?', 'Mistä pidit vähiten sovelluksessa? '),
(4, 'How suitable the self-knowledge theme is for usage through a mobile device? ', 'Miten itsetuntemusteema mielestäsi soveltuu mobiilikäyttöön (puhelin/tabletti)?');

-- --------------------------------------------------------

--
-- Table structure for table `openQuestionsAnswers`
--

CREATE TABLE IF NOT EXISTS `openQuestionsAnswers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(255) NOT NULL,
  `questionID` int(11) NOT NULL,
  `answer` text NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `resultContent`
--

CREATE TABLE IF NOT EXISTS `resultContent` (
  `contentID` int(11) NOT NULL AUTO_INCREMENT,
  `category1ID` int(11) NOT NULL,
  `category2ID` int(11) NOT NULL,
  `category3ID` int(11) NOT NULL,
  `contentTitle` text NOT NULL,
  `content` text NOT NULL,
  `contentparagraph2` text NOT NULL,
  `finnishTitle` text NOT NULL,
  `finnish` text NOT NULL,
  `paragraph2` text NOT NULL,
  `paragraph3` text NOT NULL,
  `paragraph4` text NOT NULL,
  `paragraph5` text NOT NULL,
  PRIMARY KEY (`contentID`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=12 ;

--
-- Dumping data for table `resultContent`
--

INSERT INTO `resultContent` (`contentID`, `category1ID`, `category2ID`, `category3ID`, `contentTitle`, `content`, `contentparagraph2`, `finnishTitle`, `finnish`, `paragraph2`, `paragraph3`, `paragraph4`, `paragraph5`) VALUES
(1, 1, 1, 1, 'Minäkuva', 'Ehdin (2015) tuo kirjassaan esille minäkuvan käsitteen, jota hän kuvaa uudeksi kokonaiskäsitteeksi, joka kuuluu uuden vuosituhannen käsitteisiin. Minäkuvaa luonnehtii osittain se, kuinka käsitämme itsemme ja osittain se, miten ulkopuolinen maailma meidät näkee ja käsittää.  Kaikki viestintä tapahtuu vuorovaikutuksessa ympäröivän maailman kanssa ja minäkuva on dynaaminen muuttuja, jolla on suuri kehityspotenttiaali. Hyvä minäkuva edellyttää kehittynyttä tietoisuutta omasta itsestä, tietoisuutta oman persoonan vahvuuksista ja heikkouksista.  Ehdin toteaa, että meidän on vietettävä aikaa itsemme kanssa tutustuaksemme itseemme ja eri puoliimme.  ', 'Minäkuva rakentuu useista osista ja sen tuntemisessa on kyse kaikkien omien osien näkemisestä. Minäkuvan vahvistaminen ja kehittäminen on olennaista, se liittyy yhteen hyvän ja korkean energiatason kanssa.  Hyvän minäkuvan seurauksena meistä tulee myös selkeämpiä toisia kohtaan ja se tulee näkyviin selkeinä rajoina oman minän ja ulkomaailman välillä.  Jokainen voi vahvistaa minäkuvaansa esimerkiksi tekemällä sitä, minkä tietää sisällään oikeaksi. Kun on totuudellinen itselleen, minäkuva vahvistuu automaattisesti. Mitä paremmin tietää, kuka on, sitä vahvemmaksi energia muuttuu ja sitä eheämmäksi ihminen muuttuu.  Jos et tiedä mitä sinun tulisi tehdä, voit tarttua siihen mikä tekee sinut iloiseksi tai keventää mieltäsi. Minäkuva määrittää sitä, mihin uskomme pystyvämme ja tämä vaikuttaa siihen, mitä valitsemme tehdäksemme.  Mitä suuremmassa sopusoinnussa minäkuva on sen kanssa, keitä todellisuudessa olemme, sitä suuremmat mahdollisuudet meillä on saada haluamamme elämä. Tällöin elämästä tulee paljon yksinkertaisempaa, meidän ei tarvitse teeskennellä tai näytellä jotain roolia kelvataksemme. Säästyy paljon energiaa ja on rentouttavaa ja vapauttavaa olla sellaisten ihmisten seurassa, jossa ei tarvitse suojautua.  Minäkuvan osia ovat: usko omaan itseen, itsetunto, oma voima, itsekunnioitus, rakkaus omaa itseä kohtaan, oma vahvuus, itseluottamus, kyky ottaa etäisyyttä omaan itseen, rohkeus, kypsyys ja tietoisuus. ', 'Integriteetti', 'Integriteetillä, kokemuksella kokonaisuudesta kuvataan uuden, tietoisen ihmisen ydinolemusta. Ihmisellä on tällöin kehittynyt kyky olla suhteessa ympäröivään maailmaan, hän näkee asiat yhteyksissään ja se ilmenee rehellisyytenä, vilpittömyytenä ja sen takana seisomisena mihin uskoo. Integroitunut ihminen on selkeä siinä mihin tähtää ja hän kykenee menettelemään oman vakaumuksensa mukaisesti ympäristön paineista riippumatta. Hän kykenee kunnioittamaan toisten rajoja ja tekemään toisille hyvää, asettamaan rajat ja sanomaan ei. Eheys liittyy kaikenlaiseen itsensä ja rajojensa kunnioittamiseen, terveyteen, itsensä hoitamiseen ja huolenpitoon. \r\n', 'Kun elämme itselle tärkeiden arvojen mukaisesti ja kun elämme sen mukaisesti keitä aidosti olemme, sitä vahvemmaksi minäkuvamme tulee. Oman sisäisen vakaumuksen seuraaminen ja sen tekeminen mihin uskoo, ovat merkkejä vahvasta integriteetistä. Tämä lisää automaattisesti energiaa. Todellisen itsen vastakohta on ego, joka saa ravintonsa ulkopuolelta.  Seuraavat tunteet ja ominaisuudet luonnehtivat egoa: puute, hallinta, taistelu, pelko, hengissä, haluaminen, puolustautuminen, antaa saadakseen, eristyneisyys, erillisyys, rajoitus, varauksellisuus. Todellista itseä luonnehtivia tunteet ja ominaisuudet ovat: runsaus, luottamus, virtaus, rakkaus, elossa, jakaminen, samanarvoisuus, antaa sydämestään, yhteys, ykseys, rajoittamaton, kaikki vain on.  Markkinavoimat hyödyntävät egoa, joka tarvitsee jatkuvaa ulkoapäin tulevaa uudistamista pysyäkseen käynnissä.  Aikaamme leimaa myös mediakanavien kautta tuleva valtaisa ekshibitionismi ja narsismi, olemme olemassa vain näkyäksemme.  Mitä enemmän kehitymme todellisen itsen tasolla, sitä vähemmän kiinnostavaksi oma persoonamme tulee. Todellinen itse kysyy, kuinka voin auttaa ja vaikuttaa kun taas egoisti kysyy, mitä minä saan tästä. ', 'Voimme harjaantua egon metkujen tunnistamisessa ja toimia myös toisillemme peileinä, kunhan olemme perehtyneet asiaan ja haluamme vapautta egon ohjauksesta. Tämän asian avaaminen jatkuu myöhemmin käyttöön tulevassa sovelluksen osassa. \r\n', '(Lähde: Ehdin 2015.) \r\n', ''),
(2, 1, 1, 2, '', '', '', 'Itsetunto\r\n', 'Voit tutkia itsetuntoasi, se tulee näkyviin siinä miten arvostat ja hyväksyt itsesi, koetko tunnetta kelpaamisesta ja oletko tyytyväinen itseesi riippumatta mistään ulkoisista suorituksista tai menestymisestä.  Kun itsetunto on heikko, ihminen tarvitsee enemmän ulkoista vahvistamista sisäisen tyhjyyden täyttämiseksi. Itsetunto ja usko itseen ovat eri asioita, meillä voi olla suuri usko itseemme, olemme voineet oppia toimimaan menestyksellisesti, mutta meillä voi samanaikaisesti olla huono itsetunto.  Usko itseemme voi olla hyvän suoriutumisen kautta opittua tai perustua syvälle itsen tuntemiselle ja kokemukselle siitä, että on turvassa itsessään. Tällöin ihminen on tietoinen heikkouksistaan ja vahvuuksistaan, hyväksyy itsensä ja pitää itsestään sellaisena kuin on. Itsetunto tulee sisältäpäin, sitä voi pitää kunnossa päivittäisten harjoitusten avulla. \r\n\r\n', 'Lähde: Ehdin (2015)', '', '', ''),
(3, 1, 1, 3, '', '', '', 'Tavat ja toiminta itsen parhaaksi', 'Kehityksemme riippuu osin siitä, minkälaisia tapoja ja toimintaa kykenemme kehittämään, jotta toimimme elämässämme pitkäjänteisesti itsemme parhaaksi.  Voimme kiinnittää huomiota seuraaviin näkökulmiin. Missä määrin annamme itselle tilaisuuksia, jotta voimme hyvin sisäisesti ja ulkoisesti. Tunnemmeko vahvuutemme ja omistaudummeko arjessa niiden vahvistamiseen? Elämmekö elämäämme sellaisena, jollaiseksi toivomme sen muodostuvan? Huolehdimmeko siitä, että lisäämme elämään päivittäin jotain, joka syventää omaa sisäistä suuntaamme? Kykenemmekö pysymään pitkäjänteisesti valitsemassamme suunnassa ja selviydymmekö ilman välitöntä palkitsemista?\r\n', '', '', '', ''),
(11, 1, 1, 11, '', '\r\n', '', 'Arvot ja aikataidot\r\n', 'Ollila (2010) toteaa kirjassaan, että kaiken parempaa elämää koskevan päätöksenteon taustalta löytyvät arvot. Arvoristiriidat syövät voimavaroja ja usein perheen ja työn arvot ovat jännitteisiä, elleivät suorastaan ristiriidassa. Hän toteaa myös, että on turmiollista olla työssä organisaatiossa, jonka arvomaailmaa ei jaa. ', 'Kuluttavien arvoristiriitojen poistamiseksi on lähdettävä kirkastamaan omia arvoja.  Todelliset arvot kertovat siitä, minkä puolesta kannattaa elää. Liike-elämässä osoittautuu usein, että raha on itseisarvo ja kaikki muu on sen rinnalla välineellistä.  Kun ihmisellä on todellisia arvoja, se näkyy siinä, että on asioita, joista hän ei neuvottele.  Tällöin vaarana on se, että kun ei neuvottele, ei menesty.  Työelämän ja ihmisen välille on revennyt kuilu.  Elämme keskellä arvomuutosta, monet haaveilevat lyhennetystä työajasta, sapattivapaasta ja oravanpyörästä hyppäämisestä. Ihmiset haluavat elää enemmän ja tehdä vähemmän, yksinkertaisen elämän ihanne leviää. Kuluttaminen ei välttämättä enää innosta elämäntehtävänä ja ilmastonmuutos osoittaa, että olemme eläneet väärin.  Laji on tuhoamassa omat elämisen edellytyksensä.\r\n', 'Voimme tarkastella arvoja yksilön, perheen, profession, yrityksen, yhteiskunnan ja maailmanyhteisön tasolla.  Arvoja on tapana ajatella ankkureina, joiden ohjaamana menemme kohti päämääriä, jotka olemme asettaneet tämän hetkisen viisautemme varassa.  Emme aina onnistu toimimaan asettamiemme arvojen mukaisesti.  Kaikki arvoristiriidat eivät ole pahasta. Kun ihanteiden ja elämän todellisuuden välillä on ristiriita, sen kuuluukin kalvaa.  Tämä hankaus paljastaa unelman toisenlaisesta elämästä.  Kun haluamme muuttaa suuntaa elämässämme se vaatii uusien arvojen havaitsemista tai entisen arvojärjestyksen muuttumista.  Voidaan todeta, että mikäli arvot eivät elämän varrella muutu, ihminen ei ole oppinut mitään.  Aidon arvoajattelijan on koko ajan suhteutettava toimintaansa asetettuihin päämääriin.  Tällöin on pyrittävä luomaan vaikutusvaltaa omiin tekemisiin, jotta haluttu arvomaailma voi toteutua.  Arvopohdinta on hyödytöntä, jollei aio olla itselleen tinkimättömän rehellinen.  Tulipa vastaan mitä tahansa, on uskallettava katsoa itseä silmiin. Arvoristiriita ei aina ole ihmisen sisällä, vaan se voi olla hänen omien arvojensa ja ”hyväksyttävien” arvojen välillä.  Itsepetokseen saattaa ajautua myös silloin, jos arvoja pohdittaessa pitää tiukasti kiinni ihanneminästään.', 'Ollila (2010) ohjaa tutkimaan omia arvoja ja valitsemaan kolme ydinarvoa, joiden on kyettävä toimimaan mittoina, joita käytämme toimiemme ja valintojemme arvioimiseen.  Arvovalintojen hankala puoli on se, että ne eivät ole keskenään yhteismitallisia.  Jotkut arvot on yksinkertaisesti asetettava toisten edelle.  Tosielämän arvojen järjestys riippuu mm. tavastamme hahmottaa aikaa. Se mikä säätelee aikataulujamme, säätelee vahvasti arvojemme toteutumista.  Ilman aikataitoja emme voi elää arvojemme mukaista elämää. Minkälaisia aikataitoja sinä tarvitset tämän hetkisessä tilanteessasi? Miten käytät sinulla olevan aikasi? ', 'Lähde: Ollila (2010.)'),
(4, 1, 1, 4, '', '', '', 'Tämän hetkinen kokemus elämästä', 'Tämän hetkinen kokemuksemme elämästä tuo näkyväksi oman tilanteemme. Vastaamalla seuraaviin kysymyksiin, saat käsitystä omasta kohdastasi ja siitä miten voit. Vastauksesi näyttävät suunnan, mistä suunnasta omaa tilannettaan voi halutessaan lähteä muuttamaan.  Jos esimerkiksi joku vie liikaa voimiamme, on syytä pysähtyä sen ääreen. Missä määrin voimme nauttia siitä, mitä olemme saaneet aikaiseksi; koemmeko elämämme merkitykselliseksi; koemmeko elämämme kevyeksi ja sujuvan helposti ja koemmeko elämämme rikkaaksi; tuottaako elämä meille voimaa ja voimmeko kokea kiitollisuutta ja iloa siitä, mitä elämä on meille tuonut?  \r\n', '', '', '', ''),
(5, 1, 1, 5, '', '', '', 'Itsemyötätunto', 'On tärkeätä oppia suhtautumaan myötätuntoisesti ja armollisesti itseen.  Grandell (2015) tuo esille, että olemalla ystävällisempiä ja myötätuntoisempia itseämme kohtaan voimme vähentää henkistä kipua ja saada elämäämme lisää iloa ja tyytyväisyyttä. Itsemyötätunto tulee näkyväksi erityisesti vaikeina hetkinä, kohtelemmeko itseämme kuin parasta ystäväämme. Meidät on saatettu kasvattaa uskomaan, että virheistä rankaiseminen on paras tapa oppia. Tutkimusten mukaan itseensä myötätuntoisesti suhtautuvat ihmiset ovat keskimäärin tyytyväisempiä elämäänsä, he vitkuttelevat vähemmän epämiellyttävien tehtävien kohdalla, he kestävät vastoinkäymisiä paremmin, he ottavat enemmän vastuuta virheistään ja he ovat tarvittaessa jämäkämpiä kuin ihmiset, jotka suhtautuvat itseensä kriittisesti ja kylmästi. Itselleen kriittiset ihmiset asettavat itselleen usein kovia vaatimuksia ja kritisoivat itseään kun eivät saavuta haluamaansa, he kamppailevat ahdistuksen, stressin, ärtyneisyyden, alakuloisuuden, sisäisen vaativuuden ja itsekritiikin kanssa. ', 'Itsemyötätunto koostuu kahdesta askeleesta. Kyvystä huomata kärsimys tai tunne, jota pyrkii välttelemään. Halusta ja kyvystä lievittää tätä kärsimystä erilaisin keinoin. Ympäristö asettaa meille paljon paineita ja meillä on luonnostaan taipumusta vältellä epämiellyttäviä kokemuksia. Voimme kuitenkin irtautua loputtomasta paineesta ja harjaannuttaa itsemyötätunnon taitoa itsessämme .\r\n\r\n', 'Lähde: Grandell (2015) ', '', ''),
(6, 1, 1, 6, '', '', '', 'Anteeksianto\r\n', 'Saaristo (2000) kirjoittaa kirjassaan Taikasanat, eli miksi antaisin anteeksi, tunnekoukuista, joissa riippuminen saattaa olla erittäin tuskallista.  Tunteiden tuskallisuudella on yhteyttä myös siihen, miksi saatamme viimeiseen asti välttää, kieltää tai torjua kokonaan tunteidemme olemassaolon. Myöhemmin avautuvassa sovelluksen osassa viedään tunteiden tasoa pidemmälle. Nostan tässä esille Saariston yksinkertaisen harjoituksen, jonka avulla voimme vapautua tunnekoukuistamme. Illalla nukkumaan mennessä sano 3-4 kertaa hiljaa mielessäsi: ”minä annan itselleni anteeksi”. Jos tätä tehdessä tulee mieleen, joku henkilö, lausu muutaman kerran hänen nimensä ja sano: ” minä annan sinulle anteeksi”.  Anteeksianto ei edellytä erityistä tunnetilaa eikä halua antaa anteeksi. Aloittaessamme anteeksiannon emme usein edes tiedä mitä tunteita meidän on tarpeen työstää. Sitä voi tehdä tunnetilasta riippumatta, myös niin vihaisena ettei tunne mitään halua antaa anteeksi. ', 'Voimme kehittää riippuvuuksia myös tunteita kohtaan, jos koemme saavamme voimaa vihasta, tämä voi olla merkki riippuvuudestamme. Anteeksiannon avulla voimme työstää myös torjuttuja ja kiellettyjä tunteita, joita emme voi tai haluakkaan kokea. Ihminen, joka tulee nukkumaan mennessä mieleemme, toimii kohteena vain näennäisesti. Todellisen työskentelyn kohteena on tunne ja kaikki ne tilanteet, joissa olemme tuon tunteen kohdanneet.  Saaristo toteaa, ettei anteeksiannon mysteeriä voi täysin tajuta, ellei ole itse kokeillut ja kokenut sitä. Anteeksiannossa ei ole lopulta kyse kenestäkään mieleen tulevasta henkilöstä vaan omista sisäisistä tunteisiin pohjautuvista luomuksistamme. Anteeksianto on teko, jonka avulla voimme työstää elämän vaikeuksia. Anteeksiantoa voi verrata hampaiden harjaamiseen, jota vain käytetään suuremmin kyselemättä, onko harjaus paikallaan. Monien kertomusten ja oman kokemuksen pohjalta voi todeta, että harjoitus toimii, kun teemme sitä, uskoimmepa siihen tai emme. Vaikutusten huomaamiseen tarvitaan vähintään neutraalia tai uteliaan myönteistä suhtautumista. Aika nopeasti voi tehdä havaintoja siitä, että jotakin tärkeää tapahtuu itsessä ja suhteessa muihin. Kiinnittämällä huomiota myös uniin, pääsemme tekemään havaintoja harjoituksen aikaansaamasta muutoksesta itsessä. ', '', '', ''),
(7, 1, 1, 7, '', '', '', 'Itsen rakastaminen', 'Itsen rakastaminen on sitä, että annamme itselle hyvää ravintoa, hyviä ajatuksia, huolenpitoa ja arvostusta, voimme alkaa luoda hyvää suhdetta itseemme. Rakkaus on välttämätön kaikelle elolliselle, voimme pelätä jonkun tulemista liian lähelle, jollemme ole kohdanneet sitä aikaisemmin. Ensin on tärkeätä opetella tuntemaan rakkautta ja sen jälkeen tuntemaan itsensä rakastetuksi. Kun avaamme itseä tunteaksemme rakkautta, paha ja puolustukset alkavat murtua. Ihmisestä tulee itselleen rakastava vanhempi, joka tekee hyviä asioita. Itsen rakastaminen näkyy huomion antamisena omille tarpeille, iloa tuottavien asioiden tekemisenä, kehoa rentouttavien hoitojen ottamisena, keskusteluavun hakemisena, itselle nauramisena, itsen kanssa vietettynä aikana, hupia ja iloa tuottavana liikkumisena. \r\n', 'Lähde: Ehdin (2015)', '', '', ''),
(8, 1, 1, 8, '', '', '', 'Oma voima', 'Oma voima tulee näkyväksi siinä, että teemme itsellemme hyvää ja otamme aikuisen vastuun omista tekemisistämme. Olemme ihmisinä perustavalla tavalla riippuvaisia toisistamme ja on tärkeätä osata ottaa vastaan myös apua, tukea ja neuvoja yms., lisäresursseja joita voimme toisillemme tarjota. Haitallinen omavoimaisuus ilmenee kyvyttömyytenä avun ja tuen vastaanottamiseen. Voimme vahvistaa omaa voimaamme harjoittamalla sitä. ', 'Omaan voimaan luottaminen näkyy siinä, että olemme toiveikkaita ja haluamme muuttaa tilannetta ja ryhdymme tarvittaviin tekoihin.  Se näkyy siinä, että otamme vastuuta siitä, että saamme elämässä tarvitsemamme asiat. Emme myöskään anna muiden odotusten johtaa elämäämme ja osamme vetää itsemme pois hankalista tilanteista.  Tärkeätä on lakata käyttäytymästä itseä tuhoavalla tavalla ja sallia omien arvojen johtaa elämää. Itsen kunnioittaminen ja sellaisten asioiden tekeminen, jotka saavat meidät voimaan hyvin kertovat omaan voimaan luottamisesta.  Luotanko siihen, että minussa on kaikki tarvittava viisaus, voima ja rohkeus elämässä tarvittaviin muutoksiin? Uskonko siihen, että minulla on valta muuttaa oma tilanne ja voin valita toisin?  \r\n', 'Lähde: Ehdin (2015)', '', ''),
(9, 1, 1, 9, '', '', '', 'Vastuu\r\n', 'Vastuun ottaminen itsestämme, toimistamme ja elämästämme on keskeinen asia todellisen itsen löytämisen tiellä. Ehdin (2015) kuvaa kirjassaan ihmisen vaiheita kolmen roolin avulla, uhri, selviytyjä ja elämänsä eläjä. Uhrin roolissa oleva näkee ja kokee ongelmien johtuvan aina muista ihmisistä. Elämme uhrikulttuurissa, jossa tarvitaan joku jota syyttää kaikesta, tällöin uhrin roolissa oleva voi kokea tulevansa kaltoin kohdelluksi. Uhrin rooli tulee näkyiin myös monissa riippuvuuksissa (ruoka, alkoholi, huumeet, shoppailu, pelit), joihin ihminen voi jäädä jumiin. Tällöin ihminen on vailla valtaa suhteessa omaan huumeeseensa. Tilanteeseen havahtuminen on ensimmäinen askel muutokseen. ', 'Näen, että ympäristöllä on tärkeä rooli uhrikulttuurin ylläpitämisessä tai alas ajamisessa. Voimme aina kysyä itseltämme olemmeko osa ongelmaa vai ratkaisua, kun etsimme suhtautumistamme toista moittivan tai valittavan ihmisen lähellä.  Valittaminen kertoo jollakin tavalla siitä, ettemme ole ottaneet itsellemme kuuluvaa vastuuta. Ympäristön oikeanlainen suhtautuminen on merkittävä asia, jotta uhrin roolissa oleva pääsee siirtymään seuraavaan vaiheeseen, selviytyjän rooliin.  Uhrin roolissa olevaa ei saa hylätä, hänelle tulee viestittää välittämistä vastuullisella tavalla.  Valittamiseen ja moittimiseen mukaan menemistä tulee välttää.  Kun ympäristö kykenee ottamaan vastuuta ja asettamaan lempeästi rajat toisiin kohdistuvalle hyökkäävälle käyttäytymiselle, uhrin roolissa oleva oppii vastuuta. Muiden tehtävänä on myös vahvistaa uhrin uskoa ja luottamusta ihmiseen, ihmisten yhteenkuuluvuuteen ja hyväntahtoisuuteen, johon uhrin roolissa oleva on menettänyt yhteyden.', 'Selviytyjän rooliin siirtynyt ymmärtää, etteivät monet asiat hänen elämässään ole hyvin ja että monet menneisyyden kokemukset ovat vaikuttaneet häneen. Hän alkaa ymmärtää, että ainoastaan hän itse voi vaikuttaa ja hän valitsee pulmiensa kohtaamisen.  Selviytyjä etsii aktiivisesti tietoa ja keinoja lukemalla ja muilla tavoilla, hän ottaa vastaan tukea ja hoitoa ymmärtääkseen omia kokemuksiaan. Tästä vaiheesta on mahdollista siirtyä kolmanteen, oman elämänsä eläjän vaiheeseen. Tällöin kypsyys tulee näkyväksi lisääntyneenä sovinnollisuutena itseä ja ympäristöä kohtaan.  Tässä vaiheessa ihminen voi jo keskittyä oman tilanteen muuttamiseen ja parempaan toimintaan itsensä ja muiden hyväksi.  Hän voi antaa panoksensa ympäristölle ja hän kykenee toimimaan kokonaisvaltaisesti ja pitkäjänteisesti. Ajattelen, että voimme liikkua edellä kuvattujen roolien väleillä ja siirtyminen jonkin asian kohdalla kehittyneempään rooliin ei välttämättä näy heti kaikkien asioiden kohdalla, vaan oman elämänsä eläjäksi kehittyminen vie meiltä monilta pideämmän aikaa.  ', 'Itsestään vastuun ottanut ihminen kykene ottamaan vastuun omasta terveydestä ja jaksamisesta, priorisoinneistaan, mielipiteistään, tunteistaan, arvoistaan ja moraalistaan, tarpeistaan ja unelmistaan. Hän hyväksyy ne ja on valmis sopivissa tilanteissa ilmaisemaan niitä. Vastuunottaja ei ole taakaksi eikä hänestä tarvitse kantaa huolta. Vuorovaikutuksessa harjoitamme vastuullista kuuntelemista, puhumista ja otamme vastuun myös tulkinnoistamme. Vastuun ottaminen heijastaa ihmisen itsearvostusta ja on kytköksissä itsetuntoon. ', 'Lähteet: Aalto (2014), Ehdin (2015)'),
(10, 1, 1, 10, '', '', '', 'Arvot', 'Arvot aineisto seuravalla sivulla aikataitojen yhteydessä', '', '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `resultContentEnglish`
--

CREATE TABLE IF NOT EXISTS `resultContentEnglish` (
  `contentID` int(11) NOT NULL AUTO_INCREMENT,
  `category1ID` int(11) NOT NULL,
  `category2ID` int(11) NOT NULL,
  `category3ID` int(11) NOT NULL,
  `contentTitle` text NOT NULL,
  `content` text NOT NULL,
  `contentparagraph2` text NOT NULL,
  `finnishTitle` text NOT NULL,
  `finnish` text NOT NULL,
  `paragraph2` text NOT NULL,
  `paragraph3` text NOT NULL,
  `paragraph4` text NOT NULL,
  `paragraph5` text NOT NULL,
  PRIMARY KEY (`contentID`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=12 ;

--
-- Dumping data for table `resultContentEnglish`
--

INSERT INTO `resultContentEnglish` (`contentID`, `category1ID`, `category2ID`, `category3ID`, `contentTitle`, `content`, `contentparagraph2`, `finnishTitle`, `finnish`, `paragraph2`, `paragraph3`, `paragraph4`, `paragraph5`) VALUES
(1, 1, 1, 1, 'Self-Image', 'Self image description', '', 'Integrity', 'Integrity reflective feedback paragraph 1', 'Integrity reflective feedback paragraph 2', 'Integrity reflective feedback paragraph 3\r\n', 'Source: ', ''),
(2, 1, 1, 2, '', '', '', 'Self-esteem', 'Voit tutkia itsetuntoasi, se tulee näkyviin siinä miten arvostat ja hyväksyt itsesi, koetko tunnetta kelpaamisesta ja oletko tyytyväinen itseesi riippumatta mistään ulkoisista suorituksista tai menestymisestä.  Kun itsetunto on heikko, ihminen tarvitsee enemmän ulkoista vahvistamista sisäisen tyhjyyden täyttämiseksi. Itsetunto ja usko itseen ovat eri asioita, meillä voi olla suuri usko itseemme, olemme voineet oppia toimimaan menestyksellisesti, mutta meillä voi samanaikaisesti olla huono itsetunto.  Usko itseemme voi olla hyvän suoriutumisen kautta opittua tai perustua syvälle itsen tuntemiselle ja kokemukselle siitä, että on turvassa itsessään. Tällöin ihminen on tietoinen heikkouksistaan ja vahvuuksistaan, hyväksyy itsensä ja pitää itsestään sellaisena kuin on. Itsetunto tulee sisältäpäin, sitä voi pitää kunnossa päivittäisten harjoitusten avulla. \r\n\r\n', 'Lähde: Ehdin (2015)', '', '', ''),
(3, 1, 1, 3, '', '', '', 'Habits and functioning for the best of self', 'Kehityksemme riippuu osin siitä, minkälaisia tapoja ja toimintaa kykenemme kehittämään, jotta toimimme elämässämme pitkäjänteisesti itsemme parhaaksi.  Voimme kiinnittää huomiota seuraaviin näkökulmiin. Missä määrin annamme itselle tilaisuuksia, jotta voimme hyvin sisäisesti ja ulkoisesti. Tunnemmeko vahvuutemme ja omistaudummeko arjessa niiden vahvistamiseen? Elämmekö elämäämme sellaisena, jollaiseksi toivomme sen muodostuvan? Huolehdimmeko siitä, että lisäämme elämään päivittäin jotain, joka syventää omaa sisäistä suuntaamme? Kykenemmekö pysymään pitkäjänteisesti valitsemassamme suunnassa ja selviydymmekö ilman välitöntä palkitsemista?\r\n', '', '', '', ''),
(11, 1, 1, 11, '', '\r\n', '', 'Values and time management skills', 'Ollila (2010) toteaa kirjassaan, että kaiken parempaa elämää koskevan päätöksenteon taustalta löytyvät arvot. Arvoristiriidat syövät voimavaroja ja usein perheen ja työn arvot ovat jännitteisiä, elleivät suorastaan ristiriidassa. Hän toteaa myös, että on turmiollista olla työssä organisaatiossa, jonka arvomaailmaa ei jaa. ', 'Kuluttavien arvoristiriitojen poistamiseksi on lähdettävä kirkastamaan omia arvoja.  Todelliset arvot kertovat siitä, minkä puolesta kannattaa elää. Liike-elämässä osoittautuu usein, että raha on itseisarvo ja kaikki muu on sen rinnalla välineellistä.  Kun ihmisellä on todellisia arvoja, se näkyy siinä, että on asioita, joista hän ei neuvottele.  Tällöin vaarana on se, että kun ei neuvottele, ei menesty.  Työelämän ja ihmisen välille on revennyt kuilu.  Elämme keskellä arvomuutosta, monet haaveilevat lyhennetystä työajasta, sapattivapaasta ja oravanpyörästä hyppäämisestä. Ihmiset haluavat elää enemmän ja tehdä vähemmän, yksinkertaisen elämän ihanne leviää. Kuluttaminen ei välttämättä enää innosta elämäntehtävänä ja ilmastonmuutos osoittaa, että olemme eläneet väärin.  Laji on tuhoamassa omat elämisen edellytyksensä.\r\n', 'Voimme tarkastella arvoja yksilön, perheen, profession, yrityksen, yhteiskunnan ja maailmanyhteisön tasolla.  Arvoja on tapana ajatella ankkureina, joiden ohjaamana menemme kohti päämääriä, jotka olemme asettaneet tämän hetkisen viisautemme varassa.  Emme aina onnistu toimimaan asettamiemme arvojen mukaisesti.  Kaikki arvoristiriidat eivät ole pahasta. Kun ihanteiden ja elämän todellisuuden välillä on ristiriita, sen kuuluukin kalvaa.  Tämä hankaus paljastaa unelman toisenlaisesta elämästä.  Kun haluamme muuttaa suuntaa elämässämme se vaatii uusien arvojen havaitsemista tai entisen arvojärjestyksen muuttumista.  Voidaan todeta, että mikäli arvot eivät elämän varrella muutu, ihminen ei ole oppinut mitään.  Aidon arvoajattelijan on koko ajan suhteutettava toimintaansa asetettuihin päämääriin.  Tällöin on pyrittävä luomaan vaikutusvaltaa omiin tekemisiin, jotta haluttu arvomaailma voi toteutua.  Arvopohdinta on hyödytöntä, jollei aio olla itselleen tinkimättömän rehellinen.  Tulipa vastaan mitä tahansa, on uskallettava katsoa itseä silmiin. Arvoristiriita ei aina ole ihmisen sisällä, vaan se voi olla hänen omien arvojensa ja ”hyväksyttävien” arvojen välillä.  Itsepetokseen saattaa ajautua myös silloin, jos arvoja pohdittaessa pitää tiukasti kiinni ihanneminästään.', 'Ollila (2010) ohjaa tutkimaan omia arvoja ja valitsemaan kolme ydinarvoa, joiden on kyettävä toimimaan mittoina, joita käytämme toimiemme ja valintojemme arvioimiseen.  Arvovalintojen hankala puoli on se, että ne eivät ole keskenään yhteismitallisia.  Jotkut arvot on yksinkertaisesti asetettava toisten edelle.  Tosielämän arvojen järjestys riippuu mm. tavastamme hahmottaa aikaa. Se mikä säätelee aikataulujamme, säätelee vahvasti arvojemme toteutumista.  Ilman aikataitoja emme voi elää arvojemme mukaista elämää. Minkälaisia aikataitoja sinä tarvitset tämän hetkisessä tilanteessasi? Miten käytät sinulla olevan aikasi? ', 'Lähde: Ollila (2010.)'),
(4, 1, 1, 4, '', '', '', 'The current experience of life', 'Tämän hetkinen kokemuksemme elämästä tuo näkyväksi oman tilanteemme. Vastaamalla seuraaviin kysymyksiin, saat käsitystä omasta kohdastasi ja siitä miten voit. Vastauksesi näyttävät suunnan, mistä suunnasta omaa tilannettaan voi halutessaan lähteä muuttamaan.  Jos esimerkiksi joku vie liikaa voimiamme, on syytä pysähtyä sen ääreen. Missä määrin voimme nauttia siitä, mitä olemme saaneet aikaiseksi; koemmeko elämämme merkitykselliseksi; koemmeko elämämme kevyeksi ja sujuvan helposti ja koemmeko elämämme rikkaaksi; tuottaako elämä meille voimaa ja voimmeko kokea kiitollisuutta ja iloa siitä, mitä elämä on meille tuonut?  \r\n', '', '', '', ''),
(5, 1, 1, 5, '', '', '', 'Self-compassion', 'On tärkeätä oppia suhtautumaan myötätuntoisesti ja armollisesti itseen.  Grandell (2015) tuo esille, että olemalla ystävällisempiä ja myötätuntoisempia itseämme kohtaan voimme vähentää henkistä kipua ja saada elämäämme lisää iloa ja tyytyväisyyttä. Itsemyötätunto tulee näkyväksi erityisesti vaikeina hetkinä, kohtelemmeko itseämme kuin parasta ystäväämme. Meidät on saatettu kasvattaa uskomaan, että virheistä rankaiseminen on paras tapa oppia. Tutkimusten mukaan itseensä myötätuntoisesti suhtautuvat ihmiset ovat keskimäärin tyytyväisempiä elämäänsä, he vitkuttelevat vähemmän epämiellyttävien tehtävien kohdalla, he kestävät vastoinkäymisiä paremmin, he ottavat enemmän vastuuta virheistään ja he ovat tarvittaessa jämäkämpiä kuin ihmiset, jotka suhtautuvat itseensä kriittisesti ja kylmästi. Itselleen kriittiset ihmiset asettavat itselleen usein kovia vaatimuksia ja kritisoivat itseään kun eivät saavuta haluamaansa, he kamppailevat ahdistuksen, stressin, ärtyneisyyden, alakuloisuuden, sisäisen vaativuuden ja itsekritiikin kanssa. ', 'Itsemyötätunto koostuu kahdesta askeleesta. Kyvystä huomata kärsimys tai tunne, jota pyrkii välttelemään. Halusta ja kyvystä lievittää tätä kärsimystä erilaisin keinoin. Ympäristö asettaa meille paljon paineita ja meillä on luonnostaan taipumusta vältellä epämiellyttäviä kokemuksia. Voimme kuitenkin irtautua loputtomasta paineesta ja harjaannuttaa itsemyötätunnon taitoa itsessämme .\r\n\r\n', 'Lähde: Grandell (2015) ', '', ''),
(6, 1, 1, 6, '', '', '', 'Forgiveness', 'Saaristo (2000) kirjoittaa kirjassaan Taikasanat, eli miksi antaisin anteeksi, tunnekoukuista, joissa riippuminen saattaa olla erittäin tuskallista.  Tunteiden tuskallisuudella on yhteyttä myös siihen, miksi saatamme viimeiseen asti välttää, kieltää tai torjua kokonaan tunteidemme olemassaolon. Myöhemmin avautuvassa sovelluksen osassa viedään tunteiden tasoa pidemmälle. Nostan tässä esille Saariston yksinkertaisen harjoituksen, jonka avulla voimme vapautua tunnekoukuistamme. Illalla nukkumaan mennessä sano 3-4 kertaa hiljaa mielessäsi: ”minä annan itselleni anteeksi”. Jos tätä tehdessä tulee mieleen, joku henkilö, lausu muutaman kerran hänen nimensä ja sano: ” minä annan sinulle anteeksi”.  Anteeksianto ei edellytä erityistä tunnetilaa eikä halua antaa anteeksi. Aloittaessamme anteeksiannon emme usein edes tiedä mitä tunteita meidän on tarpeen työstää. Sitä voi tehdä tunnetilasta riippumatta, myös niin vihaisena ettei tunne mitään halua antaa anteeksi. ', 'Voimme kehittää riippuvuuksia myös tunteita kohtaan, jos koemme saavamme voimaa vihasta, tämä voi olla merkki riippuvuudestamme. Anteeksiannon avulla voimme työstää myös torjuttuja ja kiellettyjä tunteita, joita emme voi tai haluakkaan kokea. Ihminen, joka tulee nukkumaan mennessä mieleemme, toimii kohteena vain näennäisesti. Todellisen työskentelyn kohteena on tunne ja kaikki ne tilanteet, joissa olemme tuon tunteen kohdanneet.  Saaristo toteaa, ettei anteeksiannon mysteeriä voi täysin tajuta, ellei ole itse kokeillut ja kokenut sitä. Anteeksiannossa ei ole lopulta kyse kenestäkään mieleen tulevasta henkilöstä vaan omista sisäisistä tunteisiin pohjautuvista luomuksistamme. Anteeksianto on teko, jonka avulla voimme työstää elämän vaikeuksia. Anteeksiantoa voi verrata hampaiden harjaamiseen, jota vain käytetään suuremmin kyselemättä, onko harjaus paikallaan. Monien kertomusten ja oman kokemuksen pohjalta voi todeta, että harjoitus toimii, kun teemme sitä, uskoimmepa siihen tai emme. Vaikutusten huomaamiseen tarvitaan vähintään neutraalia tai uteliaan myönteistä suhtautumista. Aika nopeasti voi tehdä havaintoja siitä, että jotakin tärkeää tapahtuu itsessä ja suhteessa muihin. Kiinnittämällä huomiota myös uniin, pääsemme tekemään havaintoja harjoituksen aikaansaamasta muutoksesta itsessä. ', '', '', ''),
(7, 1, 1, 7, '', '', '', 'Loving self', 'Itsen rakastaminen on sitä, että annamme itselle hyvää ravintoa, hyviä ajatuksia, huolenpitoa ja arvostusta, voimme alkaa luoda hyvää suhdetta itseemme. Rakkaus on välttämätön kaikelle elolliselle, voimme pelätä jonkun tulemista liian lähelle, jollemme ole kohdanneet sitä aikaisemmin. Ensin on tärkeätä opetella tuntemaan rakkautta ja sen jälkeen tuntemaan itsensä rakastetuksi. Kun avaamme itseä tunteaksemme rakkautta, paha ja puolustukset alkavat murtua. Ihmisestä tulee itselleen rakastava vanhempi, joka tekee hyviä asioita. Itsen rakastaminen näkyy huomion antamisena omille tarpeille, iloa tuottavien asioiden tekemisenä, kehoa rentouttavien hoitojen ottamisena, keskusteluavun hakemisena, itselle nauramisena, itsen kanssa vietettynä aikana, hupia ja iloa tuottavana liikkumisena. \r\n', 'Lähde: Ehdin (2015)', '', '', ''),
(8, 1, 1, 8, '', '', '', 'Own strenght', 'Oma voima tulee näkyväksi siinä, että teemme itsellemme hyvää ja otamme aikuisen vastuun omista tekemisistämme. Olemme ihmisinä perustavalla tavalla riippuvaisia toisistamme ja on tärkeätä osata ottaa vastaan myös apua, tukea ja neuvoja yms., lisäresursseja joita voimme toisillemme tarjota. Haitallinen omavoimaisuus ilmenee kyvyttömyytenä avun ja tuen vastaanottamiseen. Voimme vahvistaa omaa voimaamme harjoittamalla sitä. ', 'Omaan voimaan luottaminen näkyy siinä, että olemme toiveikkaita ja haluamme muuttaa tilannetta ja ryhdymme tarvittaviin tekoihin.  Se näkyy siinä, että otamme vastuuta siitä, että saamme elämässä tarvitsemamme asiat. Emme myöskään anna muiden odotusten johtaa elämäämme ja osamme vetää itsemme pois hankalista tilanteista.  Tärkeätä on lakata käyttäytymästä itseä tuhoavalla tavalla ja sallia omien arvojen johtaa elämää. Itsen kunnioittaminen ja sellaisten asioiden tekeminen, jotka saavat meidät voimaan hyvin kertovat omaan voimaan luottamisesta.  Luotanko siihen, että minussa on kaikki tarvittava viisaus, voima ja rohkeus elämässä tarvittaviin muutoksiin? Uskonko siihen, että minulla on valta muuttaa oma tilanne ja voin valita toisin?  \r\n', 'Lähde: Ehdin (2015)', '', ''),
(9, 1, 1, 9, '', '', '', 'Responsibility\r\n', 'Vastuun ottaminen itsestämme, toimistamme ja elämästämme on keskeinen asia todellisen itsen löytämisen tiellä. Ehdin (2015) kuvaa kirjassaan ihmisen vaiheita kolmen roolin avulla, uhri, selviytyjä ja elämänsä eläjä. Uhrin roolissa oleva näkee ja kokee ongelmien johtuvan aina muista ihmisistä. Elämme uhrikulttuurissa, jossa tarvitaan joku jota syyttää kaikesta, tällöin uhrin roolissa oleva voi kokea tulevansa kaltoin kohdelluksi. Uhrin rooli tulee näkyiin myös monissa riippuvuuksissa (ruoka, alkoholi, huumeet, shoppailu, pelit), joihin ihminen voi jäädä jumiin. Tällöin ihminen on vailla valtaa suhteessa omaan huumeeseensa. Tilanteeseen havahtuminen on ensimmäinen askel muutokseen. ', 'Näen, että ympäristöllä on tärkeä rooli uhrikulttuurin ylläpitämisessä tai alas ajamisessa. Voimme aina kysyä itseltämme olemmeko osa ongelmaa vai ratkaisua, kun etsimme suhtautumistamme toista moittivan tai valittavan ihmisen lähellä.  Valittaminen kertoo jollakin tavalla siitä, ettemme ole ottaneet itsellemme kuuluvaa vastuuta. Ympäristön oikeanlainen suhtautuminen on merkittävä asia, jotta uhrin roolissa oleva pääsee siirtymään seuraavaan vaiheeseen, selviytyjän rooliin.  Uhrin roolissa olevaa ei saa hylätä, hänelle tulee viestittää välittämistä vastuullisella tavalla.  Valittamiseen ja moittimiseen mukaan menemistä tulee välttää.  Kun ympäristö kykenee ottamaan vastuuta ja asettamaan lempeästi rajat toisiin kohdistuvalle hyökkäävälle käyttäytymiselle, uhrin roolissa oleva oppii vastuuta. Muiden tehtävänä on myös vahvistaa uhrin uskoa ja luottamusta ihmiseen, ihmisten yhteenkuuluvuuteen ja hyväntahtoisuuteen, johon uhrin roolissa oleva on menettänyt yhteyden.', 'Selviytyjän rooliin siirtynyt ymmärtää, etteivät monet asiat hänen elämässään ole hyvin ja että monet menneisyyden kokemukset ovat vaikuttaneet häneen. Hän alkaa ymmärtää, että ainoastaan hän itse voi vaikuttaa ja hän valitsee pulmiensa kohtaamisen.  Selviytyjä etsii aktiivisesti tietoa ja keinoja lukemalla ja muilla tavoilla, hän ottaa vastaan tukea ja hoitoa ymmärtääkseen omia kokemuksiaan. Tästä vaiheesta on mahdollista siirtyä kolmanteen, oman elämänsä eläjän vaiheeseen. Tällöin kypsyys tulee näkyväksi lisääntyneenä sovinnollisuutena itseä ja ympäristöä kohtaan.  Tässä vaiheessa ihminen voi jo keskittyä oman tilanteen muuttamiseen ja parempaan toimintaan itsensä ja muiden hyväksi.  Hän voi antaa panoksensa ympäristölle ja hän kykenee toimimaan kokonaisvaltaisesti ja pitkäjänteisesti. Ajattelen, että voimme liikkua edellä kuvattujen roolien väleillä ja siirtyminen jonkin asian kohdalla kehittyneempään rooliin ei välttämättä näy heti kaikkien asioiden kohdalla, vaan oman elämänsä eläjäksi kehittyminen vie meiltä monilta pideämmän aikaa.  ', 'Itsestään vastuun ottanut ihminen kykene ottamaan vastuun omasta terveydestä ja jaksamisesta, priorisoinneistaan, mielipiteistään, tunteistaan, arvoistaan ja moraalistaan, tarpeistaan ja unelmistaan. Hän hyväksyy ne ja on valmis sopivissa tilanteissa ilmaisemaan niitä. Vastuunottaja ei ole taakaksi eikä hänestä tarvitse kantaa huolta. Vuorovaikutuksessa harjoitamme vastuullista kuuntelemista, puhumista ja otamme vastuun myös tulkinnoistamme. Vastuun ottaminen heijastaa ihmisen itsearvostusta ja on kytköksissä itsetuntoon. ', 'Lähteet: Aalto (2014), Ehdin (2015)'),
(10, 1, 1, 10, '', '', '', 'Values', 'Values feedback on the next page with time management skills', '', '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `results`
--

CREATE TABLE IF NOT EXISTS `results` (
  `resultsID` int(11) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(255) CHARACTER SET latin1 NOT NULL,
  `avg` int(11) NOT NULL,
  `avg_category` int(11) NOT NULL,
  PRIMARY KEY (`resultsID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `statement`
--

CREATE TABLE IF NOT EXISTS `statement` (
  `statementID` int(32) NOT NULL AUTO_INCREMENT,
  `category1ID` int(32) NOT NULL,
  `category2ID` int(32) NOT NULL,
  `category3ID` int(32) NOT NULL,
  `text` text NOT NULL,
  `finnish` text NOT NULL,
  `isMultipleChoice` int(32) NOT NULL,
  `isFreeText` bit(1) NOT NULL,
  `isYesNo` bit(1) NOT NULL,
  `isReversed` bit(1) NOT NULL,
  PRIMARY KEY (`statementID`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=56 ;

--
-- Dumping data for table `statement`
--

INSERT INTO `statement` (`statementID`, `category1ID`, `category2ID`, `category3ID`, `text`, `finnish`, `isMultipleChoice`, `isFreeText`, `isYesNo`, `isReversed`) VALUES
(1, 1, 1, 1, 'I make choices and function in everyday situations based on my core values and my own truths', 'Olen arjessani tietoinen siitä, että teen valintoja ja toimin ydinarvojeni ja oman totuuteni pohjalta', 1, b'0', b'0', b'0'),
(2, 1, 1, 1, 'If required I express my own needs openly', 'Ilmaisen tarvittaessa omat tarpeeni avoimesti', 1, b'0', b'0', b'0'),
(3, 1, 1, 1, 'I take responsibility of my adult behaviour and I set suitable limits for myself', 'Otan vastuun aikuisesta käyttäytymisestäni ja asetan sopivat rajat itselle', 1, b'0', b'0', b'0'),
(4, 1, 1, 1, 'I respect other boundaries of other people and I do things that are good for others', 'Kunnioitan toisten ihmisten rajoja ja pyrin tekemään heille hyvää', 1, b'0', b'0', b'0'),
(7, 1, 1, 1, 'I enjoy time alone', 'Viihdyn itseni kanssa', 1, b'1', b'1', b'1'),
(8, 1, 1, 2, 'I accept myself completely', 'Hyväksyn itseni täydesti', 1, b'1', b'1', b'1'),
(5, 1, 1, 1, 'I take good care of myself', 'Pidän hyvää huolta itsestäni', 1, b'1', b'1', b'1'),
(6, 1, 1, 1, 'I am capable of saying no and can choose my own direction accordingly', 'Osaan sanoa ei ja kykenen valitsemaan oman suuntani mukaisesti', 1, b'1', b'1', b'1'),
(9, 1, 1, 2, 'I am valuable', 'Olen arvokas', 1, b'0', b'0', b'0'),
(10, 1, 1, 2, 'I''m happy with myself regardless of outer performance and accomplisments', 'Olen tyytyväinen itseeni ulkoisista suorituksista ja saavutuksista huolimatta', 1, b'1', b'1', b'1'),
(11, 1, 1, 2, 'I''m good the way I am', 'Kelpaan sellaisena kuin olen', 1, b'1', b'1', b'1'),
(12, 1, 1, 2, 'I know my weaknesses and strengths', 'Tunnen vahvuuteni ja heikkouteni', 1, b'1', b'1', b'1'),
(13, 1, 1, 3, 'I give myself a lot of opportunities so I can feel good internally and externally ', 'Annan itselleni paljon tilaisuuksia', 1, b'1', b'1', b'1'),
(14, 1, 1, 3, 'I am dedicated to reinforce and improve my strengths in my everyday life', 'Omistaudun arjessani vahvuuksieni vahvistamiseen', 1, b'1', b'1', b'1'),
(15, 1, 1, 3, 'I live my life the way I hope it to become', 'Elän elämääni sellaisena, jollaiseksi toivon sen muodostuvan', 1, b'0', b'0', b'0'),
(16, 1, 1, 3, 'I ensure that I add something to everyday that clarifies my inner direction ', 'Huolehdin siitä, että lisään elämääni päivittäin jotain, joka syventää omaa sisäistä suuntaani', 1, b'0', b'0', b'0'),
(17, 1, 1, 3, 'I am capable of keeping the direction I''ve chosen in the long term and I don''t require immediate rewards', 'Kykenen hyvin pysymään pitkäjänteisesti valitsemassani suunnassa ja selviydyn ilman välitöntä palkitsemista', 1, b'1', b'1', b'1'),
(18, 1, 1, 5, 'I am compassionate towards myself', 'Suhtaudun myötätuntoisesti itseeni', 1, b'0', b'0', b'0'),
(19, 1, 1, 5, 'I can be my own best friend even in tough times', 'Vaikeinakin hetkinä osaan olla itseni paras ystävä', 1, b'0', b'0', b'0'),
(20, 1, 1, 5, 'I don''t delay completing unpleasant tasks', 'En vitkuttele epämiellyttävien tehtävien kohdalla vaan kykenen tarttumaan niihin helposti', 1, b'0', b'0', b'0'),
(21, 1, 1, 5, 'It is easy for me to take responsibility of my mistakes', 'Minun on helppo ottaa vastuu virheistäni', 1, b'0', b'0', b'0'),
(22, 1, 1, 6, 'I exercise active forgiveness towards myself', 'Harjoitan aktiivista anteeksiantamista suhteessa itseeni', 1, b'0', b'0', b'0'),
(23, 1, 1, 6, 'I exercise active forgiveness towards others', 'Harjoitan aktiivista anteeksiantamista suhteessa toisiin', 1, b'0', b'0', b'0'),
(24, 1, 1, 7, 'I give myself good nutritional food and enough rest', 'Annan itselle hyvää ravintoa ja riittävästi lepoa', 1, b'0', b'0', b'0'),
(25, 1, 1, 7, 'I focus on positive thought', 'Kohdistan itseeni hyviä ajatuksia', 1, b'0', b'0', b'0'),
(26, 1, 1, 7, 'I provide myself respect and care', 'Annan itselle huolenpitoa ja arvostusta', 1, b'0', b'0', b'0'),
(27, 1, 1, 7, 'I create and maintain a good connection to myself', 'Luon ja pidän yllä hyvää suhdetta itseeni', 1, b'0', b'0', b'0'),
(28, 1, 1, 4, 'I enjoy what I have accomplished ', 'Nautin siitä, mitä olen saanut aikaiseksi', 1, b'0', b'0', b'0'),
(29, 1, 1, 4, 'My life is meaningful', 'Koen elämäni merkitykselliseksi', 1, b'1', b'1', b'1'),
(30, 1, 1, 4, 'My life is easy and goes on smoothly', 'Koen elämäni kevyeksi ja sujuvan helposti', 1, b'0', b'0', b'0'),
(31, 1, 1, 4, 'My life is rich', 'Koen elämäni rikkaaksi', 1, b'0', b'0', b'0'),
(32, 1, 1, 4, 'My life creates strenght', 'Elämäni tuottaa voimaa', 1, b'0', b'0', b'0'),
(33, 1, 1, 4, 'I am grateful and happy about what life has brought me', 'Koen kiitollisuutta ja iloa siitä, mitä elämä on tuonut', 1, b'0', b'0', b'0'),
(34, 1, 1, 8, 'When needed I ask for help in everyday situations', 'Pyydän tarvittaessa arjen tilanteissa apua', 1, b'1', b'1', b'1'),
(35, 1, 1, 8, 'I accept help in everyday situations', 'Otan arjen tilanteissa vastaan apua', 1, b'1', b'1', b'1'),
(36, 1, 1, 8, 'I believe that I have all the required wisdom', 'Luotan siihen, että minussa on kaikki tarvittava viisaus, voima ja rohkeus elämässä tarvittaviin muutoksiin', 1, b'0', b'0', b'0'),
(37, 1, 1, 8, 'I have the power to change my own situation', 'Minulla on valta muuttaa oma tilanne, voin valita toisin\r\n', 1, b'0', b'0', b'0'),
(38, 1, 1, 9, 'I am responsible of choices I make in everyday life ', 'Vastuu arjessa tekemistäni valinnoista on minulla', 1, b'1', b'1', b'1'),
(39, 1, 1, 9, 'Even small choices I make every day make a difference', 'Pienilläkin arjessa tekemilläni valinnoilla on merkitystä', 1, b'1', b'1', b'1'),
(40, 1, 1, 9, 'I am aware that even not making a choice is a choice', 'Tiedostan että valitsematta jättäminenkin on valinta', 1, b'0', b'0', b'0'),
(41, 1, 1, 9, 'I take responsibility of my health in everyday life', 'Otan arjessa vastuun terveydestäni', 1, b'1', b'1', b'1'),
(42, 1, 1, 9, 'I take responsibility of my opinions in everyday life', 'Otan arjessa vastuun mielipiteistäni', 1, b'1', b'1', b'1'),
(43, 1, 1, 9, 'I take responsibility of how I am coping', 'Otan arjessa vastuun jaksamisestani', 1, b'1', b'1', b'1'),
(44, 1, 1, 9, 'I take responsibility of my own feelings in everyday life', 'Otan arjessa vastuun tunteistani', 1, b'1', b'1', b'1'),
(45, 1, 1, 9, 'I take responsibility of my needs in everyday life', 'Otan arjessa vastuun tarpeistani', 1, b'1', b'1', b'1'),
(46, 1, 1, 9, 'I take responsibility of my dreams', 'Otan vastuun unelmistani', 1, b'1', b'1', b'1'),
(47, 1, 1, 9, 'I don''t complain about my life', 'Olen kiitollinen elämästäni, en valita elämääni', 1, b'1', b'1', b'1'),
(48, 1, 1, 10, 'My values are clear to me', 'Olen kirkastanut arvoni', 1, b'1', b'1', b'1'),
(49, 1, 1, 10, 'Name 3 important values', 'Nimeä kolme tärkeintä arvoasi, asiat joiden puolesta kannattaa elää (Ollila 2010). Laita arvot itsellesi muistiin, järjestelmä ei tallenna niitä. ', 0, b'1', b'1', b'1'),
(50, 1, 1, 10, 'My values guide my life and can be seen in the choices I make everyday', 'Nimeämäni arvot johtavat elämääni ja näkyvät arjessa tekemissäni valinnoissa', 1, b'0', b'0', b'0'),
(51, 1, 1, 11, 'The way I use my time is inline with my values', 'Ajankäyttöni vastaa arvojani', 1, b'0', b'0', b'0'),
(52, 1, 1, 11, 'I am able to influence the way I use my time', 'Voin vaikuttaa omaan ajankäyttööni', 1, b'0', b'0', b'0'),
(53, 1, 1, 11, 'I reserve time for things that are important to me', 'Varaan kalenteristani tilaa itselle tärkeisiin asioihin, ne eivät jää muun jalkoihin', 1, b'0', b'0', b'0'),
(55, 2, 2, 1, 'test', 'test', 0, b'0', b'0', b'0');

-- --------------------------------------------------------

--
-- Table structure for table `ueq`
--

CREATE TABLE IF NOT EXISTS `ueq` (
  `ueqID` int(11) NOT NULL AUTO_INCREMENT,
  `scale_start` text CHARACTER SET latin1 NOT NULL,
  `scale_end` text CHARACTER SET latin1 NOT NULL,
  `finnish_scale_start` text CHARACTER SET latin1 NOT NULL,
  `finnish_scale_end` text CHARACTER SET latin1 NOT NULL,
  PRIMARY KEY (`ueqID`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=27 ;

--
-- Dumping data for table `ueq`
--

INSERT INTO `ueq` (`ueqID`, `scale_start`, `scale_end`, `finnish_scale_start`, `finnish_scale_end`) VALUES
(1, 'annoying', 'enjoyable', 'ärsyttävä', 'nautinnollinen'),
(2, 'not understandable', 'understandable', 'ei ymmärrettävä', 'ymmärrettävä'),
(3, 'creative', 'dull', 'luova\r\n', 'mielikuvitukseton'),
(4, 'easy to learn', 'difficult to learn', 'helppo oppia', 'vaikea oppia'),
(5, 'valuable', 'inferior\r\n', 'arvokas', 'arvoton'),
(6, 'boring', 'exciting', 'ikävystyttävä', 'jännittävä'),
(7, 'not interesting', 'interesting', 'ei kiinnostava\r\n', 'mielenkiintoinen'),
(8, 'unpredictable', 'predictable', 'ennalta-arvaamaton', 'ennustettavissa\r\n'),
(9, 'fast', 'slow', 'nopea', 'hidas'),
(10, 'inventive\r\n', 'conventional', 'kekseliäs', 'tavanomainen'),
(11, 'obstructive', 'supportive', 'hajottava', 'tukea antava'),
(12, 'good', 'bad', 'hyvä', 'huono'),
(13, 'complicated', 'easy\r\n', 'monimutkainen', 'helppo'),
(14, 'unlikable', 'pleasing\r\n', 'epämiellyttävä', 'miellyttävä'),
(15, 'usual', 'leading edge', 'tavallinen', 'uraauurtava\r\n'),
(16, 'unpleasant', 'pleasant', 'epämukava', 'mukava'),
(17, 'secure', 'not secure', 'turvallinen', 'turvaton'),
(18, 'motivating\r\n', 'demotivating', 'motivoiva', 'motivatiota vähentävä'),
(19, 'meets expectations', 'does not meet expectations', 'täyttää odotukset', 'ei täytä odotuksia'),
(20, 'inefficient', 'efficient', 'tehoton', 'tehokas'),
(21, 'clear', 'confusing', 'selkeä', 'sekava'),
(22, 'impractical', 'practical', 'epäkäytännöllinen', 'käytännöllinen'),
(23, 'organized', 'cluttered', 'järjestelmällinen', 'epäjärjestelmällinen'),
(24, 'attractive', 'unattractive\r\n', 'houkutteleva', 'ei houkutteleva'),
(25, 'friendly', 'unfriendly', 'ystävällinen', 'epäystävällinen'),
(26, 'conservative', 'innovative', 'konservatiivinen\r\n', 'innovatiivinen');

-- --------------------------------------------------------

--
-- Table structure for table `ueqAnswer`
--

CREATE TABLE IF NOT EXISTS `ueqAnswer` (
  `ueqAnswerID` int(11) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(255) NOT NULL,
  `ueqQuestionID` int(11) NOT NULL,
  `ueqValue` int(11) NOT NULL,
  PRIMARY KEY (`ueqAnswerID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `ueqOption`
--

CREATE TABLE IF NOT EXISTS `ueqOption` (
  `ueqOptionID` int(11) NOT NULL,
  `value` int(11) NOT NULL,
  UNIQUE KEY `ueqOptionID` (`ueqOptionID`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ueqOption`
--

INSERT INTO `ueqOption` (`ueqOptionID`, `value`) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 7);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(255) CHARACTER SET latin1 NOT NULL,
  `user_email` varchar(60) CHARACTER SET latin1 NOT NULL,
  `user_pass` varchar(255) CHARACTER SET latin1 NOT NULL,
  `firstname` varchar(60) CHARACTER SET latin1 NOT NULL,
  `lastname` varchar(11) CHARACTER SET latin1 NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `user_name` (`user_name`),
  UNIQUE KEY `user_email` (`user_email`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `valuesAnswer`
--

CREATE TABLE IF NOT EXISTS `valuesAnswer` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(255) NOT NULL,
  `value1` int(11) NOT NULL,
  `value2` int(11) NOT NULL,
  `value3` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `valuesQuestion`
--

CREATE TABLE IF NOT EXISTS `valuesQuestion` (
  `valueID` int(11) NOT NULL AUTO_INCREMENT,
  `statementID` int(11) NOT NULL,
  `value` text NOT NULL,
  `finnish` text NOT NULL,
  PRIMARY KEY (`valueID`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=49 ;

--
-- Dumping data for table `valuesQuestion`
--

INSERT INTO `valuesQuestion` (`valueID`, `statementID`, `value`, `finnish`) VALUES
(1, 49, 'asuinpaikka', 'asuinpaikka'),
(2, 49, 'auktoriteetti', 'auktoriteetti'),
(3, 49, 'autonomia', 'autonomia'),
(4, 49, 'empaattisuus', 'empaattisuus'),
(5, 49, 'edistyminen', 'edistyminen'),
(6, 49, 'erilaiset perspektiivit', 'erilaiset perspektiivit'),
(7, 49, 'estetiikka', 'estetiikka'),
(8, 49, 'fyysinen kunto', 'fyysinen kunto'),
(9, 49, 'haasteet', 'haasteet'),
(10, 49, 'hengellisyys', 'hengellisyys'),
(11, 49, 'henkinen kasvu', 'henkinen kasvu'),
(12, 49, 'huumori', 'huumori'),
(13, 49, 'ihmisten yhteenkuuluvuus', 'ihmisten yhteenkuuluvuus'),
(14, 49, 'intohimo', 'intohimo'),
(15, 49, 'itsekunnioitus', 'itsekunnioitus'),
(16, 49, 'järjestys', 'järjestys'),
(17, 49, 'kilpailu', 'kilpailu'),
(18, 49, 'kompetenssi', 'kompetenssi'),
(19, 49, 'lojaalisuus', 'lojaalisuus'),
(20, 49, 'luotettavuus', 'luotettavuus'),
(21, 49, 'luovuus', 'luovuus'),
(22, 49, 'muutos ja variaatio', 'muutos ja variaatio'),
(23, 49, 'myötätunto', 'myötätunto'),
(24, 49, 'nautinto', 'nautinto'),
(25, 49, 'oikeudenmukaisuus', 'oikeudenmukaisuus'),
(26, 49, 'perhe', 'perhe'),
(27, 49, 'rakkaus', 'rakkaus'),
(28, 49, 'rohkeus', 'rohkeus'),
(29, 49, 'saavuttaminen', 'saavuttaminen'),
(30, 49, 'seikkailu', 'seikkailu'),
(31, 49, 'sisäinen harmonia', 'sisäinen harmonia'),
(32, 49, 'status', 'status'),
(33, 49, 'taloudellinen turvallisuus', 'taloudellinen turvallisuus'),
(34, 49, 'terveys', 'terveys'),
(35, 49, 'tieto', 'tieto'),
(36, 49, 'toisten auttaminen', 'toisten auttaminen'),
(37, 49, 'tunnustus', 'tunnustus'),
(38, 49, 'vaikutusvalta', 'vaikutusvalta'),
(39, 49, 'vastuullisuus', 'vastuullisuus'),
(40, 49, 'velvollisuus', 'velvollisuus'),
(41, 49, 'viisaus', 'viisaus'),
(42, 49, 'yhteistyö', 'yhteistyö'),
(43, 49, 'yhteisyys', 'yhteisyys'),
(44, 49, 'yhteisö', 'yhteisö'),
(45, 49, 'yltäkylläisyys', 'yltäkylläisyys'),
(46, 49, 'ystävyys', 'ystävyys'),
(47, 49, 'tai joku muu itsellesi tärkeä asia', 'tai joku muu itsellesi tärkeä asia');
--
-- Database: `jennimj_ap1`
--

-- --------------------------------------------------------

--
-- Table structure for table `ap_comment`
--

CREATE TABLE IF NOT EXISTS `ap_comment` (
  `com_id` int(9) NOT NULL AUTO_INCREMENT,
  `poll_id` int(9) NOT NULL DEFAULT '0',
  `time` int(11) NOT NULL DEFAULT '0',
  `host` varchar(255) NOT NULL,
  `browser` varchar(255) NOT NULL,
  `name` varchar(60) NOT NULL,
  `email` varchar(100) NOT NULL,
  `message` text NOT NULL,
  PRIMARY KEY (`com_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `ap_comment`
--

INSERT INTO `ap_comment` (`com_id`, `poll_id`, `time`, `host`, `browser`, `name`, `email`, `message`) VALUES
(1, 1, 1489274850, 'localhost', 'Mozilla/4.0 (compatible; MSIE 5.5; Windows NT 4.0)', 'nobody', 'nobody@server.com', 'This is the first comment!');

-- --------------------------------------------------------

--
-- Table structure for table `ap_config`
--

CREATE TABLE IF NOT EXISTS `ap_config` (
  `config_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `base_gif` varchar(60) NOT NULL,
  `lang` varchar(20) NOT NULL,
  `title` varchar(60) NOT NULL,
  `vote_button` varchar(30) NOT NULL,
  `result_text` varchar(40) NOT NULL,
  `total_text` varchar(40) NOT NULL,
  `voted` varchar(40) NOT NULL,
  `send_com` varchar(40) NOT NULL,
  `img_height` int(5) NOT NULL DEFAULT '0',
  `img_length` int(5) NOT NULL DEFAULT '0',
  `table_width` varchar(6) NOT NULL,
  `bgcolor_tab` varchar(7) NOT NULL,
  `bgcolor_fr` varchar(7) NOT NULL,
  `font_face` varchar(70) NOT NULL,
  `font_color` varchar(7) NOT NULL,
  `type` varchar(10) NOT NULL DEFAULT '0',
  `check_ip` smallint(2) NOT NULL DEFAULT '0',
  `lock_timeout` int(9) NOT NULL DEFAULT '0',
  `time_offset` varchar(5) NOT NULL DEFAULT '0',
  `entry_pp` int(4) unsigned NOT NULL DEFAULT '0',
  `poll_version` varchar(5) NOT NULL DEFAULT '0',
  `base_url` varchar(100) NOT NULL DEFAULT '',
  `result_order` varchar(20) NOT NULL DEFAULT '',
  `def_options` smallint(3) unsigned NOT NULL DEFAULT '0',
  `polls_pp` int(5) unsigned NOT NULL DEFAULT '0',
  `captcha` varchar(5) NOT NULL,
  PRIMARY KEY (`config_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `ap_config`
--

INSERT INTO `ap_config` (`config_id`, `base_gif`, `lang`, `title`, `vote_button`, `result_text`, `total_text`, `voted`, `send_com`, `img_height`, `img_length`, `table_width`, `bgcolor_tab`, `bgcolor_fr`, `font_face`, `font_color`, `type`, `check_ip`, `lock_timeout`, `time_offset`, `entry_pp`, `poll_version`, `base_url`, `result_order`, `def_options`, `polls_pp`, `captcha`) VALUES
(1, '/survey/image', 'english_utf8.php', 'Advanced Poll', 'Vote', 'View results', 'Total votes', 'You have already voted!', 'Send comment', 10, 42, '170', '#FFFFFF', '#666699', 'Verdana, Arial, Helvetica, sans-serif', '#000000', 'percent', 0, 2, '0', 5, '2.09', '/survey', 'desc', 10, 12, 'on');

-- --------------------------------------------------------

--
-- Table structure for table `ap_data`
--

CREATE TABLE IF NOT EXISTS `ap_data` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `poll_id` int(11) NOT NULL DEFAULT '0',
  `option_id` int(11) NOT NULL DEFAULT '0',
  `option_text` varchar(100) NOT NULL,
  `color` varchar(20) NOT NULL,
  `votes` int(14) NOT NULL DEFAULT '0',
  PRIMARY KEY (`poll_id`,`option_id`),
  KEY `id` (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=21 ;

--
-- Dumping data for table `ap_data`
--

INSERT INTO `ap_data` (`id`, `poll_id`, `option_id`, `option_text`, `color`, `votes`) VALUES
(1, 1, 1, 'Linux', 'blue', 49),
(2, 1, 2, 'Solaris', 'yellow', 12),
(3, 1, 3, 'FreeBSD', 'green', 29),
(4, 1, 4, 'WindowsNT', 'brown', 17),
(5, 1, 5, 'Unix', 'grey', 10),
(6, 1, 6, 'BSD', 'red', 15),
(7, 1, 7, 'other', 'purple', 9),
(8, 2, 5, 'Sybase', 'orange', 2),
(9, 2, 4, 'MS SQL', 'green', 9),
(10, 2, 3, 'Oracle', 'blue', 17),
(11, 2, 2, 'PostgreSQL', 'gold', 6),
(12, 2, 1, 'MySQL', 'pink', 23),
(13, 2, 6, 'other', 'brown', 3),
(14, 2, 7, 'DB/2', 'grey', 5),
(15, 3, 1, 'PHP', 'red', 65),
(16, 3, 2, 'Perl', 'orange', 34),
(17, 3, 3, 'ASP', 'green', 17),
(18, 3, 4, 'JSP', 'purple', 20),
(19, 3, 5, 'Python', 'gold', 8),
(20, 3, 6, 'other', 'aqua', 16);

-- --------------------------------------------------------

--
-- Table structure for table `ap_index`
--

CREATE TABLE IF NOT EXISTS `ap_index` (
  `poll_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `question` varchar(100) NOT NULL,
  `timestamp` int(11) NOT NULL DEFAULT '0',
  `status` smallint(2) NOT NULL DEFAULT '0',
  `logging` smallint(2) NOT NULL DEFAULT '0',
  `exp_time` int(11) NOT NULL DEFAULT '0',
  `expire` smallint(2) NOT NULL DEFAULT '0',
  `comments` smallint(2) NOT NULL DEFAULT '0',
  PRIMARY KEY (`poll_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `ap_index`
--

INSERT INTO `ap_index` (`poll_id`, `question`, `timestamp`, `status`, `logging`, `exp_time`, `expire`, `comments`) VALUES
(1, 'Which OS is your Website running on?', 1489274850, 1, 1, 1490138850, 1, 1),
(2, 'Which database engine do you prefer?', 1489274900, 1, 0, 1490138850, 0, 1),
(3, 'What is your favourite scripting language?', 1489274900, 1, 0, 1490138850, 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `ap_ip`
--

CREATE TABLE IF NOT EXISTS `ap_ip` (
  `ip_id` int(11) NOT NULL AUTO_INCREMENT,
  `poll_id` int(11) NOT NULL DEFAULT '0',
  `ip_addr` varchar(15) NOT NULL,
  `timestamp` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ip_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `ap_log`
--

CREATE TABLE IF NOT EXISTS `ap_log` (
  `log_id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `poll_id` int(11) NOT NULL DEFAULT '0',
  `option_id` int(11) NOT NULL DEFAULT '0',
  `timestamp` int(11) NOT NULL DEFAULT '0',
  `ip_addr` varchar(15) NOT NULL,
  `host` varchar(255) NOT NULL,
  `agent` varchar(255) NOT NULL DEFAULT '0',
  PRIMARY KEY (`log_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `ap_log`
--

INSERT INTO `ap_log` (`log_id`, `poll_id`, `option_id`, `timestamp`, `ip_addr`, `host`, `agent`) VALUES
(1, 1, 0, 1489274908, '81.109.238.33', 'cpc6-broo8-2-0-cust544.14-2.cable.virginm.net', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/56.0.2924.87 Safari/537.36');

-- --------------------------------------------------------

--
-- Table structure for table `ap_templates`
--

CREATE TABLE IF NOT EXISTS `ap_templates` (
  `tpl_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tplset_id` int(10) unsigned NOT NULL DEFAULT '0',
  `title` varchar(100) NOT NULL DEFAULT '',
  `template` mediumtext NOT NULL,
  PRIMARY KEY (`tpl_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=41 ;

--
-- Dumping data for table `ap_templates`
--

INSERT INTO `ap_templates` (`tpl_id`, `tplset_id`, `title`, `template`) VALUES
(1, 1, 'display_head', '<table width="$pollvars[table_width]" border="0" cellspacing="0" cellpadding="1" bgcolor="$pollvars[bgcolor_fr]">\r\n  <tr align="center">\r\n    <td>\r\n      <style type="text/css">\r\n <!--\r\n  .input { font-family: $pollvars[font_face]; font-size: 8pt}\r\n -->\r\n</style>\r\n      <font face="$pollvars[font_face]" size="-1" color="#FFFFFF"><b>$pollvars[title]</b></font></td>\r\n  </tr>\r\n  <tr align="center"> \r\n    <td> \r\n      <table width="100%" border="0" cellspacing="0" cellpadding="2" align="center" bgcolor="$pollvars[bgcolor_tab]">\r\n        <tr> \r\n          <td height="40" valign="middle"><font face="$pollvars[font_face]" color="$pollvars[font_color]" size="1"><b>$question</b></font></td>\r\n        </tr>\r\n        <tr align="right" valign="top"> \r\n          <td>\r\n            <form method="post" action="$this->form_forward">\r\n              <table width="100%" border="0" cellspacing="0" cellpadding="0" align="center">\r\n                <tr valign="top" align="center"> \r\n                  <td> \r\n                    <table width="100%" border="0" cellspacing="0" cellpadding="1" align="center">\r\n'),
(2, 1, 'display_loop', ' <tr> \r\n   <td width="15%"><input type="radio" name="option_id" value="$data[option_id]"></td>\r\n   <td width="85%"><font face="$pollvars[font_face]" size="1" color="$pollvars[font_color]">$data[option_text]</font></td>\r\n </tr>\r\n'),
(3, 1, 'display_foot', '                    </table>\r\n                    <input type="hidden" name="action" value="vote">\r\n                    <input type="hidden" name="poll_ident" value="$poll_id">\r\n                    <input type="submit" value="$pollvars[vote_button]" class="input">\r\n                    <br>\r\n                    <br>\r\n                    <font face="$pollvars[font_face]" color="$pollvars[font_color]" size="1"><a href="$this->form_forward?action=results&amp;poll_ident=$poll_id">$pollvars[result_text]</a></font>\r\n                  </td>\r\n                </tr>\r\n              </table>\r\n            </form>\r\n            <font face="$pollvars[font_face]" size="1"><a href="http://www.proxy2.de" target="_blank" title="Advanced Poll">Version $pollvars[poll_version]</a></font>\r\n          </td>\r\n        </tr>\r\n      </table>\r\n    </td>\r\n  </tr>\r\n</table>\r\n'),
(4, 1, 'result_head', '<table width="$pollvars[table_width]" border="0" cellspacing="0" cellpadding="1" bgcolor="$pollvars[bgcolor_fr]">\r\n<tr align="center">\r\n<td>\r\n<style type="text/css">\r\n<!--\r\n .input { font-family: $pollvars[font_face]; font-size: 8pt}\r\n .links { font-family: $pollvars[font_face]; font-size: 7.5pt; color: $pollvars[font_color]}\r\n-->\r\n</style>\r\n<font face="$pollvars[font_face]" size="-1" color="#FFFFFF"><b>$pollvars[title]</b></font></td>\r\n</tr>\r\n<tr align="center">\r\n <td><table width="100%" border="0" cellspacing="0" cellpadding="2" align="center" bgcolor="$pollvars[bgcolor_tab]">\r\n <tr valign="middle">\r\n   <td height="40"><font face="$pollvars[font_face]" color="$pollvars[font_color]" size="1"><b>$question</b></font></td>\r\n </tr>\r\n <tr align="right" valign="bottom">\r\n   <td>\r\n     <table border="0" cellspacing="0" cellpadding="1" width="100%" align="center">\r\n       <tr valign="top">\r\n        <td>\r\n         <table width="100%" border="0" cellspacing="0" cellpadding="1" align="center">\r\n'),
(5, 1, 'result_loop', '<tr>\r\n    <td height="22"><font face="$pollvars[font_face]" color="$pollvars[font_color]" size="1">$option_text</font></td>\r\n    <td nowrap height="22"><font face="$pollvars[font_face]" color="$pollvars[font_color]" size="1"><img src="$pollvars[base_gif]/$poll_color.gif" width="$img_width" height="$pollvars[img_height]"> $vote_val</font></td>\r\n</tr>\r\n'),
(6, 1, 'result_foot', '       </table>\r\n       <font face="$pollvars[font_face]" color="$pollvars[font_color]" size="1"><br>\r\n       $pollvars[total_text]: <font color="#CC0000">$total_votes</font><br>\r\n       $VOTE<br><br><div align="center">\r\n       $COMMENT&nbsp;</div></font>\r\n       </td></tr>\r\n      <tr><td height="2">&nbsp;</td></tr>\r\n     </table>\r\n    <font face="$pollvars[font_face]" size="1"><a href="http://www.proxy2.de" target="_blank" title="Advanced Poll">Version $pollvars[poll_version]</a></font></td>\r\n   </tr>\r\n </table>\r\n</td>\r\n</tr>\r\n</table>\r\n'),
(7, 1, 'comment', '<table border="0" cellspacing="0" cellpadding="1" align="center" bgcolor="#666699">\r\n  <tr align="center">\r\n    <td>\r\n     <style type="text/css">\r\n      <!--\r\n       .button {  font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 8pt}\r\n       .textarea {  font-family: "MS Sans Serif"; font-size: 9pt; width: 195px}\r\n       .input {  width: 195px}\r\n      -->\r\n    </style><font color="#FFFFFF" face="Verdana, Arial, Helvetica, sans-serif" size="2"><b>Send Your Comment</b></font></td>\r\n  </tr>\r\n  <tr>\r\n    <td>\r\n      <table border="0" cellspacing="0" cellpadding="5" align="center" bgcolor="#FFFFFF" width="200">\r\n        <tr>\r\n          <td width="149">\r\n            <form method="post" action="$this->form_forward">\r\n              <table border="0" cellspacing="0" cellpadding="2" bgcolor="" align="center">\r\n                <tr>\r\n                  <td class="td1" height="40"><b><font face="Verdana, Arial, Helvetica, sans-serif" size="1">$question</font></b></td>\r\n                </tr>\r\n                <tr>\r\n                  <td class="td1"><font face="Verdana, Arial, Helvetica, sans-serif" size="1">Name:</font><br>\r\n                    <input type="text" name="name" maxlength="25" class="input" size="23">\r\n                  </td>\r\n                </tr>\r\n                <tr>\r\n                  <td class="td1"><font face="Verdana, Arial, Helvetica, sans-serif" size="1">e-mail:</font><br>\r\n                    <input type="text" name="email" size="23" maxlength="50" class="input">\r\n                  </td>\r\n                </tr>\r\n                <tr>\r\n                  <td class="td1"><font face="Verdana, Arial, Helvetica, sans-serif" size="1">Comment(*):</font><br>\r\n                    <font face="MS Sans Serif" size="1">\r\n                    <textarea name="message" cols="19" wrap="VIRTUAL" rows="3" class="textarea"></textarea>\r\n                    </font>\r\n                    $POLL_CAPTCHA\r\n                  </td>\r\n                </tr>\r\n                <tr valign="top">\r\n                  <td>\r\n                    <input type="submit" value="Submit" class="button">\r\n                    <input type="reset" value="Reset" class="button">\r\n                    <input type="hidden" name="action" value="add">\r\n                    <input type="hidden" name="id" value="$poll_id">\r\n		    <input type="hidden" name="time" value="$poll_time">\r\n                  </td>\r\n                </tr>\r\n              </table>\r\n            </form>\r\n          </td>\r\n        </tr>\r\n      </table>\r\n    </td>\r\n  </tr>\r\n</table>\r\n'),
(8, 2, 'display_head', '<table width="$pollvars[table_width]" cellspacing="0" cellpadding="0" border="0" bgcolor="#F3F3F3">\r\n  <tr valign="top"> \r\n    <td valign="top" align="right">\r\n      <form method="post" action="$this->form_forward">\r\n        <table width="100%" border="0" cellspacing="0" cellpadding="3">\r\n          <tr bgcolor="$pollvars[bgcolor_fr]"> \r\n            <td colspan="2" height="30"><font face="$pollvars[font_face]" color="#FFFFFF" size="1"><b>\r\n              $question</b></font></td>\r\n          </tr>\r\n'),
(9, 2, 'display_loop', '<tr> \r\n    <td width="14%"><input type="radio" name="option_id" value="$data[option_id]"></td>\r\n    <td width="86%"><font face="$pollvars[font_face]" size="1" color="$pollvars[font_color]">$data[option_text]</font></td>\r\n</tr>\r\n'),
(10, 2, 'display_foot', '          <tr align="center"> \r\n            <td colspan="2"> \r\n              <input type="image" border="0" src="$pollvars[base_gif]/vote.gif" width="110" height="48">\r\n              <input type="hidden" name="action" value="vote">\r\n              <input type="hidden" name="poll_ident" value="$poll_id">\r\n              <br>\r\n              <font face="$pollvars[font_face]" color="$pollvars[font_color]" size="1"><a href="$this->form_forward?action=results&amp;poll_ident=$poll_id">$pollvars[result_text]</a>\r\n            </td>\r\n          </tr>\r\n        </table>\r\n      </form>\r\n      <font face="$pollvars[font_face]" size="1"><a href="http://www.proxy2.de" target="_blank" title="Advanced Poll">Version $pollvars[poll_version]</a></font>\r\n     </td>\r\n  </tr>\r\n</table>\r\n'),
(11, 2, 'result_head', '<table width="170" border="0" cellspacing="0" cellpadding="3" bgcolor="#F3F3F3">\r\n  <tr> \r\n    <td colspan="2" height="25" bgcolor="$pollvars[bgcolor_fr]"><font face="$pollvars[font_face]" color="#FFFFFF" size="1"><b>$question</b></font></td>\r\n  </tr>\r\n\r\n'),
(12, 2, 'result_loop', '  <tr> \r\n    <td colspan="2"><font face="$pollvars[font_face]" color="$pollvars[font_color]" size="1">$option_text</font></td>\r\n  </tr>\r\n  <tr> \r\n    <td width="52%"><img src="$pollvars[base_gif]/greenbar.gif" width="$img_width" height="7"></td>\r\n    <td width="48%"><font face="$pollvars[font_face]" color="$pollvars[font_color]" size="1">$vote_val</font></td>\r\n  </tr>\r\n'),
(13, 2, 'result_foot', '  <tr> \r\n    <td colspan="2" height="40"><font face="$pollvars[font_face]" color="$pollvars[font_color]" size="1"> \r\n      $pollvars[total_text]: <font color="#CC0000">$total_votes</font>\r\n      <br>$VOTE</font><br><div align="center"><font face="$pollvars[font_face]" color="$pollvars[font_color]" size="1">$COMMENT</font></div>\r\n    </td>\r\n  </tr>\r\n  <tr align="right" valign="bottom" height="30"> \r\n    <td colspan="2"><font face="$pollvars[font_face]" size="1"><a href="http://www.proxy2.de" target="_blank" title="Advanced Poll">Version $pollvars[poll_version]</a></font></td>\r\n  </tr>\r\n</table>\r\n'),
(14, 2, 'comment', '<table border="0" cellspacing="0" cellpadding="1" align="center" bgcolor="#666699">\r\n  <tr align="center">\r\n    <td>\r\n     <style type="text/css">\r\n      <!--\r\n       .button {  font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 8pt}\r\n       .textarea {  font-family: "MS Sans Serif"; font-size: 9pt; width: 195px}\r\n       .input {  width: 195px}\r\n      -->\r\n    </style><font color="#FFFFFF" face="Verdana, Arial, Helvetica, sans-serif" size="2"><b>Send Your Comment</b></font></td>\r\n  </tr>\r\n  <tr>\r\n    <td>\r\n      <table border="0" cellspacing="0" cellpadding="5" align="center" bgcolor="#F3F3F3" width="200">\r\n        <tr>\r\n          <td width="149">\r\n            <form method="post" action="$this->form_forward">\r\n              <table border="0" cellspacing="0" cellpadding="2" bgcolor="" align="center">\r\n                <tr>\r\n                  <td class="td1" height="40"><b><font face="Verdana, Arial, Helvetica, sans-serif" size="1">$question</font></b></td>\r\n                </tr>\r\n                <tr>\r\n                  <td class="td1"><font face="Verdana, Arial, Helvetica, sans-serif" size="1">Name:</font><br>\r\n                    <input type="text" name="name" maxlength="25" class="input" size="23">\r\n                  </td>\r\n                </tr>\r\n                <tr>\r\n                  <td class="td1"><font face="Verdana, Arial, Helvetica, sans-serif" size="1">e-mail:</font><br>\r\n                    <input type="text" name="email" size="23" maxlength="50" class="input">\r\n                  </td>\r\n                </tr>\r\n                <tr>\r\n                  <td class="td1"><font face="Verdana, Arial, Helvetica, sans-serif" size="1">Comment(*):</font><br>\r\n                    <font face="MS Sans Serif" size="1">\r\n                    <textarea name="message" cols="19" wrap="VIRTUAL" rows="3" class="textarea"></textarea>\r\n                    </font>\r\n                    $POLL_CAPTCHA\r\n                  </td>\r\n                </tr>\r\n                <tr valign="top">\r\n                  <td>\r\n                    <input type="submit" value="Submit" class="button">\r\n                    <input type="reset" value="Reset" class="button">\r\n                    <input type="hidden" name="action" value="add">\r\n                    <input type="hidden" name="id" value="$poll_id">\r\n                    <input type="hidden" name="time" value="$poll_time">\r\n                  </td>\r\n                </tr>\r\n              </table>\r\n            </form>\r\n          </td>\r\n        </tr>\r\n      </table>\r\n    </td>\r\n  </tr>\r\n</table>\r\n'),
(15, 3, 'display_head', '<table width="$pollvars[table_width]" border="0" cellspacing="0" cellpadding="1" bgcolor="$pollvars[bgcolor_fr]">\r\n  <tr align="center">\r\n    <td>\r\n      <style type="text/css">\r\n <!--\r\n  .input { font-family: $pollvars[font_face]; font-size: 8pt}\r\n -->\r\n</style>\r\n      <font face="$pollvars[font_face]" size="-1" color="#FFFFFF"><b>$pollvars[title]</b></font></td>\r\n  </tr>\r\n  <tr align="center"> \r\n    <td> \r\n      <table width="100%" border="0" cellspacing="0" cellpadding="2" align="center" bgcolor="$pollvars[bgcolor_tab]">\r\n        <tr> \r\n          <td height="40" valign="middle"><font face="$pollvars[font_face]" color="$pollvars[font_color]" size="1"><b>$question</b></font></td>\r\n        </tr>\r\n        <tr align="right" valign="top"> \r\n          <td>\r\n            <form method="post" name="poll_$poll_id" onsubmit="return poll_results_$poll_id(''vote'',''$pollvars[base_url]/popup.php'',''Poll'',''500'',''350'',''toolbar=no,scrollbars=yes'');">\r\n              <script language="JavaScript">\r\n<!--\r\nfunction poll_results_$poll_id(action,theURL,winName,winWidth,winHeight,features) {      \r\n    var w = (screen.width - winWidth)/2;\r\n    var h = (screen.height - winHeight)/2 - 20;\r\n    features = features+'',width=''+winWidth+'',height=''+winHeight+'',top=''+h+'',left=''+w;\r\n    var poll_ident = self.document.poll_$poll_id.poll_ident.value;\r\n    option_id = '''';\r\n    for (i=0; i<self.document.poll_$poll_id.option_id.length; i++) {\r\n        if(self.document.poll_$poll_id.option_id[i].checked == true) {\r\n            option_id = self.document.poll_$poll_id.option_id[i].value;\r\n            break;\r\n        }\r\n    }\r\n    option_id = (option_id != '''') ? ''&option_id=''+option_id : '''';\r\n    if (action==''results'' || (option_id != '''' && action==''vote'')) {\r\n        theURL = theURL+''?action=''+action+''&poll_ident=''+poll_ident+option_id;\r\n        poll_popup = window.open(theURL,winName,features);\r\n        poll_popup.focus();\r\n    }\r\n    return false;\r\n}\r\n//-->\r\n        </script>\r\n              <table width="100%" border="0" cellspacing="0" cellpadding="0" align="center">\r\n                <tr valign="top" align="center"> \r\n                  <td> \r\n                    <table width="100%" border="0" cellspacing="0" cellpadding="1" align="center">\r\n'),
(16, 3, 'display_loop', ' <tr> \r\n   <td width="15%"><input type="radio" name="option_id" value="$data[option_id]"></td>\r\n   <td width="85%"><font face="$pollvars[font_face]" size="1" color="$pollvars[font_color]">$data[option_text]</font></td>\r\n </tr>\r\n'),
(17, 3, 'display_foot', '                    </table>\r\n                    <input type="hidden" name="action" value="vote">\r\n                    <input type="hidden" name="poll_ident" value="$poll_id">\r\n                    <input type="submit" value="$pollvars[vote_button]" class="input">\r\n                    <br>\r\n                    <br>\r\n                    <font face="$pollvars[font_face]" color="$pollvars[font_color]" size="1"><a href="javascript:void(poll_results_$poll_id(''results'',''$pollvars[base_url]/popup.php'',''Poll'',''500'',''350'',''toolbar=no,scrollbars=yes''))">$pollvars[result_text]</a><br>\r\n                    </font></td>\r\n                </tr>\r\n              </table>\r\n            </form>\r\n            <font face="$pollvars[font_face]" size="1"><a href="http://www.proxy2.de" target="_blank" title="Advanced Poll">Version $pollvars[poll_version]</a></font>\r\n          </td>\r\n        </tr>\r\n      </table>\r\n    </td>\r\n  </tr>\r\n</table>\r\n'),
(18, 3, 'result_head', '<table width="450" border="0" cellspacing="0" cellpadding="2" bgcolor="#CCCCCC">\r\n  <tr>\r\n    <td align="center"> \r\n      <table width="100%" border="0" cellspacing="0" cellpadding="3" bgcolor="#F6F6F6">\r\n        <tr align="center"> \r\n          <td colspan="3" height="40"><font face="$pollvars[font_face]" size="1" color="#000000"><b>$question</b></font></td>\r\n        </tr>\r\n'),
(19, 3, 'result_loop', '        <tr>\r\n          <td width="3%">&nbsp;</td>\r\n          <td><font face="$pollvars[font_face]" color="$pollvars[font_color]" size="1">$option_text</font></td>\r\n          <td><font face="$pollvars[font_face]" color="$pollvars[font_color]" size="1"><img src="$pollvars[base_gif]/$poll_color.gif" width="$img_width" height="$pollvars[img_height]"> $vote_percent % ($vote_count)</font></td>\r\n        </tr>\r\n'),
(20, 3, 'result_foot', '        <tr> \r\n          <td colspan="3" valign="bottom" align="center"><b><font face="$pollvars[font_face]" color="$pollvars[font_color]" size="1">$pollvars[total_text]: \r\n            $total_votes</font></b></td>\r\n        </tr>\r\n        <tr align="center"> \r\n          <td colspan="3" valign="top"><font face="$pollvars[font_face]" color="$pollvars[font_color]" size="1">$VOTE \r\n            <br>\r\n            $COMMENT</font></td>\r\n        </tr>\r\n        <tr align="right"> \r\n          <td colspan="3"><font face="$pollvars[font_face]" size="1"><a href="http://www.proxy2.de" target="_blank" title="Advanced Poll">Version $pollvars[poll_version]</a></font></td>\r\n        </tr>\r\n      </table>\r\n    </td>\r\n  </tr>\r\n</table>\r\n'),
(21, 3, 'comment', '<table border="0" cellspacing="0" cellpadding="1" align="center" bgcolor="#666699">\r\n  <tr align="center">\r\n    <td>\r\n     <style type="text/css">\r\n      <!--\r\n       .button {  font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 8pt}\r\n       .textarea {  font-family: "MS Sans Serif"; font-size: 9pt; width: 195px}\r\n       .input {  width: 195px}\r\n      -->\r\n    </style><font color="#FFFFFF" face="Verdana, Arial, Helvetica, sans-serif" size="2"><b>Submit Your Comment</b></font></td>\r\n  </tr>\r\n  <tr>\r\n    <td>\r\n      <table border="0" cellspacing="0" cellpadding="5" align="center" bgcolor="#FFFFFF" width="200">\r\n        <tr>\r\n          <td width="149">\r\n            <form method="post" action="$this->form_forward">\r\n              <table border="0" cellspacing="0" cellpadding="2" bgcolor="" align="center">\r\n                <tr>\r\n                  <td class="td1" height="40"><b><font face="Verdana, Arial, Helvetica, sans-serif" size="1">$question</font></b></td>\r\n                </tr>\r\n                <tr>\r\n                  <td class="td1"><font face="Verdana, Arial, Helvetica, sans-serif" size="1">Name:</font><br>\r\n                    <input type="text" name="name" maxlength="25" class="input" size="23">\r\n                  </td>\r\n                </tr>\r\n                <tr>\r\n                  <td class="td1"><font face="Verdana, Arial, Helvetica, sans-serif" size="1">e-mail:</font><br>\r\n                    <input type="text" name="email" size="23" maxlength="50" class="input">\r\n                  </td>\r\n                </tr>\r\n                <tr>\r\n                  <td class="td1"><font face="Verdana, Arial, Helvetica, sans-serif" size="1">Comment(*):</font><br>\r\n                    <font face="MS Sans Serif" size="1">\r\n                    <textarea name="message" cols="19" wrap="VIRTUAL" rows="3" class="textarea"></textarea>\r\n                    </font>\r\n                    $POLL_CAPTCHA\r\n                  </td>\r\n                </tr>\r\n                <tr valign="top">\r\n                  <td>\r\n                    <input type="submit" value="Submit" class="button">\r\n                    <input type="reset" value="Reset" class="button">\r\n                    <input type="hidden" name="action" value="add">\r\n                    <input type="hidden" name="id" value="$poll_id">\r\n                    <input type="hidden" name="time" value="$poll_time">\r\n                  </td>\r\n                </tr>\r\n              </table>\r\n            </form>\r\n          </td>\r\n        </tr>\r\n      </table>\r\n    </td>\r\n  </tr>\r\n</table>\r\n'),
(22, 4, 'display_head', '<table width="$pollvars[table_width]" border="0" cellspacing="0" cellpadding="1" bgcolor="$pollvars[bgcolor_fr]">\r\n  <tr align="center">\r\n    <td>\r\n      <style type="text/css">\r\n <!--\r\n  .input { font-family: $pollvars[font_face]; font-size: 8pt}\r\n -->\r\n</style>\r\n      <font face="$pollvars[font_face]" size="-1" color="#FFFFFF"><b>$pollvars[title]</b></font></td>\r\n  </tr>\r\n  <tr align="center"> \r\n    <td> \r\n      <table width="100%" border="0" cellspacing="0" cellpadding="2" align="center" bgcolor="$pollvars[bgcolor_tab]">\r\n        <tr> \r\n          <td height="40" valign="middle"><font face="$pollvars[font_face]" color="$pollvars[font_color]" size="1"><b>$question</b></font></td>\r\n        </tr>\r\n        <tr align="right" valign="top"> \r\n          <td>\r\n            <form method="post" action="$this->form_forward">\r\n               <table width="100%" border="0" cellspacing="0" cellpadding="0" align="center">\r\n                <tr valign="top" align="center"> \r\n                  <td> \r\n                    <table width="100%" border="0" cellspacing="0" cellpadding="1" align="center">\r\n'),
(23, 4, 'display_loop', '<tr> \r\n   <td width="15%"><input type="radio" name="option_id" value="$data[option_id]"></td>\r\n   <td width="85%"><font face="$pollvars[font_face]" size="1" color="$pollvars[font_color]">$data[option_text]</font></td>\r\n </tr>\r\n'),
(24, 4, 'display_foot', '                    </table>\r\n                    <input type="hidden" name="action" value="vote">\r\n                    <input type="hidden" name="poll_ident" value="$poll_id">\r\n                    <input type="submit" value="$pollvars[vote_button]" class="input">\r\n                    <br>\r\n                    <br>\r\n                    <font face="$pollvars[font_face]" color="$pollvars[font_color]" size="1"><a href="$this->form_forward?action=results&amp;poll_ident=$poll_id">$pollvars[result_text]</a><br>\r\n                    </font></td>\r\n                </tr>\r\n              </table>\r\n            </form>\r\n            <font face="$pollvars[font_face]" size="1"><a href="http://www.proxy2.de" target="_blank" title="Advanced Poll">Version $pollvars[poll_version]</a></font>\r\n          </td>\r\n        </tr>\r\n      </table>\r\n    </td>\r\n  </tr>\r\n</table>\r\n'),
(25, 4, 'result_head', '<table border="0" cellspacing="0" cellpadding="2" width="360">\r\n  <tr> \r\n    <td colspan="2"><font face="$pollvars[font_face]" size="2">$question</font></td>\r\n  </tr>\r\n  <tr> \r\n    <td><img src="$pollvars[base_url]/png.php?poll_id=$poll_id"></td>\r\n    <td> \r\n      <table width="100%" border="0" cellspacing="0" cellpadding="1" bgcolor="#000000">\r\n        <tr> \r\n          <td> \r\n            <table width="100%" border="0" cellspacing="0" cellpadding="3" bgcolor="#EBEBEB">'),
(26, 4, 'result_loop', '            <tr> \r\n                <td width="12"><font size="1" face="$pollvars[font_face]"><img src="$pollvars[base_gif]/$poll_color.gif" width="8" height="10"></font></td>\r\n                <td><font size="1" face="$pollvars[font_face]">$option_text -\r\n                  $vote_val</font></td>\r\n              </tr>'),
(27, 4, 'result_foot', '              <tr> \r\n                <td>&nbsp;</td>\r\n                <td><font face="$pollvars[font_face]" size="1">$pollvars[total_text]: \r\n                 <font color="#990000">$total_votes</font><br>\r\n                 $COMMENT&nbsp;</font></td>\r\n              </tr>\r\n            </table>\r\n          </td>\r\n        </tr>\r\n      </table>\r\n    </td>\r\n  </tr>\r\n</table>'),
(28, 4, 'comment', '<table border="0" cellspacing="0" cellpadding="1" align="center" bgcolor="#666699">\r\n  <tr align="center">\r\n    <td>\r\n     <style type="text/css">\r\n      <!--\r\n       .button {  font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 8pt}\r\n       .textarea {  font-family: "MS Sans Serif"; font-size: 9pt; width: 195px}\r\n       .input {  width: 195px}\r\n      -->\r\n    </style><font color="#FFFFFF" face="Verdana, Arial, Helvetica, sans-serif" size="2"><b>Submit Your Comment</b></font></td>\r\n  </tr>\r\n  <tr>\r\n    <td>\r\n      <table border="0" cellspacing="0" cellpadding="5" align="center" bgcolor="#FFFFFF" width="200">\r\n        <tr>\r\n          <td width="149">\r\n            <form method="post" action="$this->form_forward">\r\n              <table border="0" cellspacing="0" cellpadding="2" bgcolor="" align="center">\r\n                <tr>\r\n                  <td class="td1" height="40"><b><font face="Verdana, Arial, Helvetica, sans-serif" size="1">$question</font></b></td>\r\n                </tr>\r\n                <tr>\r\n                  <td class="td1"><font face="Verdana, Arial, Helvetica, sans-serif" size="1">Name:</font><br>\r\n                    <input type="text" name="name" maxlength="25" class="input" size="23">\r\n                  </td>\r\n                </tr>\r\n                <tr>\r\n                  <td class="td1"><font face="Verdana, Arial, Helvetica, sans-serif" size="1">e-mail:</font><br>\r\n                    <input type="text" name="email" size="23" maxlength="50" class="input">\r\n                  </td>\r\n                </tr>\r\n                <tr>\r\n                  <td class="td1"><font face="Verdana, Arial, Helvetica, sans-serif" size="1">Comment(*):</font><br>\r\n                    <font face="MS Sans Serif" size="1">\r\n                    <textarea name="message" cols="19" wrap="VIRTUAL" rows="3" class="textarea"></textarea>\r\n                    </font>\r\n                    $POLL_CAPTCHA\r\n                  </td>\r\n                </tr>\r\n                <tr valign="top">\r\n                  <td>\r\n                    <input type="submit" value="Submit" class="button">\r\n                    <input type="reset" value="Reset" class="button">\r\n                    <input type="hidden" name="action" value="add">\r\n                    <input type="hidden" name="id" value="$poll_id">\r\n                    <input type="hidden" name="time" value="$poll_time">\r\n                  </td>\r\n                </tr>\r\n              </table>\r\n            </form>\r\n          </td>\r\n        </tr>\r\n      </table>\r\n    </td>\r\n  </tr>\r\n</table>\r\n'),
(29, 5, 'display_head', '<table width="450" border="0" cellspacing="0" cellpadding="2" bgcolor="#CCCCCC">\r\n  <tr>\r\n    <td align="center">\r\n     <style type="text/css">\r\n       <!--\r\n        .input { font-family: $pollvars[font_face]; font-size: 9pt}\r\n       -->\r\n      </style> \r\n      <table width="100%" border="0" cellspacing="0" cellpadding="3" bgcolor="#F6F6F6">\r\n        <tr align="center"> \r\n          <td colspan="2" height="40"><font face="$pollvars[font_face]" color="$pollvars[font_color]" size="1"><b>$question</b></font></td>\r\n        </tr>\r\n        <tr align="center"> \r\n          <td colspan="2"> \r\n            <form method="post" action="$this->form_forward">\r\n              <table width="100%" border="0" cellspacing="0" cellpadding="1">'),
(30, 5, 'display_loop', ' <tr> \r\n   <td width="11%" align="center"><input type="radio" name="option_id" value="$data[option_id]"></td>\r\n   <td width="89%"><font face="$pollvars[font_face]" size="1" color="$pollvars[font_color]">$data[option_text]</font></td>\r\n </tr>'),
(31, 5, 'display_foot', '                <tr align="center" valign="bottom"> \r\n                  <td colspan="2"> \r\n                    <input type="submit" value="$pollvars[vote_button]" class="input" name="submit">\r\n                    <input type="hidden" name="action" value="vote">\r\n                    <input type="hidden" name="poll_ident" value="$poll_id">\r\n                  </td>\r\n                </tr>\r\n                <tr valign="bottom"> \r\n                  <td colspan="2" height="30" align="center"><font face="$pollvars[font_face]" color="$pollvars[font_color]" size="1">[<a href="$this->form_forward?action=results&amp;poll_ident=$poll_id">$pollvars[result_text]</a>]</font></td>\r\n                </tr>\r\n              </table>\r\n            </form>\r\n          </td>\r\n        </tr>\r\n      </table>\r\n    </td>\r\n  </tr>\r\n</table>\r\n'),
(32, 5, 'result_head', '<table width="450" border="0" cellspacing="0" cellpadding="2" bgcolor="#CCCCCC">\r\n  <tr>\r\n    <td align="center"> \r\n      <table width="100%" border="0" cellspacing="0" cellpadding="3" bgcolor="#F6F6F6">\r\n        <tr align="center"> \r\n          <td colspan="3" height="40"><font face="$pollvars[font_face]" size="1" color="#000000"><b>$question</b></font></td>\r\n        </tr>\r\n'),
(33, 5, 'result_loop', '        <tr>\r\n          <td width="3%">&nbsp;</td>\r\n          <td><font face="$pollvars[font_face]" color="$pollvars[font_color]" size="1">$option_text</font></td>\r\n          <td><font face="$pollvars[font_face]" color="$pollvars[font_color]" size="1"><img src="$pollvars[base_gif]/$poll_color.gif" width="$img_width" height="$pollvars[img_height]"> $vote_percent % ($vote_count)</font></td>\r\n        </tr>\r\n'),
(34, 5, 'result_foot', '        <tr> \r\n          <td colspan="3" valign="bottom" align="center"><b><font face="$pollvars[font_face]" color="$pollvars[font_color]" size="1">$pollvars[total_text]: \r\n            $total_votes</font></b></td>\r\n        </tr>\r\n        <tr align="center"> \r\n          <td colspan="3" valign="top"><font face="$pollvars[font_face]" color="$pollvars[font_color]" size="1">$VOTE \r\n            <br>\r\n            $COMMENT</font></td>\r\n        </tr>\r\n        <tr align="right"> \r\n          <td colspan="3"><font face="$pollvars[font_face]" size="1"><a href="http://www.proxy2.de" target="_blank" title="Advanced Poll">Version $pollvars[poll_version]</a></font></td>\r\n        </tr>\r\n      </table>\r\n    </td>\r\n  </tr>\r\n</table>\r\n'),
(35, 5, 'comment', '<table border="0" cellspacing="0" cellpadding="1" align="center" bgcolor="#666699">\r\n  <tr align="center">\r\n    <td>\r\n     <style type="text/css">\r\n      <!--\r\n       .button {  font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 8pt}\r\n       .textarea {  font-family: "MS Sans Serif"; font-size: 9pt; width: 195px}\r\n       .input {  width: 195px}\r\n      -->\r\n    </style><font color="#FFFFFF" face="Verdana, Arial, Helvetica, sans-serif" size="2"><b>Send Your Comment</b></font></td>\r\n  </tr>\r\n  <tr>\r\n    <td>\r\n      <table border="0" cellspacing="0" cellpadding="5" align="center" bgcolor="#F3F3F3" width="200">\r\n        <tr>\r\n          <td width="149">\r\n            <form method="post" action="$this->form_forward">\r\n              <table border="0" cellspacing="0" cellpadding="2" bgcolor="" align="center">\r\n                <tr>\r\n                  <td class="td1" height="40"><b><font face="Verdana, Arial, Helvetica, sans-serif" size="1">$question</font></b></td>\r\n                </tr>\r\n                <tr>\r\n                  <td class="td1"><font face="Verdana, Arial, Helvetica, sans-serif" size="1">Name:</font><br>\r\n                    <input type="text" name="name" maxlength="25" class="input" size="23">\r\n                  </td>\r\n                </tr>\r\n                <tr>\r\n                  <td class="td1"><font face="Verdana, Arial, Helvetica, sans-serif" size="1">e-mail:</font><br>\r\n                    <input type="text" name="email" size="23" maxlength="50" class="input">\r\n                  </td>\r\n                </tr>\r\n                <tr>\r\n                  <td class="td1"><font face="Verdana, Arial, Helvetica, sans-serif" size="1">Comment(*):</font><br>\r\n                    <font face="MS Sans Serif" size="1">\r\n                    <textarea name="message" cols="19" wrap="VIRTUAL" rows="3" class="textarea"></textarea>\r\n                    </font>\r\n                    $POLL_CAPTCHA\r\n                  </td>\r\n                </tr>\r\n                <tr valign="top">\r\n                  <td>\r\n                    <input type="submit" value="Submit" class="button">\r\n                    <input type="reset" value="Reset" class="button">\r\n                    <input type="hidden" name="action" value="add">\r\n                    <input type="hidden" name="id" value="$poll_id">\r\n                    <input type="hidden" name="time" value="$poll_time">\r\n                  </td>\r\n                </tr>\r\n              </table>\r\n            </form>\r\n          </td>\r\n        </tr>\r\n      </table>\r\n    </td>\r\n  </tr>\r\n</table>\r\n'),
(36, 0, 'poll_comment', '<table border="0" cellspacing="1" cellpadding="2" width="450">\r\n  <tr bgcolor="#E4E4E4"> \r\n    <td bgcolor="#F2F2F2"><b><font size="1" face="Verdana, Arial, Helvetica, sans-serif">$data[name]</font></b> \r\n      <i><font size="1" face="Verdana, Arial, Helvetica, sans-serif">$data[email]</font></i> \r\n      - <font size="1" face="Verdana, Arial, Helvetica, sans-serif">$data[time]</font>\r\n    </td>\r\n  </tr>\r\n  <tr>\r\n    <td><font size="2" face="Verdana, Arial, Helvetica, sans-serif">$data[message]</font> \r\n    </td>\r\n  </tr>\r\n  <tr> \r\n    <td height="15">&nbsp;</td>\r\n  </tr>\r\n</table>\r\n'),
(37, 0, 'poll_list', '<table border="0" cellspacing="0" cellpadding="4" width="450">\r\n  <tr> \r\n    <td width="80" valign="top"> &#0149; <font size="2" face="Arial, Helvetica, sans-serif"><i>$data[timestamp]</i></font></td>\r\n    <td width="354"><font face="Arial, Helvetica, sans-serif" size="2"><a href="$PHP_SELF?poll_id=$data[poll_id]">$data[question]</a></font></td>\r\n  </tr>\r\n</table>\r\n'),
(38, 0, 'poll_form', '<table border="0" cellspacing="0" cellpadding="0">\r\n  <tr> \r\n    <td> \r\n      <style type="text/css">\r\n      <!--\r\n       .button {  font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 8pt}\r\n       .poll_textarea {  font-family: "MS Sans Serif"; font-size: 9pt; width: 300px}\r\n       .poll_input {  width: 300px}\r\n      -->\r\n    </style>\r\n      <form method="post" action="$this->form_forward">\r\n        <table border="0" cellspacing="0" cellpadding="4">\r\n          <tr>\r\n            <td class="td1"><font color="#CC0000" face="Verdana, Arial, Helvetica, sans-serif" size="1"><b>$msg</b></font></td>\r\n          </tr>\r\n          <tr> \r\n            <td class="td1"><font face="Verdana, Arial, Helvetica, sans-serif" size="1">Name:</font><br>\r\n              <input type="text" name="name" value="$comment[name]" maxlength="30" class="poll_input" size="25">\r\n            </td>\r\n          </tr>\r\n          <tr> \r\n            <td class="td1"><font face="Verdana, Arial, Helvetica, sans-serif" size="1">E-mail:</font><br>\r\n              <input type="text" name="email" value="$comment[email]" size="25" maxlength="50" class="poll_input">\r\n            </td>\r\n          </tr>\r\n          <tr> \r\n            <td class="td1"> <font face="Verdana, Arial, Helvetica, sans-serif" size="1">Comment:</font><br>\r\n              <font face="MS Sans Serif" size="1"> \r\n              <textarea name="message" cols="25" wrap="VIRTUAL" rows="8" class="poll_textarea">$comment[message]</textarea>\r\n              </font>\r\n              $POLL_CAPTCHA\r\n              </td>\r\n          </tr>\r\n          <tr valign="top"> \r\n            <td>              \r\n              <input type="submit" value="Submit" class="button" name="submit">\r\n              <input type="reset" value="Reset" class="button" name="reset">\r\n              <input type="hidden" name="action" value="add">\r\n              <input type="hidden" name="pcomment" value="$poll_id">\r\n              <input type="hidden" name="time" value="$poll_time">\r\n            </td>\r\n          </tr>\r\n        </table>\r\n      </form>\r\n    </td>\r\n  </tr>\r\n</table>\r\n'),
(40, 0, 'poll_captcha', '<div style="margin-top:3px;display:block;">\r\n	<img src="$pollvars[base_url]/captcha.php?time=$poll_time" border="0" style="float:left;margin-right:6px"><input type="text" name="captcha" maxlength="20" style="width:100px;margin-top:4px">\r\n</div>\r\n');

-- --------------------------------------------------------

--
-- Table structure for table `ap_templateset`
--

CREATE TABLE IF NOT EXISTS `ap_templateset` (
  `tplset_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `tplset_name` varchar(50) NOT NULL DEFAULT '',
  `created` datetime DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`tplset_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `ap_templateset`
--

INSERT INTO `ap_templateset` (`tplset_id`, `tplset_name`, `created`) VALUES
(1, 'default', '2017-03-11 23:27:30'),
(2, 'simple', '2017-03-11 23:27:30'),
(3, 'popup', '2017-03-11 23:27:30'),
(4, 'graphic', '2017-03-11 23:27:30'),
(5, 'plain', '2017-03-11 23:27:30');

-- --------------------------------------------------------

--
-- Table structure for table `ap_user`
--

CREATE TABLE IF NOT EXISTS `ap_user` (
  `user_id` smallint(5) NOT NULL AUTO_INCREMENT,
  `username` varchar(30) NOT NULL,
  `userpass` varchar(32) NOT NULL,
  `session` varchar(32) NOT NULL,
  `last_visit` int(11) NOT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `ap_user`
--

INSERT INTO `ap_user` (`user_id`, `username`, `userpass`, `session`, `last_visit`) VALUES
(1, 'd88x47', '9146f05be6dc57b78fc080d7342d150d', 'b3e7fa9ddb8d10cacd2e6306802e5464', 1489274855);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
