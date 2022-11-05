CREATE DATABASE classwork;

SHOW DATABASES;

use classwork;

create table students (
             firstname varchar(30) NOT NULL,
			 lastname varchar(30) NOT NULL,
             avg_mark NUMERIC(2, 1) check(avg_mark BETWEEN 0 and 5),
             gender char(1) check (gender in ('M', 'F'))

);

insert into students (firstname, lastname, avg_mark, gender) values ('Oleg', 'Petrov', 4.3, 'M'),
                                                 ('Semen', 'Stepanov', 3.1, 'M'),
                                                 ('Olga', 'Semenova', 4.7, 'F'),
												 ('Igor', 'Romanov', 3.1, 'M'),
                                                 ('Irina', 'Ivanova', 2.2, 'F');

select * from students;

ALTER TABLE students
ADD id integer primary key auto_increment;

ALTER TABLE students
CHANGE firstname name varchar(30);

select name, lastname
from students
where avg_mark > 4;

select name, lastname
from students
where avg_mark NOT BETWEEN 3 AND 4;

select name, lastname
from students
where name like 'I%';

select name, lastname
from students
where avg_mark = 2.2 OR avg_mark = 3.1 OR avg_mark = 4.7;

/*select name, lastname
from students
where avg_mark in (2.2, 3.1, 4.7;*/

select distinct
avg_mark
from students;

UPDATE students
SET lastname = 'Sidorov'
WHERE name = 'Oleg' AND
lastname = 'Petrov';





