-- 스키마 생성
create database test_db_lch;

-- 스키마 사용
USE test_db_lch;

CREATE TABLE user_mst (
	user_code INT PRIMARY KEY AUTO_INCREMENT,
    user_name VARCHAR(10) NOT NULL,
    user_email VARCHAR(50) NOT NULL,
    user_phone VARCHAR(20) NOT NULL,
    create_date DATETIME,
    update_date DATETIME
    ) ENGINE = INNODB;
    
-- 테이블 이름 변경
RENAME TABLE user_mst TO user_mst2;

-- 컬럼 추가
ALTER TABLE user_mst ADD COLUMN gender INT NOT NULL;

-- 컬럼 변경
ALTER TABLE user_mst CHANGE gender user_gender INT;

-- 컬럼 수정
ALTER TABLE user_mst MODIFY COLUMN gender INT NOT NULL AFTER user_phone;

/*
gender를 user_gender 로 바꾸고 
NULL 허용으로 바꾸시오
위치를 user_email 뒤로 보내시오

create_date는 NOT NULL을 추가하십시오

*/

ALTER TABLE user_mst RENAME COLUMN gender TO user_gender;
ALTER TABLE user_mst MODIFY COLUMN user_gender INT AFTER user_email;
ALTER TABLE user_mst MODIFY COLUMN user_gender INT DEFAULT 0;
ALTER TABLE user_mst MODIFY COLUMN create_date DATETIME NOT NULL;

CREATE TABLE youtube_mst (
	youtube_code INT PRIMARY KEY AUTO_INCREMENT,
    youtube_title VARCHAR(100) NOT NULL,
    youtube_name VARCHAR(20) NOT NULL,
    youtube_movie VARCHAR(20) NOT NULL,
	youtube_ex VARCHAR(200) NOT NULL,
    youtube_count int(200) NOT NULL,
    create_date DATETIME,
    update_date DATETIME
    ) ENGINE INNODB;
    
    -- 테이블 추가 및 조회수(10)으로 수정
    
    ALTER TABLE youtube_mst ADD COLUMN youtube_tag VARCHAR(20) NOT NULL AFTER youtube_ex;
    ALTER TABLE youtube_mst MODIFY COLUMN youtube_count int(20) NOT NULL;
    
INSERT INTO
	youtube_mst(
		youtube_code,
		youtube_title,
        youtube_name,
        youtube_movie,
        youtube_ex,
        youtube_count,
        create_date,
        update_date
	)
VALUES(
	0,
    "잔잔한 음악2",
    "음악유튜버",
	"12.mov",
    "베토벤,쇼팽...",
    13,
    now(),
    now());
INSERT INTO
	user_mst(
		user_code,
		user_name,
		user_email,
		user_gender,
		user_phone,
		create_date,
		update_date
        )
-- 모든 컬럼 넣을 떈 user_mst만 해도 됨
VALUES
	(
    0,
    "gildong",
    "gildong@gmail.com",
    1,
    '010-1111-2222',
    now(),
    now()),
    (
    0,
    "gilseo",
    "gilseo@gmail.com",
    0,
    '010-3333-4444',
    now(),
    now()),
    (
    0,
    "gilnam",
    "gilnam@gmail.com",
    1,
    '010-5555-6666',
    now(),
    now()),
    (
    0,
    "gilbook",
    "gilbook@gmail.com",
    0,
    '010-7777-8888',
    now(),
    now());
    
SELECT
	user_name,
    user_email
FROM
	user_mst;
SELECT
	*
FROM
	user_mst;
    
/*
새로운 쿼리 탭을 만드시오
테이블 명 : school_mst
school_code,
school_name,
create_date,
update_date

서울대학교
연새대학교
고려대학교
*/

create table school_mst (
	school_code int primary key auto_increment,
    school_name varchar(10) not null,
    create_date datetime,
    update_date datetime
    ) engine InnoDB;
 
 -- insert into school_mst
insert into 
	school_mst(
    school_code,
    school_name,
    create_date,
    update_date
    )
values (
	0,
    "서울대학교",
    now(),
    now()),
    (
    0,
    "연세대학교",
    now(),
    now()),
    (
    0,
    "고려대학교",
    now(),
    now()),
     (
    0,
    "부산대학교",
    now(),
    now()),
    (
    0,
    "부경대학교",
    now(),
    now()),
     (
    0,
    "동아대학교",
    now(),
    now()),
    (
    0,
    "경성대학교",
    now(),
    now()),
     (
    0,
    "동명대학교",
    now(),
    now()),
    (
    0,
    "부산외국어대학교",
    now(),
    now());
    
    
