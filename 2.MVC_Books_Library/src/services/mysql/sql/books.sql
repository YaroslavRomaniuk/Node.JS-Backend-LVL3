USE mvc_library;

-- *********** --
INSERT INTO Books (book_id, book_title, book_year, pages_quantity, isbn, book_description, image)
VALUES (22, 'СИ++ И КОМПЬЮТЕРНАЯ ГРАФИКА', 2003, 352, '978-3-16-148410-0', 'Лекции и практикум по программированию на Си++', '/images_and_styles/images/22.jpg');
INSERT INTO Authors (author_name)
VALUES ('Андрей Богуславский');
SET @last_author_id = LAST_INSERT_ID();
INSERT INTO Book_Author (book_id, author_id)
VALUES (22, @last_author_id);

-- *********** --
INSERT INTO Books (book_id, book_title, book_year, pages_quantity, isbn, book_description, image)
VALUES (23, 'Программирование на языке Go', 2013, 580, '978-3-16-148411-0', 'Полное руководство по программированию на языке Go', '/images_and_styles/images/23.jpg');
INSERT INTO Authors (author_name)
VALUES ('Марк Саммерфільд');
SET @last_author_id = LAST_INSERT_ID();
INSERT INTO Book_Author (book_id, author_id)
VALUES (23, @last_author_id);

-- *********** --
INSERT INTO Books (book_id, book_title, book_year, pages_quantity, isbn, book_description, image)
VALUES (25, 'Толковый словарь сетевых терминов и аббревиатур', 2002, 366, '978-3-16-148412-0', 'Справочник терминов и аббревиатур в области сетевых технологий', '/images_and_styles/images/25.jpg');
INSERT INTO Authors (author_name)
VALUES ('Cisco Systems');
SET @last_author_id = LAST_INSERT_ID();
INSERT INTO Book_Author (book_id, author_id)
VALUES (25, @last_author_id);

-- *********** --
INSERT INTO Books (book_id, book_title, book_year, pages_quantity, isbn, book_description, image)
VALUES (26, 'Python for Data Analysis', 2012, 547, '978-3-16-148413-0', 'Руководство по анализу данных с использованием Python', '/images_and_styles/images/26.jpg');
INSERT INTO Authors (author_name)
VALUES ('Вес Маккінні');
SET @last_author_id = LAST_INSERT_ID();
INSERT INTO Book_Author (book_id, author_id)
VALUES (26, @last_author_id);

-- *********** --
INSERT INTO Books (book_id, book_title, book_year, pages_quantity, isbn, book_description, image)
VALUES (27, 'Философия Java', 1998, 1168, '978-3-16-148414-0', 'Глубокое погружение в принципы и философию языка Java', '/images_and_styles/images/27.jpg');
INSERT INTO Authors (author_name)
VALUES ('Брюс Еккель');
SET @last_author_id = LAST_INSERT_ID();
INSERT INTO Book_Author (book_id, author_id)
VALUES (27, @last_author_id);

-- *********** --
INSERT INTO Books (book_id, book_title, book_year, pages_quantity, isbn, book_description, image)
VALUES (29, 'Introduction to Algorithms', 1989, 1312, '978-3-16-148415-0', 'Стандартное введение в алгоритмы и структуры данных', '/images_and_styles/images/29.jpg');
INSERT INTO Authors (author_name)
VALUES ('Томас Кормен');
SET @last_author_id = LAST_INSERT_ID();
INSERT INTO Book_Author (book_id, author_id)
VALUES (29, @last_author_id);

-- *********** --
INSERT INTO Books (book_id, book_title, book_year, pages_quantity, isbn, book_description, image)
VALUES (31, 'JavaScript Pocket Reference', 2012, 1025, '978-3-16-148416-0', 'Краткий справочник по языку программирования JavaScript', '/images_and_styles/images/31.jpg');
INSERT INTO Authors (author_name)
VALUES ('Дэвид Флэнаган');
SET @last_author_id = LAST_INSERT_ID();
INSERT INTO Book_Author (book_id, author_id)
VALUES (31, @last_author_id);

