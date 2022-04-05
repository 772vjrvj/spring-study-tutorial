<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>질문하기</title>
<script type="text/javascript">
$(function(){
	$('#cancelBtn').click(function(){
		history.back();
	});
});
</script>
</head>
<body>
	<div class="container">
		<h3>질문하기</h3>

		<form action="question.do" method="post">
			<div class="form-group">
				<label for="title">제목</label> <input type="text" required="required"
					placeholder="제목은 4자 이상 입력하셔야 합니다."
					class="form-control" id="title" name="title">
			</div>
			<div class="form-group">
				<label for="comment" >내용</label>
				<textarea class="form-control" rows="5" id="comment" name="content" required="required"
					placeholder="내용은 4자 이상 입력하셔야 합니다."></textarea>
			</div>
			<button type="submit" class="btn btn-default">등록</button>
			<button type="reset" class="btn btn-default">새로입력</button>
			<button type="button" id="cancelBtn" class="btn btn-default">취소</button>
		</form>

	</div>
</body>
</html>