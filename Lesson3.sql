CREATE DATABASE lesson;
drop table goods;
SHOW DATABASES;
USE lesson;
CREATE TABLE goods (
id integer UNIQUE,
title varchar(30),
quantity integer CHECK (quantity > 0),
price integer,
in_stock char(1) check (in_stock in ('Y', 'N'))
);

select * from goods;
insert into goods (id, title, quantity, price, in_stock) values (1, 'Cycle', 3, 1000, 'Y');
insert into goods (id, title, quantity, price, in_stock) values (2, 'Boot', 3, 5000, 'Y');
insert into goods (id, title, quantity, price, in_stock) values (3, 'Skate', 3, 3000, 'Y');
insert into goods (id, title, quantity, price, in_stock) values (4, 'Scooter', 3, 3500, 'Y');
insert into goods (id, title, quantity, price, in_stock) values (5, 'Snowboard', 3, 4000, 'Y');

select
*
from goods
order by price desc
limit 3;

ALTER TABLE goods
ADD city varchar(20) default 'Berlin';

select * from goods;

ALTER TABLE goods
DROP COLUMN city;

SELECT * FROM goods;

UPDATE goods
SET city = 'Madrid'
WHERE title = 'Boot';

set sql_safe_updates = 0;

SELECT * FROM goods;

UPDATE goods
SET city = 'Paris'
WHERE title = 'Scooter';

SELECT * FROM goods;

UPDATE goods
SET city = null;

ALTER TABLE goods
MODIFY COLUMN city char(3);

UPDATE goods
SET city = 'Berl';

UPDATE goods
SET city = null;

ALTER TABLE goods
MODIFY COLUMN city char(3);

UPDATE goods
SET city = 'Ber';

ALTER TABLE goods
CHANGE city  country varchar(20);

ALTER TABLE goods
CHANGE country city varchar(20);

DELETE FROM goods
WHERE city = 'Ber';

SELECT * FROM goods;

drop table if exists goods;




