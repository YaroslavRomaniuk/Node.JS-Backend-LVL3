USE mvc_library;
INSERT INTO Books (book_id, book_title, book_year, pages_quantity, isbn, book_description, image, is_deleted)
VALUES (22, 'СИ++ И КОМПЬЮТЕРНАЯ ГРАФИКА', 2003, 352, '978-3-16-148410-0', 'Лекции и практикум по программированию на Си++', './books-page_files/images/22.jpg', 0);
INSERT INTO Authors (author_name)
VALUES ('Андрей Богуславский');
SET @last_author_id = LAST_INSERT_ID();
INSERT INTO Book_Author (book_id, author_id)
VALUES (22, @last_author_id);

INSERT INTO Books (book_id, book_title, book_year, pages_quantity, isbn, book_description, image, is_deleted)
VALUES (23, 'Программирование на языке Go', 2013, 580, '978-3-16-148411-0', 'Полное руководство по программированию на языке Go', './books-page_files/images/23.jpg', 0);
INSERT INTO Authors (author_name)
VALUES ('Марк Саммерфільд');
SET @last_author_id = LAST_INSERT_ID();
INSERT INTO Book_Author (book_id, author_id)
VALUES (23, @last_author_id);

INSERT INTO Books (book_id, book_title, book_year, pages_quantity, isbn, book_description, image, is_deleted)
VALUES (25, 'Толковый словарь сетевых терминов и аббревиатур', 2002, 366, '978-3-16-148412-0', 'Справочник терминов и аббревиатур в области сетевых технологий', './books-page_files/images/25.jpg', 0);
INSERT INTO Authors (author_name)
VALUES ('Cisco Systems');
SET @last_author_id = LAST_INSERT_ID();
INSERT INTO Book_Author (book_id, author_id)
VALUES (25, @last_author_id);

INSERT INTO Books (book_id, book_title, book_year, pages_quantity, isbn, book_description, image, is_deleted)
VALUES (26, 'Python for Data Analysis', 2012, 547, '978-3-16-148413-0', 'Руководство по анализу данных с использованием Python', './books-page_files/images/26.jpg', 0);
INSERT INTO Authors (author_name)
VALUES (' Вес Маккінні');
SET @last_author_id = LAST_INSERT_ID();
INSERT INTO Book_Author (book_id, author_id)
VALUES (26, @last_author_id);

INSERT INTO Books (book_id, book_title, book_year, pages_quantity, isbn, book_description, image, is_deleted)
VALUES (27, 'Философия Java', 1998, 1168, '978-3-16-148414-0', 'Глубокое погружение в принципы и философию языка Java', './books-page_files/images/27.jpg', 0);
INSERT INTO Authors (author_name)
VALUES ('Брюс Еккель');
SET @last_author_id = LAST_INSERT_ID();
INSERT INTO Book_Author (book_id, author_id)
VALUES (27, @last_author_id);

INSERT INTO Books (book_id, book_title, book_year, pages_quantity, isbn, book_description, image, is_deleted)
VALUES (29, 'Introduction to Algorithms', 1989, 1312, '978-3-16-148415-0', 'Стандартное введение в алгоритмы и структуры данных', './books-page_files/images/29.jpg', 0);
INSERT INTO Authors (author_name)
VALUES ('Томас Кормен');
SET @last_author_id = LAST_INSERT_ID();
INSERT INTO Book_Author (book_id, author_id)
VALUES (29, @last_author_id);

INSERT INTO Books (book_id, book_title, book_year, pages_quantity, isbn, book_description, image, is_deleted)
VALUES (31, 'JavaScript Pocket Reference', 2012, 1025, '978-3-16-148416-0', 'Краткий справочник по языку программирования JavaScript', './books-page_files/images/31.jpg', 0);
INSERT INTO Authors (author_name)
VALUES ('Дэвид Флэнаган');
SET @last_author_id = LAST_INSERT_ID();
INSERT INTO Book_Author (book_id, author_id)
VALUES (31, @last_author_id);

