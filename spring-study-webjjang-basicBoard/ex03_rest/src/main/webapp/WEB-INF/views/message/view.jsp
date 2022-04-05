<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="pageObject"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메시지 보기</title>


</head>
<body>
	<div class="container">
		<h3>메시지 보기</h3>
		<table class="table">
		<tbody>
			<tr>
				<th>번호</th>
				<td>${vo.no }</td>
			</tr>
			<tr>
				<th>내용</th>
				<td><pre style="border: none; padding: 0;">
				${vo.content }</pre></td>
			</tr>
			<tr>
				<th>보낸 사람</th>
				<td>${vo.sender}</td>
			</tr>
			<tr>
				<th>보낸 날짜</th>
				<td>${vo.sendDate}</td>
			</tr>
			<tr>
				<th>받은 사람</th>
				<td>${vo.accepter}</td>
			</tr>
			<tr>
				<th>받은 날짜</th>
				<td>${vo.acceptDate}</td>
			</tr>
			<tr>
				<td colspan="2">
					<!-- 상대가 읽지 않았으면 삭제 가능 -->
					<c:if test="${ !(vo.sender == login.id && !empty vo.acceptDate) }">
						<a href="delete.do?no=${vo.no }" class="btn btn-default">삭제</a>
					</c:if>
				</td>
			</tr>
		</tbody>
	</table>

	</div>
</body>
</html>