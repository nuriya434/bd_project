CREATE TABLE Customers (
    customer_id SERIAL PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(100) UNIQUE
);

CREATE TABLE Movies (
    movie_id SERIAL PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    release_year INTEGER CHECK (release_year >= 2000 AND release_year <= 2010),
    genre VARCHAR(100),
    director VARCHAR(100),
    description TEXT,
    actors_cast TEXT
);

CREATE TABLE Halls (
    hall_id SERIAL PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    capacity INTEGER DEFAULT 25
);

CREATE TABLE Rows (
    row_id SERIAL PRIMARY KEY,
    hall_id INTEGER REFERENCES Halls(hall_id),
    row_number INTEGER,
    seats_count INTEGER
);

CREATE TABLE Sessions (
    session_id SERIAL PRIMARY KEY,
    movie_id INTEGER REFERENCES Movies(movie_id),
    hall_id INTEGER REFERENCES Halls(hall_id),
    start_time TIMESTAMP,
    end_time TIMESTAMP
);

CREATE TABLE Tickets (
    ticket_id SERIAL PRIMARY KEY,
    session_id INTEGER REFERENCES Sessions(session_id),
    row_id INTEGER REFERENCES Rows(row_id),
    seat_number INTEGER,
    price DECIMAL(10, 2),
    currency VARCHAR(3) DEFAULT 'KZT',
    ticket_type VARCHAR(20) DEFAULT 'Взрослый'
);