INSERT INTO Books (book_id, book_title, book_year, pages_quantity, isbn, book_description, image, is_deleted)
VALUES (32, 'Adaptive Code via C#:', 2014, 432, '978-3-16-148417-0', 'Принципы написания адаптивного кода на C#', './books-page_files/images/32.jpg', 0);
INSERT INTO Authors (author_name)
VALUES ('Гэри Маклин Холл');
SET @last_author_id = LAST_INSERT_ID();
INSERT INTO Book_Author (book_id, author_id)
VALUES (32, @last_author_id);

INSERT INTO Books (book_id, book_title, book_year, pages_quantity, isbn, book_description, image, is_deleted)
VALUES (33, 'SQL: The Complete Reference', 2009, 912, '978-3-16-148418-0', 'Полное руководство по языку SQL', './books-page_files/images/33.jpg', 0);
INSERT INTO Authors (author_name)
VALUES ('Джеймс Р. Грофф');
SET @last_author_id = LAST_INSERT_ID();
INSERT INTO Book_Author (book_id, author_id)
VALUES (33, @last_author_id);

INSERT INTO Books (book_id, book_title, book_year, pages_quantity, isbn, book_description, image, is_deleted)
VALUES (34, 'PHP and MySQL Web Development', 2001, 896, '978-3-16-148419-0', 'Руководство по веб-разработке с использованием PHP и MySQL', './books-page_files/images/34.jpg', 0);
INSERT INTO Authors (author_name)
VALUES ('Люк Веллинг');
SET @last_author_id = LAST_INSERT_ID();
INSERT INTO Book_Author (book_id, author_id)
VALUES (34, @last_author_id);

INSERT INTO Books (book_id, book_title, book_year, pages_quantity, isbn, book_description, image, is_deleted)
VALUES (35, 'Статистический анализ и визуализация данных с помощью R', 2015, 496, '978-3-16-148420-0', 'Методы статистического анализа и визуализации данных с помощью языка R', './books-page_files/images/35.jpg', 0);
INSERT INTO Authors (author_name)
VALUES ('Мастицкий Сергей');
SET @last_author_id = LAST_INSERT_ID();
INSERT INTO Book_Author (book_id, author_id)
VALUES (35, @last_author_id);

INSERT INTO Books (book_id, book_title, book_year, pages_quantity, isbn, book_description, image, is_deleted)
VALUES (36, 'computer coding for kid', 2016, 425, '978-3-16-148421-0', 'Введение в программирование для детей', './books-page_files/images/36.jpg', 0);
INSERT INTO Authors (author_name)
VALUES ('Джон Вудкок');
SET @last_author_id = LAST_INSERT_ID();
INSERT INTO Book_Author (book_id, author_id)
VALUES (36, @last_author_id);

INSERT INTO Books (book_id, book_title, book_year, pages_quantity, isbn, book_description, image, is_deleted)
VALUES (37, 'Exploring Arduino: Tools and Techniques for Engineering Wizardry', 2019, 512, '978-3-16-148422-0', 'Руководство по работе с Arduino и инженерными техниками', './books-page_files/images/37.jpg', 0);
INSERT INTO Authors (author_name)
VALUES ('Джереми Блум');
SET @last_author_id = LAST_INSERT_ID();
INSERT INTO Book_Author (book_id, author_id)
VALUES (37, @last_author_id);

INSERT INTO Books (book_id, book_title, book_year, pages_quantity, isbn, book_description, image, is_deleted)
VALUES (38, 'Программирование микроконтроллеров для начинающих и не только', 2016, 352, '978-3-16-148423-0', 'Основы программирования микроконтроллеров для начинающих', './books-page_files/images/38.jpg', 0);
INSERT INTO Authors (author_name)
VALUES ('А. Белов');
SET @last_author_id = LAST_INSERT_ID();
INSERT INTO Book_Author (book_id, author_id)
VALUES (38, @last_author_id);

INSERT INTO Books (book_id, book_title, book_year, pages_quantity, isbn, book_description, image, is_deleted)
VALUES (39, 'The Internet of Things', 2015, 230, '978-3-16-148424-0', 'Обзор и анализ концепции Интернета вещей', './books-page_files/images/39.jpg', 0);
INSERT INTO Authors (author_name)
VALUES ('Сэмюэл Грингард');
SET @last_author_id = LAST_INSERT_ID();
INSERT INTO Book_Author (book_id, author_id)
VALUES (39, @last_author_id);

