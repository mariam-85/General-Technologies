-- ДЗ
-- 1. Определить сколько покупок было совершено в июне

use shop;

select
	count(*) as cnt
from orders
where month(odate) = 6;

-- 2. Определить среднюю стоимость покупок в марте

select
	ROUND(avg(amt)) as avg_amt
from orders
where month(odate) = 3;

-- 3. Определить какие покупки были совершены во вторник

select
	*
from orders
where weekday(odate) = 1;

-- 4. Определить, сколько покупок было совершено в каждый месяц. Отсортировать строки в порядке возрастания количества покупок. 
-- Вывести два поля - номер месяца и количество покупок

select
	monthname(odate) as month_name,
    count(*) as cnt
from orders
group by month_name
order by cnt;


-- 5. * Определить, в какой месяц было совершено больше всего покупок.  Вывести два поля - номер месяца и количество покупок

create view v_all_month as
select
	monthname(odate) as month_name,
    count(*) as cnt
from orders
group by month_name;

select
	*
from v_all_month
where cnt = (select max(cnt) from v_all_month);




-- ПРЕДСТАВЛЕНИЕ (VIEW)
create view v_march as
select
	*
from orders
where month(odate) = 3;


select 
	* 
from v_march;


select
	*
from (
	select
		*
	from orders
	where month(odate) = 3
) t1;

drop view tmp;