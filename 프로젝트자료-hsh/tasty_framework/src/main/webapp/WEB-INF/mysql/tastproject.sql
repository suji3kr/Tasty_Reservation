CREATE TABLE Users (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) NOT NULL,
    password VARCHAR(255) NOT NULL,
    age INT NOT NULL,
    email VARCHAR(100) NOT NULL,
    phone VARCHAR(20),
    gender ENUM('M', 'F') NOT NULL
);

INSERT INTO Users (username, password, email, phone, age, gender) VALUES('홍길동', '12345', 'hong123@email.com', 01012341234, 20, 'M');

select * from Users;
drop tables users;

SET FOREIGN_KEY_CHECKS=0;  -- 외래 키 체크 비활성화
DROP TABLE Users;
SET FOREIGN_KEY_CHECKS=1;



CREATE TABLE Restaurants (
    restaurant_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    location VARCHAR(255),
    cuisine VARCHAR(50),
    contact VARCHAR(20)
);

CREATE TABLE Reservations (
    reservation_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    restaurant_id INT,
    reservation_date DATETIME NOT NULL,
    status VARCHAR(20) DEFAULT 'Pending',
    FOREIGN KEY (user_id) REFERENCES Users(user_id),
    FOREIGN KEY (restaurant_id) REFERENCES Restaurants(restaurant_id)
);

CREATE TABLE Admins (
    admin_id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) NOT NULL,
    password VARCHAR(255) NOT NULL
);

CREATE TABLE Notifications (
    notification_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    message TEXT NOT NULL,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES Users(user_id)
);

CREATE TABLE Payments (
    payment_id INT AUTO_INCREMENT PRIMARY KEY,
    reservation_id INT,
    amount DECIMAL(10, 2) NOT NULL,
    payment_date DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (reservation_id) REFERENCES Reservations(reservation_id)
);

SHOW CREATE TABLE reservations;

ALTER TABLE reservations
DROP FOREIGN KEY fk_user_id;




ALTER TABLE reservations
DROP FOREIGN KEY reservations_ibfk_1;

SHOW CREATE TABLE Users;















-- tbl_board 테이블 생성
CREATE TABLE tbl_board (
    bno INT(10) NOT NULL AUTO_INCREMENT, -- Oracle의 sequence를 대체
    title VARCHAR(200) NOT NULL,
    content VARCHAR(2000) NOT NULL,
    writer VARCHAR(50) NOT NULL,
    regdate DATETIME DEFAULT CURRENT_TIMESTAMP, -- sysdate를 CURRENT_TIMESTAMP로 변경
    updatedate DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP, -- 업데이트 시 자동 갱신
    PRIMARY KEY (bno) -- PRIMARY KEY 정의
);

-- tbl_reply 테이블 생성
CREATE TABLE tbl_reply (
    rno INT(10) NOT NULL AUTO_INCREMENT, -- Oracle의 sequence를 대체
    bno INT(10) NOT NULL,
    reply VARCHAR(1000) NOT NULL,
    replyer VARCHAR(50) NOT NULL,
    replyDate DATETIME DEFAULT CURRENT_TIMESTAMP, -- sysdate를 CURRENT_TIMESTAMP로 변경
    updateDate DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP, -- 업데이트 시 자동 갱신
    PRIMARY KEY (rno), -- PRIMARY KEY 정의
    FOREIGN KEY (bno) REFERENCES tbl_board (bno) -- 외래 키 설정
);

-- tbl_board에 데이터 삽입
INSERT INTO tbl_board (title, content, writer)
VALUES ('텍스트 제목', '텍스트 내용', 'user00'); -- bno는 AUTO_INCREMENT로 자동 생성

-- tbl_reply에 데이터 삽입 예시 (옵션)
INSERT INTO tbl_reply (bno, reply, replyer)
VALUES (1, '댓글 내용', 'user01'); -- bno는 tbl_board의 값과 연결
