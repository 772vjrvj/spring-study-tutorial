<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

</head>
<body>
	<div class="container">
		<h3>게시판 글수정 폼</h3>
		<form action="update.do" method="post">
			<input type="hidden" name="page" value="${pageObject.page }">
			<input type="hidden" name="perPageNum" value="${pageObject.perPageNum }">
			<div class="form-group">
				<label for="no">번호</label> <input type="text"
					class="form-control" id="no" name="no" value="${vo.no }" readonly="readonly">
			</div>
			<div class="form-group">
				<label for="title">제목</label> <input type="text"
					class="form-control" id="title" name="title" value="${vo.title }">
			</div>
			<div class="form-group">
				<label for="comment">내용</label>
				<textarea class="form-control" rows="5" id="comment" name="content">${vo.content }</textarea>
			</div>
			<div class="form-group">
				<label for="writer">작성자</label> <input type="text"
					class="form-control" id="writer" name="writer" value="${vo.writer }">
			</div>
			<button type="submit" class="btn btn-default">수정</button>
		</form>
	</div>
</body>
</html>