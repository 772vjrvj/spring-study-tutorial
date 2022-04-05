<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="pageObject"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>질문답변 리스트</title>
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<style type="text/css">
.dataRow:hover {
	background: #eee;
	cursor: pointer;
}
</style>
<script type="text/javascript">
	$(function() {
		$(".dataRow").click(function() {
				var no = $(this).find(".no").text();
				location = "view.do?no="+ no 
					+ "&inc=1"
					+ "&page=${pageObject.page}"
					+ "&perPageNum=${pageObject.perPageNum}"
					+ "&key=${pageObject.key}"
					+ "&word=${pageObject.word}";
			});
	})
</script>
</head>
<body>
	<div class="container">
		<h3>질문답변 리스트</h3>
		<table class="table">
			<thead>
				<tr>
					<th>번호</th>
					<th>제목</th>
					<th>작성자(아이디)</th>
					<th>작성일</th>
					<th>조회수</th>
				</tr>
			</thead>
			<tbody>
				<c:if test="${empty list }">
					<tr>
						<td colspan="5">데이터가 존재하지 않습니다.</td>
					</tr>
				</c:if>
				<c:if test="${!empty list }">
					<c:forEach items="${list }" var="vo">
						<tr class="dataRow">
							<td class="no">${vo.no }</td>
							<td>
								<c:forEach begin="1" end="${vo.levNo }">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</c:forEach>
								<c:if test="${vo.levNo > 0 }">
									<i class="material-icons">subdirectory_arrow_right</i>
								</c:if>${vo.title }
							</td>
							<td>${vo.name }(${vo.id })</td>
							<td>${vo.writeDate }</td>
							<td>${vo.hit }</td>
						</tr>
					</c:forEach>
				</c:if>

			</tbody>
		</table>
		<c:if test="${!empty login }">
			<div>
				<a href="question.do" class="btn btn-default">질문하기</a>		
			</div>	
		</c:if>
		<div>
			<pageObject:pageNav listURI="list.do" pageObject="${pageObject }"/>
		</div>
	</div>
</body>
</html>