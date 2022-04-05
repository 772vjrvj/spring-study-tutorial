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
		<h3>공지사항 수정</h3>
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
				<label for="content">내용</label>
				<textarea class="form-control" rows="7" cols="60" id="content" name="content">${vo.content }</textarea>
			</div>
			<div class="form-group"><!-- min max로 날짜 다른거 안나오게 다음에 하기 -->
				<label for="startDate">공지 시작일</label> <input type="date" value="${vo.startDate }"
					class="form-control" id="startDate" name="startDate"  >
			</div>	
			<div class="form-group">
				<label for="endDate">공지 종료일</label> <input type="date" value="${vo.endDate }"
					class="form-control" id="endDate" name="endDate"  >
			</div>		
			<button type="submit" class="btn btn-default">수정</button>
			<button type="reset" class="btn btn-default">새로입력</button>
			<button type="button" onclick="history.back()" class="btn btn-default">취소</button>
		</form>
	</div>
</body>
</html>