-- *********** --
INSERT INTO Books (book_id, book_title, book_year, pages_quantity, isbn, book_description, image)
VALUES (32, 'Adaptive Code via C#:', 2014, 432, '978-3-16-148417-0', 'Принципы написания адаптивного кода на C#', '/images_and_styles/images/32.jpg');
INSERT INTO Authors (author_name)
VALUES ('Гэри Маклин Холл');
SET @last_author_id = LAST_INSERT_ID();
INSERT INTO Book_Author (book_id, author_id)
VALUES (32, @last_author_id);

-- *********** --
INSERT INTO Books (book_id, book_title, book_year, pages_quantity, isbn, book_description, image)
VALUES (33, 'SQL: The Complete Reference', 2009, 912, '978-3-16-148418-0', 'Полное руководство по языку SQL', '/images_and_styles/images/33.jpg');
INSERT INTO Authors (author_name)
VALUES ('Джеймс Р. Грофф');
SET @last_author_id = LAST_INSERT_ID();
INSERT INTO Book_Author (book_id, author_id)
VALUES (33, @last_author_id);

-- *********** --
INSERT INTO Books (book_id, book_title, book_year, pages_quantity, isbn, book_description, image)
VALUES (34, 'PHP and MySQL Web Development', 2001, 896, '978-3-16-148419-0', 'Руководство по веб-разработке с использованием PHP и MySQL', '/images_and_styles/images/34.jpg');
INSERT INTO Authors (author_name)
VALUES ('Люк Веллинг');
SET @last_author_id = LAST_INSERT_ID();
INSERT INTO Book_Author (book_id, author_id)
VALUES (34, @last_author_id);

-- *********** --
INSERT INTO Books (book_id, book_title, book_year, pages_quantity, isbn, book_description, image)
VALUES (35, 'Статистический анализ и визуализация данных с помощью R', 2015, 496, '978-3-16-148420-0', 'Методы статистического анализа и визуализации данных с помощью языка R', '/images_and_styles/images/35.jpg');
INSERT INTO Authors (author_name)
VALUES ('Мастицкий Сергей');
SET @last_author_id = LAST_INSERT_ID();
INSERT INTO Book_Author (book_id, author_id)
VALUES (35, @last_author_id);

-- *********** --
INSERT INTO Books (book_id, book_title, book_year, pages_quantity, isbn, book_description, image)
VALUES (36, 'computer coding for kid', 2016, 425, '978-3-16-148421-0', 'Введение в программирование для детей', '/images_and_styles/images/36.jpg');
INSERT INTO Authors (author_name)
VALUES ('Джон Вудкок');
SET @last_author_id = LAST_INSERT_ID();
INSERT INTO Book_Author (book_id, author_id)
VALUES (36, @last_author_id);

-- *********** --
INSERT INTO Books (book_id, book_title, book_year, pages_quantity, isbn, book_description, image)
VALUES (37, 'Exploring Arduino: Tools and Techniques for Engineering Wizardry', 2019, 512, '978-3-16-148422-0', 'Руководство по работе с Arduino и инженерными техниками', '/images_and_styles/images/37.jpg');
INSERT INTO Authors (author_name)
VALUES ('Джереми Блум');
SET @last_author_id = LAST_INSERT_ID();
INSERT INTO Book_Author (book_id, author_id)
VALUES (37, @last_author_id);

-- *********** --
INSERT INTO Books (book_id, book_title, book_year, pages_quantity, isbn, book_description, image)
VALUES (38, 'Программирование микроконтроллеров для начинающих и не только', 2016, 352, '978-3-16-148423-0', 'Основы программирования микроконтроллеров для начинающих', '/images_and_styles/images/38.jpg');
INSERT INTO Authors (author_name)
VALUES ('А. Белов');
SET @last_author_id = LAST_INSERT_ID();
INSERT INTO Book_Author (book_id, author_id)
VALUES (38, @last_author_id);

