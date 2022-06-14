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
INSERT INTO `content` VALUES (1,'Danny Phantom',1,53,'Serial opowiada o czternastolatku Dannym Fentonie, który po wypadku w laboratorium rodziców (jego DNA łączy się z ektoplazmą), staje się Dannym Phantomem, walczy z duchami, które zagrażają jego miastu – Amity Park','danny_phantom.png'),(2,'Code Lyoko',1,97,'Francuski serial animowany opowiadający o piątce nastolatków. Bohaterowie wiodą weń podwójne życie – w świecie realnym (przedstawianym w grafice 2D) uchodzą za zwykłych uczniów gimnazjum Kadic, zmagających się z typowymi, młodzieżowymi rozterkami, jednak ich na pozór nie wyróżniająca się codzienność przeplata się z misją „Wojowników Lyoko”. W Lyoko (wirtualnym świecie przedstawionym w grafice 3D) zmieniają się w wojowników, których zadaniem jest zatrzymać potężny świadomy program (SI) – Xanę przed zniszczeniem życia na ziemi, oraz odkrycie tajemnicy sprzed lat dotyczącej Franza Hoppera – twórcy Xany, Lyoko oraz Superkomputera. ','code_lyoko.png'),(3,'Pora na przygodę',1,283,'amerykański serial animowany stworzony przez Pendletona Warda. Serial opowiada o przygodach chłopca Finna oraz jego przyjaciela i przybranego brata Jake’a, magicznego psa potrafiącego dowolnie zmieniać swój kształt i rozmiar. Mieszkają oni w kolorowej i pełnej magii Krainie Ooo, leżącej na postapokaliptycznej Ziemi. Podczas swoich przygód przyjaciele często spotykają innych bohaterów, na przykład Królewnę Balonową, Lodowego Króla lub wampirzycę Marcelinę oraz najróżniejsze potwory i fantastyczne istoty. ','adventure_time.jpg'),(4,'Steven Universe',1,160,'Serial opisuje perypetie Stevena Universe’a, chłopca, który jest najmłodszym, a także jedynym męskim członkiem grupy superbohaterów zwanej Kryształowymi Klejnotami. Steven nie jest tak silny i mądry, jak jego towarzyszki: Ametyst, Granat i Perła. Kiedyś nie potrafił w pełni kontrolować swoich mocy, które swoje źródło mają w magicznym klejnocie znajdującym się na jego brzuchu. Steven wraz z resztą grupy wspólnie przeżywają niezwykłe przygody. ','Steven_universe.jpg'),(5,'Steven Universe Film',2,1,'Akcja filmu toczy się dwa lata później po wydarzeniach z czteroczęściowego finału piątego sezonu Zmiana zdania i skupia się na historii szesnastoletniego Stevena Universe’a. Chłopak powraca na Ziemię mając nadzieję, że odzyska swoje życie dzięki Kryształowym Klejnotom – Perle, Granat i Ametyst. Tymczasem w Beach City zjawia się tajemnicza Spinel, która przybyła na Ziemię z zamiarem zniszczenia wszystkich organicznych form życia. Steven i Kryształowe Klejnoty muszą zmierzyć się ze złowrogim klejnotem i uratować miasto. ','steven_universe_movie.webp'),(6,'Steven Universe Przyszłość',1,20,'Akcja serialu toczy się zaraz po wydarzeniach z filmu Steven Universe: Film, która miała miejsce dwa lata po czteroodcinkowym finale piątego sezonu z oryginalnego serialu Zmiana zdania. Nastoletni Steven Universe po raz kolejny będzie musiał zmierzyć się z wyzwaniami, które pojawiają się w jego obecnie stosunkowo spokojnym życiu oraz znaleźć i zakwestionować nowy cel. Steven musi również zdecydować, czego chce dla swojej własnej przyszłości. ','steven_universe_future.jpg'),(7,'Niesamowity świat gumballa',1,240,'Serial opisuje przygody dwunastoletniego, psotnego, niebieskiego kota Gumballa, który mieszka w niewielkim miasteczku Elmore w Stanach Zjednoczonych, które zamieszkują niezwykłe postacie. Wraz z rodziną i szkolnymi przyjaciółmi przeżywa liczne przygody. ','amazing_world_of_gumball.jpg'),(8,'Ben 10',1,52,'10-letni Ben Tennyson wraz z kuzynką Gwen i dziadkiem Maxem jadą w wakacje na kemping. Podczas niego Ben znajduje Omnitrix – urządzenie podobne do zegarka.\r\nDzięki niemu może się zmieniać w dziesięciu kosmitów.','ben_10.jpg'),(9,'Ben 10: Obca potęga',1,46,'15-letni Ben Tennyson prowadzi spokojne życie, po tym jak pięć lat wcześniej ściągnął Omnitrix. Niestety pewnego dnia chłopak odkrywa, że jego dziadek zaginął w tajemniczych okolicznościach. Postanawia ponownie założyć swój niezwykły \"zegarek\", by go odnaleźć. Do Bena i jego kuzynki Gwen dołącza ich dawny wróg  - Kevin. Po drodze odkrywają, że podczas nieobecności Bena, kosmici nie próżnowali i szykowali inwazję. Młody Tennyson będzie musiał się z nimi zmierzyć w trakcie poszukiwania dziadka, wykorzystując zmieniony Omnitrix. ','ben_10_alien_force.jpg'),(10,'Ben 10: Ultimate Alien',1,52,'Rok po wydarzeniach, które miały miejsce podczas \"Ostatecznej bitwy\" i po zniszczeniu Omnitrixa, 16-letni Ben Tennyson musi stawić czoła nowym wrogom. Gdy jeden z fanów Bena wyjawia jego sekretną tożsamość całemu światu, ten zaczyna być obserwowany przez media. Dzieci uznają go za bohatera, a ich rodzice uważają go za przestępcę. Na dodatek ciągle jeszcze nie udało mu się opanować Ultimatrixa. Chłopak będzie musiał się też zmierzyć z Osmosjaninem Aggregorem, który chce za wszelką cenę odnaleźć legendarną Kuźnię Stworzenia i tym samym zdobyć potęgę absolutną. ','ben_10_ultimate_alien.jpg'),(11,'Ben 10: Omniverse',1,80,'Serial opowiada o 16-letnim Benie Tennysonie, właścicielu Omnitrixa – urządzenia podobnego do zegarka, który pozwala mu zmieniać się w kosmitów. Po ostatniej akcji z Zombozzo zespół Bena się rozpada, jako że Gwen jedzie do college\'u, a Kevin wraz z nią. Ben zaczyna działać sam, lecz potem Max Tennyson znajduje mu nowego partnera – kosmitę gatunku Revonnahganderów, Rooka. Podczas misji zwiadowczej w tajemniczym mieście kosmitów Ben znajduje też wrogów z przeszłości, którzy chcą rewanżu z nim. Co gorsza, na trop Bena wpada łowca Khyber, którego zwierzę za sprawą Nemetrixa potrafi się zmieniać w drapieżnicze stwory. Seria sięga też o fragmenty, w których występuje młodsza wersja Bena. ','brn_10_omniverse.jpg'),(12,'Ben 10: Tajemnica Omnitrixa',2,1,'Doktor Animo skonstruował bombę DNA. Podczas niszczenia jej (1 wersja – Inferno; 2 wersja – Szybcior; 3 wersja – Gała) przez Bena, Omnitrix ustawia się na tryb samozniszczenia. Ma to dodatkowo moc zniszczenia całego wszechświata. Teraz Ben musi odnaleźć twórcę Omnitrixa, Azmutha (który jest przedstawicielem gatunku Szarej Materii); tylko on może wyłączyć ten tryb. Benowi w dotarciu do niego pomagają Gwen, Tetrax (który w kreskówce wystąpił jako Hoveboard), jego pomocnik Gluto i pomocnica Azmutha – Myaxx. Podczas podróży po kosmosie cała piątka będzie musiała się zmierzyć z przeszkodami, a mianowicie Vilgaxem, potem w Omnitrixie pojawi się nowy kosmita – Największy. ','ben_10_secret_of_the_omnitrix.jpg'),(13,'Generator Rex',1,60,'Zazwyczaj mikromaszyny zwane nanitami są nieszkodliwe. Jednak raz na jakiś czas wymykają się spod kontroli, a wtedy sprawiają, że żywe organizmy mutują, przeistaczając się w groteskowe potwory znane jako E.V.O. Te uwielbiają szaleć i niszczyć co popadnie, a w takich sytuacjach do akcji wkracza organizacja Providence, która ma rozległą siatkę agentów i dostęp do najbardziej zaawansowanych technologii. Piętnastoletni Rex Salazar, który także jest E.V.O. to tajna broń agencji. Chłopak pomaga organizacji zwalczać potwory, które sprawiają problemy. Jak każdy piętnastolatek lubi samochody, dziewczyny, muzykę i sport, jednak nie każdy nastolatek potrafi powiększyć swoje pięści do rozmiarów głazu, wysunąć z pleców plecak odrzutowy i przekształcić nogi w superszybki pojazd. To właśnie te umiejętności są niezwykle przydatne dla Providence, dzięki czemu dla organizacji jest bezcenną bronią. Celem Rexa jest wyleczyć wszystkie zmutowane E.V.O. z całego świata i oddzielić ludzi od cierpień i krzywd jakie im wyrządzają. ','generator_rex.jpg'),(14,'Młodzi Tytani',1,65,'Piątka nastolatków – Robin, Gwiazdka, Cyborg, Bestia, Raven – tworząc grupę superherosów o nazwie Młodzi Tytani, pilnuje porządku w mieście Jump City. Doglądając ładu z okien swojej wieży Tytanów, wyruszają natychmiast, gdy na ulicach istnieje jakieś niebezpieczeństwo, zagrażające cywilom. Zmagają się z inteligentnymi recydywistami, potworami i zwykłymi, podrzędnymi rabusiami. Niekiedy są zmuszeni opuścić tereny swojego miasta, a nawet Ziemię, lecz głównym punktem ich egzystencji jest ta wielka metropolia w USA. Mieszkają w budynku w kształcie litery „T”, na wyspie niedaleko brzegu ich miasta.\r\n\r\nCzasem ich przygody są lekkie, przyjemne i bardzo zabawne, a innym razem całe odcinki składają się z poważnych zadań i akcji, w których niekiedy może wydarzyć się przykrość i ból. Mimo że ogółem jest to kreskówka typu akcji, to bohaterowie nie walczą tam tylko ze złem, ale także z własnymi problemami: z relacjami między sobą, z dorastaniem, z kontrolowaniem swojej mocy.\r\n\r\nSeria jest co prawda luźno powiązana z komiksem, ale gdzieniegdzie nie obyło się bez mocnych nawiązań, inspiracji, czy adaptacji. Najwięcej z komiksowymi Tytanami mają wspólne sezon II i IV oraz nieemitowany w Polsce sezon V. Sezon drugi, z historią Terry jest luźną adaptacją „Judas Contract”, natomiast motyw Raven i jej złego ojca jest wzięty z komiksu „Terror of Trigon”. Sezon III także wprowadził kilka osób z komiksów, a mianowicie Tytanów Wschodu. W sezonie V mamy najwięcej powiązań do komiksowych Tytanów – przez postacie oraz wydarzenia. ','teen_titans.jpg'),(15,'Zwyczajny serial',1,261,'Głównymi bohaterami tego animowanego serialu są dwaj przyjaciele, wysoka na sześć stóp sójka Mordechaj i hiperaktywny szop Rigby. Obaj pracują jako ogrodnicy w parku, który należy, do przypominającego swoim wyglądem człowieka, lizaka imieniem Papcio. Praca ta jest tak nudna, że ci dwaj kumple zrobią wszystko, aby tylko jej uniknąć.','regular_show.jpg'),(16,'Johnny Test',1,137,'Johnny jest jedenastolatkiem mieszkającym w Świnioszycach (ang. Porkbelly). Wraz z psem Dukey testuje dla swoich sióstr, pracujących w domowym laboratorium, różne niebezpieczne wynalazki. ','johnny_test.jpg'),(17,'Awatar: Legenda Aanga',1,61,'Aang, 12-letni mag powietrza z Południowej Świątyni Powietrza, dowiaduje się, że jest kolejną inkarnacją awatara. Zazwyczaj awatar dowiadywał się prawdy o sobie w wieku 16 lat, jednak mnisi, mając na względzie wiszącą w powietrzu wojnę, chcą, by Awatar jak najszybciej przywrócił równowagę na świecie. Niedługo po tym decydują się na odseparowanie Aanga od jego mistrza Gyatso i wysyłają go do Wschodniej Świątyni, by tam dokończył swój trening magii powietrza.\r\n\r\nZdezorientowany, przerażony nowinami i ciążącą na nim odpowiedzialnością Aang ucieka z domu na grzbiecie swojego latającego bizona – Appy. Podczas podróży przez południowy ocean niespodziewany sztorm spycha Appę pod wodę. Nieświadomie Aang wkracza w stan awatara i używa kombinacji magii powietrza i wody, by chronić siebie i Appę, tworząc kulę powietrza otoczoną lodem. Kula zapewnia im dopływ tlenu i ochronę przed burzą, aż do jej zakończenia. Jednak sztorm przenosi ich w pobliże bieguna południowego, gdzie zamarzają w górze lodowej na 100 lat. ','avatar_legend_of_aang.webp'),(18,'Legenda Korry',1,52,'Avatar Aang, pokonując władcę ognia, wprowadził świat w najdłuższy okres pokoju i rozwoju gospodarczo - technologicznego. Teraz po jego śmierci, tą samą ścieżką podąża Korra, młoda dziewczyna o nieprzejednanej woli walki i wybuchowym charakterze. Wspierana przez grupę wiernych przyjaciół musi poradzić sobie nie tylko z duchowym przewodnictwem świata, ale także z problemami typowymi dla każdej nastolatki. Czy Korra dorówna swoim wielkim poprzednikom?','legend_of_korra.jpg');
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
INSERT INTO `contenttype` VALUES (2,'Film'),(1,'Kreskówka');
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
