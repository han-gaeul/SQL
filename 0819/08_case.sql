-- 단순 조회
SELECT id, gender
from healthcare
LIMIT 5;
-- id  gender
-- --  ------
-- 1   1
-- 2   2
-- 3   2
-- 4   1
-- 5   2


-- 성별 1(남자), 2(여자)
SELECT
    id,
    CASE
        WHEN gender = 1 THEN '남자'
        WHEN gender = 2 THEN '여자'
        -- ELSE
    END AS 성별
FROM healthcare
LIMIT 5;
-- id  성별
-- --  --
-- 1   남자
-- 2   여자
-- 3   여자
-- 4   남자
-- 5   여자


-- 흡연 (smoking)
SELECT DISTINCT smoking
FROM healthcare;

SELECT
    id,
    smoking,
    CASE
        WHEN smoking = 1 THEN '비흡연자'
        WHEN smoking = 2 THEN '흡연자'
        WHEN smoking = 3 THEN '헤비스모커'
        ELSE '무응답'
    END
FROM healthcare
LIMIT 5;
-- id  smoking  CASE
-- --  -------  ----
-- 1   1        비흡연자
-- 2   1        비흡연자
-- 3   1        비흡연자
-- 4   1        비흡연자
-- 5   1        비흡연자


-- 나이에 따라서 구분
-- 청소년(~18), 청년(~40), 중장년(~90)
SELECT
    first_name,
    last_name,
    CASE
        WHEN age <= 18 THEN '청소년'
        WHEN age <= 40 THEN '청년'
        WHEN age <= 90 THEN '중장년'
        ELSE '노년'
    END
FROM users
LIMIT 10;
-- first_name  last_name  CASE
-- ----------  ---------  ----
-- 정호          유          청년
-- 경희          이          청년
-- 정자          구          청년
-- 미경          장          청년
-- 영환          차          청년
-- 서준          이          청년
-- 주원          민          청소년
-- 예진          김          청년
-- 서현          김          청년
-- 서윤          오          청년