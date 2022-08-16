# 사전 설정

## 실행

```bash
$ sqlite3 healthcare.sqlite3 
```

## Column 출력 설정

```sql
sqlite3> .headers on 
sqlite3> .mode column
```

## table 및 스키마 조회

```sql
sqlite3> .tables
healthcare

sqlite3> .schema healthcare
CREATE TABLE healthcare (
id PRIMARY KEY,        
sido INTEGER NOT NULL, 
gender INTEGER NOT NULL,
age INTEGER NOT NULL,  
height INTEGER NOT NULL,
weight INTEGER NOT NULL,
waist REAL NOT NULL,   
va_left REAL NOT NULL, 
va_right REAL NOT NULL,

blood_pressure INTEGER 
NOT NULL,
smoking INTEGER NOT NULL,
is_drinking BOOLEAN NOT NULL
);
```

# 문제

### 1. 추가되어 있는 모든 데이터의 수를 출력하시오.

```sql
SELECT COUNT(*) FROM healthcare;
```

```sql
COUNT(*)
--------
1000000
```

### 2. 나이 그룹이 10(age)미만인 사람의 수를 출력하시오.

```sql
SELECT age, COUNT(*) FROM healthcare WHERE age <= 10;
```

```sql
age  COUNT(*)
---  --------
9    300442  
```

### 3. 성별이 1인 사람의 수를 출력하시오.

```sql
SELECT gender, COUNT(*) FROM healthcare WHERE gender = 1;
```

```sql
gender  COUNT(*)
------  --------
1       510689 
```

### 4. 흡연 수치(smoking)가 3이면서 음주(is_drinking)가 1인 사람의 수를 출력하시오.

```sql
SELECT smoking, is_drinking, COUNT(*) FROM healthcare WHERE smoking = 3 AND is_drinking = 1;
```

```sql
smoking  is_drinking  COUNT(*)
-------  -----------  --------
3        1            150361  
```

### 5. 양쪽 시력이(va_left, va_right) 모두 2.0이상인 사람의 수를 출력하시오.

```sql
SELECT va_left, va_right, COUNT(*) FROM healthcare WHERE va_left >= 2.0 AND va_right >= 2.0;
```

```sql
va_left  va_right  COUNT(*)
-------  --------  --------
2.0      2.0       2614    
```

### 6. 시도(sido)를 모두 중복 없이 출력하시오.

```sql
SELECT DISTINCT sido FROM healthcare;
```

```sql
sido
----
36  
27  
11  
31  
41  
44  
48  
30  
42  
43  
46  
28  
26  
47  
45  
29  
49  
```

### 자유롭게 조합해서 원하는 데이터를 출력해보세요.

> 몸무게가 60 이상이면서 혈압이 120 이상인 사람의 수

```sql
SELECT weight, blood_pressure, count(*) FROM healthcare WHERE weight >= 60 and blood_pressure >= 120;
```

```sql
weight  blood_pressure  count(*)
------  --------------  --------
60      127             445190  
```

