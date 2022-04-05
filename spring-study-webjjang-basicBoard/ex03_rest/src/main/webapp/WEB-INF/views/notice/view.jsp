<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지보기</title>

</head>
<body>
<div class="container">
	<h3>공지 보기</h3>
	<table class="table">
		<tbody>
			<tr>
				<th>번호</th>
				<td>${vo.no }</td>
			</tr>
			<tr>
				<th>제목</th>
				<td>${vo.title }</td>
			</tr>
			<tr>
				<th>내용</th>
				<td><pre style="background: white; border: none; margin: 0; font-size: 11pt; padding: 0;">
				${vo.content }</pre></td>
			</tr>
			<tr>
				<th>공지시작일</th>
				<td>${vo.startDate}</td>
			</tr>
			<tr>
				<th>공지종료일</th>
				<td>${vo.endDate}</td>
			</tr>
			<tr>
				<th>공지 작성일</th>
				<td>${vo.writeDate }</td>
			</tr>
			<tr>
				<th>최근수정일</th>
				<td>${vo.endDate}</td>
			</tr>
			<tr>
				<th colspan="2">
					<a href="update.do?no=${vo.no }" class="btn btn-default">수정</a>
					<a href="delete.do?no=${vo.no }" onclick="return confirm('정살 삭제하시겠습니까?')" 
					class="btn btn-default">삭제</a>
					<a href="list.do" class="btn btn-default">리스트</a>
				</th>
				<td></td>
			</tr>

		</tbody>
	</table>
</div>
</body>
</html>