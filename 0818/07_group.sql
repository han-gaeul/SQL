-- GROUP BY

-- 각 성(last_name)씨가 몇 명씩 있는지 조회
SELECT last_nmae, COUNT(*) FROM users GROUP BY last_name;

-- GROUP BY에서 활용하는 컬럼을 제외하고는 집계함수 사용
SELECT last_name, AVG(age), COUNT(*) FROM users GROUP BY last_name;

-- 참고
SELECT last_name, age, COUNT(*) FROM users WHERE last_name = '곽';

-- GROUP BY는 결과가 정렬되지 않음. 기존 순서와 바뀜
-- 원칙적으로 정렬해서 보고 싶으면 ORDER BY
SELECT 

-- GROUP BY WHERE를 사용하고 싶음
-- 100개 이상인 성만 출력 -> 오류
SELECT last_name, count(last_name) FROM users WHERE COUNT(last_name) > 100 GROUP BY last_name;

-- 조건에 따른 group을 하려면 having을 사용
SELECT last_name, count(last_name) FROM users GROUP BY last_name HAVING COUNT(last_name) > 100;

