CREATE DATABASE Shop;

SHOW DATABASES;

USE Shop;

CREATE TABLE Goods (
id integer primary key AUTO_INCREMENT,
title varchar(128),
quantity integer check(quantity between 0 and 10)
);

CREATE TABLE Goods_1 (
id integer primary key AUTO_INCREMENT,
title varchar(128),
price integer,
quantity integer check(quantity between 0 and 10)
);

DROP TABLE Goods_1;

select * from Goods;

select * from Goods_1;

insert into Goods (title, quantity) values ('Bike', 4),
										   ('Skies', 5),
										   ('Skates', 7),
										   ('Skate', 2);
                                               
insert into Goods_1 (title, price, quantity) values ('Bike', 12000, 4),
                                                    ('Skies', 10000, 5),
                                                    ('Skates', 6000, 7),
                                                    ('Skate', 2000, 2);
                                               
SELECT id, title, quantity FROM Goods
UNION 
SELECT id, title, quantity FROM Goods_1;

SELECT id, title, quantity FROM Goods
UNION ALL
SELECT id, title, quantity FROM Goods_1;

SELECT id, title, null as price, quantity FROM Goods
UNION ALL
SELECT id, title, quantity, price FROM Goods_1;


