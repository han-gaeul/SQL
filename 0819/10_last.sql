-- AC/DC의 모든 앨범
-- AC/DC (artists)
-- 앨범 (albums)

-- 앨범 검색하려고 하는데
-- 아티스트는 id로 저장되어 있고
-- AC/DC는 아는데 id를 모른다

-- ID 조회
SELECT ArtistId
FROM artists
WHERE Name = 'AC/DC';

-- 서브쿼리
SELECT *
FROM albums
WHERE ArtistId = (SELECT ArtistId
FROM artists
WHERE Name = 'AC/DC');

