##########################################################
##########################################################
##########################################################

# SQL - MySQL for Data Analytics and Business Intelligence
# Lecture and Exercise Code

##########################################################
##########################################################
##########################################################





##########################################################
##########################################################

-- SECTION: First Steps in SQL

##########################################################
##########################################################


###########
-- LECTURE: Creating a Database - Part I

sales database 생성

create database sales;

-- EXERCISE 1: Creating a Database - Part I


###########
-- LECTURE: Creating a Database - Part II

sales database 선택

use sales;

-- EXERCISE 1: Creating a Database - Part II



###########
-- LECTURE: Fixed and Floating-Point Data Types

test table 생성
test column 생성 - datatype -  DECIMAL(5,3)

create table test (test decimal(5,3));


값 10.5 입력

insert into test(test) values(10.5);

test테이블 출력

select * from test;

값 입력 - 12.55555


insert into test(test) values(12.55555);

칼럼 추가  `test_fl` - FLOAT(5,3) NULL AFTER `test`

alter table test add column 'test_f1' foat(5,3) null after 'test';

값 입력 - test_fl : 14.55555 / test : 16.55555

insert into test_f1 values(14.5555);
insert into test values(16.55555);

test table 삭제

drop table test;
###########
-- LECTURE: Creating a Table

sales 테이블 생성
	purchase_number - INT  ,
    date_of_purchase - DATE NOT NULL,     
    customer_id - INT,
    item_code - VARCHAR(10) NOT NULL
    
    
create table sales (
purchase_number  INT  auto_increment primary key,
date_of_purchase  DATE NOT NULL,     
customer_id  INT,
item_code  VARCHAR(10) NOT NULL
);



-- EXERCISE 1: Creating a Table
customers 테이블 생성
    customer_id - INT,
    first_name - varchar(255),
    last_name - varchar(255),
    email_address - varchar(255),
    number_of_complaints - int
    
    
    
create table customers (
	customer_id  INT,
    first_name  varchar(255),
    last_name  varchar(255),
    email_address  varchar(255),
    number_of_complaints  int
);


sales 테이블의 purchase_number를 primary key로 지정 - 2가지 방범/ not null로 지정/ auto_increment로 지정
customers 테이블의 customer_id를 primary key로 지정

create table customers (
	customer_id  INT primary key,
    first_name  varchar(255),
    last_name  varchar(255),
    email_address  varchar(255),
    number_of_complaints  int
    );

create table customers (
	customer_id  INT primary key,
    first_name  varchar(255),
    last_name  varchar(255),
    email_address  varchar(255),
    number_of_complaints  int,
    primary key(customer_id)
    );

alter table customers add constraint primary key(customer_id);








###########

##########################################################
##########################################################

-- SECTION: MySQL Constraints

##########################################################
##########################################################


###########
-- LECTURE: PRIMARY KEY Constraint

/


-- EXERCISE 1: PRIMARY KEY Constraint


items 테이블 생성, 
	
	primary key - item_id
    item_id - VARCHAR(255),
    item - VARCHAR(255),
    unit_price - NUMERIC(10 , 2 ),
    company_id - VARCHAR(255),
    
    create table items(
    
    item_id  VARCHAR(255) primary key,
    item  VARCHAR(255),
    unit_price  NUMERIC(10 , 2 ),
    company_id  VARCHAR(255)
    );


companies 테이블 생성, 
	primary key - company_id
    company_id - VARCHAR(255),
    company_name - VARCHAR(255),
    headquarters_phone_number - INT(12),
    
    create table companies(
		company_id  VARCHAR(255),
		company_name  VARCHAR(255),
		headquarters_phone_number  INT(12),
        primary key(company_id)
        );
    



alter - customers테이블 - email_address - unique key로 지정

ALTER TABLE customers ADD UNIQUE KEY (email_address);

alter table customers add foreign key(customer_id) references customers(customer_id) ON DELETE CASCADE;


customers테이블 gender column를 추가 - enum('M', 'F')

alter table customers add column gender enum('M', 'F') after last_name;

customers 테이블 값 추가 - 'John', 'Mackinley', 'M', 'john.mckinley@365careers.com', 0

insert into customers values('John', 'Mackinley', 'M', 'john.mckinley@365careers.com', 0);

customers 테이블 값 추가 - first_name, last_name, gender -> 'Peter', 'Figaro', 'M'

insert into customers (first_name, last_name, gender) values('Peter', 'Figaro', 'M');


