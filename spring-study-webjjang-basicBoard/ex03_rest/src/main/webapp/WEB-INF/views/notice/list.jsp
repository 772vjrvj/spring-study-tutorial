<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="pageObject"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 리스트</title>
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
		<h3>공지사항 리스트</h3>
		<table class="table">
			<thead>
				<tr>
					<th>번호</th>
					<th>제목</th>
					<th>공지시작일</th>
					<th>공지종료일</th>
					<th>최근수정일</th>
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
							<td>${vo.title }</td>
							<td>${vo.startDate }</td>
							<td>${vo.endDate }</td>
							<td>${vo.updateDate }</td>
						</tr>
					</c:forEach>
				</c:if>

			</tbody>
		</table>
		<a href="write.do"><button>공지등록</button></a>
		<div>
			<pageObject:pageNav listURI="list.do" pageObject="${pageObject }"></pageObject:pageNav>
		</div>
	</div>
</body>
</html>