### `SQL 기본`

***

#### 1️⃣ 관계형 DB 개요

- `DB` 
  - 데이터를 일정한 형태로 저장해 놓은 것
  - DBMS를 이용하여 효율적인 데이터 관리와 데이터 손상 복구 가능
  - 종류
    - 계층형 DB : 트리 형태의 자료구조에 데이터 저장. 1:N 관계 표현
    - 네트워크형 DB : 오너와 멤버 형태로 데이터 저장. M:N 관계 표현
    - 관계형 DB : 릴레이션에 데이터 저장. 집합 연산과 관계 연산 가능
- `관계형 DB (RDB; Relational Database)`
  - 정규화를 통해 이상현상 및 중복 데이터 제거
  - 동시성 관리와 병행 제어를 통해 데이터 동시 조작 가능
  - 집합 연산
    - 합집합(Union)
    - 차집합(Difference)
    - 교집합(Intersection)
    - 곱집합(Cartesian Product) : 각 릴레이션에 존재하는 모든 데이터를 조합
  - 관계 연산
    - 선택 연산(Selection) : 조건에 맞는 행(튜플) 조회
    - 투영 연산(Projection) : 조건에 맞는 칼럼(속성)조회
    - 결합 연산(Join) : 공통 속성을 사용하여 새로운 릴레이션 생성
    - 나누기 연산(Division) : 공통요소를 추출하고 분모 릴레이션의 속성을 삭제한 후 중복된 행 제거
- `SQL(Structured Query Language)`
  - RDB에서 사용하는 언어
  - 데이터 조회 및 신규 데이터 입력/수정/삭제 기능 제공
  - 종류
    - DML(Data Manipulation Language) *ISUD*
      - 데이터 조작어
      - SELECT : 데이터 조회 명령어
      - INSERT, UPDATE, DELETE : 데이터 변형 명령어
    - DDL(Data Definition Language) *CA_D*
      - 데이터 정의어
      - 데이터 구조 관련 명령어
      - CREATE, ALTER DROP
    - DCL(Data Control Language)
      - 데이터 제어어
      - DB 접근 권한 부여 및 회수 명령어
      - GRANT, REVOKE
    - TCL(Transaction Control Language)
      - 트랜잭션 제어어
      - DML로 조작한 결과를 논리적인 작업단위 별로 제어
      - COMMIT, ROLLBACK
- `테이블(Table)`
  - RDB의 기본 단위
  - 데이터를 저장하는 객체
  - 칼럼과 행의 2차원 구조

***

#### 2️⃣ DDL

- `데이터 타입` *(앞은 Oracle, 뒤는 SQL Server)*

  - CHAR(L)
    - 고정 길이 문자열
    - 할당된 변수 값의 길이가 L 이하일 때 차이는 공백으로 채워짐
  - VARCHAR2(L), VARCHAR(L)
    - 가변 길이 문자열
    - 할당되는 변수 값의 길이의 최대값이 L
    - 문자열은 가능한 최대 길이로 설정
  - NUMBER(L, D)
    - 숫자형 (L은 전체 자리 수, D는 소수점 자리 수)
    - SQL ServerSMS NUMERIC, DECIMAL, FLOAT, REAL 등
  - DATE, DATETIME
    - 날짜형
    - 데이터 크기 지정이 필요하지 않음

