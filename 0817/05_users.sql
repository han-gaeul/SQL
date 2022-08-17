

CREATE TABLE users (
    first_name TEXT NOT NULL,






-- 30세 이상인 사람들
SELECT * FROM users WHERE age >= 30;
-- 30세 이상인 사람들의 이름
SELECT first_name FROM users WHERE age >= 30;
-- 30시 이상인 사람들의 이름 3명만
SELECT first_name FROM users WHERE age >= 30 LIMIT 3;
-- 30세 이상이고 성이 김인 사람
SELECT age, first_name FROM users WHERE age >= 30 AND last_name = '김';

-- 30세 이상인 사람들의 숫자
SELECT COUNT(*) FROM users WHERE age >= 30;
-- 전체 중에 가장 작은 나이
SELECT MIN(age) FROM users;
-- 이씨 중에 가장 작은 나이
SELECT MIN(age), first_name FROM users WHERE laso_name = '이';
-- 이씨 중에 가장 작은 나이를 가진 사람의 이름과 계좌 잔고
SELECT MIN(age), first_name, balance FROM users WHERE laso_name = '이';
-- 30세 이상인 사람들의 평균 나이
SELECT AVG(age) FROM users WHERE age >= 30;
-- 계좌 잔고가 가장 높은 사람
SELECT MAX(balance), first_name FROM users;
-- 나이가 30 이상인 사람의 계좌 평균 잔액
SELECT AVG(balance) FROM users WHERE age >= 30;


-- 지역 번호가 02인 사람
SELECT * FROM users WHERE phone LIKE '02-%';
-- 지역 번호가 02인 사람의 수
SELECT COUNT(*) FROM users WHERE phone LIKE '02-%';
-- 이름이 '준'으로 끝나는 사람
SELECT * FROM users WHERE first_name LIKE '%준';
-- 중간 번호가 5114인 사람
SELECT * FROM users WHERE phone LIKE '%-5114-%';


-- 나이 오름차순
SELECT first_name FROM users ORDER BY age ASC LIMIT 10;
-- ASC 생략 가능
SELECT first_name FROM users ORDER BY age LIMIT 10;
-- 나이, 성 순으로 오름차순 10개
SELECT * FROM users ORDER BY age, last_name LIMIT 10;
-- 계좌 잔액 내림차순 정렬해서 성과 이름 10개
SELECT last_name, first_name, balance FROM users ORDER BY balance DESC LIMIT 10;
-- 계좌 잔액 내림차순, 성 오름차순
SELECT last_name, first_name, balance FROM users ORDER BY balane DESC, last_name ASC LIMIT 10;
