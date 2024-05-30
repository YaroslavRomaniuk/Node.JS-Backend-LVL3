-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: localhost    Database: mvc_library
-- ------------------------------------------------------
-- Server version	8.0.34

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `authors`
--

DROP TABLE IF EXISTS `authors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `authors` (
  `author_id` int NOT NULL AUTO_INCREMENT,
  `author_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`author_id`),
  UNIQUE KEY `author_name` (`author_name`)
) ENGINE=InnoDB AUTO_INCREMENT=62 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `authors`
--

LOCK TABLES `authors` WRITE;
/*!40000 ALTER TABLE `authors` DISABLE KEYS */;
INSERT INTO `authors` VALUES (3,'Cisco Systems'),(14,'А. Белов'),(1,'Андрей Богуславский'),(42,'Батчер Мэтт'),(34,'Бек Кент'),(56,'Бен Фрай'),(5,'Брюс Еккель'),(39,'Васильев Алексей'),(4,'Вес Маккінні'),(60,'Вирт Никлаус'),(49,'Гамма Эрих'),(59,'Гуткнехт Юрг'),(8,'Гэри Маклин Холл'),(40,'Джастин Зейтц'),(23,'Джей Макгаврен'),(9,'Джеймс Р. Грофф'),(13,'Джереми Блум'),(53,'Джеффери К. Л.'),(12,'Джон Вудкок'),(51,'Джонсон Роберт'),(24,'Дрю Нейл'),(7,'Дэвид Флэнаган'),(45,'Жан-Жак Леви'),(44,'Жиль Довек'),(52,'Златопольский Дмитрий'),(29,'И. В. Петров'),(32,'Йо Ван Гуй'),(55,'Кейси Риас'),(10,'Люк Веллинг'),(33,'Макеев Г.А.'),(2,'Марк Саммерфільд'),(20,'Мартин Роберт'),(22,'Мартин Фаулер'),(11,'Мастицкий Сергей'),(31,'Нистрем Роберт'),(38,'Пауэрс Шелли'),(19,'Пол Дейтел'),(47,'Поллис Гари'),(28,'Роберт Мартин'),(25,'Салахова Алена'),(58,'Свейгарт Эл'),(48,'Селков Стэнли'),(17,'Сераков Александр'),(16,'Сет Гринберг'),(37,'Скотт Адам Д.'),(54,'Спилкэ Лауренциу'),(15,'Сэмюэл Грингард'),(27,'Тамара Манцнер'),(26,'Тиаго Антао'),(41,'Тим Арнольд'),(18,'Тим Кедлек'),(36,'Томас Дэвид'),(6,'Томас Кормен'),(43,'Фарина Мэтт'),(46,'Хайнеман Джордж'),(35,'Хант Эндрю'),(50,'Хелм Ричард'),(30,'Херманс Ф.'),(61,'Цилюрик Олег'),(21,'Энтони Грей'),(57,'Ярошенко Алексей');
/*!40000 ALTER TABLE `authors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `book_author`
--

DROP TABLE IF EXISTS `book_author`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `book_author` (
  `book_id` int NOT NULL,
  `author_id` int NOT NULL,
  PRIMARY KEY (`book_id`,`author_id`),
  KEY `author_id` (`author_id`),
  CONSTRAINT `book_author_ibfk_1` FOREIGN KEY (`book_id`) REFERENCES `books` (`book_id`),
  CONSTRAINT `book_author_ibfk_2` FOREIGN KEY (`author_id`) REFERENCES `authors` (`author_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `book_author`
--

LOCK TABLES `book_author` WRITE;
/*!40000 ALTER TABLE `book_author` DISABLE KEYS */;
INSERT INTO `book_author` VALUES (22,1),(23,2),(25,3),(26,4),(27,5),(29,6),(31,7),(32,8),(33,9),(34,10),(35,11),(36,12),(37,13),(38,14),(39,15),(40,16),(41,17),(42,18),(43,19),(44,20),(45,21),(46,22),(47,23),(48,24),(49,25),(50,26),(51,27),(52,28),(53,29),(54,30),(56,31),(57,32),(59,33),(60,34),(61,35),(61,36),(62,37),(62,38),(64,39),(67,40),(67,41),(68,42),(68,43),(69,44),(69,45),(70,46),(70,47),(70,48),(71,49),(71,50),(71,51),(72,52),(73,53),(74,54),(75,55),(75,56),(76,57),(77,58),(78,59),(78,60),(79,61);
/*!40000 ALTER TABLE `book_author` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `books`
--

DROP TABLE IF EXISTS `books`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `books` (
  `book_id` int NOT NULL AUTO_INCREMENT,
  `book_title` varchar(255) DEFAULT NULL,
  `book_year` int DEFAULT NULL,
  `pages_quantity` int DEFAULT NULL,
  `isbn` varchar(20) DEFAULT NULL,
  `book_description` text,
  `image` varchar(255) DEFAULT NULL,
  `view_count` int DEFAULT '0',
  `click_count` int DEFAULT '0',
  `deleted_at` datetime DEFAULT NULL,
  PRIMARY KEY (`book_id`)
) ENGINE=InnoDB AUTO_INCREMENT=80 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `books`
--

LOCK TABLES `books` WRITE;
/*!40000 ALTER TABLE `books` DISABLE KEYS */;
INSERT INTO `books` VALUES (22,'СИ++ И КОМПЬЮТЕРНАЯ ГРАФИКА',2003,352,'978-3-16-148410-0','Лекции и практикум по программированию на Си++','/books-page_files/images/22.jpg',3,0,NULL),(23,'Программирование на языке Go',2013,580,'978-3-16-148411-0','Полное руководство по программированию на языке Go','/books-page_files/images/23.jpg',3,0,NULL),(25,'Толковый словарь сетевых терминов и аббревиатур',2002,366,'978-3-16-148412-0','Справочник терминов и аббревиатур в области сетевых технологий','/books-page_files/images/25.jpg',2,0,NULL),(26,'Python for Data Analysis',2012,547,'978-3-16-148413-0','Руководство по анализу данных с использованием Python','/books-page_files/images/26.jpg',0,0,NULL),(27,'Философия Java',1998,1168,'978-3-16-148414-0','Глубокое погружение в принципы и философию языка Java','/books-page_files/images/27.jpg',0,0,NULL),(29,'Introduction to Algorithms',1989,1312,'978-3-16-148415-0','Стандартное введение в алгоритмы и структуры данных','/books-page_files/images/29.jpg',0,0,NULL),(31,'JavaScript Pocket Reference',2012,1025,'978-3-16-148416-0','Краткий справочник по языку программирования JavaScript','/books-page_files/images/31.jpg',0,0,NULL),(32,'Adaptive Code via C#:',2014,432,'978-3-16-148417-0','Принципы написания адаптивного кода на C#','/books-page_files/images/32.jpg',0,0,NULL),(33,'SQL: The Complete Reference',2009,912,'978-3-16-148418-0','Полное руководство по языку SQL','/books-page_files/images/33.jpg',0,0,NULL),(34,'PHP and MySQL Web Development',2001,896,'978-3-16-148419-0','Руководство по веб-разработке с использованием PHP и MySQL','/books-page_files/images/34.jpg',0,0,NULL),(35,'Статистический анализ и визуализация данных с помощью R',2015,496,'978-3-16-148420-0','Методы статистического анализа и визуализации данных с помощью языка R','/books-page_files/images/35.jpg',0,0,NULL),(36,'computer coding for kid',2016,425,'978-3-16-148421-0','Введение в программирование для детей','/books-page_files/images/36.jpg',0,0,NULL),(37,'Exploring Arduino: Tools and Techniques for Engineering Wizardry',2019,512,'978-3-16-148422-0','Руководство по работе с Arduino и инженерными техниками','/books-page_files/images/37.jpg',0,0,NULL),(38,'Программирование микроконтроллеров для начинающих и не только',2016,352,'978-3-16-148423-0','Основы программирования микроконтроллеров для начинающих','/books-page_files/images/38.jpg',0,0,NULL),(39,'The Internet of Things',2015,230,'978-3-16-148424-0','Обзор и анализ концепции Интернета вещей','/books-page_files/images/39.jpg',0,0,NULL),(40,'Sketching User Experiences: Getting the Design Right and the Right Design',2007,448,'978-3-16-148425-0','Практики и методы скетчинга в дизайне пользовательского опыта','/books-page_files/images/40.jpg',0,0,NULL),(41,'InDesign',2013,208,'978-3-16-148426-0','Основы работы с программой InDesign для создания впечатляющих дизайнерских проектов','/books-page_files/images/41.jpg',0,0,NULL),(42,'Адаптивный дизайн',2013,288,'978-3-16-148427-0','Понимание и применение адаптивного дизайна для создания отзывчивых веб-сайтов','/books-page_files/images/42.jpg',0,0,NULL),(43,'Android для разработчиков',2016,512,'978-3-16-148428-0','Полное руководство по разработке приложений для Android с примерами и упражнениями','/books-page_files/images/45.jpg',0,0,NULL),(44,'Чистый код: создание, анализ и рефакторинг',2022,464,'978-3-16-148429-0','Советы и трюки для создания чистого, эффективного кода и рефакторинга существующего','/books-page_files/images/44.jpg',0,0,NULL),(45,'Swift. Карманный справочник',2014,183,'978-3-16-148430-0','Карманный справочник по языку программирования Swift, идеальный для быстрого справления','/books-page_files/images/45.jpg',0,0,NULL),(46,'NoSQL Distilled: A Brief Guide to the Emerging World of Polyglot Persistence',2012,192,'978-3-16-148431-0','Введение в мир NoSQL и полиглотского постоянства','/books-page_files/images/46.jpg',0,0,NULL),(47,'Head First Ruby',2015,569,'978-3-16-148432-0','Интерактивное введение в язык программирования Ruby с акцентом на активное обучение','/books-page_files/images/47.jpg',0,0,NULL),(48,'Practical Vim',2015,356,'978-3-16-148433-0','Практическое руководство по использованию Vim для улучшения эффективности кодирования','/books-page_files/images/48.jpg',0,0,NULL),(49,'Arduino. Полный учебный курс',2003,333,'978-3-16-148434-0','Полный учебный курс по работе с Arduino, включающий проекты для самостоятельного выполнения','/books-page_files/images/49.jpg',0,0,NULL),(50,'Сверхбыстрый Python',2023,370,'978-3-16-148435-0','Техники и стратегии для ускорения вашего кода на Python','/books-page_files/images/50.jpg',0,0,NULL),(51,'Визуализация данных',2023,464,'978-3-16-148436-0','Теория и практика визуализации данных, включая принципы дизайна и программирования','/books-page_files/images/51.jpg',0,0,NULL),(52,'Идеальный программист',2022,224,'978-3-16-148437-0','Советы и стратегии для становления идеальным программистом','/books-page_files/images/52.jpg',0,0,NULL),(53,'Программируемые контроллеры',2016,254,'978-3-16-148438-0','Основы программирования программируемых контроллеров','/books-page_files/images/53.jpg',0,0,NULL),(54,'Ум программиста. Как понять и осмыслить любой код.',2023,272,'978-3-16-148438-0','Стратегии и техники для понимания и осмысления любого кода','/books-page_files/images/54.jpg',0,0,NULL),(56,'Паттерны программирования игр',2022,432,'978-5-04-102290-7','Хороший код — основа любой игры.','/books-page_files/images/56.jpg',0,0,NULL),(57,'Программирование на ассемблере х64',2021,332,'978-5-97060-929-3','Вы сможете писать и читать исходный код на ассемблере','/books-page_files/images/57.jpg',0,0,NULL),(59,'Обьектно-ориентированное программирование: с нуля к SOLID и MVC',2024,272,'978-5-9775-1913-7','Книга по приёмам ООП с примерами на языке C++','/books-page_files/images/59.jpg',0,0,NULL),(60,'Экстремальное программирование',2022,224,'978-5-4461-1439-9','Возвращение знаменитого бестселлера.','/books-page_files/images/60.jpg',0,0,NULL),(61,'Программист-прагматик',2020,368,'978-5-907203-32-7','Предложенный авторами книги прагматичный философский подход к разработке программного обеспечения нашел широкое распространение','/books-page_files/images/61.jpg',0,0,NULL),(62,'JavaScript. Рецепты для разработчиков.',2023,528,'978-5-4461-2001-7','Зачем изобретать велосипед, сталкиваясь с очередной проблемой в JavaScript?','/books-page_files/images/62.jpg',0,0,NULL),(64,'Программирование на C++ в примерах и задачах',2023,368,'978-5-699-87445-3','Книга предназначена для изучения языка программирования C++','/books-page_files/images/64.jpg',0,0,NULL),(67,'Black Hat Python',2022,224,'978-5-4461-3935-4','Вы исследуете темную сторону возможностей Python','/books-page_files/images/67.jpg',0,0,NULL),(68,'Go на практике',2017,374,'978-5-97060-477-9','Go - превосходный системный язык.','/books-page_files/images/68.jpg',0,0,NULL),(69,'Введение в теорию языков программирования',2016,134,'978-5-97060-242-3','Книга представляет читателю средства, необходимые для проектирования и реализации подобных языков','/books-page_files/images/69.jpg',0,0,NULL),(70,'Алгоритмы. Справочник',2020,432,'978-5-9908910-7-4','В данном обновленном издании описываются существующие алгоритмы для решения различных задач.','/books-page_files/images/70.jpg',0,0,NULL),(71,'Паттерны объектно-ориентированного проектирования',2022,448,'978-5-4461-1595-2','Банда четырех - представляют вашему вниманию опыт ООП в виде двадцати трех паттернов.','/books-page_files/images/71.jpg',0,0,NULL),(72,'Сборник задач по программированию',2012,100,'5-94157-450-9','В пособии приведены более 1600 задач по программированию','/books-page_files/images/72.jpg',0,0,NULL),(73,'Создай свой собственный язык программирования',2023,408,'978-5-93700-140-5','Книга рассказывает о том, как разрабатывать уникальные языки программирования','/books-page_files/images/73.jpg',0,0,NULL),(74,'JAVA: устранение проблем',2023,356,'978-5-93700-215-0','В этой книге представлены практические методики исследования и улучшения незнакомого кода.','/books-page_files/images/74.jpg',0,0,NULL),(75,'Знакомство с программированием на языке Processing',2021,194,'978-5-97060-950-7','Изучите компьютерное программирование с помощью Processing','/books-page_files/images/75.jpg',0,0,NULL),(76,'Хакинг web-сервера',2023,304,'978-5-907592-21-6','Данная книга расскажет, как получить несанкционированный доступ к веб-серверу','/books-page_files/images/76.jpg',0,0,NULL),(77,'Scratch 3',2023,224,'978-5-04-122009-9','Scratch 3 — лучшая среда программирования для новичков.','/books-page_files/images/77.jpg',0,0,NULL),(78,'Разработка операционной системы и компилятора.',2017,560,'978-5-97060-613-1','Благодаря своей структуре, язык Оберон удобен для отображения глобальной модульной структуры любой программной системы.','/books-page_files/images/78.jpg',0,0,NULL),(79,'Linux и Go.',2023,304,'978-5-9775-1741-6','Первая русскоязычная книга об интеграции языка Go в архитектуру ядра Linux.','/books-page_files/images/79.jpg',0,0,NULL);
/*!40000 ALTER TABLE `books` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `db_initialization`
--

DROP TABLE IF EXISTS `db_initialization`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `db_initialization` (
  `id` int NOT NULL AUTO_INCREMENT,
  `initialized` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `db_initialization`
--

LOCK TABLES `db_initialization` WRITE;
/*!40000 ALTER TABLE `db_initialization` DISABLE KEYS */;
INSERT INTO `db_initialization` VALUES (1,1);
/*!40000 ALTER TABLE `db_initialization` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-05-26 14:08:01