-- *********** --
INSERT INTO Books (book_id, book_title, book_year, pages_quantity, isbn, book_description, image)
VALUES (39, 'The Internet of Things', 2015, 230, '978-3-16-148424-0', 'Обзор и анализ концепции Интернета вещей', '/images_and_styles/images/39.jpg');
INSERT INTO Authors (author_name)
VALUES ('Сэмюэл Грингард');
SET @last_author_id = LAST_INSERT_ID();
INSERT INTO Book_Author (book_id, author_id)
VALUES (39, @last_author_id);

-- *********** --
INSERT INTO Books (book_id, book_title, book_year, pages_quantity, isbn, book_description, image)
VALUES (40, 'Sketching User Experiences: Getting the Design Right and the Right Design', 2007, 448, '978-3-16-148425-0', 'Практики и методы скетчинга в дизайне пользовательского опыта', '/images_and_styles/images/40.jpg');
INSERT INTO Authors (author_name)
VALUES ('Сет Гринберг');
SET @last_author_id = LAST_INSERT_ID();
INSERT INTO Book_Author (book_id, author_id)
VALUES (40, @last_author_id);

-- *********** --
INSERT INTO Books (book_id, book_title, book_year, pages_quantity, isbn, book_description, image)
VALUES (41, 'InDesign', 2013, 208, '978-3-16-148426-0', 'Основы работы с программой InDesign для создания впечатляющих дизайнерских проектов', '/images_and_styles/images/41.jpg');
INSERT INTO Authors (author_name)
VALUES ('Сераков Александр');
SET @last_author_id = LAST_INSERT_ID();
INSERT INTO Book_Author (book_id, author_id)
VALUES (41, @last_author_id);

-- *********** --
INSERT INTO Books (book_id, book_title, book_year, pages_quantity, isbn, book_description, image)
VALUES (42, 'Адаптивный дизайн', 2013, 288, '978-3-16-148427-0', 'Понимание и применение адаптивного дизайна для создания отзывчивых веб-сайтов', '/images_and_styles/images/42.jpg');
INSERT INTO Authors (author_name)
VALUES ('Тим Кедлек');
SET @last_author_id = LAST_INSERT_ID();
INSERT INTO Book_Author (book_id, author_id)
VALUES (42, @last_author_id);

-- *********** --
INSERT INTO Books (book_id, book_title, book_year, pages_quantity, isbn, book_description, image)
VALUES (43, 'Android для разработчиков', 2016, 512, '978-3-16-148428-0', 'Полное руководство по разработке приложений для Android с примерами и упражнениями', '/images_and_styles/images/45.jpg');
INSERT INTO Authors (author_name)
VALUES ('Пол Дейтел');
SET @last_author_id = LAST_INSERT_ID();
INSERT INTO Book_Author (book_id, author_id)
VALUES (43, @last_author_id);

-- *********** --
INSERT INTO Books (book_id, book_title, book_year, pages_quantity, isbn, book_description, image)
VALUES (44, 'Чистый код: создание, анализ и рефакторинг', 2022, 464, '978-3-16-148429-0', 'Советы и трюки для создания чистого, эффективного кода и рефакторинга существующего', '/images_and_styles/images/44.jpg');
INSERT INTO Authors (author_name)
VALUES ('Мартин Роберт');
SET @last_author_id = LAST_INSERT_ID();
INSERT INTO Book_Author (book_id, author_id)
VALUES (44, @last_author_id);

