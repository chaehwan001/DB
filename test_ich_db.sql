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
order by create_date desc;                        -- decs는 내림차순 오름차순은 deafult임

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


    
    

