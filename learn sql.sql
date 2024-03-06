CREATE DATABASE college;
-- if not exists
create database if not exists  college;
-- drop command
drop database if exists college;
drop database if exists company;
use college;
show databases;
show tables;
CREATE TABLE student (
id INT PRIMARY KEY,
name VARCHAR(50),
age INT NOT NULL
);
INSERT into STUDENT VALUES(1,"AMAN",26);
INSERT into STUDENT VALUES(2,"SHARADHA",24);
SELECT * FROM student;
-- ............................

-- now use xyz database
CREATE DATABASE xyz_company;
use xyz_company;
show databases;
CREATE TABLE employee(
id INT PRIMARY KEY,
name VARCHAR(100),
salary INT 
);
INSERT INTO employee
(id,name,salary)
VALUES
(1,"adam",25000),
(2,"bob",30000),
(3,"casey",40000);
select * from employee;
-- ..........................................
-- now create a ew database
-- apply unique operation
create table temp1(
id int unique);

insert into temp1 values (101);
insert into temp1 values(101);
select * from temp1;

-- now primary key
create table temp2(
id int primary key
);

-- 2 way of pk
create table temp3(
id int,
name varchar(50),
age int,
city varchar(20),
primary key(id,name)
);

-- constrainsts
create table tempz(
cust_id int,
foreign key(cust_id) references customer(id)
);

-- default
-- salary int default 20000;
create table emp(
id int,
salary int DEFAULT 25000);

insert into emp (id) values (101);
select *  from emp;


-- check
create table city(
id int primary key,
city varchar(50),
age int,
CONSTRAINT age_check CHECK (age>=18 and city="delhi")
);

-- now apply operation on database
create database clg;
use clg;
create table child(
rollno int primary key,
name varchar(50),
marks int not null,
grade varchar(1),
city varchar(20)
);


create table dept(
id int primary key,
name varchar(50)
);

insert into dept 
values
(101,"english"),
(102,"it");

update dept
set id=111
where id=101;

select * from dept;

create table teacher(
id int primary key,
name varchar(50),
dept_id int,
foreign key (dept_id) references dept(id)
on update cascade
on delete cascade
);

drop table teacher;

insert into teacher
values
(101,"adam",101),
(102,"eve",102);

select * from teacher;

insert into child(
rollno, name, marks,grade,city)
values
(101,"anil",78,"c","pune"),
(102,"bhumika",93,"a","mumbai"),
(103,"cheta",85,"b","mumbai"),
(104,"dhruv",96,"A","delhi"),
(105,"emaunel",12,"f","delhi"),
(106,"farah",82,"b","delhi");



select name,marks from child;
select * from child;
-- distinct.............
select distinct city from child;

-- where clause............
select * from child where marks>80;
select * from child where city="mumbai";
-- and ,or,between,in,not.limit..........
select *  from child where marks>80 AND city="mumbai";
select *  from child where marks>80 OR city="mumbai";
select * from child where marks BETWEEN 80 AND 90;
select * from child where city IN("delhi","mumbai");
select * from child where city NOT IN("delhi","mumbai");
select * from child LIMIT 3;
-- order by clause...............means ascending and descending.....
select *from child
ORDER BY city ASC;

select *from child
order by marks desc
limit 3;



-- operators............
select *from child where marks+10>100;
select *from child where marks=93;
select *from child where marks>75;


-- aggregate function.............
select MAX(marks)
from child;

select avg(marks)
from child;

select min(marks)
from child;

select count(rollno)
from child;

-- group by clause..................
select city, count(name)
from child
group by city; 

select city,name,count(rollno)
from child
group by city,name;

select city, avg(marks)
from child
group by city;

-- find avg each city in asc order
select city, avg(marks)
from child
group by city
order by city;

-- or
select city, avg(marks)
from child
group by city
order by avg(marks) desc;

-- select mode,count(customers)
-- from payment
-- group by mode;


select grade,count(rollno)
from child
group by grade;
-- order by grade;



-- having clause.....aplly condition on groups.........
select count(name), city
from child
group by city
having max(marks)>90;
 
-- select city, count(rollno)
-- from child
-- group by city;
-- HAVING max(marks)>90;

-- where apply on rows
-- having apply on groups

-- this is general order...
-- where cond->rows ad having cond->columns /group 
select city
from child
where grade="A"
group by city;
-- HAVING MAX(marks)>90;
-- order by city desc;
-- order by aesc;