-- *********** --
INSERT INTO Books (book_id, book_title, book_year, pages_quantity, isbn, book_description, image)
VALUES (45, 'Swift. Карманный справочник', 2014, 183, '978-3-16-148430-0', 'Карманный справочник по языку программирования Swift, идеальный для быстрого справления', '/images_and_styles/images/45.jpg');
INSERT INTO Authors (author_name)
VALUES ('Энтони Грей');
SET @last_author_id = LAST_INSERT_ID();
INSERT INTO Book_Author (book_id, author_id)
VALUES (45, @last_author_id);

-- *********** --
INSERT INTO Books (book_id, book_title, book_year, pages_quantity, isbn, book_description, image)
VALUES (46, 'NoSQL Distilled: A Brief Guide to the Emerging World of Polyglot Persistence', 2012, 192, '978-3-16-148431-0', 'Введение в мир NoSQL и полиглотского постоянства', '/images_and_styles/images/46.jpg');
INSERT INTO Authors (author_name)
VALUES ('Мартин Фаулер');
SET @last_author_id = LAST_INSERT_ID();
INSERT INTO Book_Author (book_id, author_id)
VALUES (46, @last_author_id);

-- *********** --
INSERT INTO Books (book_id, book_title, book_year, pages_quantity, isbn, book_description, image)
VALUES (47, 'Head First Ruby', 2015, 569, '978-3-16-148432-0', 'Интерактивное введение в язык программирования Ruby с акцентом на активное обучение', '/images_and_styles/images/47.jpg');
INSERT INTO Authors (author_name)
VALUES ('Джей Макгаврен');
SET @last_author_id = LAST_INSERT_ID();
INSERT INTO Book_Author (book_id, author_id)
VALUES (47, @last_author_id);

-- *********** --
INSERT INTO Books (book_id, book_title, book_year, pages_quantity, isbn, book_description, image)
VALUES (48, 'Practical Vim', 2015, 356, '978-3-16-148433-0', 'Практическое руководство по использованию Vim для улучшения эффективности кодирования', '/images_and_styles/images/48.jpg');
INSERT INTO Authors (author_name)
VALUES ('Дрю Нейл');
SET @last_author_id = LAST_INSERT_ID();
INSERT INTO Book_Author (book_id, author_id)
VALUES (48, @last_author_id);

-- *********** --
INSERT INTO Books (book_id, book_title, book_year, pages_quantity, isbn, book_description, image)
VALUES (49, 'Arduino. Полный учебный курс', 2003, 333, '978-3-16-148434-0', 'Полный учебный курс по работе с Arduino, включающий проекты для самостоятельного выполнения', '/images_and_styles/images/49.jpg');
INSERT INTO Authors (author_name)
VALUES ('Салахова Алена');
SET @last_author_id = LAST_INSERT_ID();
INSERT INTO Book_Author (book_id, author_id)
VALUES (49, @last_author_id);

-- *********** --
INSERT INTO Books (book_id, book_title, book_year, pages_quantity, isbn, book_description, image)
VALUES (50, 'Сверхбыстрый Python', 2023, 370, '978-3-16-148435-0', 'Техники и стратегии для ускорения вашего кода на Python', '/images_and_styles/images/50.jpg');
INSERT INTO Authors (author_name)
VALUES ('Тиаго Антао');
SET @last_author_id = LAST_INSERT_ID();
INSERT INTO Book_Author (book_id, author_id)
VALUES (50, @last_author_id);

-- *********** --
INSERT INTO Books (book_id, book_title, book_year, pages_quantity, isbn, book_description, image)
VALUES (51, 'Визуализация данных', 2023, 464, '978-3-16-148436-0', 'Теория и практика визуализации данных, включая принципы дизайна и программирования', '/images_and_styles/images/51.jpg');
INSERT INTO Authors (author_name)
VALUES ('Тамара Манцнер');
SET @last_author_id = LAST_INSERT_ID();
INSERT INTO Book_Author (book_id, author_id)
VALUES (51, @last_author_id);

