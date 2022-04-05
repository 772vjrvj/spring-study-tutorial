<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="pageObject"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메시지 리스트</title>

<script type="text/javascript">
$(function(){
	$("#cancelBtn").click(function(){
		history.back();
	});
});
</script>

</head>
<body>
	<div class="container">
		<h3>메시지 리스트</h3>
		<form action="write.do" method="post">
			<div class="form-group">
				<label for="accepter">받는 사람의 아이디</label> 
				<input class="form-control" id="accepter" name="accepter">
			</div>
			<div class="form-group">
				<label for="content">내용</label>
				<textarea class="form-control" rows="5" id="content" name="content" ></textarea>
			</div>
			<button class="btn btn-default">전송</button>
			<button type="reset" class="btn btn-default">새로입력</button>
			<button type="button" class="btn btn-default" id="cancelBtn">취소</button>
		</form>
	</div>
</body>
</html>