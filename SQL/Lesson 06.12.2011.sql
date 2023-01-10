use airport;

-- Отсортируйте данные о билетах в зависимости от цены по возрастанию. В выборке должны присутствовать три атрибута — id, trip_id, price.

select 
	id,
    trip_id,
    price
from tickets
order by price;

-- Менеджеры авиакомпании потребовали выяснить наименования моделей самолетов. Выведите все доступные модели, исключая дубликаты.
-- В выборке должен присутствовать один атрибут — model_name.

select distinct
		model_name
from airliners;

select
	count(*)
from (
	select distinct
		model_name
	from airliners
) t1;

select
		model_name,
        count(*) as cnt
from airliners
group by model_name;
    
-- Аналитическое подразделение решило уточнить у авиакомпании количество билетов не бизнес-класса.
-- Напишите запрос, который выведет id билетов, класс обслуживания в которых отличен от бизнес-класса (Business).
-- В выборке должен присутствовать один атрибут —  id.

select
	id
from tickets
where service_class <> 'Business';

-- Посчитать количество полученных id билетов в предыдущем запросе

select
	count(id) as cnt
from tickets
where service_class <> 'Business';


-- Посчитать количество билетов в каждом классе. Отсортировать в порядке убывания количества билетов

select
	service_class,
    count(*) as cnt
from tickets
group by service_class
order by cnt desc;

-- Определите модели самолетов, максимальная дальность полета (range) которых находится в диапазоне от 4200 до 10100 включительно.
-- В выборке должен присутствовать один атрибут —  model_name.

select 
	model_name 
from airliners
where range_ between 4200 and 10100;


-- Номера некоторых билетов рейса RL6EC4YWB1 (trip_id) внесены в базу некорректно: два последних символа билетов серии UE01H8UCJQXX (id) введены неправильно. 
-- То есть на месте символов XX находятся некорректные значения. Номера некоторых билетов имеют значение NULL. 
-- Найдите идентификаторы пассажиров всех некорректно введенных билетов.
-- В выборке должен присутствовать один атрибут — client_id.

select 
	client_id 
from tickets
where trip_id = 'RL6EC4YWB1'
and ((id like 'UE01H8UCJQ__') or id is null);


-- Для каждого самолета модели Cessna 172 выведите дальность полета. Имя столбца с результатом должно быть max_distance.
-- В выборке должен присутствовать один атрибут — max_distance.

select 
	range_ as max_distance
from airliners
where model_name = 'Cessna 172';


-- Разделите самолеты на ближне-, средне- и дальнемагистральные. 
-- Ближнемагистральными будем считать самолеты, дальность полета которых > 1000 км и <= 2500 км. 
-- Среднемагистральными — с дальностью полета > 2500 км и <= 6000 км. 
-- Дальнемагистральными — с дальностью полета > 6000 км. 
-- В выборке должно быть два столбца, где в первом указана модель самолета. 
-- Во втором, category, — категория, со значениями short-haul, medium-haul, long-haul (ближне-, средне- и дальнемагистральные соответственно). 
-- Каждый самолет точно попадает ровно в одну категорию.
-- В выборке должны присутствовать два атрибута — model_name, category.

select
	model_name,
	case
		when range_ > 1000 and range_ <= 2500 then 'short-haul'
        when range_ > 2500 and range_ <= 6000 then 'medium-haul'
        when range_ > 6000 then 'long-haul'
    end category
from airliners;


-- Если максимальная дальность полета <= 1000 км или данных о дальности полета нет, в category выведите 'UNDEFINED'.

select
	model_name,
	case
		when range_ > 1000 and range_ <= 2500 then 'short-haul'
        when range_ > 2500 and range_ <= 6000 then 'medium-haul'
        when range_ > 6000 then 'long-haul'
        else 'UNDEFINED'
    end category
from airliners;


-- Выведите данные о билетах разной ценовой категории. 
-- Среди билетов экономкласса (Economy) добавьте в выборку билеты с ценой от 10 000 до 11 000 включительно. 
-- Среди билетов комфорт-класса (PremiumEconomy) — билеты с ценой от 20 000 до 30 000 включительно. 
-- Среди билетов бизнес-класса (Business) — с ценой строго больше 100 000. 
-- В решении необходимо использовать оператор CASE.
-- В выборке должны присутствовать три атрибута — id, service_class, price.