-- *********** --
INSERT INTO Books (book_id, book_title, book_year, pages_quantity, isbn, book_description, image)
VALUES (52, 'Идеальный программист', 2022, 224, '978-3-16-148437-0', 'Советы и стратегии для становления идеальным программистом', '/images_and_styles/images/52.jpg');
INSERT INTO Authors (author_name)
VALUES ('Роберт Мартин');
SET @last_author_id = LAST_INSERT_ID();
INSERT INTO Book_Author (book_id, author_id)
VALUES (52, @last_author_id);

-- *********** --
INSERT INTO Books (book_id, book_title, book_year, pages_quantity, isbn, book_description, image)
VALUES (53, 'Программируемые контроллеры', 2016, 254, '978-3-16-148438-0', 'Основы программирования программируемых контроллеров', '/images_and_styles/images/53.jpg');
INSERT INTO Authors (author_name)
VALUES ('И. В. Петров');
SET @last_author_id = LAST_INSERT_ID();
INSERT INTO Book_Author (book_id, author_id)
VALUES (53, @last_author_id);

-- *********** --
INSERT INTO Books (book_id, book_title, book_year, pages_quantity, isbn, book_description, image)
VALUES (54, 'Ум программиста. Как понять и осмыслить любой код.', 2023, 272, '978-3-16-148438-0', 'Стратегии и техники для понимания и осмысления любого кода', '/images_and_styles/images/54.jpg');
INSERT INTO Authors (author_name)
VALUES ('Херманс Ф.');
SET @last_author_id = LAST_INSERT_ID();
INSERT INTO Book_Author (book_id, author_id)
VALUES (54, @last_author_id);

-- *********** --
INSERT INTO Books (book_id, book_title, book_year, pages_quantity, isbn, book_description, image)
VALUES (56, 'Паттерны программирования игр', 2022, 432, '978-5-04-102290-7', 'Хороший код — основа любой игры.', '/images_and_styles/images/56.jpg');
INSERT INTO Authors (author_name)
VALUES ('Нистрем Роберт');
SET @last_author_id = LAST_INSERT_ID();
INSERT INTO Book_Author (book_id, author_id)
VALUES (56, @last_author_id);

-- *********** --
INSERT INTO Books (book_id, book_title, book_year, pages_quantity, isbn, book_description, image)
VALUES (57, 'Программирование на ассемблере х64', 2021, 332, '978-5-97060-929-3', 'Вы сможете писать и читать исходный код на ассемблере', '/images_and_styles/images/57.jpg');
INSERT INTO Authors (author_name)
VALUES ('Йо Ван Гуй');
SET @last_author_id = LAST_INSERT_ID();
INSERT INTO Book_Author (book_id, author_id)
VALUES (57, @last_author_id);

-- *********** --
INSERT INTO Books (book_id, book_title, book_year, pages_quantity, isbn, book_description, image)
VALUES (59, 'Обьектно-ориентированное программирование: с нуля к SOLID и MVC', 2024, 272, '978-5-9775-1913-7', 'Книга по приёмам ООП с примерами на языке C++', '/images_and_styles/images/59.jpg');
INSERT INTO Authors (author_name)
VALUES ('Макеев Г.А.');
SET @last_author_id = LAST_INSERT_ID();
INSERT INTO Book_Author (book_id, author_id)
VALUES (59, @last_author_id);

-- *********** --
INSERT INTO Books (book_id, book_title, book_year, pages_quantity, isbn, book_description, image)
VALUES (60, 'Экстремальное программирование', 2022, 224, '978-5-4461-1439-9', 'Возвращение знаменитого бестселлера.', '/images_and_styles/images/60.jpg');
INSERT INTO Authors (author_name)
VALUES ('Бек Кент');
SET @last_author_id = LAST_INSERT_ID();
INSERT INTO Book_Author (book_id, author_id)
VALUES (60, @last_author_id);