company_name을 not null로 추가

alter company_name add constraint not null(company_name);

ALTER TABLE customers
CHANGE COLUMN number_of_complaints number_of_complaints INT DEFAULT 0;

ALTER TABLE companies
MODIFY company_name VARCHAR(255) NULL;

ALTER TABLE companies
CHANGE COLUMN company_name company_name VARCHAR(255) NOT NULL;


###########
-- LECTURE: SELECT - FROM

employees database 선택

use employees;


first_name, last_name 출력

select first_name, last_name from employees;

  
###########
-- LECTURE: WHERE

이름이  'Denis'인 데이터 출력

select * from employees where name='Denis';
    

###########
-- LECTURE: AND

이름이 'Denis' 이고 남성인 데이터 출력
    
select * from employees where name='Denis' and gender='M';

###########
-- LECTURE: OR

이름이 'Denis' 또는  'Elvis'인 데이터 출력

select * from employees where name = 'Denis' or name='Elvis';

###########
-- LECTURE: IN / NOT IN

이름이 'Cathie' , 'Mark', 'Nathan'에 해당하는 row출력

select * from employees where name='Cathie' or name='Mark' or name='Nathan';

select * from employees where name in ('Cathie', 'Mark', 'Nathan');

이름이 'Cathie' , 'Mark', 'Nathan'에 해당하지 않는 row출력

select * from employees where name not in ('Cathie', 'Mark', 'Nathan');

###########
-- LECTURE: LIKE / NOT LIKE 

이름이 Mar로 시작하는 row출력

select * from employees where name like ('Mar%');

이름이 ar로 끝나는 row출력

select * from employees where name like ('%ar');

이름이 Mar로 시작하고 4글자인 row출력

select * from employees where name like ('Mar_');

이름에 jack을 포한하는 row를 출력

select * from employees where first_name like ('%Jack%');
    

hire_date이 '1990-01-01' 과 '2000-01-01' 사이인 row출력

select * from employees where hire_date between '1990-01-01' and '2000-01-01';

    
salary가 66000과 70000 사이인 row출력

select * from salaries where salary between 66000 and 70000;
 
이름이 null인 row출력

select * from employees where first_name is null;
 
 이름이 null이 아닌 row출력

select * from employees where first_name is not null;
    
이름이 'Mark'가 아닌 row를 출력

select * from employees where first_name != 'Mark';
    
select * from employees

hire_date이 '2000-01-01' 이후인 데이터 출력

select * from employees where hire_date > '2000-01-01';
    
hire_date이 '1985-02-01'이전인 데이터 출력

select * from employees where hire_date < '1985-02-01';

hire_date이 '1985-02-01'이전이고 남성인인 데이터 출력
    
salary가 150000  이상인 데이터 출력
select  * from salaries where salary > 150000;


중복없는 입사일자 데이터 출력
select distinct hire_date from employees;


중복없는 이름 출력

select distinct first_name from employees;
    

###########
-- LECTURE: Introduction to Aggregate Functions    
    
사원번호 갯수를 출력

select count(emp_no) from employees;
    
    
이름 칼럼 갯수의 총 합 출력

select count(first_name) from employees;

중복없는 이름의 갯수 출력

select count(distinct first_name) from employees;

-- EXERCISE 1: Introduction to Aggregate Functions

연봉 100000이상인 사람의 총 수
    
select count(*) from salaries where salary > 100000;

메니저인 사람의 총 수 출력

select count(emp_no) from dept_manager;


이름으로 오름차순 정렬 후 하위 10개 이름 출력

select first_name from employees order by first_name limit 10;

이름으로 내림차순 정렬 후 하위 10개 이름 출력

select first_name from employees order by first_name desc limit 10;

성울 선순위, 이름을 차순위로 내림차순 정렬

select last_name, first_name from employees order by first_name asc, last_name desc;

연봉 상위 100명 이름 출력
select first_name from salaries order by salary desc limit 100;

중복 이름이 100 이상인 이름 목록 출력
select first_name from employees group by first_name having count(first_name) > 100;


평균 연봉이 120000 이상인 직원 번호와 평균 임금 출력
select emp_no, avg(salary) from employees group by emp_no having avg(salary) > 120000;
###########
-- LECTURE: WHERE vs HAVING - Part I

중복 이름이 200번 이상이면서 1999-01-01 이후에 입사한 사람의 이름과 중복된 이름의 갯수 출력

