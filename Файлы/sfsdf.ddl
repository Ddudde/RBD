
CREATE TABLE Абонемент
(
	Код_абонемента       INTEGER NOT NULL,
	Код_заказа           INTEGER NOT NULL,
	Читателя             INTEGER NULL,
	Библиотекаря         INTEGER NULL,
	Выговоры             INTEGER NULL
);



ALTER TABLE Абонемент
ADD PRIMARY KEY (Код_абонемента);



CREATE TABLE Автор_по_книгам
(
	Код_автора           INTEGER NOT NULL,
	Фамилия              TEXT NULL,
	Имя                  TEXT NULL,
	Отчество             TEXT NULL,
	Дата_рождения        DATE NULL,
	Инициалы             TEXT NULL
);



ALTER TABLE Автор_по_книгам
ADD PRIMARY KEY (Код_автора);



CREATE TABLE Автор_пользователь
(
	Инициалы             TEXT NULL,
	Код_пользователя     INTEGER NOT NULL,
	Код_автора           INTEGER NULL,
	Почтовый_адрес       TEXT NULL
);



ALTER TABLE Автор_пользователь
ADD PRIMARY KEY (Код_пользователя);



CREATE TABLE Администратор
(
	Код_пользователя     INTEGER NOT NULL,
	Дата_регистрации     DATE NULL,
	Почтовый_адрес       TEXT NULL
);



ALTER TABLE Администратор
ADD PRIMARY KEY (Код_пользователя);



CREATE TABLE Библиотекарь
(
	Код_пользователя     INTEGER NOT NULL,
	Дата_регистрации     DATE NULL,
	Почтовый_адрес       TEXT NULL
);



ALTER TABLE Библиотекарь
ADD PRIMARY KEY (Код_пользователя);



CREATE TABLE Заказ
(
	Код_заказа           INTEGER NOT NULL,
	Дата_заказа          DATE NULL,
	Код_абонемента       INTEGER NULL
);



ALTER TABLE Заказ
ADD PRIMARY KEY (Код_заказа);



CREATE TABLE Заказанная_книга
(
	Код_заказа           INTEGER NOT NULL,
	Отметка_о_возврате   TEXT NULL,
	Дата_возврата        DATE NULL,
	Фактическая_дата_возврата DATE NULL,
	Код_пользователя     INTEGER NULL,
	Код_книги            INTEGER NULL
);



ALTER TABLE Заказанная_книга
ADD PRIMARY KEY (Код_заказа);



CREATE TABLE Книга
(
	Код_книги            INTEGER NOT NULL,
	Название             TEXT NULL,
	Издательство         TEXT NULL,
	Год_издания          INTEGER NULL,
	Код_тематики         INTEGER NULL,
	Администратор        INTEGER NULL,
	Автор                INTEGER NULL,
	Код_автора           INTEGER NULL
);



ALTER TABLE Книга
ADD PRIMARY KEY (Код_книги);



CREATE TABLE Паспортные_данные
(
	Код_паспорта         INTEGER NOT NULL,
	Фамилия              TEXT NULL,
	Имя                  TEXT NULL,
	Отчество             TEXT NULL,
	Серия                INTEGER NULL,
	Номер                INTEGER NULL,
	Дата_рождения        DATE NULL
);



ALTER TABLE Паспортные_данные
ADD PRIMARY KEY (Код_паспорта);



CREATE TABLE Пользователь
(
	Код_пользователя     INTEGER NOT NULL,
	Код_паспорта         INTEGER NOT NULL,
	Имя_пользователя     TEXT NULL,
	Пароль               TEXT NULL,
	Телефон              TEXT NULL
);



ALTER TABLE Пользователь
ADD PRIMARY KEY (Код_пользователя);



CREATE TABLE Тематика
(
	Код_тематики         INTEGER NOT NULL,
	Название             TEXT NULL,
	Примечание           TEXT NULL
);



ALTER TABLE Тематика
ADD PRIMARY KEY (Код_тематики);



CREATE TABLE Читатели
(
	Код_пользователя     INTEGER NOT NULL,
	Дата_регистрации     DATE NULL
);



ALTER TABLE Читатели
ADD PRIMARY KEY (Код_пользователя);



ALTER TABLE Абонемент
ADD FOREIGN KEY R_20 (Код_заказа) REFERENCES Заказанная_книга (Код_заказа);



ALTER TABLE Абонемент
ADD FOREIGN KEY R_18 (Читателя) REFERENCES Читатели (Код_пользователя);



ALTER TABLE Абонемент
ADD FOREIGN KEY R_34 (Библиотекаря) REFERENCES Библиотекарь (Код_пользователя);



ALTER TABLE Автор_пользователь
ADD FOREIGN KEY (Код_пользователя) REFERENCES Пользователь(Код_пользователя)
		ON DELETE CASCADE;



ALTER TABLE Автор_пользователь
ADD FOREIGN KEY R_44 (Код_автора) REFERENCES Автор_по_книгам (Код_автора);



ALTER TABLE Администратор
ADD FOREIGN KEY (Код_пользователя) REFERENCES Пользователь(Код_пользователя)
		ON DELETE CASCADE;



ALTER TABLE Библиотекарь
ADD FOREIGN KEY (Код_пользователя) REFERENCES Пользователь(Код_пользователя)
		ON DELETE CASCADE;



ALTER TABLE Заказ
ADD FOREIGN KEY R_47 (Код_абонемента) REFERENCES Абонемент (Код_абонемента);



ALTER TABLE Заказанная_книга
ADD FOREIGN KEY R_4 (Код_заказа) REFERENCES Заказ (Код_заказа);



ALTER TABLE Заказанная_книга
ADD FOREIGN KEY R_32 (Код_пользователя) REFERENCES Библиотекарь (Код_пользователя);



ALTER TABLE Заказанная_книга
ADD FOREIGN KEY R_48 (Код_книги) REFERENCES Книга (Код_книги);



ALTER TABLE Книга
ADD FOREIGN KEY R_17 (Код_тематики) REFERENCES Тематика (Код_тематики);



ALTER TABLE Книга
ADD FOREIGN KEY R_19 (Автор) REFERENCES Автор_пользователь (Код_пользователя);



ALTER TABLE Книга
ADD FOREIGN KEY R_30 (Администратор) REFERENCES Администратор (Код_пользователя);



ALTER TABLE Книга
ADD FOREIGN KEY R_46 (Код_автора) REFERENCES Автор_по_книгам (Код_автора);



ALTER TABLE Пользователь
ADD FOREIGN KEY R_22 (Код_паспорта) REFERENCES Паспортные_данные (Код_паспорта);



ALTER TABLE Читатели
ADD FOREIGN KEY (Код_пользователя) REFERENCES Пользователь(Код_пользователя)
		ON DELETE CASCADE;


