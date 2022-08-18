USE lesson;
CREATE TABLE students (
name VARCHAR(128) NOT NULL,
lastname VARCHAR(128) NOT NULL,
avg_mark NUMERIC(2,1) check(avg_mark BETWEEN 0 and 5),
gender varchar(128) check (gender in ('M', 'F'))
);

select * from students;

insert into students (name, lastname, avg_mark, gender) values ('Mariam', 'Lofink', 3.5, 'F'),
															('Nelly', 'Efremyan', 4.3, 'F');
                                                            
alter table students
modify gender char(1);                                                            