CREATE TABLE CUST_PERF
(
	ID CHAR(4) PRIMARY KEY NOT NULL,
	NAME CHAR(10) NOT NULL,
	SEG CHAR(10) NOT NULL,
	TOT_AMT_1 DECIMAL(15,0),
	TOT_AMT_2 DECIMAL(15,0),
	TOT_AMT_3 DECIMAL(15,0),
	CITY CHAR(10),
	COUNTRY CHAR(10)
);

INSERT INTO CUST_PERF VALUES ('1', 'SUE', 'PRIORITY', 790, 1770, 4780, 'BERLIN', 'GERMANY');
INSERT INTO CUST_PERF VALUES ('2', 'DAVID', 'MASS', 90700, 5789, 87986, 'BERN', 'SWITZERLAND');
INSERT INTO CUST_PERF VALUES ('3', 'SAM', 'MASS', , , , 'NANTES', 'FRANCE');
INSERT INTO CUST_PERF VALUES ('4', 'KIM', 'MASS', 88805, 659860, 5130, 'BERGAMO', 'BRAZIL');
INSERT INTO CUST_PERF VALUES ('5', 'LEE', 'PRIORITY', 9846000, 5708900, 7600000, 'VERSAILLES', 'FRANCE');
INSERT INTO CUST_PERF VALUES ('6', 'BERNEY', 'MASS', , 6000, , 'BERGAMO', 'ITALY');
INSERT INTO CUST_PERF VALUES ('7', 'SANDY', 'PRIORITY', 1000400, 788000, 2378696, 'BERLIN', 'GERMANY');
INSERT INTO CUST_PERF VALUES ('8', 'YOUNG', 'MASS', , , , 'SEOUL', 'KOREA');
INSERT INTO CUST_PERF VALUES ('9', 'SALLY', 'MASS', 540, , 7700, 'TOKYO', 'JAPAN');
INSERT INTO CUST_PERF VALUES ('10', 'BRIAN', 'MASS', 254860, 578321, 432004, 'PUSAN', 'KOREA');
INSERT INTO CUST_PERF VALUES ('11', 'CHRISTINA', 'PRIORITY', 687063, 870000, 545400, 'OSAKA', 'JAPAN');







use company;

create table customers (
id int,
name char(10),
city char(15),
country char(20) );

insert into customers values 
(1, 'sue', 'berlin', 'germany'),
(2, 'david', 'bern', 'switzerland'),
(3, 'sam', 'nantes', 'france'),
(4, 'kim', ' bergamo', 'brazil'),
(5, 'lee', 'versailles', 'brazil'),
(6, 'berney', 'bergamo', 'italy'),
(7, 'sandy', 'berlin', 'germany'),
(8, 'youn','seoul','korea');