INSERT INTO Books (book_id, book_title, book_year, pages_quantity, isbn, book_description, image, is_deleted)
VALUES (40, 'Sketching User Experiences: Getting the Design Right and the Right Design', 2007, 448, '978-3-16-148425-0', 'Практики и методы скетчинга в дизайне пользовательского опыта', './books-page_files/images/40.jpg', 0);
INSERT INTO Authors (author_name)
VALUES ('Сет Гринберг');
SET @last_author_id = LAST_INSERT_ID();
INSERT INTO Book_Author (book_id, author_id)
VALUES (40, @last_author_id);

INSERT INTO Books (book_id, book_title, book_year, pages_quantity, isbn, book_description, image, is_deleted)
VALUES (41, 'InDesign', 2013, 208, '978-3-16-148426-0', 'Основы работы с программой InDesign для создания впечатляющих дизайнерских проектов', './books-page_files/images/41.jpg', 0);
INSERT INTO Authors (author_name)
VALUES ('Сераков Александр');
SET @last_author_id = LAST_INSERT_ID();
INSERT INTO Book_Author (book_id, author_id)
VALUES (41, @last_author_id);

INSERT INTO Books (book_id, book_title, book_year, pages_quantity, isbn, book_description, image, is_deleted)
VALUES (42, 'Адаптивный дизайн', 2013, 288, '978-3-16-148427-0', 'Понимание и применение адаптивного дизайна для создания отзывчивых веб-сайтов', './books-page_files/images/42.jpg', 0);
INSERT INTO Authors (author_name)
VALUES ('Тим Кедлек');
SET @last_author_id = LAST_INSERT_ID();
INSERT INTO Book_Author (book_id, author_id)
VALUES (42, @last_author_id);

INSERT INTO Books (book_id, book_title, book_year, pages_quantity, isbn, book_description, image, is_deleted)
VALUES (43, 'Android для разработчиков', 2016, 512, '978-3-16-148428-0', 'Полное руководство по разработке приложений для Android с примерами и упражнениями', './books-page_files/images/45.jpg', 0);
INSERT INTO Authors (author_name)
VALUES ('Пол Дейтел');
SET @last_author_id = LAST_INSERT_ID();
INSERT INTO Book_Author (book_id, author_id)
VALUES (43, @last_author_id);

INSERT INTO Books (book_id, book_title, book_year, pages_quantity, isbn, book_description, image, is_deleted)
VALUES (44, 'Чистый код: создание, анализ и рефакторинг', 2022, 464, '978-3-16-148429-0', 'Советы и трюки для создания чистого, эффективного кода и рефакторинга существующего', './books-page_files/images/44.jpg', 0);
INSERT INTO Authors (author_name)
VALUES ('Мартин Роберт');
SET @last_author_id = LAST_INSERT_ID();
INSERT INTO Book_Author (book_id, author_id)
VALUES (44, @last_author_id);

INSERT INTO Books (book_id, book_title, book_year, pages_quantity, isbn, book_description, image, is_deleted)
VALUES (45, 'Swift. Карманный справочник', 2014, 183, '978-3-16-148430-0', 'Карманный справочник по языку программирования Swift, идеальный для быстрого справления', './books-page_files/images/45.jpg', 0);
INSERT INTO Authors (author_name)
VALUES ('Энтони Грей');
SET @last_author_id = LAST_INSERT_ID();
INSERT INTO Book_Author (book_id, author_id)
VALUES (45, @last_author_id);

INSERT INTO Books (book_id, book_title, book_year, pages_quantity, isbn, book_description, image, is_deleted)
VALUES (46, 'NoSQL Distilled: A Brief Guide to the Emerging World of Polyglot Persistence', 2012, 192, '978-3-16-148431-0', 'Введение в мир NoSQL и полиглотского постоянства', './books-page_files/images/46.jpg', 0);
INSERT INTO Authors (author_name)
VALUES ('Мартин Фаулер');
SET @last_author_id = LAST_INSERT_ID();
INSERT INTO Book_Author (book_id, author_id)
VALUES (46, @last_author_id);

