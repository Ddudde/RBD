
CREATE TABLE Абонемент
(
	Код_абонемента       INTEGER AUTO_INCREMENT,
	Читателя             INTEGER NULL,
	Библиотекаря         INTEGER NULL,
	Выговоры             INTEGER NULL,
	ID                   INTEGER NULL
 AUTO_INCREMENT = AUTO_INCREMENT
);



ALTER TABLE Абонемент
ADD PRIMARY KEY (Код_абонемента);



CREATE TABLE Автор_по_книгам
(
	Код_автора           INTEGER AUTO_INCREMENT,
	Фамилия              TEXT NULL,
	Имя                  TEXT NULL,
	Отчество             TEXT NULL,
	Дата_рождения        DATE NULL,
	Инициалы             TEXT NULL
 AUTO_INCREMENT = AUTO_INCREMENT
);



ALTER TABLE Автор_по_книгам
ADD PRIMARY KEY (Код_автора);



CREATE TABLE Автор_пользователь
(
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
	Код_заказа           INTEGER AUTO_INCREMENT,
	Дата_заказа          DATE NULL,
	Код_абонемента       INTEGER NULL,
	Код_книги            INTEGER NULL,
	ID                   INTEGER NULL
 AUTO_INCREMENT = AUTO_INCREMENT
);



ALTER TABLE Заказ
ADD PRIMARY KEY (Код_заказа);



CREATE TABLE Заказанная_книга
(
	Отметка_о_возврате   TEXT NULL,
	Дата_возврата        DATE NULL,
	Фактическая_дата_возврата DATE NULL,
	Код_пользователя     INTEGER NULL,
	Код_книги            INTEGER NOT NULL
);



ALTER TABLE Заказанная_книга
ADD PRIMARY KEY (Код_книги);



CREATE TABLE Книга
(
	Код_книги            INTEGER AUTO_INCREMENT,
	Название             TEXT NULL,
	Издательство         TEXT NULL,
	Год_издания          INTEGER NULL,
	Код_тематики         INTEGER NULL,
	Администратор        INTEGER NULL,
	Автор                INTEGER NULL,
	Код_автора           INTEGER NULL,
	ID                   INTEGER NULL
 AUTO_INCREMENT = AUTO_INCREMENT
);



ALTER TABLE Книга
ADD PRIMARY KEY (Код_книги);



CREATE TABLE Паспортные_данные
(
	Код_паспорта         INTEGER AUTO_INCREMENT,
	Фамилия              TEXT NULL,
	Имя                  TEXT NULL,
	Отчество             TEXT NULL,
	Серия                INTEGER NULL,
	Номер                INTEGER NULL,
	Дата_рождения        DATE NULL
 AUTO_INCREMENT = AUTO_INCREMENT
);



ALTER TABLE Паспортные_данные
ADD PRIMARY KEY (Код_паспорта);



CREATE TABLE Пользователь
(
	Код_пользователя     INTEGER AUTO_INCREMENT,
	Код_паспорта         INTEGER NOT NULL,
	Имя_пользователя     TEXT NULL,
	Пароль               TEXT NULL,
	Телефон              TEXT NULL
 AUTO_INCREMENT = AUTO_INCREMENT
);



ALTER TABLE Пользователь
ADD PRIMARY KEY (Код_пользователя);



CREATE TABLE Тематика
(
	Код_тематики         INTEGER AUTO_INCREMENT,
	Название             TEXT NULL,
	Примечание           TEXT NULL
 AUTO_INCREMENT = AUTO_INCREMENT
);



ALTER TABLE Тематика
ADD PRIMARY KEY (Код_тематики);



CREATE TABLE Читатель
(
	Код_пользователя     INTEGER NOT NULL,
	Дата_регистрации     DATE NULL
);



ALTER TABLE Читатель
ADD PRIMARY KEY (Код_пользователя);



ALTER TABLE Абонемент
ADD FOREIGN KEY R_18 (Читателя) REFERENCES Читатель (Код_пользователя);



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



ALTER TABLE Заказ
ADD FOREIGN KEY R_53 (Код_книги) REFERENCES Заказанная_книга (Код_книги);



ALTER TABLE Заказанная_книга
ADD FOREIGN KEY R_32 (Код_пользователя) REFERENCES Библиотекарь (Код_пользователя);



ALTER TABLE Заказанная_книга
ADD FOREIGN KEY R_54 (Код_книги) REFERENCES Книга (Код_книги);



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



ALTER TABLE Читатель
ADD FOREIGN KEY (Код_пользователя) REFERENCES Пользователь(Код_пользователя)
		ON DELETE CASCADE;


