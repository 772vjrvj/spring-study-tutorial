<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이미지 정보수정 폼</title>
<meta name="viewport" content="width=device-width, initial-scale=1">

</head>
<body>
	<div class="container">
		<h3>이미지 정보수정 폼</h3>
		<div>
			사진바꾸기는 이미지 보기의 바꾸기 버튼을 이용하세요.
		</div>
		<form action="update.do" method="post">
			<!-- 페이지 정보나 검색 정보를 숨겨서 넘긴다. -->
			<input name="page" type="hidden" value="${pageObject.page }">
			<input name="perPageNum" type="hidden" value="${pageObject.perPageNum }">
			<div class="form-group">
				<label for="no">번호</label> <input type="text" readonly="readonly" onclick="alert('번호는 수정할 수 없습니다.')"
					class="form-control" id="no" name="no" value="${vo.no }">
			</div>
			<div class="form-group">
				<label for="title">제목</label> <input type="text"
					class="form-control" id="title" name="title" value="${vo.title }">
			</div>
			<div class="form-group">
				<label for="comment">내용</label>
				<textarea class="form-control" rows="5" id="comment" name="content">${vo.content }</textarea>
			</div>
			<button type="submit" class="btn btn-default">바꾸기</button>
		</form>

	</div>
</body>
</html>