-- *********** --
INSERT INTO Books (book_id, book_title, book_year, pages_quantity, isbn, book_description, image)
VALUES (61, 'Программист-прагматик', 2020, 368, '978-5-907203-32-7', 'Предложенный авторами книги прагматичный философский подход к разработке программного обеспечения нашел широкое распространение', '/images_and_styles/images/61.jpg');

INSERT INTO Authors (author_name)
VALUES ('Хант Эндрю');
SET @first_author_id = LAST_INSERT_ID();

INSERT INTO Authors (author_name)
VALUES ('Томас Дэвид');
SET @second_author_id = LAST_INSERT_ID();

INSERT INTO Book_Author (book_id, author_id)
VALUES (61, @first_author_id);

INSERT INTO Book_Author (book_id, author_id)
VALUES (61, @second_author_id);

-- *********** --
INSERT INTO Books (book_id, book_title, book_year, pages_quantity, isbn, book_description, image)
VALUES (62, 'JavaScript. Рецепты для разработчиков.', 2023, 528, '978-5-4461-2001-7', 'Зачем изобретать велосипед, сталкиваясь с очередной проблемой в JavaScript?', '/images_and_styles/images/62.jpg');

INSERT INTO Authors (author_name)
VALUES ('Скотт Адам Д.');
SET @first_author_id = LAST_INSERT_ID();

INSERT INTO Authors (author_name)
VALUES ('Пауэрс Шелли');
SET @second_author_id = LAST_INSERT_ID();

INSERT INTO Book_Author (book_id, author_id)
VALUES (62, @first_author_id);

INSERT INTO Book_Author (book_id, author_id)
VALUES (62, @second_author_id);


-- *********** --
INSERT INTO Books (book_id, book_title, book_year, pages_quantity, isbn, book_description, image)
VALUES (64, 'Программирование на C++ в примерах и задачах', 2023, 368, '978-5-699-87445-3', 'Книга предназначена для изучения языка программирования C++', '/images_and_styles/images/64.jpg');
INSERT INTO Authors (author_name)
VALUES ('Васильев Алексей');
SET @last_author_id = LAST_INSERT_ID();
INSERT INTO Book_Author (book_id, author_id)
VALUES (64, @last_author_id);

-- *********** --
INSERT INTO Books (book_id, book_title, book_year, pages_quantity, isbn, book_description, image)
VALUES (67, 'Black Hat Python', 2022, 224, '978-5-4461-3935-4', 'Вы исследуете темную сторону возможностей Python', '/images_and_styles/images/67.jpg');

INSERT INTO Authors (author_name)
VALUES ('Джастин Зейтц');
SET @first_author_id = LAST_INSERT_ID();

INSERT INTO Authors (author_name)
VALUES ('Тим Арнольд');
SET @second_author_id = LAST_INSERT_ID();

INSERT INTO Book_Author (book_id, author_id)
VALUES (67, @first_author_id);

INSERT INTO Book_Author (book_id, author_id)
VALUES (67, @second_author_id);

-- *********** --
INSERT INTO Books (book_id, book_title, book_year, pages_quantity, isbn, book_description, image)
VALUES (68, 'Go на практике', 2017, 374, '978-5-97060-477-9', 'Go - превосходный системный язык.', '/images_and_styles/images/68.jpg');

INSERT INTO Authors (author_name)
VALUES ('Батчер Мэтт');
SET @first_author_id = LAST_INSERT_ID();

INSERT INTO Authors (author_name)
VALUES ('Фарина Мэтт');
SET @second_author_id = LAST_INSERT_ID();

INSERT INTO Book_Author (book_id, author_id)
VALUES (68, @first_author_id);

INSERT INTO Book_Author (book_id, author_id)
VALUES (68, @second_author_id);

-- *********** --
INSERT INTO Books (book_id, book_title, book_year, pages_quantity, isbn, book_description, image)
VALUES (69, 'Введение в теорию языков программирования', 2016, 134, '978-5-97060-242-3', 'Книга представляет читателю средства, необходимые для проектирования и реализации подобных языков', '/images_and_styles/images/69.jpg');