select school_name from school_mst;

ALTER TABLE school_mst MODIFY COLUMN school_name varchar(10) unique key;
    
select school_code 
from school_mst
where school_name = "부산대학교";

/*
user_email 이 "chaehwan@gmail.com" 있는지 없는지 확인하세요
*/

select user_email
from user_mst
where user_email = "chaehwan@gmail.com";
 
-- 쿼리문에서 같다는 "=" 

select *
from school_mst
where school_name = "부산대학교"
or school_code = 1;

select *
from school_mst
where school_name = "부산대학교" and school_code = 1;

/*
아파트 현관
1. 비밀번호 치기
 - 공동현관 비밀번호
 - 세대현관 현관 비밀번호
 *apt_code apt_num apt_pw
 - BLE
 - 얼굴등록(HOG) 
*/

select *
from school_mst
where school_name = "부산대학교" or school_code = 1
order by create_date desc;                        -- decs는 내림차순 오름차순은 defult임

/*
major_mst 테이블 만들기
major_code
major_name
crete_date
update_date

컴퓨터 공학과
전자공학과
기계공학과
화학공학과
토목공학과
국어국문학과
영어영문학과
유아교육학과
경영학과
정치외교학과

1. 전체 학과 이름을 조회하시오
2. 이름을 가나다 순으로 조회하시오
3. 이름을 가나다 역순으로 조회하시오
*/
create table major_mst (
	major_code int primary key auto_increment,
    major_name varchar(20) not null,
	crete_date datetime,
    update_date datetime
    ) engine = InnoDB;
    
insert into major_mst

values(
	0,
	"컴퓨터공학과",
    now(),
    now()),
    (
    0,
    "전자공학과",
    now(),
    now()),
    (
    0,
    "기계공학과",
    now(),
    now()),
    (
    0,
    "화학공학과",
    now(),
    now()),
    (
    0,
    "토목공학과",
    now(),
    now()),
    (
    0,
    "국어국문학과",
    now(),
    now()),
     (
     0,
    "영어영문학과",
    now(),
    now()),
     (
     0,
    "유아교육학과",
    now(),
    now()),
     (
     0,
    "경영학과",
    now(),
    now()),
     (
     0,
    "정치외교학과",
    now(),
    now());
    
select
	major_name
from major_mst;

select majot_name
from major_mst
order by major_name;

select majot_name
from major_mst
order by major_name desc;

/*
정치외교학과 또는 유아교육학과의 코드를 조회하시오(결과는 가나다 역순입니다)
*/

select major_code
from major_mst
where major_name in ("정치외교학과", "유아교육학과", "기계공학과")
order by major_name desc;

-- 7/23

select *
from major_mst
where major_name like '%공학%';

/*
student_mst

student_code
student_name
student_year
school_code
major_code
major_code
update_date
*/

create table student_mst (
	student_code int primary key auto_increment,
    student_name varchar(20) not null,
    student_year int not null,
    school_code int not null,
    major_code int not null,
	crete_date datetime,
    update_date datetime
    ) engine = InnoDB;
    
select *
from student_mst;

select school_code
from school_mst 
where school_name = "부산대학교";

select student_name
from student_mst
where school_code = (select school_code
					from school_mst
					where school_name = '부산대학교');
                    
select *
from student_mst as sm
left outer join school_mst as scm on(sm.school_code = scm.school_code);

/*
전자공학과, 기계공학과, 화학공학과를 다니는 학생들의 학생 이름과 학교명을 추출하시오
(학교명 가나다 순서대로 추출하시오)
*/

select student_name, school_name
from 
student_mst as sm
left outer join school_mst as scm on (sm.school_code = scm.school_code)
left outer join major_mst as mm on (sm.major_code = mm.major_code)
where major_name in('전자공학과', '기계공학과', '화학공학과')
order by school_name;

select student_code, student_name, student_year
from
student_mst
order by student_year;

select school_name
from
school_mst as scm
left outer join student_mst as sm on (scm.school_code = sm.school_code)
where student_code = 5;

select major_name
from major_mst
order by crete_date desc;

