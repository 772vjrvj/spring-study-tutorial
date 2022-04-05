<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="pageObject"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 리스트</title>

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
		<h3>게시판 리스트</h3>

		<form class="navbar-form">
			<div class="input-group">
				<div class="form-group navbar-left">
					<select name="key" class="form-control">
						<option value="t" ${(pageObject.key == "t")?"selected":"" }>제목</option>
						<option value="c" ${(pageObject.key == "c")?"selected":"" }>내용</option>
						<option value="w" ${(pageObject.key == "w")?"selected":"" }>작성자</option>
						<option value="tc" ${(pageObject.key == "tc")?"selected":"" }>제목/내용</option>
						<option value="tw" ${(pageObject.key == "tw")?"selected":"" }>제목/작성자</option>
						<option value="cw" ${(pageObject.key == "cw")?"selected":"" }>내용/작성자</option>
						<option value="tcw" ${(pageObject.key == "tcw")?"selected":"" }>모두</option>
					</select> <input type="text" class="form-control" placeholder="Search"
						name="word" value="${pageObject.word }">
				</div>

				<div class="input-group-btn">
					<button class="btn btn-default" type="submit">
						<i class="glyphicon glyphicon-search"></i>
					</button>
				</div>
			</div>
		</form>


		<table class="table">
			<thead>
				<tr>
					<th>번호</th>
					<th>제목</th>
					<th>작성자</th>
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
							<td>${vo.title }</td>
							<td>${vo.writer }</td>
							<td><fmt:formatDate value="${vo.writeDate }"
									pattern="yyyy.MM.dd" /></td>
							<td>${vo.hit }</td>
						</tr>
					</c:forEach>
				</c:if>	
			
			</tbody>
		</table>
		
		<a href="write.do"><button>글쓰기</button></a>
		<div>
			<pageObject:pageNav listURI="list.do" pageObject="${pageObject }"></pageObject:pageNav>
		</div>
	</div>
</body>
</html>