select first_name, count(first_name) from employees where hire_date > 1999-01-01 
group by first-name having count(first_name) > 200;

use employees;

employees에 데이터 삽입

insert into employees (
	emp_no,
	birth_date,
	first_name,
	last_name,
	gender,
	hire_date) values
	(999901,
    '1986-04-21',
    'John',
    'Smith',
    'M',
    '2011-01-01'),
    
    ('1973-3-26',
    999902,
    'Patricia',
    'Lawrence',
    'F',
    '2005-01-01'),
    
    (999903,
    '1977-09-14',
    'Johnathan',
    'Creek',
    'M',
    '1999-01-01');
    
employees 내림차순 상위 10개 출력

select * from employees order by emp_no desc limit 100;

titles에 데이터 입력
insert into titles (	
    emp_no,
    title,
    from_date) values(

	999903,
    'Senior Engineer',
    '1997-10-01');
    
employees 내림차순 상위 10개 출력

 
dept_emp에 데이터 입력

insert into dept_emp (
	emp_no,
    dept_no,
    from_date,
    to_date) values(

	999903,
    'd005',
    '1997-10-01',
    '9999-01-01');


###########
-- LECTURE: Inserting Data INTO a New Table
use employees;

CREATE TABLE departments_dup 
(
    dept_no CHAR(4) NOT NULL,
    dept_name VARCHAR(40) NOT NULL
);

departments의 데이터를 departments-dup에 삽입하시오

insert into departments_dup(dept_no, dept_name)  select * from departments




##########################################################
##########################################################

-- SECTION: The SQL UPDATE Statement

##########################################################
##########################################################


###########
-- LECTURE: The UPDATE Statement - Part I


USE employees;

emp_no = 999901e데이터를 수정하시오

update employees set (

first_name = 'Stella',
last_name = 'Parkinson',
birth_date = '1990-12-31',
gender = 'F') where emp_no = 999901;

emp_no 기준 내림차순으로 상위 10개를 출력하시오


###########


-- EXERCISE 1: The UPDATE Statement - Part II

departments에서 dept_no가 'd010'인 데이터의 dept_name을 'data analysis'로 수정하시오

update departments set( dept_name='data analysis') where dept_np= 'd010';


##########################################################
##########################################################

-- SECTION: The SQL DELETE Statement

##########################################################
##########################################################


###########
-- LECTURE: The DELETE Statement - Part I

USE employees;


SELECT 
    *
FROM
    titles
WHERE
    emp_no = 999903;
    
    
employees 테이블에서 emp_no가 999903인 데이터를 삭제하시오

delete from employees where emp_no = 999903;

SELECT 
    *
FROM
    employees
WHERE
    emp_no = 999903;
    
    

###########
-- LECTURE: The DELETE Statement - Part II

SELECT 
    *
FROM
    departments_dup
ORDER BY dept_no;


departments_dup의 모든 데이터를 삭제하시오

delete from departments_dup;


departments에서 dept_no가 'd010'인 데이터를 삭제하시오

delete from departments where dept_np='d010';
##########################################################
##########################################################

-- SECTION: MySQL Aggregate Functions

##########################################################
##########################################################


###########
-- LECTURE: COUNT()

SELECT 
    *
FROM
    salaries
ORDER BY salary DESC
LIMIT 10; 

SELECT 
    COUNT(salary)
FROM
    salaries;   

salaries테이블에서 입사일자 총 갯수합합을 산출하시오
select count(hire_date) from salaries;

salaries테이블에서 중복없는 입사일자 총 합을 산출하시오
select count(distinct(hire_date)) from salaries;
    
salaries 테이블의 총데이터 갯수를 구하시오
select count(*) from salaries;

dept_emp에서 중복없는 dept_no의 갯수를 구하시오
select count(distinct(dept_no)) from dept_emp;


salaries에서 salary의 총 합을 구하시오.
select sum(salary) from salaries;
    
'1997-01-01'일 이후의 salary의 총합을 구하시오.
select sum(salary) from salaries where mdate > '19970-01-01';


###########
-- LECTURE: MIN() and MAX()

salaries에서 salary최대값을 구하시오.
select max(salary) from salaries;

salaries에서 salary최소값을 구하시오
select min(salary) from salaries;

salaries에서 salary 평균값을 구하시오
select avg(salary) from salaries;

salaries에서 salary 반올림한 평균값을 구하시오.
select round(salary) from salaries;



