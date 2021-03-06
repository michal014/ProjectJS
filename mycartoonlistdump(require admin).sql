-- MariaDB dump 10.19  Distrib 10.4.24-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: mycartoonlist
-- ------------------------------------------------------
-- Server version	10.4.24-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `accounttype`
--

DROP TABLE IF EXISTS `accounttype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `accounttype` (
  `accountTypeID` int(20) unsigned NOT NULL AUTO_INCREMENT,
  `accountTypeName` varchar(20) COLLATE utf8_polish_ci NOT NULL,
  `canCreat` tinyint(1) NOT NULL,
  `canRead` tinyint(1) NOT NULL,
  `canUpdate` tinyint(1) NOT NULL,
  `canDelete` tinyint(1) NOT NULL,
  `canRequest` tinyint(1) NOT NULL,
  PRIMARY KEY (`accountTypeID`),
  UNIQUE KEY `accountTypeName` (`accountTypeName`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounttype`
--

LOCK TABLES `accounttype` WRITE;
/*!40000 ALTER TABLE `accounttype` DISABLE KEYS */;
INSERT INTO `accounttype` VALUES (1,'Admin',1,1,1,1,1),(2,'Quest',0,1,0,0,0),(3,'Mod',1,1,1,0,1),(4,'User',0,1,0,0,1);
/*!40000 ALTER TABLE `accounttype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `content`
--

DROP TABLE IF EXISTS `content`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `content` (
  `contentID` int(20) unsigned NOT NULL AUTO_INCREMENT,
  `contentName` varchar(255) COLLATE utf8_polish_ci NOT NULL,
  `contentType` int(20) unsigned NOT NULL,
  `contentNumberOfEpisodes` int(20) unsigned NOT NULL,
  `contentDescription` varchar(2000) COLLATE utf8_polish_ci NOT NULL,
  `contentPicture` varchar(255) COLLATE utf8_polish_ci NOT NULL,
  PRIMARY KEY (`contentID`),
  UNIQUE KEY `contentName` (`contentName`),
  KEY `content-contenttype` (`contentType`),
  CONSTRAINT `content-contenttype` FOREIGN KEY (`contentType`) REFERENCES `contenttype` (`contentTypeID`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `content`
--

LOCK TABLES `content` WRITE;
/*!40000 ALTER TABLE `content` DISABLE KEYS */;
INSERT INTO `content` VALUES (1,'Danny Phantom',1,53,'Serial opowiada o czternastolatku Dannym Fentonie, kt??ry po wypadku w laboratorium rodzic??w (jego DNA ????czy si?? z ektoplazm??), staje si?? Dannym Phantomem, walczy z duchami, kt??re zagra??aj?? jego miastu ??? Amity Park','danny_phantom.png'),(2,'Code Lyoko',1,97,'Francuski serial animowany opowiadaj??cy o pi??tce nastolatk??w. Bohaterowie wiod?? we?? podw??jne ??ycie ??? w ??wiecie realnym (przedstawianym w grafice 2D) uchodz?? za zwyk??ych uczni??w gimnazjum Kadic, zmagaj??cych si?? z typowymi, m??odzie??owymi rozterkami, jednak ich na poz??r nie wyr????niaj??ca si?? codzienno???? przeplata si?? z misj?? ???Wojownik??w Lyoko???. W Lyoko (wirtualnym ??wiecie przedstawionym w grafice 3D) zmieniaj?? si?? w wojownik??w, kt??rych zadaniem jest zatrzyma?? pot????ny ??wiadomy program (SI) ??? Xan?? przed zniszczeniem ??ycia na ziemi, oraz odkrycie tajemnicy sprzed lat dotycz??cej Franza Hoppera ??? tw??rcy Xany, Lyoko oraz Superkomputera. ','code_lyoko.png'),(3,'Pora na przygod??',1,283,'ameryka??ski serial animowany stworzony przez Pendletona Warda. Serial opowiada o przygodach ch??opca Finna oraz jego przyjaciela i przybranego brata Jake???a, magicznego psa potrafi??cego dowolnie zmienia?? sw??j kszta??t i rozmiar. Mieszkaj?? oni w kolorowej i pe??nej magii Krainie Ooo, le????cej na postapokaliptycznej Ziemi. Podczas swoich przyg??d przyjaciele cz??sto spotykaj?? innych bohater??w, na przyk??ad Kr??lewn?? Balonow??, Lodowego Kr??la lub wampirzyc?? Marcelin?? oraz najr????niejsze potwory i fantastyczne istoty. ','adventure_time.jpg'),(4,'Steven Universe',1,160,'Serial opisuje perypetie Stevena Universe???a, ch??opca, kt??ry jest najm??odszym, a tak??e jedynym m??skim cz??onkiem grupy superbohater??w zwanej Kryszta??owymi Klejnotami. Steven nie jest tak silny i m??dry, jak jego towarzyszki: Ametyst, Granat i Per??a. Kiedy?? nie potrafi?? w pe??ni kontrolowa?? swoich mocy, kt??re swoje ??r??d??o maj?? w magicznym klejnocie znajduj??cym si?? na jego brzuchu. Steven wraz z reszt?? grupy wsp??lnie prze??ywaj?? niezwyk??e przygody. ','Steven_universe.jpg'),(5,'Steven Universe Film',2,1,'Akcja filmu toczy si?? dwa lata p????niej po wydarzeniach z czterocz????ciowego fina??u pi??tego sezonu Zmiana zdania i skupia si?? na historii szesnastoletniego Stevena Universe???a. Ch??opak powraca na Ziemi?? maj??c nadziej??, ??e odzyska swoje ??ycie dzi??ki Kryszta??owym Klejnotom ??? Perle, Granat i Ametyst. Tymczasem w Beach City zjawia si?? tajemnicza Spinel, kt??ra przyby??a na Ziemi?? z zamiarem zniszczenia wszystkich organicznych form ??ycia. Steven i Kryszta??owe Klejnoty musz?? zmierzy?? si?? ze z??owrogim klejnotem i uratowa?? miasto. ','steven_universe_movie.webp'),(6,'Steven Universe Przysz??o????',1,20,'Akcja serialu toczy si?? zaraz po wydarzeniach z filmu Steven Universe: Film, kt??ra mia??a miejsce dwa lata po czteroodcinkowym finale pi??tego sezonu z oryginalnego serialu Zmiana zdania. Nastoletni Steven Universe po raz kolejny b??dzie musia?? zmierzy?? si?? z wyzwaniami, kt??re pojawiaj?? si?? w jego obecnie stosunkowo spokojnym ??yciu oraz znale???? i zakwestionowa?? nowy cel. Steven musi r??wnie?? zdecydowa??, czego chce dla swojej w??asnej przysz??o??ci. ','steven_universe_future.jpg'),(7,'Niesamowity ??wiat gumballa',1,240,'Serial opisuje przygody dwunastoletniego, psotnego, niebieskiego kota Gumballa, kt??ry mieszka w niewielkim miasteczku Elmore w Stanach Zjednoczonych, kt??re zamieszkuj?? niezwyk??e postacie. Wraz z rodzin?? i szkolnymi przyjaci????mi prze??ywa liczne przygody. ','amazing_world_of_gumball.jpg'),(8,'Ben 10',1,52,'10-letni Ben Tennyson wraz z kuzynk?? Gwen i dziadkiem Maxem jad?? w wakacje na kemping. Podczas niego Ben znajduje Omnitrix ??? urz??dzenie podobne do zegarka.\r\nDzi??ki niemu mo??e si?? zmienia?? w dziesi??ciu kosmit??w.','ben_10.jpg'),(9,'Ben 10: Obca pot??ga',1,46,'15-letni Ben Tennyson prowadzi spokojne ??ycie, po tym jak pi???? lat wcze??niej ??ci??gn???? Omnitrix. Niestety pewnego dnia ch??opak odkrywa, ??e jego dziadek zagin???? w tajemniczych okoliczno??ciach. Postanawia ponownie za??o??y?? sw??j niezwyk??y \"zegarek\", by go odnale????. Do Bena i jego kuzynki Gwen do????cza ich dawny wr??g  - Kevin. Po drodze odkrywaj??, ??e podczas nieobecno??ci Bena, kosmici nie pr????nowali i szykowali inwazj??. M??ody Tennyson b??dzie musia?? si?? z nimi zmierzy?? w trakcie poszukiwania dziadka, wykorzystuj??c zmieniony Omnitrix. ','ben_10_alien_force.jpg'),(10,'Ben 10: Ultimate Alien',1,52,'Rok po wydarzeniach, kt??re mia??y miejsce podczas \"Ostatecznej bitwy\" i po zniszczeniu Omnitrixa, 16-letni Ben Tennyson musi stawi?? czo??a nowym wrogom. Gdy jeden z fan??w Bena wyjawia jego sekretn?? to??samo???? ca??emu ??wiatu, ten zaczyna by?? obserwowany przez media. Dzieci uznaj?? go za bohatera, a ich rodzice uwa??aj?? go za przest??pc??. Na dodatek ci??gle jeszcze nie uda??o mu si?? opanowa?? Ultimatrixa. Ch??opak b??dzie musia?? si?? te?? zmierzy?? z Osmosjaninem Aggregorem, kt??ry chce za wszelk?? cen?? odnale???? legendarn?? Ku??ni?? Stworzenia i tym samym zdoby?? pot??g?? absolutn??. ','ben_10_ultimate_alien.jpg'),(11,'Ben 10: Omniverse',1,80,'Serial opowiada o 16-letnim Benie Tennysonie, w??a??cicielu Omnitrixa ??? urz??dzenia podobnego do zegarka, kt??ry pozwala mu zmienia?? si?? w kosmit??w. Po ostatniej akcji z Zombozzo zesp???? Bena si?? rozpada, jako ??e Gwen jedzie do college\'u, a Kevin wraz z ni??. Ben zaczyna dzia??a?? sam, lecz potem Max Tennyson znajduje mu nowego partnera ??? kosmit?? gatunku Revonnahgander??w, Rooka. Podczas misji zwiadowczej w tajemniczym mie??cie kosmit??w Ben znajduje te?? wrog??w z przesz??o??ci, kt??rzy chc?? rewan??u z nim. Co gorsza, na trop Bena wpada ??owca Khyber, kt??rego zwierz?? za spraw?? Nemetrixa potrafi si?? zmienia?? w drapie??nicze stwory. Seria si??ga te?? o fragmenty, w kt??rych wyst??puje m??odsza wersja Bena. ','brn_10_omniverse.jpg'),(12,'Ben 10: Tajemnica Omnitrixa',2,1,'Doktor Animo skonstruowa?? bomb?? DNA. Podczas niszczenia jej (1 wersja ??? Inferno; 2 wersja ??? Szybcior; 3 wersja ??? Ga??a) przez Bena, Omnitrix ustawia si?? na tryb samozniszczenia. Ma to dodatkowo moc zniszczenia ca??ego wszech??wiata. Teraz Ben musi odnale???? tw??rc?? Omnitrixa, Azmutha (kt??ry jest przedstawicielem gatunku Szarej Materii); tylko on mo??e wy????czy?? ten tryb. Benowi w dotarciu do niego pomagaj?? Gwen, Tetrax (kt??ry w kresk??wce wyst??pi?? jako Hoveboard), jego pomocnik Gluto i pomocnica Azmutha ??? Myaxx. Podczas podr????y po kosmosie ca??a pi??tka b??dzie musia??a si?? zmierzy?? z przeszkodami, a mianowicie Vilgaxem, potem w Omnitrixie pojawi si?? nowy kosmita ??? Najwi??kszy. ','ben_10_secret_of_the_omnitrix.jpg'),(13,'Generator Rex',1,60,'Zazwyczaj mikromaszyny zwane nanitami s?? nieszkodliwe. Jednak raz na jaki?? czas wymykaj?? si?? spod kontroli, a wtedy sprawiaj??, ??e ??ywe organizmy mutuj??, przeistaczaj??c si?? w groteskowe potwory znane jako E.V.O. Te uwielbiaj?? szale?? i niszczy?? co popadnie, a w takich sytuacjach do akcji wkracza organizacja Providence, kt??ra ma rozleg???? siatk?? agent??w i dost??p do najbardziej zaawansowanych technologii. Pi??tnastoletni Rex Salazar, kt??ry tak??e jest E.V.O. to tajna bro?? agencji. Ch??opak pomaga organizacji zwalcza?? potwory, kt??re sprawiaj?? problemy. Jak ka??dy pi??tnastolatek lubi samochody, dziewczyny, muzyk?? i sport, jednak nie ka??dy nastolatek potrafi powi??kszy?? swoje pi????ci do rozmiar??w g??azu, wysun???? z plec??w plecak odrzutowy i przekszta??ci?? nogi w superszybki pojazd. To w??a??nie te umiej??tno??ci s?? niezwykle przydatne dla Providence, dzi??ki czemu dla organizacji jest bezcenn?? broni??. Celem Rexa jest wyleczy?? wszystkie zmutowane E.V.O. z ca??ego ??wiata i oddzieli?? ludzi od cierpie?? i krzywd jakie im wyrz??dzaj??. ','generator_rex.jpg'),(14,'M??odzi Tytani',1,65,'Pi??tka nastolatk??w ??? Robin, Gwiazdka, Cyborg, Bestia, Raven ??? tworz??c grup?? superheros??w o nazwie M??odzi Tytani, pilnuje porz??dku w mie??cie Jump City. Dogl??daj??c ??adu z okien swojej wie??y Tytan??w, wyruszaj?? natychmiast, gdy na ulicach istnieje jakie?? niebezpiecze??stwo, zagra??aj??ce cywilom. Zmagaj?? si?? z inteligentnymi recydywistami, potworami i zwyk??ymi, podrz??dnymi rabusiami. Niekiedy s?? zmuszeni opu??ci?? tereny swojego miasta, a nawet Ziemi??, lecz g????wnym punktem ich egzystencji jest ta wielka metropolia w USA. Mieszkaj?? w budynku w kszta??cie litery ???T???, na wyspie niedaleko brzegu ich miasta.\r\n\r\nCzasem ich przygody s?? lekkie, przyjemne i bardzo zabawne, a innym razem ca??e odcinki sk??adaj?? si?? z powa??nych zada?? i akcji, w kt??rych niekiedy mo??e wydarzy?? si?? przykro???? i b??l. Mimo ??e og????em jest to kresk??wka typu akcji, to bohaterowie nie walcz?? tam tylko ze z??em, ale tak??e z w??asnymi problemami: z relacjami mi??dzy sob??, z dorastaniem, z kontrolowaniem swojej mocy.\r\n\r\nSeria jest co prawda lu??no powi??zana z komiksem, ale gdzieniegdzie nie oby??o si?? bez mocnych nawi??za??, inspiracji, czy adaptacji. Najwi??cej z komiksowymi Tytanami maj?? wsp??lne sezon II i IV oraz nieemitowany w Polsce sezon V. Sezon drugi, z histori?? Terry jest lu??n?? adaptacj?? ???Judas Contract???, natomiast motyw Raven i jej z??ego ojca jest wzi??ty z komiksu ???Terror of Trigon???. Sezon III tak??e wprowadzi?? kilka os??b z komiks??w, a mianowicie Tytan??w Wschodu. W sezonie V mamy najwi??cej powi??za?? do komiksowych Tytan??w ??? przez postacie oraz wydarzenia. ','teen_titans.jpg'),(15,'Zwyczajny serial',1,261,'G????wnymi bohaterami tego animowanego serialu s?? dwaj przyjaciele, wysoka na sze???? st??p s??jka Mordechaj i hiperaktywny szop Rigby. Obaj pracuj?? jako ogrodnicy w parku, kt??ry nale??y, do przypominaj??cego swoim wygl??dem cz??owieka, lizaka imieniem Papcio. Praca ta jest tak nudna, ??e ci dwaj kumple zrobi?? wszystko, aby tylko jej unikn????.','regular_show.jpg'),(16,'Johnny Test',1,137,'Johnny jest jedenastolatkiem mieszkaj??cym w ??winioszycach (ang. Porkbelly). Wraz z psem Dukey testuje dla swoich si??str, pracuj??cych w domowym laboratorium, r????ne niebezpieczne wynalazki. ','johnny_test.jpg'),(17,'Awatar: Legenda Aanga',1,61,'Aang, 12-letni mag powietrza z Po??udniowej ??wi??tyni Powietrza, dowiaduje si??, ??e jest kolejn?? inkarnacj?? awatara. Zazwyczaj awatar dowiadywa?? si?? prawdy o sobie w wieku 16 lat, jednak mnisi, maj??c na wzgl??dzie wisz??c?? w powietrzu wojn??, chc??, by Awatar jak najszybciej przywr??ci?? r??wnowag?? na ??wiecie. Nied??ugo po tym decyduj?? si?? na odseparowanie Aanga od jego mistrza Gyatso i wysy??aj?? go do Wschodniej ??wi??tyni, by tam doko??czy?? sw??j trening magii powietrza.\r\n\r\nZdezorientowany, przera??ony nowinami i ci??????c?? na nim odpowiedzialno??ci?? Aang ucieka z domu na grzbiecie swojego lataj??cego bizona ??? Appy. Podczas podr????y przez po??udniowy ocean niespodziewany sztorm spycha App?? pod wod??. Nie??wiadomie Aang wkracza w stan awatara i u??ywa kombinacji magii powietrza i wody, by chroni?? siebie i App??, tworz??c kul?? powietrza otoczon?? lodem. Kula zapewnia im dop??yw tlenu i ochron?? przed burz??, a?? do jej zako??czenia. Jednak sztorm przenosi ich w pobli??e bieguna po??udniowego, gdzie zamarzaj?? w g??rze lodowej na 100 lat. ','avatar_legend_of_aang.webp'),(18,'Legenda Korry',1,52,'Avatar Aang, pokonuj??c w??adc?? ognia, wprowadzi?? ??wiat w najd??u??szy okres pokoju i rozwoju gospodarczo - technologicznego. Teraz po jego ??mierci, t?? sam?? ??cie??k?? pod????a Korra, m??oda dziewczyna o nieprzejednanej woli walki i wybuchowym charakterze. Wspierana przez grup?? wiernych przyjaci???? musi poradzi?? sobie nie tylko z duchowym przewodnictwem ??wiata, ale tak??e z problemami typowymi dla ka??dej nastolatki. Czy Korra dor??wna swoim wielkim poprzednikom?','legend_of_korra.jpg');
/*!40000 ALTER TABLE `content` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contentrelation`
--

DROP TABLE IF EXISTS `contentrelation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contentrelation` (
  `contentID` int(20) unsigned NOT NULL,
  `userID` int(20) unsigned NOT NULL,
  `rate` int(2) unsigned NOT NULL,
  `progress` int(20) unsigned NOT NULL,
  `status` tinyint(1) NOT NULL,
  PRIMARY KEY (`contentID`,`userID`),
  KEY `user-relation` (`userID`),
  CONSTRAINT `content-relation` FOREIGN KEY (`contentID`) REFERENCES `content` (`contentID`),
  CONSTRAINT `user-relation` FOREIGN KEY (`userID`) REFERENCES `users` (`userID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contentrelation`
--

LOCK TABLES `contentrelation` WRITE;
/*!40000 ALTER TABLE `contentrelation` DISABLE KEYS */;
INSERT INTO `contentrelation` VALUES (1,4,10,53,1),(2,4,5,54,0),(4,4,9,160,0),(8,4,8,52,0),(9,3,0,0,0),(9,4,8,46,0),(11,3,0,0,0),(11,4,0,40,0),(13,4,10,60,0),(15,4,5,130,0),(17,3,0,0,0),(17,4,9,61,0),(18,4,10,52,0);
/*!40000 ALTER TABLE `contentrelation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contenttype`
--

DROP TABLE IF EXISTS `contenttype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contenttype` (
  `contentTypeID` int(20) unsigned NOT NULL AUTO_INCREMENT,
  `contentTypeName` varchar(255) COLLATE utf8_polish_ci NOT NULL,
  PRIMARY KEY (`contentTypeID`),
  UNIQUE KEY `contentTypeName` (`contentTypeName`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contenttype`
--

LOCK TABLES `contenttype` WRITE;
/*!40000 ALTER TABLE `contenttype` DISABLE KEYS */;
INSERT INTO `contenttype` VALUES (2,'Film'),(1,'Kresk??wka');
/*!40000 ALTER TABLE `contenttype` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `genre`
--

DROP TABLE IF EXISTS `genre`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `genre` (
  `genreID` int(5) unsigned NOT NULL AUTO_INCREMENT,
  `genreName` varchar(255) COLLATE utf8_polish_ci NOT NULL,
  PRIMARY KEY (`genreID`),
  UNIQUE KEY `genreName` (`genreName`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `genre`
--

LOCK TABLES `genre` WRITE;
/*!40000 ALTER TABLE `genre` DISABLE KEYS */;
INSERT INTO `genre` VALUES (1,'Akcja'),(5,'Animacja'),(9,'Familijny'),(3,'Fantasy'),(7,'Komedia'),(8,'Musical'),(2,'Przygoda'),(6,'Sci_Fi'),(4,'SuperHero');
/*!40000 ALTER TABLE `genre` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `genrerelation`
--

DROP TABLE IF EXISTS `genrerelation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `genrerelation` (
  `contentID` int(20) unsigned NOT NULL,
  `genreID` int(5) unsigned NOT NULL,
  PRIMARY KEY (`contentID`,`genreID`),
  KEY `genre-relation` (`genreID`),
  CONSTRAINT `content-relation-genre` FOREIGN KEY (`contentID`) REFERENCES `content` (`contentID`),
  CONSTRAINT `genre-relation` FOREIGN KEY (`genreID`) REFERENCES `genre` (`genreID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `genrerelation`
--

LOCK TABLES `genrerelation` WRITE;
/*!40000 ALTER TABLE `genrerelation` DISABLE KEYS */;
INSERT INTO `genrerelation` VALUES (1,1),(1,2),(1,3),(1,4),(1,5),(2,1),(2,2),(2,5),(2,6),(3,2),(3,5),(3,7),(4,1),(4,5),(4,7),(5,1),(5,5),(5,8),(6,1),(6,5),(6,7),(7,5),(7,7),(8,5),(8,6),(8,7),(8,9),(9,1),(9,5),(9,6),(9,7),(10,1),(10,5),(10,6),(10,7),(11,1),(11,5),(11,6),(11,7),(12,1),(12,5),(12,6),(13,1),(13,5),(13,6),(14,1),(14,3),(14,5),(15,2),(15,5),(15,7),(16,5),(16,6),(16,7),(17,2),(17,3),(17,5),(17,7),(18,2),(18,3),(18,5);
/*!40000 ALTER TABLE `genrerelation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `producent`
--

DROP TABLE IF EXISTS `producent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `producent` (
  `producentID` int(20) unsigned NOT NULL AUTO_INCREMENT,
  `producentName` varchar(255) COLLATE utf8_polish_ci NOT NULL,
  PRIMARY KEY (`producentID`),
  UNIQUE KEY `producentName` (`producentName`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `producent`
--

LOCK TABLES `producent` WRITE;
/*!40000 ALTER TABLE `producent` DISABLE KEYS */;
INSERT INTO `producent` VALUES (2,'Antefilms'),(4,'Cartoon Network'),(3,'MoonScoop Group'),(1,'Nickelodeon');
/*!40000 ALTER TABLE `producent` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `producentrelation`
--

DROP TABLE IF EXISTS `producentrelation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `producentrelation` (
  `contentID` int(20) unsigned NOT NULL,
  `producentID` int(20) unsigned NOT NULL,
  PRIMARY KEY (`contentID`,`producentID`),
  KEY `producent-relation` (`producentID`),
  CONSTRAINT `content-relation-producent` FOREIGN KEY (`contentID`) REFERENCES `content` (`contentID`),
  CONSTRAINT `producent-relation` FOREIGN KEY (`producentID`) REFERENCES `producent` (`producentID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `producentrelation`
--

LOCK TABLES `producentrelation` WRITE;
/*!40000 ALTER TABLE `producentrelation` DISABLE KEYS */;
INSERT INTO `producentrelation` VALUES (1,1),(2,2),(2,3),(3,4),(4,4),(5,4),(6,4),(7,4),(8,4),(9,4),(10,4),(11,4),(12,4),(13,4),(14,4),(15,4),(16,4),(17,1),(18,1);
/*!40000 ALTER TABLE `producentrelation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `userID` int(20) unsigned NOT NULL AUTO_INCREMENT,
  `login` varchar(255) COLLATE utf8_polish_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_polish_ci NOT NULL,
  `accountType` int(20) unsigned NOT NULL,
  PRIMARY KEY (`userID`),
  UNIQUE KEY `login` (`login`),
  KEY `users-accounttype` (`accountType`),
  CONSTRAINT `users-accounttype` FOREIGN KEY (`accountType`) REFERENCES `accounttype` (`accountTypeID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'admin','admin',1),(2,'quest','quest',2),(3,'michal','123',4),(4,'test','123',4),(5,'123','123',4);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-06-13 22:50:35
