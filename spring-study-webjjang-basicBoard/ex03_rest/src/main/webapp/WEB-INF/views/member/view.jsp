<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내 정보 보기</title>

</head>
<body>
<div class="container">
	<h3>내 정보 보기</h3>
	<table class="table">
		<tbody>
			<tr>
				<th>아이디</th>
				<td>${vo.id }</td>
			</tr>
			<tr>
				<th>이름</th>
				<td>${vo.name }</td>
			</tr>
			<tr>
				<th>성별</th>
				<td>${vo.gender }</td>
			</tr>
			<tr>
				<th>생년월일</th>
				<td>${vo.birth }</td>
			</tr>
			<tr>
				<th>연락처</th>
				<td>${vo.tel }</td>
			</tr>
			<tr>
				<th>이메일</th>
				<td>${vo.email }</td>
			</tr>
			<tr>
				<th>회원가입일</th>
				<td>${vo.regDate }</td>
			</tr>
			<tr>
				<th>상태</th>
				<td>${vo.status }</td>
			</tr>
			<tr>
				<th>등급번호</th>
				<td>${vo.gradeNo }</td>
			</tr>			
			<tr>
				<th>등급명</th>
				<td>${vo.gradeName }</td>
			</tr>
		</tbody>
	</table>
</div>
</body>
</html>