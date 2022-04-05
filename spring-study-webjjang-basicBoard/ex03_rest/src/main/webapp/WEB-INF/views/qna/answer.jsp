<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>대답하기</title>
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
		<h3>대답하기</h3>

		<form action="answer.do" id="writeForm" method="post">
			<input name="refNo" value="${vo.refNo }" type="hidden">
			<input name="ordNo" value="${vo.ordNo }" type="hidden">
			<input name="levNo" value="${vo.levNo }" type="hidden">
			<div class="form-group">
				<label for="no">제목</label> <input type="text" readonly="readonly"
					placeholder="제목은 4자 이상 입력하셔야 합니다."
					value="${vo.no }"
					class="form-control" id="no" name="no">
			</div>
			<div class="form-group">
				<label for="title">제목</label> <input type="text" required="required"
					placeholder="제목은 4자 이상 입력하셔야 합니다."
					value="[답변]${vo.title }"
					class="form-control" id="title" name="title">
			</div>
			<div class="form-group">
				<label for="comment" >내용</label>
				<textarea class="form-control" rows="5" id="comment" name="content" required="required" placeholder="내용은 4자 이상 입력하셔야 합니다.">


---------------------------------------[질문]---------------------------------------
${vo.content }
					</textarea>
			</div>
			<button type="submit" class="btn btn-default">등록</button>
			<button type="reset" class="btn btn-default">새로입력</button>
			<button type="button" id="cancelBtn" class="btn btn-default">취소</button>
		</form>

	</div>
</body>
</html>