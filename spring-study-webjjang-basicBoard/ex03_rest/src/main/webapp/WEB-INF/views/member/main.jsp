<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Main Page</title>

</head>
<body>
	<div class="container">
		<h1>Main Page</h1>
		<!-- 일반 사용자 : 로그인이 안된 상태 -->
		<c:if test="${empty login }">
			<a href="/member/login.do" class="btn btn-default">로그인</a>
			<a href="/member/clouse.do" class="btn btn-default">회원가입</a>
		</c:if>
		<!-- 일반 회원이상 : 로그인 된 상태 -->
		<c:if test="${!empty login }">
			<a href="/member/logout.do" class="btn btn-default">로그아웃</a>
			<a href="/member/view.do" class="btn btn-default">내 정보 보기</a>
			<c:if test="${login.gradeNo == 9 }">
				<a href="/member/list.do" class="btn btn-default">회원 리스트</a>
			</c:if>
		</c:if>
	</div>
</body>
</html>