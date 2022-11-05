CREATE DATABASE Homework;

SHOW DATABASES;

USE Homework;

CREATE TABLE animals (
id integer primary key,
title varchar(20),
country varchar(15)
);

select * from animals;

insert into animals (id, title, country) values (1, 'Monkey', 'India');
insert into animals (id, title, country) values (2, 'Deer', 'Germany');
insert into animals (id, title, country) values (3, 'bear', 'Russia');

ALTER TABLE animals
ADD age integer default 0;

UPDATE animals
SET age = null;

set sql_safe_updates = 0;

ALTER TABLE animals
MODIFY age numeric(3, 1);

ALTER TABLE animals
MODIFY age integer;

ALTER TABLE animals
CHANGE age animal_age integer;

/*ALTER TABLE animals
RENAME COLUMN age to animal_age;*/

ALTER TABLE animals
DROP COLUMN animal_age;
