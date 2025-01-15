create database food;

use food;

-- 회원 테이블
CREATE TABLE member (
  user_id varchar(20) NOT NULL, -- 아이디
  user_pw varchar(1024) NOT NULL, -- 비밀번호
  user_name varchar(50) NOT NULL, -- 이름
  user_birth date DEFAULT NULL, -- 생년월일
  user_tel varchar(30) NOT NULL, -- 전화번호
  user_email varchar(40) NOT NULL, -- 이메일
  user_zip varchar(10) NOT NULL, -- 우편번호
  user_address varchar(255) NOT NULL, -- 주소
  user_address_detail varchar(255) NOT NULL, -- 상세주소
  enabled varchar(1) DEFAULT '1', -- 권한
  user_reg_date timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP, -- 회원 가입 일
  PRIMARY KEY (user_id)
);

-- 회원 권한 테이블
CREATE TABLE member_auth (
  user_id varchar(20) NOT NULL, -- 아이디
  auth varchar(100) NOT NULL, -- 권한
  KEY fk_member_auth_user_id (user_id),
  CONSTRAINT fk_member_auth_userid FOREIGN KEY (user_id) REFERENCES member (user_id) ON DELETE CASCADE ON UPDATE CASCADE
);

-- 탈퇴 회원 테이블
CREATE TABLE secession_member (
  user_id varchar(20) NOT NULL,
  user_email varchar(40) NOT NULL,
  PRIMARY KEY (user_id)
);

-- 예약 내역 테이블 
CREATE TABLE loan_history (
  loan_no int(11) NOT NULL AUTO_INCREMENT, -- 예약 번호
  user_id varchar(20) NOT NULL, -- 예약 회원 아이디
  user_email varchar(40) not NULL, -- 예약 회원 이메일
  store_title varchar(100) NOT NULL, -- 예약 음식점 제목
  loan_date timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP, -- 예약 일자
  return_date timestamp NULL DEFAULT NULL, -- 방문 일자
  return_period timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP, -- 예약 기한
  PRIMARY KEY (loan_no),
  KEY loan_history_FK (user_id),
  CONSTRAINT loan_history_FK FOREIGN KEY (user_id) REFERENCES member (user_id)
);

-- 예약 내역 테이블 
CREATE TABLE buy_history (
  buy_no int(11) NOT NULL AUTO_INCREMENT, -- 예약 번호
  store_price int(255) not null, -- 예약 가격
  user_id varchar(20) NOT NULL, -- 예약 회원 아이디
  user_email varchar(40) not NULL, -- 예약 회원 이메일
  store_title varchar(100) NOT NULL, -- 가게 이름
  buy_date timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP, -- 예약 일자
  return_date timestamp NULL DEFAULT NULL, -- 방문 일자
  return_period timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP, -- 예약 방문 기한
  return_status tinyint(1) NOT NULL DEFAULT '0', -- 예약 방문 상태
  PRIMARY KEY (buy_no),
  KEY buy_history_FK (user_id),
  CONSTRAINT buy_history_FK FOREIGN KEY (user_id) REFERENCES member (user_id)
);

-- 장바구니 테이블
CREATE TABLE cart (
  cart_id int(11) NOT NULL AUTO_INCREMENT, -- 예약 음식점 번호
  user_id varchar(20) NOT NULL, -- 예약 회원 아이디
  user_email varchar(40) not NULL, -- 예약 회원 이메일
  store_title varchar(100) NOT NULL, -- 가게 이름
  store_pubdate varchar(20) NOT NULL, -- 맛집 예약일
  storeCount int not null,
  priceStandard int not null,
  PRIMARY KEY (cart_id),
  KEY cart_FK (user_id),
  CONSTRAINT cart_FK FOREIGN KEY (user_id) REFERENCES member (user_id)
);

-- 찜하기 테이블
CREATE TABLE like_history (
  like_no int(11) NOT NULL AUTO_INCREMENT, -- 찜한 가게 번호
  user_id varchar(20) NOT NULL, -- 찜한 회원 아이디
  user_email varchar(40) not NULL, -- 찜한 회원 이메일
  store_title varchar(100) NOT NULL, -- 찜한 가게 제목
  store_publisher varchar(50) NOT NULL, -- 찜한 가게 제목
  storeCount int not null, -- 찜한 가게 갯수
  PRIMARY KEY (like_no),
  KEY like_history_FK (user_id),
  CONSTRAINT like_history_FK FOREIGN KEY (user_id) REFERENCES member (user_id)
);

