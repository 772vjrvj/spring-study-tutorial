<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>서버 내부 처리 오류</title>

	<script src="https://kit.fontawesome.com/a076d05399.js" crossorigin='anonymous'></script>
</head>
<body>
<div class="container">
	<div class="panel panel-default" style="margin-top: 80px;">
		<div class="panel-heading" style="background: #732626; color: white;">
			<h2><i class="fas fa-exclamation-circle" style="font-size:36px;color:white; margin: 0px 15px 0px 15px;"></i>
				서버 내부 처리 오류
			</h2>
		</div>
		<div class="panel-body">
			<ul class="list-group">
				<li class="list-group-item">예외코드 : 500 - JRE 처리 오류</li>
				<li class="list-group-item">메시지 : ${exception.message }</li>
				<li class="list-group-item">이유 : ${exception.cause }</li>
				<li class="list-group-item">
					조치 : 다시 한번 시도해 보세요.<br>
					계속 오류가 나면 전산 담당자에게 연락 주세요. 010-1111-2222
				</li>
				<li class="list-group-item">
					<c:forEach items="${exception.stackTrace }" var="stack">
						${stack }<br>
					</c:forEach>
				</li>
			</ul>
		</div>
		<div class="footer" style="padding:10px;">
			<a href="/board/list.do" class="btn btn-success">게시판(main으로 바꾼다.)</a>
		</div>
	</div>
</div>
</body>
</html>