select student_code as '학번', student_name as '이름', school_name as '학교명'
from student_mst as sm
left outer join school_mst as scm on (sm.school_code = scm.school_code)
left outer join major_mst as mm on (sm.major_code = mm.major_code)
where mm.major_code = 5;

select student_year
from student_mst
where student_code = "13";

-- 7/28

/*
부산대, 동명대, 경성대학교에 재학중이거나 공학계열인 학생들을 조회하시오
학교명, 전공, 이름, 학년을 조회하시오
학교명 가나다 순으로 배치하시오
*/    
select 
school_name as '학교명', 
major_name as '전공', 
student_name as '이름', 
student_year as '학년'
from 
student_mst as sm
left outer join school_mst as scm on (sm.school_code = scm.school_code)
left outer join major_mst as mm on (sm.major_code = mm.major_code)
where 
mm.major_name like '%공학%' or 
scm.school_name in ('부산대학교', '동명대학교', '경성대학교')
order by 
scm.school_name;

# 서브쿼리
# 국어국문학과 학생들의 이름을 조회하시오

select student_name,
		(select count(*)
        from
			student_mst) as student_count
from student_mst
where major_code = (select major_code
					from major_mst
					where major_name = '국어국문학과'); -- where 절의 서브쿼리

select *
from student_mst
limit 5, 10;
# (page -1) * n, n

update
	student_mst
set 
	student_name = '홍길서'
where
	student_code = 1;
    
select *
from student_mst;
/*
1. 회원아이디와 이름을 요청 보내서 회원이 존재하는지 확인하시오
2. 회원이 존재하면 회원의 이름, 학년, 학교명, 전공명을 보여주시오
3. 전공을 '화학공학과' 바꾸시오
*/

select *
from student_mst
where student_code = 5 and
student_name = '홍길동5';

select student_name as '회원이름',
	   student_year as '학년',
       school_name as '학교명',
       major_name as '전공명'
from student_mst as sm
left outer join school_mst as scm on (sm.school_code = scm.school_code)
left outer join major_mst as mm on (sm.major_code = mm.major_code)
where student_code = 5 and
student_name = '홍길동5';

update
	student_mst as sm
set 
	major_code = (select major_code
					from major_mst
                    where major_name = '화학공학과')
where student_code = 5 and
student_name = '홍길동5';

select *
from youtube_mst;

update
	youtube_mst
set 
	youtube_count = youtube_count + 1
where
	youtube_code = 1;

-- 7/30
select
	student_name,
    case
		when student_year = 1
        then '해당'
        when student_year > 1
        then '미해당'
	end
from
	student_mst; 

select length(youtube_movie)
from
	youtube_mst;

/*
유튜브 1,2 태그값 수정하십시오
#음악 #라이브 #잠잘때듣는노래 # 숙면 #잠안올때
#째즈 #피아노 #밤

태그값의 길이가 10을 넘어가면 장문태크, 작으면 단문태그로 출력
*/

update
	youtube_mst
set 
	youtube_tag = '#음악 #라이브 #잠잘때듣는노래 #숙면 #잠안올때'
where
	youtube_code = 1;

update
	youtube_mst
set 
	youtube_tag = '#째즈 #피아노 #밤'
where
	youtube_code = 2;
    
select
	youtube_code,
    youtube_title,
    youtube_name,
    youtube_tag,
	case 
		when length(youtube_tag) > 10
		then '장문태그'
		when length(youtube_tag) <= 10
		then '단문태그'
	end as '태그유형'
from youtube_mst;

/*
좋아요 쿼리문
*/

update
	youtube_mst
set 
	youtube_like = case
		when youtube_like = 0
        then 1
        else 0 
	end
where
	youtube_code = 1;

/*
user2_mst
-user_code
-user_name
-user_pw

user2_dtl
-user_code
-user_img_path
-user_age
-user_profile
*/

create table user2_mst(
	user_code INT PRIMARY KEY AUTO_INCREMENT,
    user_name int not null,
    user_pw int not null
) engine = InnoDB;

create table user2_dtl (
	user_code int primary key auto_increment,
    user_img_path varchar(20) not null,
    user_age int(10) not null,
    user_profile varchar(20) not null
    ) engine InnoDB;

/* 08-01 
   모델링
- 현실의 복잡성을 컴퓨터에 담을 수 있는 방법론
*/
    

		
	


