use testdb;

CREATE TABLE CARD_TRAN_201311
(
	CMF CHAR(4) PRIMARY KEY NOT NULL,
	PARTY_NM CHAR(10) NOT NULL,
	SEG CHAR(10) NOT NULL,
	PIF_AMT DECIMAL(15,0),
	INST_AMT DECIMAL(15,0),
	OVRS_AMT DECIMAL(15,0),
	CASH_AMT DECIMAL(15,0)
);

INSERT INTO CARD_TRAN_201311 VALUES ('2356', '김아름', 'PB', 1234041,null , 1301710, null);
INSERT INTO CARD_TRAN_201311 VALUES ('4570', '이선우', 'MASS',null , null, 524560, null);
INSERT INTO CARD_TRAN_201311 VALUES ('4563', '홍지은', 'MASS', 213570,null , null, 3700000);
INSERT INTO CARD_TRAN_201311 VALUES ('3266', '윤일상', 'MASS', 89641, null, null, null);
INSERT INTO CARD_TRAN_201311 VALUES ('8904', '이동건', 'PB', 1278960, 500000, null, null);
INSERT INTO CARD_TRAN_201311 VALUES ('4678', '최혜연', 'MASS', 4567780, null, null, null);
INSERT INTO CARD_TRAN_201311 VALUES ('1746', '임하영', 'PB', 7836100, 3213400, null, null);
INSERT INTO CARD_TRAN_201311 VALUES ('3120', '김지철', 'PB', null, null, null, null);
INSERT INTO CARD_TRAN_201311 VALUES ('8974', '강성범', 'MASS', 655456, null, null, null);
INSERT INTO CARD_TRAN_201311 VALUES ('3255', '김지연', 'MASS', 213, null, null, null);
INSERT INTO CARD_TRAN_201311 VALUES ('8977', '김지현', 'PB', 1300, null, 54000, 100000);

select * from card_tran_201311;

/*
cmf - 고객번호, party_nm - 이름, seg - 고객등급, pif_amt - 일시불, inst_amt - 할부사용금액,
ovrs_amt - 해외사용금액, cash_amt - 현금서비스

coalesce함수 사용

1. cmd, 이름, 총 사용금액을 총 사용금액 기준 내림차순으로 출력하시오
2. 신규 무이자 할부 카드의 홍보대상 고객을 추출하시오
3. pb고객을 대상으로 일시불사용금액의 1%를 캐시백해주는 캠페인을 진행하면 누가 얼마의 금액을 받을 것인가
4. 고객 등급별 총사용 금액을 추출하고 총사용금액 기준 내림차순 정렬
5. 사용금액이 가장 많은 서비스는
6. 사용횟수가 가장 많은 서비스는
7. pb 고객이 가장 많이 사용한 서비스는
*/


select cmf, party_nm, (coalesce(pif_amt,0) + coalesce(inst_amt,0) + coalesce(ovrs_amt,0) + coalesce(cash_amt,0)) 
as tot_amt from card_tran_201311 order by 3 desc;

select cmf, party_nm, inst_amt from card_tran_201311 where inst_amt > 0;

select cmf, party_nm, seg, pif_amt, pif_amt*0.1 as reward_amt from card_tran_201311 where seg='pb';






create table purchase_tran (
id int,
purchase_amt int,
purchase_cnt int,
last_amt int,
last_cnt int);

insert into purchase_tran values 
(145, 2000000, 12, 1231000, 21),
(455, 1273100, 1, 2237230, 22),
(463, 111463, 3, 214047, 1),
(324, 154769, 3, 7474663, 13),
(568, 25786652, 47, 1000047, 3),
(662, 106868, 1, 277763, 1),
(871, 9694470, 123, 798874, 2),
(460, 65650000, 1200, 6557741, 320),
(277, 5766300, 470, 57663000, 444),
(309, 5579800, 415, 2333000, 135);

 /*
1. 올해 구매금액이 1백만원 이상인 고객의 고객번호와 올해 구매금액을 추출하시오.
2. 작년 구매금액이 1백만원 이상 5천만원 이하인 고객의 고객 번호와 작년 구매금액을 출력하시오.
3. 올해 구입건수가 작년 구입건수 보다 많은 고객들의 고객번호, 올해구입건수, 작년구입건수를 출력하고 올래구입건수를 기준으로 오름차순 정렬하시오.
4. 올해 건당 구입금액을 구하고 이름을 평균구매금액으로 출력하시오.
5. 올해와 작년의 구매건수 당 평균 구매금액을 구하시오
*/

select * from purchase_tran;

select id, purchase_amt from purchase_tran where purchase_amt >= 1000000;
select id, last_amt from purchase_tran where  1000000 <= last_amt <= 50000000;
select id, purchase_cnt, last_cnt from purchase_tran where purchase_cnt > last_cnt order by id;
select id, purchase_amt*0.1 as income_amt from purchase_tran;
select id, purchase_amt/purchase_cnt as ticket_size from purchase_tran;
select id, card_no, cnrt_amt from ins_info where cncl_dt is null;
select id, cnrt_no, cnrt_amt from ins_info where cncl_dt is not null;




create table ins_info (
id int,
cnrt_no int,
cnrt_dt date,
cnrt_cd int,
prdt_nm char(15),
cncl_dt date,
cnrt_amt int);

insert ignore into ins_info values 
(224,	2533274,	'2013-07-01',	1,'다이렉트자동차보험', null, 1000000),
(224,	6111075,	'2012-08-07',	2,	'5년만기저축보험', '2014-01-21',	300000),
(684,	4447330,	'2014-06-12',	1,	'다이렉트자동차보험', null, 100000),
(233,	4932004,	'2011-11-23',	3, '자동차보험', null, 200000),
(762,	9633703,	'2013-05-31',	2,	'10년만기저축보험', '2013-11-03',	700000),
(789,	1378934,    '2013-01-12',	2,	'3년만기저축보험', null, 5000001),
(183,	3701447,	'2010-05-05',	1,	'다이렉트자동차보험', null, 900000),
(183,	6678966,	'2011-12-08',	3,	'10년만기저축보험', null, 10000000),
(831,	8463112,	'2013-04-16',	1,	'다이렉트자동차보험', '2013-08-11',	1000000);

drop table ins_info;
select * from ins_info;

/*
	
1. 가입금액이 1백만원 이상인 고객들의 고객번호, 계약번호, 가입금액을 추출하시오.
2. 다이렉트자동차보험 가입 고객들의 고객번호, 상품명, 계약일을 계약일 오름차순으로 출력하시오
3. 상품계약일이 2013년 4월 16일 이후인 고객들의 고객번호, 계약일, 상품명을 고객번호 오름차순으로 출력하시오.
4. 보험 계약을 해지한 고객의 고객번호를 출력하시오.
5. 계약 종류 별 평균가입금액과 가입수를 추출하시오.
6. 계약이 해지된 계약의 종류와 수를 추출하시오
7. 2013년에 가입한 계약의 수와 평균 가입금액을 추출하시오
8. 살아있는 계약의 고객번호, 상품명, 가입금액을 추출하시오
*/

select * from ins_info where cnrt_amt>= 100000;
select * from ins_info where prdt_nm = '다이렉트자동차보험' order by id;
select * from ins_info where cnrt_dt > '2013-04-16' order by  id;
select * from ins_info where cncl_dt is not null;
select prdt_nm, avg(cnrt_amt) from ins_info group by prdt_nm order by  id;
select * from ins_info where cnrt_dt between '2013-01-01' and '2013-12-31' order by  id;
select * from ins_info where cncl_dt is null order by  id;