CREATE TABLE Purchases (
    purchase_id SERIAL PRIMARY KEY,
    customer_id INTEGER REFERENCES Customers(customer_id),
    ticket_id INTEGER REFERENCES Tickets(ticket_id),
    purchase_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO Movies (title, release_year, genre, director, description, actors_cast) VALUES
('Аватар', 2009, 'Фантастика', 'Джеймс Кэмерон', 'ывший морпех Джейк Салли прикован к инвалидному креслу. Несмотря на немощное тело, Джейк в душе по-прежнему остается воином. Он получает задание совершить путешествие в несколько световых лет к базе землян на планете Пандора, где корпорации добывают редкий минерал, имеющий огромное значение для выхода Земли из энергетического кризиса.', 'Сэм Уортингтон, Зои Салдана'),
('Исходный код', 2008, 'Триллер', 'Дункан Джонс', 'Студент-программист оказывается в теле другого человека и узнает, что должен предотвратить теракт.', 'Джейк Джилленхол, Мишель Монахэн'),
('Гладиатор', 2000, 'Боевик', 'Ридли Скотт', 'Генерал-гладиатор борется за свою свободу в Древнем Риме.', 'Рассел Кроу, Хоакин Феникс'),
('Начало', 2010, 'Фантастика', 'Кристофер Нолан', 'Команда специалистов ворует секреты из сновидений.', 'Леонардо ДиКаприо, Джозеф Гордон-Левитт'),
('Железный человек', 2008, 'Боевик', 'Джон Фавро', 'Миллиардер Тони Старк создает бронекостюм и становится супергероем.', 'Роберт Дауни мл., Гвинет Пэлтроу'),
('Темный рыцарь', 2008, 'Боевик', 'Кристофер Нолан', 'Бэтмен сражается с преступником Джокером в Готэме.', 'Кристиан Бэйл, Хит Леджер'),
('Трансформеры', 2007, 'Фантастика', 'Майкл Бэй', 'Роботы-трансформеры сражаются за будущее Земли.', 'Шайа ЛаБаф, Меган Фокс'),
('Звездные войны: Эпизод III - Месть Ситхов', 2005, 'Фантастика', 'Джордж Лукас', 'Падме умирает, Анакин становится Дартом Вейдером.', 'Хайден Кристенсен, Натали Портман'),
('Мстители', 2010, 'Боевик', 'Джосс Уидон', 'Супергерои объединяются, чтобы сражаться с угрозой для Земли.', 'Роберт Дауни мл., Крис Эванс'),
('Храброе сердце', 2009, 'Эпический', 'Мел Гибсон', 'Шотландский воин Уильям Уоллес сражается за свободу.', 'Мел Гибсон, Софи Марсо'),
('Тайна Броулинга', 2007, 'Детектив', 'Дэвид Финчер', 'Журналист расследует исчезновение миллиардера.', 'Брэд Питт, Кейт Бланшетт');

INSERT INTO Halls (name, capacity) VALUES
('Зал 1', 50),
('Зал 2', 40),
('Зал 3', 30),
('Зал 4', 60),
('Зал 5', 25),
('Зал 6', 35),
('Зал 7', 45),
('Зал 8', 55),
('Зал 9', 20),
('Зал 10', 50),
('VIP Зал', 15);

INSERT INTO Rows (hall_id, row_number, seats_count) VALUES
(1, 1, 10),
(1, 2, 15),
(2, 1, 8),
(3, 1, 12),
(4, 1, 18),
(5, 1, 5),
(6, 1, 7),
(7, 1, 11),
(8, 1, 16),
(9, 1, 4),
(10, 1, 10),
(11, 1, 15);

INSERT INTO Sessions (movie_id, hall_id, start_time, end_time) VALUES
(1, 1, '2024-01-26 18:00:00', '2024-01-26 20:00:00'),
(2, 2, '2024-01-27 15:30:00', '2024-01-27 17:30:00'),
(3, 3, '2024-01-28 20:15:00', '2024-01-28 22:15:00'),
(4, 4, '2024-01-29 14:00:00', '2024-01-29 16:00:00'),
(5, 5, '2024-01-30 19:30:00', '2024-01-30 21:30:00'),
(6, 6, '2024-01-31 16:45:00', '2024-01-31 18:45:00'),
(7, 7, '2024-02-01 21:00:00', '2024-02-01 23:00:00'),
(8, 8, '2024-02-02 13:30:00', '2024-02-02 15:30:00'),
(9, 9, '2024-02-03 18:30:00', '2024-02-03 20:30:00'),
(10, 10, '2024-02-04 14:45:00', '2024-02-04 16:45:00');

INSERT INTO Tickets (session_id, row_id, seat_number, price, ticket_type) VALUES
(1, 1, 5, 10.50, 'детский'),
(2, 2, 3, 15.00, 'взрослый') ,
(3, 3, 6, 12.75, 'детский'),
(4, 4, 10, 18.50, 'детский'),
(5, 5, 2, 20.00, 'студенческий'),
(6, 6, 7, 14.75, 'студенческий'),
(7, 7, 9, 22.00, 'детский'),
(8, 8, 12, 16.50, 'детский'),
(9, 9, 4, 19.25, 'взрослый'),
(10, 10, 8, 13.50, 'взрослый'),
(1, 1, 6, 11.25, 'взрослый'),
(2, 2, 5, 16.00, 'студенческий'),
(3, 3, 8, 14.00, 'студенческий'),
(4, 4, 15, 25.00, 'студенческий'),
(5, 5, 1, 22.50, 'взрослый');

INSERT INTO Customers (first_name, last_name, email) VALUES
('Иван', 'Иванов', 'ivan@gmail.com'),
('Мария', 'Петрова', 'maria@gmail.com'),
('Алексей', 'Сидоров', 'alex@gmail.com'),
('Елена', 'Смирнова', 'elena@gmail.com'),
('Дмитрий', 'Ковалев', 'dmitry@gmail.com'),
('Анна', 'Кузнецова', 'anna@gmail.com'),
('Сергей', 'Морозов', 'sergey@gmail.com'),
('Ольга', 'Попова', 'olga@gmail.com'),
('Никита', 'Ильин', 'nikita@gmail.com'),
('Екатерина', 'Федорова', 'ekaterina@gmail.com');

INSERT INTO Purchases (customer_id, ticket_id, purchase_date) VALUES
    (1, 1, '2024-01-26 19:30:00'),
    (2, 2, '2024-01-27 16:45:00'),
    (3, 3, '2024-01-28 21:00:00'),
    (4, 4, '2024-01-29 15:30:00'),
    (5, 5, '2024-01-30 20:15:00'),
    (6, 6, '2024-01-31 17:00:00'),
    (7, 7, '2024-02-01 22:30:00'),
    (8, 8, '2024-02-02 14:45:00'),
    (9, 9, '2024-02-03 19:45:00'),
    (10, 10, '2024-02-04 15:00:00'),
    (1, 11, '2024-01-26 20:00:00'),
    (2, 12, '2024-01-27 17:30:00'),
    (3, 13, '2024-01-28 22:15:00'),
    (4, 14, '2024-01-29 16:45:00'),
    (5, 15, '2024-01-30 21:30:00');

SELECT C.first_name AS customer_name, M.title AS movie_title, H.name AS hall_name,
R.row_number AS row_number, T.seat_number AS seat_number, S.start_time AS session_start_time,
P.purchase_date AS purchase_date, T.ticket_type, T.price AS ticket_price, T.currency
FROM Purchases P
JOIN Customers C ON P.customer_id = C.customer_id
JOIN Tickets T ON P.ticket_id = T.ticket_id
JOIN Sessions S ON T.session_id = S.session_id
JOIN Movies M ON S.movie_id = M.movie_id
JOIN Halls H ON S.hall_id = H.hall_id
JOIN Rows R ON T.row_id = R.row_id;
