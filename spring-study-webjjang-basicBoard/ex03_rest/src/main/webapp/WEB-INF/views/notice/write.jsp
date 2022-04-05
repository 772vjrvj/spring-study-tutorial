<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 수정</title>

</head>
<body>
	<div class="container">
		<h3>공지사항 수정</h3>

		<form action="write.do" method="post">
			<div class="form-group">
				<label for="title">제목</label> <input type="text" required="required"
					placeholder="제목 입력 - 3글자 이상 100자 이내"
					class="form-control" id="title" name="title">
			</div>
			<div class="form-group">
				<label for="content">내용</label>
				<textarea class="form-control" rows="7" id="content" name="content" required="required"></textarea>
			</div>
			<div class="form-group">
				<label for="startDate">공지 시작일</label> <input type="date"
					class="form-control" id="startDate" name="startDate" required="required" >
			</div>
			<div class="form-group">
				<label for="endDate">공지 종료일</label> <input type="date"
					class="form-control" id="endDate" name="endDate" required="required" >
			</div>
			<button class="btn btn-default">등록</button>
			<button type="reset" class="btn btn-default">새로입력</button>
			<button type="button" onclick="history.back()" class="btn btn-default">취소</button>
		</form>

	</div>
</body>
</html>