- `CREATE TABEL`

  ```sql
  CREATE TABLE 테이블명 (칼럼명 데이터타입 제약조건, ...);
  ```

  - 테이블 및 칼럼 명명 규칙

    - 알파벳
    - 숫자
    - `_`
    - `$`
    - `#`
    - 대소문자 구분하지 않음
    - 테이블명은 단수형 권고

  - 제약 조건

    - 데이터 무결성 유지가 목적
    - 복제 테이블에는 기존 테이블 제약 조건 중 NOT NULL만 적용
    - PRIMARY KEY
      - 테이블 당 하나의 기본키만 정의 가능
      - 기본키 생성시 DBMS가 자동으로 인덱스를 생성함
      - NULL 불가
    - FOREIGN KEY
      - 다른 테이블의 기본키를 외래키로 지정
      - 참조 무결성 제약 조건

    ```sql
    ALTER TABLE 테이블명 ADD CONSTRAINT 칼럼명 FOREIGN KEY (칼럼명) REFERENCES 테이블명(칼럼명);
    ```

    - UNIQUE KEY

      - 행 데이터를 식별하기 위해 생성함
      - NULL 가능

    - DEFAULT

      - DEFAULT 값으로 기본값 설정

    - NOT NULL

      💡 NULL : 아직 정의되지 않은 값 또는 현재 데이터를 입력하지 못하는 값

      1. 수치 연산은 NULL
      2. 비교 연산은 FALSE 출력

    - CHECK

      - 입력값의 종류 및 범위 제한

  - DESCRIBE 테이블명, sp_help 'dbo.테이블명'

    - 테이블 구조 확인
    - 'DESCRIBE 테이블명'이 ANSI/SIO 표준

- `ALTER TABLE`

  - 테이블의 칼럼 관련 변경 명령어

  - 칼럼 추가

    ```sql
    ALTER TABLE 테이블명 ADD (칼럼명 데이터타입);
    ```

    - 마지막 칼럼으로 추가됨 (칼럼 위치 지정 불가)

  - 칼럼 삭제

    ```sql
    ALTER TABLE 테이블명 DROP COLUMN 칼럼명;
    ```

    - 삭제 후 복구 불가

  - 칼럼 설정 변경

    ```sql
    ALTER TABLE 테이블명 MODIFFY (칼럼명 데이터타입 제약조건);
    ```

    - NULL만 있거나 행이 없는 경우에만 칼럼의 크기 축소 가능
    - NULL만 있을 때는 데이터 유형도 변경 가능
    - NULL이 없으면 NOT NULL 제약조건 추가 가능
    - 기본값 변경 작업 이후 발생하는 데이터에 대해서만 기본값이 변경됨

  - 칼럼명 변경

    ```sql
    ALTER TABLE 테이블명 RENAME COLUMN 칼럼명;
    ```

    - ANSI/ISO 표준에 명시된 기능 아님

  - 제약 조건 추가

    ```sql
    ALTER TABLE 테이블명 ADD CONSTRAINT 제약조건;
    ```

  - 제약조건 제거

    ```sql
    ALTER TABLE 테이블명 DROP CONSTRAINT 제약조건;
    ```

- `RENAME TABLE`

  ```sql
  RENAME 테이블명 TO 테이블명; (ANSI/ISO 표준)
  ```

  > ALTER TABLE 테이블명 RENAME TO 테이블명 도 가능

- `DROP TABLE`

  ```sql
  DROP TABLE 테이블명;
  ```

  - 테이블의 데이터와 구조 삭제, 복구 불가

  - CASCADE CONSTRAINT 옵션으로 관련 테이블의 참조 제약조건도 삭제하여 참조 무결성을 준수할 수 있음

    *(CREATE TABLE에서 ON DELETE CASCADE 옵션으로도 동일 기능 실현 가능)*

- `TRUNCATE TABLE`

  ```sql
  TRUNCATE TABLE 테이블명;
  ```

  - 테이블의 전체 데이터 삭제 (⬌ DROP TABLE은 테이블 자체를 제거함)
  - 로그를 기록하지 않기 때문에 ROLLBACK 불가

***

#### 3️⃣ DML

- `INSERT`

  ```sql
  INSERT INTO 테이블명 (칼럼명, ...) VALUES (필드값, ...);
  
  INSERT INTO 테이블명 VALUES (필드값, ...);
  ```

  - 데이터 입력

- `UPDATE`

  ```sql
  UPDATE 테이블명 SET 칼럼명=필드값;
  ```

  - 데이터 수정

- `DELETE`

  ```sql
  DELETE FROM 테이블명 WHERE 조건절;
  
  DELETE FROM 테이블명;
  ```

  - 데이터 삭제
  - DELETE로 데이터를 삭제해도 테이블 용량은 초기화되지 않음 (⬌ TRUNCATE로 삭제하면 초기화 됨)
  - ⬌ DROP은 객체 삭제 명령어

