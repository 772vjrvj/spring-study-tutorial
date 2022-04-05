<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="pageObject"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메시지 리스트</title>
<style type="text/css">
tr{
	color: #777;
}

.noRead{
	color: #4d0026;
}
.dataRow:hover{
	cursor: pointer;
	background: #eee;
}

</style>
<script type="text/javascript">
	$(function(){
		$(".dataRow").click(function(){
			var no = $(this).find('.no').text();
			location = "view.do?no=" + no;
		});
	})
</script>
</head>
<body>
	<div class="container">
		<h3>메시지 리스트</h3>
			<table class="table">
			<thead>
				<tr>
					<th>번호</th>
					<th>보낸사람</th>
					<th>보낸날짜</th>
					<th>받는사람</th>
					<th>받은날짜</th>
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
						<tr class="dataRow ${(empty vo.acceptDate) ? 'noRead':'' }">
							<td class="no">${vo.no }</td>
							<td>${vo.sender }</td>
							<td>${vo.sendDate }</td>
							<td>${vo.accepter }</td>
							<td>${(empty vo.acceptDate)? "읽지 않음" : vo.acceptDate }</td>
						</tr>
					</c:forEach>
				</c:if>
				<tr>
					<td colspan="5">
						<pageObject:pageNav listURI="list.do" pageObject="${pageObject }"></pageObject:pageNav>
					</td>
				</tr>
				<tr>
					<td colspan="5">
						<a href="write.do" class="btn btn-default">보내기</a>					
					</td>
				</tr>
			</tbody>
		</table>
		
	</div>
</body>
</html>