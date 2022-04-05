 -- 인덱스 만들기
 -- 게시판으로 만들기
 -- 글번호 검색을 많이 한다. -PK이므로 이미 이컬럼으로 만들어 져 있므로 오류가 난다.
 CREATE INDEX idx_board_no
 ON board(no);
 -- 제목 검색
 CREATE INDEX idx_board_title
 ON board(title);
 -- 작성자 검색
 CREATE INDEX idx_board_writer
 ON board(writer);
 -- 제목, 작성자 동시에 검색
 CREATE INDEX idx_board_title_writer
 ON board(title, writer);
 -- ** 검색을 많이하는 테이블인 경우 검색을 많이하는 컬럼을 속도 향상을 위해 인덱스를 만든다.
 