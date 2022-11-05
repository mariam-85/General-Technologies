use hr;
select * from employees;


-- Вывести имя/фамилию сотрудника и имя/фамилию его/ее менеджера

select
   t1.first_name as employee_name,
   t1.last_name as employee_last_name,
   t2.first_name as manager_name,
   t2.last_name as manager_last_name
from employees t1
inner join employees t2
on t1.manager_id = t2.employee_id;

-- t1 - источник данных о сотруднике
-- t2 - источник данных о менеджере

-- Вывести имена и фамилии тех сотрудников, которые зарабатывают больше своего менеджера

select
   t1.first_name as employee_name,
   t1.last_name as employee_last_name,
   t1.salary as employee_salary,
   t2.first_name as manager_name,
   t2. last_name as manager_last_name,
   t2.salary as manager_salary
from employees t1
inner join employees t2
on t1.manager_id = t2.employee_id
where t1.salary > t2.salary;


/*
 АГРЕГАЦИЯ
 1. count() - кол-во строк, которые не null
 2. max() - максимальное значение
 3. min() - минимальное значение
 4. avg() - среднее значение
 5. sum() - сумма значений
 */
 
 -- 1) Найти имя и фамилию сотрудников с самой большой и самой маленькой зарплатами
 SELECT
    max(salary) as max_salary,
    min(salary) as min_salary
FROM Employees; 

select
	first_name,
    last_name,
    salary as max_salary
from Employees
where salary = (
SELECT
    max(salary)
FROM Employees
);

select
	first_name,
    last_name,
    salary as min_salary
from Employees
where salary = (
SELECT
    min(salary)
FROM Employees
);

SELECT 
	avg(salary) as avg_salary
FROM employees;

select
	first_name,
    last_name,
    salary as min_salary
from Employees
where salary = (
SELECT
    salary
FROM Employees
where salary <= avg(salary)
);

-- ДЗ
-- 1) Найти сотрудников, у которых зарплата меньше средней
-- 2) Найти количество сотрудников в каждом департаменте
-- 3) Найти количество сотрудников у каждого менеджера
​

use hr;
select * from employees;


select
	first_name,
    last_name,
    salary
from employees
where salary < (
select
    avg(salary)
from Employees
);

select
count(*) as employees_amount,
manager_id
from employees
group by manager_id;

SET sql_mode=(SELECT REPLACE(@@sql_mode,'ONLY_FULL_GROUP_BY',''));

select
t1.manager_id,
t2.first_name,
t2.last_name,
count(t1.employee_id) as employees_amount
from employees t1
inner join employees t2
on t1.manager_id = t2.employee_id
group by t1.manager_id;

SELECT  
	t1.manager_id, 
    t2.first_name, 
    t2.last_name, 
    count(t1.employee_id) as employee_count
FROM Employees t1
INNER JOIN Employees t2
ON t1.manager_id = t2.employee_id
GROUP BY t1.manager_id;*/



select
count(*) as employees_amount,
department_id
from employees
where department_id is not null
group by department_id;


select
t1.department_name,
count(*) as employees_amount
from Departments t1
left join Employees t2
on t1.department_id = t2.department_id
group by t1.department_name;

-- ДЗ (БД HR)
-- Найти департаменты, в которых больше 10 сотрудников


use hr;

show tables;
select * from departments;
select * from employees;

select
t1.department_id,
t1.department_name,
t2.total_employee_id
 from departments t1
inner join (
select
department_id,
count(employee_id) as total_employee_id
from employees
group by department_id
having total_employee_id > 10
) t2
on t1.department_id = t2.department_id;


select count(employee_id) as total_employee_id,
department_id
from employees
group by department_id
having total_employee_id > 10;

-- Выведите название департаментов с кол-вом сотрудников выше среднего

;

select
department_name
from
departments
where department_id in (
select
department_id
from employees
group by department_id
having count(*) > (
select
avg(total_employee_id)
from (
select count(employee_id) as total_employee_id,
department_id
from employees
group by department_id
having department_id is not null
) t1
)
);

-- Найти департамент с наибольшим кол-вом сотрудников

select
department_name
from
departments
where department_id in (
select
department_id
from employees
group by department_id
having count(*) = (
select
max(total_employee_id)
from(
select count(employee_id) as total_employee_id,
department_id
from employees
group by department_id
having department_id is not null
)t1
)
);


/* ------------ 27.09.2022 ------------ */


-- Найти департаменты, в которых есть работники, зарабатывающие больше 10 000. В результате выборки формирует два поля:
-- department_id и 1/0 (1-если есть такие работники, 0 - если нет) -----

use hr; 

select * from employees;

SET sql_mode=(SELECT REPLACE(@@sql_mode,'ONLY_FULL_GROUP_BY',''));

select
department_id,
max(
     case
        when salary >= 10000
            then 1
          else 0
     end
) as amount
from employees
group by department_id;

select
department_id,
min(
     case
        when salary >= 10000
            then 1
          else 0
     end
) as amount
from employees
group by department_id;