- `SELECT`

  - 칼럼별 데이터 선택

  ```sql
  SELECT 칼럼명 FROM 테이블명;
  ```

  - 데이터 중복 없이 선택

  ```sql
  SELECT DISTINCT 칼럼명 FROM 테이블명;
  ```

  - 전체 칼럼의 데이터 선택

  ```sql
  SELECT * FROM 테이블명;
  ```

  💡 엘리어스(Alias)

  - SELECT 칼럼명 AS '별명' : 출력되는 칼럼명 설정
  - FROM 테이블명 별명 : 쿼리 내에서 사용할 테이블명 설정. 칼럼명이 중복될 경우 SELECT절에서 엘리어스 필수

- `문자열의 합성 연산자`
  - `+`, CONCAT 함수로도 2개 문자열 합성 가능
  - Oracle에서는 `||`도 가능
- `DUAL`
  - Oracle의 기본 더미 테이블
  - 연산 수행을 위해 사용됨

***

#### 4️⃣ TCL

- `트랜잭션`

  - DB의 논리적 연산 단위
  - 하나 이상의 SQL문을 포함
  - 특성 *AGID*
    - 원자성(Atomicty) : 전부 실행되거나 전형 실행되지 않음(All or Nothing)
    - 일관성(Consistency) : 트랜잭션으로 인한 DB 상태의 모순이 없음
    - 고립성(Isolation) : 부분적인 실행 결과에 다른 트랜잭션이 접근할 수 없음. LOCKING으로 고립성 보장
    - 영속성(Durability) : 트랜백션의 결과는 영구적으로 저장됨

- `TCL`

  - 데이터 무결성 보장을 목적으로 함
    - 영구 변경 전 확인과 연관 작업이 동시처리 가능
  - Oracle은 SQL 문장을 실행하면 트랜잭션이 시작되고 TCL을 실행하면 트랜잭션이 종료됨
  - DDL을 실행하면 자동 커밋 (DML 이후 커밋 없이 DDL을 실행해도 자동 커밋)
  - DB를 정상적으로 종료하면 자동 커밋. 애플리케이션 등의 이상으로 DB 접속이 단절되면 자동 롤백

- `COMMIT`

  - 데이터를 DB에 영구적으로 반영하는 명령어

  - 커밋시 트랜잭션이 완료되어 LOCKING이 해제됨

  - SQL Server는 기본적으로 자동 커밋

  - COMMIT 전

    - 데이터 변경이 메모리 버퍼에만 영향을 받았기 때문에 복구 가능

      *(NOLOGGING 옵션 사용시 버퍼 캐시의 기록을 생략하여 입력 성능이 향상 됨)*

    - 사용자는 SELECT절로 결과를 확인할 수 있으나 다른 사용자는 현재 결과를 볼 수 없음

    - 변경된 해에 LOCKING이 설정되어 다른 사용자가 변경할 수 없음

      *(LOCKING이 안 걸린 상태일 때 여러 사용자가 데이터를 변경하면 상관 없음)*

  - COMMIT 후

    - 변경 사항이 DB에 반영되고 이전 데이터는 복구 불가
    - 모든 사용자가 결과를 볼 수 있음
    - LOCKING이 해제되어 다른 사용자가 행을 조작할 수 있음

- `ROLLBACK`

  - 트랜잭션 일부만 롤백 할 수 있도록 중간 상태를 저장하는 명령어
  - 'ROLLBACK TO 저장점명' 시 해당 저장점 상태로 돌려줌
  - 동일한 저장점명이 있으면 나중 저장점이 유효함
  - SQL Server에서는 'BEGIN TRAN'으로 명시해야 가능

***

#### 5️⃣ WHERE절

- `WHERE`

  ```sql
  SELECT 칼럼명 FROM 테이블명 WHERE 조건절;
  ```

