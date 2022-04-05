<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>질문 답변 보기</title>

</head>
<body>
<div class="container">
	<h3>질문 답변 보기</h3>
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
				<th>작성자</th>
				<td>${vo.name}(${vo.id })</td>
			</tr>
			<tr>
				<th>작성일</th>
				<td>${vo.writeDate}</td>
			</tr>
			<tr>
				<th>조회수</th>
				<td>${vo.hit }</td>
			</tr>
			<tr>
				<th colspan="2">
					<a href="answer.do?no=${vo.no }" class="btn btn-default">답변하기</a>
					<c:if test="${vo.id == login.id || login.gradeNo == 9}">					
						<a href="delete.do?no=${vo.no }" onclick="return confirm('정살 삭제하시겠습니까?')" 
						class="btn btn-default">삭제</a>
					</c:if>
					<a href="list.do" class="btn btn-default">리스트</a>
				</th>
				<td></td>
			</tr>

		</tbody>
	</table>
</div>
</body>
</html>