-- 리뷰 테이블
CREATE TABLE review (
  review_no int(10) NOT NULL AUTO_INCREMENT, -- 후기 게시글 번호
  review_content varchar(8196) NOT NULL, -- 후기 내용
  writer_id varchar(20) NOT NULL, -- 후기 작성자 아이디
  store_isbn bigint NOT NULL, -- 가게 게시글 번호
  review_reg_date timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP, -- 문의사항 등록일
  PRIMARY KEY (review_no),
  KEY review_FK (writer_id),
  CONSTRAINT review_FK FOREIGN KEY (writer_id) REFERENCES member (user_id)
);

-- 답변 테이블
CREATE TABLE reviewanswer (
  reviewanswer_no int(11) NOT NULL AUTO_INCREMENT, -- 답변 번호
  review_no int(11) NOT NULL, -- 문의사항 번호
  reviewanswer_content varchar(8196) NOT NULL, -- 답변 내용
  a_writer_id varchar(20) NOT NULL, -- 답변 작성자 아이디
  reviewanswer_reg_date timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP, -- 답변 등록일
  PRIMARY KEY (reviewanswer_no),
  KEY fk_reviewanswer_review_no (review_no),
  KEY reviewanswer_FK (a_writer_id),
  CONSTRAINT reviewanswer_FK FOREIGN KEY (a_writer_id) REFERENCES member (user_id),
  CONSTRAINT fk_reviewanswer_review_no FOREIGN KEY (review_no) REFERENCES review (review_no) ON DELETE CASCADE ON UPDATE CASCADE
);



-- 추천 가게 테이블
CREATE TABLE recommend_store (
  rec_no int(11) NOT NULL AUTO_INCREMENT, -- 추천 가게 번호
  user_id varchar(20) NOT NULL, -- 추천자 아이디
  store_title varchar(100) NOT NULL, -- 추천 가게 이름
  store_cover varchar(2000) NOT NULL, -- 추천 가게 표지
  recommend_date timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP, -- 추천 가게 등록일
  PRIMARY KEY (rec_no),
  KEY recommend_store_FK (user_id),
  CONSTRAINT recommend_store_FK FOREIGN KEY (user_id) REFERENCES member (user_id)
);

-- 식당 일정 테이블
CREATE TABLE calendar (
  cal_no int(11) NOT NULL AUTO_INCREMENT, -- 일정 번호
  groupId int(11) NOT NULL, -- 그룹 아이디
  user_id varchar(20) NOT NULL, -- 일정 작성자 아이디
  title varchar(1024) NOT NULL, -- 일정 제목
  start date NOT NULL, -- 일정 시작 시간
  end date NOT NULL, -- 일정 종료 시간
  allDay int(11) NOT NULL, -- 하루종일인지
  textColor varchar(50) NOT NULL, -- 글자 색상
  backgroundColor varchar(50) NOT NULL, -- 배경 색상
  borderColor varchar(50) NOT NULL, -- 외곽선 색상
  reg_date timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP, -- 일정 등록 일자
  PRIMARY KEY (cal_no),
  KEY calendar_FK (user_id),
  CONSTRAINT calendar_FK FOREIGN KEY (user_id) REFERENCES member (user_id)
);

-- 공지사항 테이블
CREATE TABLE notice (
  notice_no int(11) NOT NULL AUTO_INCREMENT, -- 공지사항 번호
  notice_title varchar(50) NOT NULL, -- 공지사항 제목
  notice_content varchar(8196) NOT NULL, -- 공지사항 내용
  writer_id varchar(20) NOT NULL, -- 공지사항 작성자 아이디
  writer_name varchar(50) NOT NULL, -- 공지사항 작성자 이름
  notice_reg_date timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP, -- 공지사항 작성일
  notice_views int(11) NOT NULL DEFAULT '0', -- 공지사항 조회수
  notice_img mediumblob, -- 공지사항 첨부파일 경로 
  PRIMARY KEY (notice_no),
  KEY notice_FK (writer_id),
  CONSTRAINT notice_FK FOREIGN KEY (writer_id) REFERENCES member (user_id)
);

-- 공지사항 첨부파일 테이블
CREATE TABLE notice_attach_file (
  uuid varchar(500) NOT NULL, -- uuid
  upload_path varchar(4096) NOT NULL, -- 업로드 경로
  file_name varchar(100) NOT NULL, -- 파일명
  file_type char(1) DEFAULT '1', -- 파일 타입
  notice_no int(11) NOT NULL, -- 공지사항 번호
  PRIMARY KEY (uuid),
  KEY notice_no (notice_no),
  CONSTRAINT notice_attach_file_ibfk_1 FOREIGN KEY (`notice_no`) REFERENCES notice (notice_no) ON DELETE CASCADE ON UPDATE CASCADE
);