- `연산자`

  - 종류

    - 비교 연산자

      - `=`, `>`, `>=`, `<`, `<=`
      - 비교 대상 데이터 타입에 따라 자동으로 형 변환되는 경우도 있음

    - 부정 비교 연산자

      - 'NOT 칼럼명 비교 연산자'와 동일
      - 부등호 : `!=`, `^=`, `<>` (ISO 표준)

    - SQL 연산자

      - 입력값을 비교하여 논리값 출력

      - BETWEEN A AND B : A와 B 사잇값

      - IN (리스트) : 리스트 내의 값

      - LIKE '문자열' : 문자열의 형태와 일치하는 값

        💡 와일드카드 : `%`는 0개 이상의 문자, `_`는 1개의 단일 문자

      - IS NULL : NULL은 등호로 판단 불가 *어떤 상황에서도*

      - NOT BETWEEN A AND B, NOT IN (리스트), IS NOT NULL

    - 논리 연산자

      - AND, OR, NOT

  - 우선 순위

    - 부정 연산자 > 비교 연산자 > 논리 연산자

    1. `()`
    2. NOT
    3. 비교 연산자 및 SQL 연산자
    4. AND
    5. OR

  - 문자열 비교방법

    - CHAR vs CHAR
      - 첫 서로 다른 문자열 값으로 비교 (뒤 순서가 더 큰 값)
      - 길이가 다를 때 공백을 추가하여 길이 맞춤 (공백 수만 다르면 같은 값)
    - CHAR vs VARCHAR
      - 첫 서로 다른 문자열 값으로 비교
      - 길이가 다르면 길이가 긴 값이 크다고 판단
      - VARCHAR의 공백도 문자로 판단
      - TRIM 함수로 VARCHAR의 공백 제거하고 판단할 수 있음
    - CHAR vs 상수
      - 상수를 변수 타입으로 바꿔 비교

- `부분 범위 처리`

  - ROWNUM (Oracle)

    - SQL 처리 결과 집합의 각 행에 임시로 부여되는 번호
    - 조건절 내에서 행의 개수를 제한하는 목적으로 사용함

  - TOP (SQL Server)

    - 출력 행의 수 제한 함수
    - 'TOP (N)'로 N개 행 출력
    - 개수 대신 비율로도 제한 가능

    💡 ORDER BY절이 없으면 ROWNUM과 TOP의 기능이 같음

***

#### 6️⃣ 함수

- `단일 행 함수`

  - SELECT절, WHERE절, ORDER BY절에 사용 가능

  - 각 행에 개별적으로 적용

  - 여러 인자를 입력해도 단 하나의 결과만 출력

  - 문자형 함수

    - 문자열 입력시 문자열이나 숫자 반환
    - LOWER, UPPER, LENGTH
    - CONCAT : 문자열 결합
    - SUBSTR : 문자열 부분 추출
    - LTRIM, RTRIM, TRIM : 왼쪽 공백 제거, 오른쪽 공백 제거, 양쪽 공백 제거
    - ASCII : 아스키 코드값 출력

  - 숫자형 함수

    - ABS, SIGN : 절대값 부호 (1, 0, -1 중 출력)
    - MOD : 나머지, 연산자 `%`로 대체 가능
    - ROUND, CEIL, FLOOR : 반올림, 올림, 버림 *('함수(E, N)'으로 소수점 이후 N번째 자리까지 출력)*
    - TRUNC : 숫자형 부분 추출

  - 날짜형 함수

    - SYSDATE : 현재 시각 출력 (년, 월, 일, 시, 분, 초)
    - EXTRACT : 날짜형 부분 추출

    ```sql
    SELECT EXTRACT(부분 FROM SYSDATE) FROM DUAL;
    ```

    - ±숫자, ±숫자/24 : 일자 연산, 시간 연산
    - NEXT_DAY : 지정된 요일 첫 날짜 출력

  - 변환형 함수

    - 데이터 타입 변환

    - 명시적 형변황 방식

    - TO_NUMBER

    - TO_CHAR

    - TO_DATE (Oracle)

      