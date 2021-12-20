use bib;
SELECT Дата_рождения FROM паспортные_данные;

use bib;
SELECT * FROM паспортные_данные WHERE Имя='Андрей';

use bib;
SELECT Код_абонемента, Дата_регистрации FROM Абонемент INNER JOIN Читатель
ON Читатель.Код_пользователя=Абонемент.Читателя
WHERE Абонемент.Выговоры=0 AND Читатель.Дата_регистрации IS NOT NULL;

use bib;
SELECT Библиотекаря, Код_абонемента, Дата_регистрации FROM Абонемент INNER JOIN Читатель
ON Читатель.Код_пользователя=Абонемент.Читателя
WHERE Абонемент.Библиотекаря=5 OR Абонемент.Библиотекаря=6;

use bib;
SELECT FIOTeacher FROM Teachers INNER JOIN Sessions
ON Teachers.idTeacher=Sessions.idTeacher
WHERE Sessions.NumSemestr=1 AND Sessions.NumGroup='901'
AND EXISTS (SELECT * FROM Sessions as s1
WHERE s1.idTeacher=Sessions.idTeacher AND s1.NumSemestr=1
AND s1.NumGroup='902');