INSERT INTO Authors (author_name)
VALUES ('Жиль Довек');
SET @first_author_id = LAST_INSERT_ID();

INSERT INTO Authors (author_name)
VALUES ('Жан-Жак Леви');
SET @second_author_id = LAST_INSERT_ID();

INSERT INTO Book_Author (book_id, author_id)
VALUES (69, @first_author_id);

INSERT INTO Book_Author (book_id, author_id)
VALUES (69, @second_author_id);

-- *********** --
INSERT INTO Books (book_id, book_title, book_year, pages_quantity, isbn, book_description, image)
VALUES (70, 'Алгоритмы. Справочник', 2020, 432, '978-5-9908910-7-4', 'В данном обновленном издании описываются существующие алгоритмы для решения различных задач.', '/images_and_styles/images/70.jpg');

INSERT INTO Authors (author_name)
VALUES ('Хайнеман Джордж');
SET @first_author_id = LAST_INSERT_ID();

INSERT INTO Authors (author_name)
VALUES ('Поллис Гари');
SET @second_author_id = LAST_INSERT_ID();

INSERT INTO Authors (author_name)
VALUES ('Селков Стэнли');
SET @third_author_id = LAST_INSERT_ID();

INSERT INTO Book_Author (book_id, author_id)
VALUES (70, @first_author_id);

INSERT INTO Book_Author (book_id, author_id)
VALUES (70, @second_author_id);

INSERT INTO Book_Author (book_id, author_id)
VALUES (70, @third_author_id);

-- *********** --
INSERT INTO Books (book_id, book_title, book_year, pages_quantity, isbn, book_description, image)
VALUES (71, 'Паттерны объектно-ориентированного проектирования', 2022, 448, '978-5-4461-1595-2', 'Банда четырех - представляют вашему вниманию опыт ООП в виде двадцати трех паттернов.', '/images_and_styles/images/71.jpg');

INSERT INTO Authors (author_name)
VALUES ('Гамма Эрих');
SET @first_author_id = LAST_INSERT_ID();

INSERT INTO Authors (author_name)
VALUES ('Хелм Ричард');
SET @second_author_id = LAST_INSERT_ID();

INSERT INTO Authors (author_name)
VALUES ('Джонсон Роберт');
SET @third_author_id = LAST_INSERT_ID();

INSERT INTO Book_Author (book_id, author_id)
VALUES (71, @first_author_id);

INSERT INTO Book_Author (book_id, author_id)
VALUES (71, @second_author_id);

INSERT INTO Book_Author (book_id, author_id)
VALUES (71, @third_author_id);

-- *********** --
INSERT INTO Books (book_id, book_title, book_year, pages_quantity, isbn, book_description, image)
VALUES (72, 'Сборник задач по программированию', 2012, 100, '5-94157-450-9', 'В пособии приведены более 1600 задач по программированию', '/images_and_styles/images/72.jpg');
INSERT INTO Authors (author_name)
VALUES ('Златопольский Дмитрий');
SET @last_author_id = LAST_INSERT_ID();
INSERT INTO Book_Author (book_id, author_id)
VALUES (72, @last_author_id);

-- *********** --
INSERT INTO Books (book_id, book_title, book_year, pages_quantity, isbn, book_description, image)
VALUES (73, 'Создай свой собственный язык программирования', 2023, 408, '978-5-93700-140-5', 'Книга рассказывает о том, как разрабатывать уникальные языки программирования', '/images_and_styles/images/73.jpg');
INSERT INTO Authors (author_name)
VALUES ('Джеффери К. Л.');
SET @last_author_id = LAST_INSERT_ID();
INSERT INTO Book_Author (book_id, author_id)
VALUES (73, @last_author_id);

