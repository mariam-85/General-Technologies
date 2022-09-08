
use hr;

show tables;

select first_name, last_name

SELECT * from employees;

select * from departments;


SELECT
t1.first_name,
t1.last_name,
t2.department_name
FROM employees t1
INNER JOIN departments t2
ON t1.department_id = t2.department_id
WHERE t2.department_name IN ('IT Support', 'Treasury', 'IT');

SELECT
t1.department_name
FROM departments t1
LEFT JOIN employees t2
ON t1.department_id = t2.department_id
WHERE t2.first_name IS NULL;

SELECT
t1.department_name,
t2.manager_id,
t2.salary
FROM departments t1
INNER JOIN employees t2
ON t1.manager_id = t2.employee_id
WHERE t2.salary > 10000;

SELECT
t1.department_name,
t2.manager_id,
t2.salary
FROM departments t1
INNER JOIN employees t2
ON t1.department_id = t2.department_id
WHERE t2.salary > 10000;


use hr;

show tables;


select  
t1.first_name,
t2.last_name,
t3.city
from employees t1
inner join departments t2
on t1.department_id = t2.department_id
inner join locations t3
on t2.location_id = t3.id;