-- 문의사항 테이블
CREATE TABLE enquiry (
  enquiry_no int(11) NOT NULL AUTO_INCREMENT, -- 문의사항 게시글 번호
  enquiry_title varchar(1024) NOT NULL, -- 문의사항 제목
  enquiry_content varchar(8196) NOT NULL, -- 문의사항 내용
  writer_id varchar(20) NOT NULL, -- 문의사항 작성자 아이디
  writer_name varchar(50) NOT NULL, -- 문의사항 작성자 이름
  enquiry_hits int(11) NOT NULL DEFAULT '0', -- 문의사항 조회수
  enquiry_reg_date timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP, -- 문의사항 등록일
  PRIMARY KEY (enquiry_no),
  KEY enquiry_FK (writer_id),
  CONSTRAINT enquiry_FK FOREIGN KEY (writer_id) REFERENCES member (user_id)
);

-- 답변 테이블
CREATE TABLE answer (
  answer_no int(11) NOT NULL AUTO_INCREMENT, -- 답변 번호
  enquiry_no int(11) NOT NULL, -- 문의사항 번호
  answer_title varchar(1024) NOT NULL, -- 답변 제목
  answer_content varchar(8196) NOT NULL, -- 답변 내용
  a_writer_id varchar(20) NOT NULL, -- 답변 작성자 아이디
  a_writer_name varchar(50) NOT NULL, -- 답변 작성자 이름
  answer_hits int(11) NOT NULL DEFAULT '0', -- 답변 조회수
  answer_reg_date timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP, -- 답변 등록일
  PRIMARY KEY (answer_no),
  KEY fk_answer_enquiry_no (enquiry_no),
  KEY answer_FK (a_writer_id),
  CONSTRAINT answer_FK FOREIGN KEY (a_writer_id) REFERENCES member (user_id),
  CONSTRAINT fk_answer_enquiry_no FOREIGN KEY (enquiry_no) REFERENCES enquiry (enquiry_no) ON DELETE CASCADE ON UPDATE CASCADE
);

-- 배너 테이블
CREATE TABLE banner (
  user_id varchar(20) NOT NULL, -- 등록자 아이디
  path varchar(4096) NOT NULL, -- 경로
  reg_date timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP, -- 등록일
  KEY banner_FK (user_id),
  CONSTRAINT banner_FK FOREIGN KEY (user_id) REFERENCES member (user_id)
);


-- 이벤트 출력
show variables like 'event%';

-- 이벤트 활성화
set global event_scheduler = on;

-- 등록 된 이벤트 출력
select * from information_schema.EVENTS;

-- 공지사항 삭제 시 공지사항 번호 정렬
DELIMITER //
CREATE PROCEDURE notice_reset()
begin
   SET @CNT = 0;
   UPDATE notice SET notice.notice_no = @CNT:=@CNT+1;
   set @max = (SELECT MAX(notice_no)+ 1 FROM notice); 
   set @str = CONCAT('ALTER TABLE notice AUTO_INCREMENT = ', @max);
   PREPARE qry FROM @str;
   EXECUTE qry;
   DEALLOCATE PREPARE qry;
END //



-- 문의사항 삭제 시 문의사항 번호 정렬
DELIMITER //
CREATE PROCEDURE enquiry_reset()
begin
   SET @CNT = 0;
   UPDATE enquiry SET enquiry.enquiry_no = @CNT:=@CNT+1;
   set @max = (SELECT MAX(enquiry_no)+ 1 FROM enquiry); 
   set @str = CONCAT('ALTER TABLE enquiry AUTO_INCREMENT = ', @max);
   PREPARE qry FROM @str;
   EXECUTE qry;
   DEALLOCATE PREPARE qry;
END //


-- 답변 삭제 시 답변 번호 정렬
DELIMITER //
CREATE PROCEDURE answer_reset()
begin
   SET @CNT = 0;
   UPDATE answer SET answer.answer_no = @CNT:=@CNT+1;
   set @max = (SELECT MAX(enquiry_no)+ 1 FROM enquiry); 
    set @str = CONCAT('ALTER TABLE answer AUTO_INCREMENT = ', @max);
    PREPARE qry FROM @str;
    EXECUTE qry;
    DEALLOCATE PREPARE qry;
END //

-- 초기 관리자 계정 설정
-- id : webdb
-- pw : 12345

insert into member values
("admin", "$2a$10$oyw6645fwRPh9BOpgsVzZuqkSQr1N/b8UGE25hiU0ww7kEQ/e.YPW", "관리자", "2025-01-15", "01012345678",
"store.raon@gmail.com", "63309", "경기도 용인시 기흥구 신갈동 12345", "1", 10, 0, 0, 1, current_timestamp);
insert into member_auth values("admin", "ROLE_MEMBER");
insert into member_auth values("admin", "ROLE_ADMIN");
insert into member_auth values("admin", "ROLE_MASTER");

-- 기본 배너 추가
insert into banner values("admin", "/resources/banner/banner1.png", current_timestamp);
insert into banner values("admin", "/resources/banner/banner2.png", current_timestamp);