-- table related queries.................
-- 1. update...........update in existing rows............
set sql_safe_updates=0;
update child
set grade="o"
where grade="a";
-- o-outstanding..
-- update marks

update child
set marks=82
where rollno=105;

update child
set grade="b"
where markks between 80 and 90;

update child
set marks=marks+1;


-- 2 table query is delete->it delete existing rows
update child
set marks=12
where rollno=105;

delete from child
where marks<43;

select * from child;

-- revisit fk
 
 -- alter ->to change the schema ->design(columns, datatypes,constraints)
 -- 1 add column
 alter table child
 add column age int;
 
 alter table child
 drop column age;
 
 alter table child
 add column age int not null default 19;
 
 alter table child
 modify column age varchar(2);
 
 alter table child
 change age stu_age int;
 
 insert into child
 (rollno, name, marks, stu_age)
 values
 (107,"gargi",68,100);
 
 alter table child
 drop column stu_age;
 
 alter table child
 rename to stu;
 
 select * from stu;
 
 alter table stu
 rename to child;
 
 select * from child;

-- truncate -->delete all table data not table 
--  truncate table table_name;

truncate table child;

select * from child;

-- chage table name
alter table child
change name full_name varchar(50);

delete from child
where marks<80;

select * from child;

alter table child
drop column grade;

select * from child;

-- joins in sql.....->combine rows from two or more tables , based on a related column between them
create table course(
id int primary key,
course varchar(50)
);

insert into course
(id,course)
values
(102,"english"),
(105,"math"),
(103,"science"),
(107,"computer science");

-- select * from child
-- inner join course 
-- on child.rollno=course.id;

-- we also use alias ->it means alternate name...
select * 
from child as ch
inner join course as c
on ch.rollno=c.id;


-- left join.....
select * from child as ch
left join course as c
on ch.rollno=c.id;



-- right join.....
select * from child as ch
right join course as c
on ch.rollno=c.id;


-- full join........
select * from child as a
left join course as b
on a.rollno=b.id
union
select * from child as a
right join course as b
on a.rollno=b.id;


-- left exclusive join-->it give data of left side not right side and also not give overlapping or coomn ata of right table
select *
from child as a
left join course as b
on a.rollno=b.id
where b.id is null;

-- similarly right exclusive join
select *
from child as a
right join course as b
on a.rollno=b.id
where a.rollno is null;

-- full exclusive join
-- select *
-- from child as a
-- left join course as b
-- on a.rollno=b.id
-- where b.id is null;
-- intersection
-- select *
-- from child as a
-- right join course as b
-- on a.rollno=b.id;
-- where a.rollno is null;


--  self join->join with itself
create table emp(
id int primary key,
name varchar(50),
manager_id int);

insert into emp
values
(101,"adam",103),
(102,"bob",104),
(103,"casey",null),
(104,"donald",103);

select a.name as manager_name, b.name 
from emp as a
join emp as b
on a.id=b.manager_id;

-- union....>
select name from emp
union
select name from emp;

-- union all->it gives duplicate values..


-- sql sub queries...->a inner query or a nested query is a query withi aanother sql query
-- it involve 2 statements...alter
-- they write in 3 ways...alter-- 
-- 1. select 2. where 3. from 

create table student(
rollno int,
name varchar(20),
marks int not null,
grade varchar(1),
city varchar(20)
);

insert into student
values
(101,"anil",78,"c","pune"),
(102,"bhumi",93,"a","mumbai"),
(103,"chetan",85,"b","mumbai"),
(104,"dhruv",92,"a","delhi");

select * from student;

select avg(marks)
from student;

select name,marks
from student
where marks>87;

select name,marks
from student
where marks>(select avg(marks) from student);


-- name of all student with even rollno
select rollno,name
from student
where rollno%2=0;

-- use of in operator
select name 
from student
where rollno in (102,104);

-- another way..
select rollno, name
from student
where rollno in(select rollno 
from student 
where rollno%2=0);

-- sql queries..from
select *
from student
where city="delhi";

select max(marks)
from
(select *
from student
where city="delhi") as temp;

select(select max(marks) from student),
name from student;


-- mysql views............
create view view1 as
select rollno, name
from student;

select * from view1;


create view view2 as
select rollno, name, marks
from student;

select * from view2
where marks>90;