-- *********** --
INSERT INTO Books (book_id, book_title, book_year, pages_quantity, isbn, book_description, image)
VALUES (74, 'JAVA: устранение проблем', 2023, 356, '978-5-93700-215-0', 'В этой книге представлены практические методики исследования и улучшения незнакомого кода.', '/images_and_styles/images/74.jpg');
INSERT INTO Authors (author_name)
VALUES ('Спилкэ Лауренциу');
SET @last_author_id = LAST_INSERT_ID();
INSERT INTO Book_Author (book_id, author_id)
VALUES (74, @last_author_id);

-- *********** --
INSERT INTO Books (book_id, book_title, book_year, pages_quantity, isbn, book_description, image)
VALUES (75, 'Знакомство с программированием на языке Processing', 2021, 194, '978-5-97060-950-7', 'Изучите компьютерное программирование с помощью Processing', '/images_and_styles/images/75.jpg');

INSERT INTO Authors (author_name)
VALUES ('Кейси Риас');
SET @first_author_id = LAST_INSERT_ID();

INSERT INTO Authors (author_name)
VALUES ('Бен Фрай');
SET @second_author_id = LAST_INSERT_ID();

INSERT INTO Book_Author (book_id, author_id)
VALUES (75, @first_author_id);

INSERT INTO Book_Author (book_id, author_id)
VALUES (75, @second_author_id);

-- *********** --
INSERT INTO Books (book_id, book_title, book_year, pages_quantity, isbn, book_description, image)
VALUES (76, 'Хакинг web-сервера', 2023, 304, '978-5-907592-21-6', 'Данная книга расскажет, как получить несанкционированный доступ к веб-серверу', '/images_and_styles/images/76.jpg');
INSERT INTO Authors (author_name)
VALUES ('Ярошенко Алексей');
SET @last_author_id = LAST_INSERT_ID();
INSERT INTO Book_Author (book_id, author_id)
VALUES (76, @last_author_id);

-- *********** --
INSERT INTO Books (book_id, book_title, book_year, pages_quantity, isbn, book_description, image)
VALUES (77, 'Scratch 3', 2023, 224, '978-5-04-122009-9', 'Scratch 3 — лучшая среда программирования для новичков.', '/images_and_styles/images/77.jpg');
INSERT INTO Authors (author_name)
VALUES ('Свейгарт Эл');
SET @last_author_id = LAST_INSERT_ID();
INSERT INTO Book_Author (book_id, author_id)
VALUES (77, @last_author_id);

-- *********** --
INSERT INTO Books (book_id, book_title, book_year, pages_quantity, isbn, book_description, image)
VALUES (78, 'Разработка операционной системы и компилятора.', 2017, 560, '978-5-97060-613-1', 'Благодаря своей структуре, язык Оберон удобен для отображения глобальной модульной структуры любой программной системы.', '/images_and_styles/images/78.jpg');

INSERT INTO Authors (author_name)
VALUES ('Гуткнехт Юрг');
SET @first_author_id = LAST_INSERT_ID();

INSERT INTO Authors (author_name)
VALUES ('Вирт Никлаус');
SET @second_author_id = LAST_INSERT_ID();

INSERT INTO Book_Author (book_id, author_id)
VALUES (78, @first_author_id);

INSERT INTO Book_Author (book_id, author_id)
VALUES (78, @second_author_id);

-- *********** --
INSERT INTO Books (book_id, book_title, book_year, pages_quantity, isbn, book_description, image)
VALUES (79, 'Linux и Go.', 2023, 304, '978-5-9775-1741-6', 'Первая русскоязычная книга об интеграции языка Go в архитектуру ядра Linux.', '/images_and_styles/images/79.jpg');
INSERT INTO Authors (author_name)
VALUES ('Цилюрик Олег');
SET @last_author_id = LAST_INSERT_ID();
INSERT INTO Book_Author (book_id, author_id)
VALUES (79, @last_author_id);
