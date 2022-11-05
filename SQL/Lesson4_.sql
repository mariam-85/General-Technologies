show databases;
use lesson;

drop table if exists people;

create table people (
        id integer primary key auto_increment,
        firstname varchar(128),
        lastname varchar(128)
);
        
insert into people (firstname, lastname) values ('Anton', 'Golebev'),
                                                 ('Victoria', 'Petrova'),
                                                 ('Olga', 'Ivanova');
                                                 
select * from people;

insert into people (firstname, lastname) values ('Mariam', 'Lofink');

insert into people (firstname, lastname) values ('Olga', 'Ivanova');


DELETE FROM people
WHERE firstname = 'Mariam';

DELETE FROM people
WHERE firstname = 'Olga';

set sql_safe_updates = 0;

TRUNCATE people;



