<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="pageObject"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Main Page</title>
<style type="text/css">
.dataRow:hover {
	background: #eee;
	cursor: pointer;
}
</style>
<script type="text/javascript">
	$(function(){
		$(".dataRow").click(function(){
			var module = $(this).data('module');
			var no = $(this).find('.no').text();
			
			var url = "/" + module + "/view.do?no=" + no;
			if(module == 'board') url += "&inc=1";
			location = url
			
		});
	})
</script>

</head>
<body>
	<div class="container">
		<!-- 공지사항과 일반 게시판 -->
		<div class="row">
			<div class=" col-md-6">
				<div class="panel panel-default">
					<div class="panel-heading">공지사항</div>
					<div class="panel-body">
					
						<table class="table">
							<thead>
								<tr>
									<th>번호</th>
									<th>제목</th>
									<th>공지시작일</th>
								</tr>
							</thead>
							<tbody>
								<c:if test="${empty noticeList }">
									<tr>
										<td colspan="5">데이터가 존재하지 않습니다.</td>
									</tr>
								</c:if>
								<c:if test="${!empty noticeList }">
									<c:forEach items="${noticeList }" var="vo">
										<tr class="dataRow" data-module="notice">
											<td class="no">${vo.no }</td>
											<td>${vo.title }</td>
											<td>${vo.startDate }</td>
										</tr>
									</c:forEach>
								</c:if>
							</tbody>
						</table>
						
					</div>
				</div>
			</div>
			
			<div class=" col-md-6">
				<div class="panel panel-default">
					<div class="panel-heading">게시판</div>
					<div class="panel-body">
					
						<table class="table">
							<thead>
								<tr>
									<th>번호</th>
									<th>제목</th>
									<th>작성자</th>
								</tr>
							</thead>
							<tbody>
							
								<c:if test="${empty boardList }">
									<tr>
										<td colspan="5">데이터가 존재하지 않습니다.</td>
									</tr>
								</c:if>
								<c:if test="${!empty boardList }">
									<c:forEach items="${boardList }" var="vo">
										<tr class="dataRow" data-module="board">
											<td class="no">${vo.no }</td>
											<td>${vo.title }</td>
											<td>${vo.writer }</td>
										</tr>
									</c:forEach>
								</c:if>	
							
							</tbody>
						</table>
					
					</div>
				</div>
			</div>
		</div>
		
		<!-- 이미지 게시판 -->
		<div class="row">
			<div class="col-md-12">
				<div class="panel panel-default">
					<div class="panel-heading">이미지</div>
					<div class="panel-body">
					
						<c:forEach items="${imageList }" var="vo" >
							<div class="col-md-3">
								<div class="thumbnail dataRow" data-module="image">
									<img src="${vo.fileName }" alt="${vo.title }" style="width: 100%">
									<div class="caption">
										<p>[<span class="no">${vo.no }</span>] ${vo.title }</p>
									</div>
								</div>
							</div>
						</c:forEach>
					
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>