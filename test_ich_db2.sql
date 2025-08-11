select concat("java", " ", "python");

select
	concat(major_name, " ", "홍길동")
from
	major_mst
where
	major_code = 2;
 
 -- n번 부터 자르는 함수
 select substring("LAST DBMS" , 3);
   
 -- 특정 문자가 n번 등장할때부터 버리는 함수  
select substring_index("test-last-dbms**1212", '-',2);
select substring_index("test-last-dbms**1212", '-',-1);

select length("hihi2323"); -- 글자수 출력
select lower("Hello World"); -- 소문자로 바꿈
select upper("Hello World"); -- 대문자로 바꿈

-- 공백을 없애는 함수
select trim("   abcdef    "); 

-- 양쪽 지정된 문자열 제거
select trim(both "a" from "abcde aaa dddaaaaa");
-- 뒤쪽 지정된 문자열 제거
select trim(trailing "a" from "abcde aaa dddaaaaa");

-- 앞쪽 지정된 문자열 제거
select trim(leading "a" from "abcde aaa dddaaaaa");

select replace("It is Banana", "Banana", "Apple");

-- 블랙리스트 테이블 만들기  블랙리스트코드 st코드 
create table black_List(
	black_code INT PRIMARY KEY AUTO_INCREMENT,
    student_code int not null
) engine = InnoDB;

insert into black_list 

values(
	0,
    7
);

select 
		concat(school_name," ",
       case
			when bl.student_code != 0
            then "블랙리스트"
            else student_name
	   end
       )as "result"
from student_mst as sm
left outer join school_mst as scm on (sm.school_code = scm.school_code)
left outer join black_list as bl on (bl.student_code = sm.student_code);


select *
from black_list;

-- 문자열에서 해당 문자열이 처음 시작하는 위치 반환
select instr("abcdddpower", "power");

select lpad("banana", 10, 10);
select rpad("banana", 10, 10);

select left("banana",3);
select right("banana", 3);

select mid("abcdefghi",5,2);

-- 2진수로 나타냄
select bin(31);
select oct(31);
select hex(31);

select reverse("123aabc32");
select repeat("gilding", 5);

-- 첫번째로 발견한 문자열의 위치를 반환
select locate("abc", "abcdefghijk");
select position("gildong" IN "abdefdsfsgildong123123");
select instr("abdefdsfsgildong123123", "gildong");

-- 날짜, 시간
-- 년도, 월, 일
select curdate();
-- hh:mm:ss
select curtime();

select now();
select year('2025-08-11');
select month('2025-08-11');
select dayofmonth('2025-08-11');

select adddate('2025-08-11',interval 15 day);
select adddate('2025-08-11',interval 15 month);

select subdate('2025-08-11',interval 15 day);
select subdate('2025-08-11',interval 15 month);

select datediff('2025-08-11','2025-03-11');

select dayofweek(now());

-- 숫자 관련 함수
select 
	sum(student_year)
from
	student_mst;
    
select 
	avg(student_year)
from
	student_mst;

-- 절댓값
select abs(-100);

-- 나머지
select mod(100,3);

-- 제곱
select pow(2,3);
