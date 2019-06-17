
use company;

create table branch_info (
branch_no int,
branch_nm char(10),
open_dt date,
close_dt date,
branch_num int,
branch_perf char(5));

insert into branch_info values 
(789, '시청', '1990-03-12', null, 13, 'A'),
(640, '여의도', '2005-08-07', null, 8, 'B'),
(368, '대치', '2005-08-01', '2013-07-09', 13, 'C'),
(248, '창동', '2000-11-30', null, 12, 'A'),
(547, '종각', '1993-02-21', null, 11, 'C'),
(780, '명동', '1999-09-22', null, 8, 'A'),
(987, '역삼', '2008-08-30', null, 7, 'B'),
(456, '대학로', '2010-12-01', null, 8, 'B'),
(650, '신촌', '2002-05-17', null, 10, 'C');

select * from branch_info;


1.직원수가 10명 이상, 경영평가 'C'학점, 영업점 폐쇄
2. 직원수가 10명 또는 8명, 경영평가가 'A' 또는 'B'
3. 영업점이 폐쇄되었거나 2000년 이전에 신설한 영업







CREATE TABLE PERF_MAST_201312
(
	CMF CHAR(4) PRIMARY KEY NOT NULL,
	PARTY_NM CHAR(10) NOT NULL,
	SEG CHAR(10) NOT NULL,
	TOT_AMT_1 DECIMAL(15,0),
	TOT_AMT_2 DECIMAL(15,0),
	TOT_AMT_3 DECIMAL(15,0)
);
INSERT INTO PERF_MAST_201312 VALUES ('2356', '김아름', 'PB', 790, 1770, 4780);
INSERT INTO PERF_MAST_201312 VALUES ('4570', '이선우', 'MASS', 90700, 5789, 87986);
INSERT INTO PERF_MAST_201312 VALUES ('4563', '홍지은', 'MASS', , , );
INSERT INTO PERF_MAST_201312 VALUES ('3268', '윤일상', 'MASS', 88805, 659860, 5130);
INSERT INTO PERF_MAST_201312 VALUES ('8904', '이동건', 'PB', 9846000, 5708900, 7600000);
INSERT INTO PERF_MAST_201312 VALUES ('4678', '최혜연', 'MASS', , 6000, );
INSERT INTO PERF_MAST_201312 VALUES ('1748', '임하영', 'PB', 1000400, 788000, 2378696);
INSERT INTO PERF_MAST_201312 VALUES ('3120', '김지철', 'PB', , , );
INSERT INTO PERF_MAST_201312 VALUES ('8974', '강성범', 'MASS', 540, , 7700);
INSERT INTO PERF_MAST_201312 VALUES ('3255', '김지연', 'MASS', 254860, 578321, 432004);
INSERT INTO PERF_MAST_201312 VALUES ('8977', '김지현', 'PB', 687063, 870000, 545400);

cmf - 고객번호, seg - 고객등급, t_amt1 - 한달 전 사용금액, t_amt2 - 두 달 전 사용금액, t_amt3 - 세 달 전 사용금액

coalesce함수 사용

1. 3개월 연속 1만원 미만 사용 고객 - 비활성화 고객
2. pb이면서 비활성화 고객
3. 직전 3개월 동안 카드사용금액이 매달 줄어드는 고객
4. 직전 3개월 카드사용금액이 7천원 이상인 고객
5. 3개월 카드사용금액이 매달 줄어들면서 3개월 카드사용 금액이 7천만원 이상인 고객
6. 지난 3개월간 매월 총 카드사용금액 합계
7. 매달 카드 사용금액이 증가하는 고객
8. pb고객의 매달 카드사용금액의 합계
9. 고객 등급별 지난 달 최고 카드사용 고객