INSERT INTO Books (book_id, book_title, book_year, pages_quantity, isbn, book_description, image, is_deleted)
VALUES (47, 'Head First Ruby', 2015, 569, '978-3-16-148432-0', 'Интерактивное введение в язык программирования Ruby с акцентом на активное обучение', './books-page_files/images/47.jpg', 0);
INSERT INTO Authors (author_name)
VALUES ('Джей Макгаврен');
SET @last_author_id = LAST_INSERT_ID();
INSERT INTO Book_Author (book_id, author_id)
VALUES (47, @last_author_id);

INSERT INTO Books (book_id, book_title, book_year, pages_quantity, isbn, book_description, image, is_deleted)
VALUES (48, 'Practical Vim', 2015, 356, '978-3-16-148433-0', 'Практическое руководство по использованию Vim для улучшения эффективности кодирования', './books-page_files/images/48.jpg', 0);
INSERT INTO Authors (author_name)
VALUES ('Дрю Нейл');
SET @last_author_id = LAST_INSERT_ID();
INSERT INTO Book_Author (book_id, author_id)
VALUES (48, @last_author_id);

INSERT INTO Books (book_id, book_title, book_year, pages_quantity, isbn, book_description, image, is_deleted)
VALUES (49, 'Arduino. Полный учебный курс', 2003, 333, '978-3-16-148434-0', 'Полный учебный курс по работе с Arduino, включающий проекты для самостоятельного выполнения', './books-page_files/images/49.jpg', 0);
INSERT INTO Authors (author_name)
VALUES ('Салахова Алена');
SET @last_author_id = LAST_INSERT_ID();
INSERT INTO Book_Author (book_id, author_id)
VALUES (49, @last_author_id);

INSERT INTO Books (book_id, book_title, book_year, pages_quantity, isbn, book_description, image, is_deleted)
VALUES (50, 'Сверхбыстрый Python', 2023, 370, '978-3-16-148435-0', 'Техники и стратегии для ускорения вашего кода на Python', './books-page_files/images/50.jpg', 0);
INSERT INTO Authors (author_name)
VALUES ('Тиаго Антао');
SET @last_author_id = LAST_INSERT_ID();
INSERT INTO Book_Author (book_id, author_id)
VALUES (50, @last_author_id);

INSERT INTO Books (book_id, book_title, book_year, pages_quantity, isbn, book_description, image, is_deleted)
VALUES (51, 'Визуализация данных', 2023, 464, '978-3-16-148436-0', 'Теория и практика визуализации данных, включая принципы дизайна и программирования', './books-page_files/images/51.jpg', 0);
INSERT INTO Authors (author_name)
VALUES ('Тамара Манцнер');
SET @last_author_id = LAST_INSERT_ID();
INSERT INTO Book_Author (book_id, author_id)
VALUES (51, @last_author_id);

INSERT INTO Books (book_id, book_title, book_year, pages_quantity, isbn, book_description, image, is_deleted)
VALUES (52, 'Идеальный программист', 2022, 224, '978-3-16-148437-0', 'Советы и стратегии для становления идеальным программистом', './books-page_files/images/52.jpg', 0);
INSERT INTO Authors (author_name)
VALUES ('Роберт Мартин');
SET @last_author_id = LAST_INSERT_ID();
INSERT INTO Book_Author (book_id, author_id)
VALUES (52, @last_author_id);

INSERT INTO Books (book_id, book_title, book_year, pages_quantity, isbn, book_description, image, is_deleted)
VALUES (53, 'Программируемые контроллеры', 2016, 254, '978-3-16-148438-0', 'Основы программирования программируемых контроллеров', './books-page_files/images/53.jpg', 0);
INSERT INTO Authors (author_name)
VALUES ('И. В. Петров');
SET @last_author_id = LAST_INSERT_ID();
INSERT INTO Book_Author (book_id, author_id)
VALUES (53, @last_author_id);

INSERT INTO Books (book_id, book_title, book_year, pages_quantity, isbn, book_description, image, is_deleted)
VALUES (54, 'Ум программиста. Как понять и осмыслить любой код.', 2023, 272, '978-3-16-148438-0', 'Стратегии и техники для понимания и осмысления любого кода', './books-page_files/images/54.jpg', 0);
INSERT INTO Authors (author_name)
VALUES ('Херманс Ф.');
SET @last_author_id = LAST_INSERT_ID();
INSERT INTO Book_Author (book_id, author_id)
VALUES (54, @last_author_id);

