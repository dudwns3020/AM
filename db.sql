#DB 삭제/생성/사용
DROP DATABASE IF EXISTS am;
CREATE DATABASE am;
USE am;

# 게시물 테이블 생성
CREATE TABLE article(
    id INT(10) UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
    regDate DATETIME NOT NULL,
    title CHAR(255) NOT NULL,
    `body` LONGTEXT NOT NULL
);

# 멤버 테이블 생성
CREATE TABLE `member` (
    id INT(10) UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
    regDate DATETIME NOT NULL,
    loginId CHAR(100) NOT NULL,
    loginPw CHAR(100) NOT NULL UNIQUE,
    `name` CHAR(100) NOT NULL
);
# 게시물 데이터 추가 
INSERT INTO article 
SET regDate = NOW(),
title = '제목1',
`body` = '내용1';

INSERT INTO article 
SET regDate = NOW(),
title = '제목2',
`body` = '내용2';

INSERT INTO article 
SET regDate = NOW(),
title = '제목3',
`body` = '내용3';

INSERT INTO article 
SET regDate = NOW(),
title = '제목4',
`body` = '내용4';

INSERT INTO article 
SET regDate = NOW(),
title = '제목5',
`body` = '내용5';

# 회원 데이터 추가
INSERT INTO `member` 
SET regDate = NOW(),
loginId = 'hong123',
loginPw = 'hong123',
`name` = '홍길동';

INSERT INTO `member` 
SET regDate = NOW(),
loginId = 'soon123',
loginPw = 'soon123',
`name` = '홍길순';

INSERT INTO `member` 
SET regDate = NOW(),
loginId = 'admin',
loginPw = 'admin',
`name` = '관리자';

#게시물 테이블에 memberId 칼럼 추가
ALTER TABLE `article` ADD COLUMN memberId INT(10) UNSIGNED NOT NULL AFTER regDate;

DESC article;

#기존의 글은 2번 회원이 작성
UPDATE article
SET memberId = 2
WHERE memberId = 0;

SELECT * FROM article;

SELECT * FROM `member`;