select 
	id,
    service_class,
    price
from tickets
where
	case service_class
		when 'Business' then price > 100000
        when 'PremiumEconomy' then price between 20000 and 30000
        when 'Economy' then price between 10000 and 11000
    end;



-- РАБОТА С ДАТОЙ

select str_to_date('2022-12-04 14:58:30', '%Y-%m-%d %H:%i:%s');

-- Создать БД Shop, используя следующие данные

create database shop;

use shop;

CREATE TABLE SELLERS(
       SELL_ID    INTEGER, 
       SNAME   CHAR(20), 
       CITY    CHAR(20), 
       COMM    NUMERIC(3, 2),
       BOSS_ID  INTEGER
);
                                            
CREATE TABLE CUSTOMERS(
       CUST_ID   INTEGER, 
       CNAME   CHAR(20), 
       CITY    CHAR(20), 
       RATING  INTEGER
);

CREATE TABLE ORDERS(
       ORDER_ID  INTEGER, 
       AMT     NUMERIC(7,2), 
       ODATE   DATE, 
       CUST_ID    INTEGER,
       SELL_ID    INTEGER 
);

INSERT INTO SELLERS VALUES(201,'Олег','Москва',0.12,202);
INSERT INTO SELLERS VALUES(202,'Лев','Сочи',0.13,204);
INSERT INTO SELLERS VALUES(203,'Арсений','Владимир',0.10,204);
INSERT INTO SELLERS VALUES(204,'Екатерина','Москва',0.11,205);
INSERT INTO SELLERS VALUES(205,'Леонид ','Казань',0.15,NULL);


INSERT INTO CUSTOMERS VALUES(301,'Андрей','Москва',100);
INSERT INTO CUSTOMERS VALUES(302,'Михаил','Тула',200);
INSERT INTO CUSTOMERS VALUES(303,'Иван','Сочи',200);
INSERT INTO CUSTOMERS VALUES(304,'Дмитрий','Ярославль',300);
INSERT INTO CUSTOMERS VALUES(305,'Руслан','Москва',100);
INSERT INTO CUSTOMERS VALUES(306,'Артём','Тула',100);
INSERT INTO CUSTOMERS VALUES(307,'Юлия','Сочи',300);


INSERT INTO ORDERS VALUES(101,18.69,'2022-03-10',308,207);
INSERT INTO ORDERS VALUES(102,5900.1,'2022-03-10',307,204);
INSERT INTO ORDERS VALUES(103,767.19,'2022-03-10',301,201);
INSERT INTO ORDERS VALUES(104,5160.45,'2022-03-10',303,202);
INSERT INTO ORDERS VALUES(105,1098.16,'2022-03-10',308,207);
INSERT INTO ORDERS VALUES(106,75.75,'2022-04-10',304,202); 
INSERT INTO ORDERS VALUES(107,4723,'2022-05-10',306,201);
INSERT INTO ORDERS VALUES(108,1713.23,'2022-04-10',302,203);
INSERT INTO ORDERS VALUES(109,1309.95,'2022-06-10',304,203);
INSERT INTO ORDERS VALUES(110,9891.88,'2022-06-10',306,201);


-- 1. Определить какие из покупок были совершены в марте

select
	*
from orders
where month(odate) = 3;

-- 2. Определить какие из покупок были совершены в 2021

select
	*
from orders
where year(odate) = 2021;

-- 3.  Определить какие из покупок были совершены в интервале от 10 апреля 2022 до 10 мая 2022 года

select
	*
from orders
where date(odate) between '2022,04,10' and '2022,05,10';


-- ДЗ
-- 1. Определить сколько покупок было совершено в июне
-- 2. Определить среднюю стоимость покупок в марте
-- 3. Определить какие покупки были совершены во вторник
-- 4. Определить, сколько покупок было совершено в каждый месяц. Отсортировать строки в порядке возрастания количества покупок. Вывести два поля - номер месяца и количество покупок
-- 5. * Определить, в какой месяц было совершено больше всего покупок.  Вывести два поля - номер месяца и количество покупок