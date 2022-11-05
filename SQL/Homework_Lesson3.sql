CREATE DATABASE Homework;
SHOW DATABASES;
USE Homework;
CREATE TABLE animals (
id integer UNIQUE,
title varchar(20),
country varchar(15)
);
select * from animals;
insert into animals (id, title, country) values (1, 'Monkey', 'India');
insert into animals (id, title, country) values (2, 'Deer', 'Germany');
insert into animals (id, title, country) values (3, 'bear', 'Russia');
ALTER TABLE animals
ADD age int(2);
UPDATE animals
SET age = null;
ALTER TABLE animals
MODIFY COLUMN age numeric(3, 1);
ALTER TABLE animals
MODIFY COLUMN age integer(2);
ALTER TABLE animals
CHANGE age animal_age integer(2);
ALTER TABLE animals
DROP COLUMN animal_age;
