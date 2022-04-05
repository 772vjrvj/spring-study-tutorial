<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이미지 올리기 폼</title>
<meta name="viewport" content="width=device-width, initial-scale=1">

</head>
<body>
	<div class="container">
		<h3>이미지 올리기 폼</h3>

		<form action="write.do" method="post" enctype="multipart/form-data">
			<div class="form-group">
				<label for="title">제목</label> <input type="text"
					class="form-control" id="title" name="title">
			</div>
			<div class="form-group">
				<label for="comment">내용</label>
				<textarea class="form-control" rows="5" id="comment" name="content"></textarea>
			</div>
			<div class="form-group">
				<label for="imageFile">이미지파일</label> <input type="file" class="form-control" id="imageFile" name="imageFile">
			</div>
			<button type="submit" class="btn btn-default">올리기</button>
		</form>

	</div>
</body>
</html>