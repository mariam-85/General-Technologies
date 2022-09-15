CREATE DATABASE University;

SHOW DATABASES;

USE University;

CREATE TABLE Students (
id integer primary key AUTO_INCREMENT,
name varchar(128) NOT NULL,
age integer
);

insert into Students (id, name, age) values (1, 'Анатолий', 29),
                                            (2, 'Олег', 25),
                                            (3, 'Семен', 27),
                                            (4, 'Олеся', 28),
                                            (5, 'Ольга', 31),
                                            (6, 'Иван', 22);
                                            
insert into Teachers (id, name, age) values (1, 'Петр', 39),
                                            (2, 'Максим', 35),
                                            (3, 'Антон', 37),
                                            (4, 'Всеволод', 38),
                                            (5, 'Егор', 41),
                                            (6, 'Светлана', 32);
                                            
insert into Competencies (id, name) values (1, 'Математика'),
                                            (2, 'Информатика'),
                                            (3, 'Программирование'),
                                            (4, 'Графика');                                            


insert into Teachers2Competencies (id, teacher_id, competencies_id) values (1, 1, 1),
                                            (2, 2, 1),
                                            (3, 2, 3),
                                            (4, 3, 2),
                                            (5, 4, 1),
                                            (6, 5, 3);                                            

select * from Teachers2Competencies;

insert into Courses (id, teacher_id, title, headman_id) values (1, 1, 'Алгебра логики', 2),
                                            (2, 2, 'Математическая статистика', 3),
                                            (3, 4, 'Высшая математика', 5),
                                            (4, 5, 'Javascript', 1),
                                            (5, 5, 'Базовый Python', 1);     

insert into students2courses (id, student_id, course_id) values (1, 1, 1),
                                            (2, 2, 1),
                                            (3, 3, 2),
                                            (4, 3, 3),
                                            (5, 4, 5);

select * from Teachers;

select * from Competencies;

CREATE TABLE Teachers (
id integer primary key AUTO_INCREMENT,
name varchar(128) NOT NULL,
age integer
);

CREATE TABLE Competencies (
id integer primary key AUTO_INCREMENT,
name varchar(128) NOT NULL
);

CREATE TABLE Teachers2Competencies (
id integer primary key AUTO_INCREMENT,
teacher_id integer,
competencies_id integer
);

SELECT *
FROM Teachers2Competencies;

CREATE TABLE Courses (
id integer primary key AUTO_INCREMENT,
teacher_id integer,
title varchar(128) NOT NULL,
headman_id integer
);

CREATE TABLE Students2Courses (
id integer primary key AUTO_INCREMENT,
student_id integer,
course_id integer
);

select  
t1.name,
t3.title
from Students t1
inner join Students2Courses t2
on t1.id = t2.student_id
inner join Courses t3
on t2.course_id = t3.id;

select  
t1.name,
t3.name
from Teachers t1
left join Teachers2Competencies t2
on t1.id = t2.teacher_id
left join Competencies t3
on t2.competencies_id = t3.id;

select  
t1.name,
t3.name
from Teachers t1
left join Teachers2Competencies t2
on t1.id = t2.teacher_id
left join Competencies t3
on t2.competencies_id = t3.id
WHERE t3.name is null;

select  
t1.name,
t3.title
from Students t1
left join Students2Courses t2
on t1.id = t2.student_id
left join Courses t3
on t2.course_id = t3.id
WHERE t3.title is null;

select  
*
from Students t1
left join Students2Courses t2
on t1.id = t2.student_id
WHERE t2.student_id is null;

select  
t1.title
from Courses t1
left join Students2Courses t2
on t1.id = t2.course_id
WHERE t2.course_id is null;

select  
t1.name,
t2.title
from Students t1
left join Courses t2
on t1.id = t2.headman_id;

select  
t1.name,
t2.title
from Students t1
inner join Courses t2
on t1.id = t2.headman_id;

select  
t1.title,
t2.name
from Courses t1
inner join Students t2
on t1.headman_id = t2.id;

select  
t1.name
from Competencies t1 
left join Teachers2Competencies t2
on t1.id = t2.Competencies_id
where t2.competencies_id is null;

SELECT * FROM Students;

SELECT * FROM Students2Courses;


select 
t1.name as student_name,
t3.title as course_title,
t4.name as headman_name
from Students t1 
inner join Students2Courses t2
on t1.id = t2.student_id
inner join Courses t3
on t2.course_id = t3.id
inner join Students t4
on t3.headman_id = t4.id;















