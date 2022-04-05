<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="pageObject"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이미지 게시판 리스트</title>

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
			location = "view.do?no="
			+ no
			+ "&page=${pageObject.page}&perPageNum=${pageObject.perPageNum}";
		});
	})
</script>
<body>
	<div class="container">
		<h3>이미지 게시판 리스트</h3>
		<c:if test="${ !empty login }">
			<!-- 로그인을 한 경우에만 올리기 버튼이 보여진다. -->
			<div>
				<a href="write.do" class="btn btn-default">올리기</a>
			</div>
		</c:if>
		<div>
			<div class="row">
			<c:forEach items="${list }" var="vo" varStatus="vs">
				<!-- 줄바꿈을 하기 위한 코드 -EL 객체의 삼항 연산자 - 조건? T:F -->
				${(vs.index !=0 && (vs.index % 4 ==0))?"</div><div class='row'>":"" }
				<div class="col-md-3 dataRow">
					<div class="thumbnail">
						<img src="${vo.fileName }" alt="Lights" style="width: 100%">
						<div class="caption">
							<p>
								<span class="no">${vo.no }</span>. ${vo.title }
							</p>
						</div>
						<div>${vo.name }(${vo.id })
							<span class="pull-right"><fmt:formatDate value="${vo.writeDate }" pattern="yyyy.MM.dd" /></span>
						</div>
					</div>
				</div>
			</c:forEach>
			</div>
			<div>
				<pageObject:pageNav listURI="list.do" pageObject="${pageObject }"></pageObject:pageNav>
			</div>
			<c:if test="${ !empty login }">
				<!-- 로그인을 한 경우에만 올리기 버튼이 보여진다. -->
				<div>
					<a href="write.do" class="btn btn-default">올리기</a>
				</div>
			</c:if>
		</div>
	</div>
</body>
</html>