<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>    
 <%@ taglib tagdir="/WEB-INF/tags" prefix="pageObject" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  
  <style type="text/css">
  	.dataRow:hover{
  		background: #eee;
  		cursor: pointer;
  	}
  </style>
  
<c:if test="${!empty msg }">
	<script type="text/javascript">
	$(function(){
		var isMag = true;
		
		 var msg = '${msg}';
		
		if(msg){
			alert(msg);
			isMsg = false;
		} 	
	});
	</script>
</c:if>
<script type="text/javascript">
$(function() {
	$(".dataRow").click(function(){
		var no =$(this).find(".no").text();
		location = "view.do?no=" + no + "&inc=1&page=${pageObject.page}&perPageNum=${pageObject.perPageNum}";
	});
})
</script>


</head>
<body>
<div class="container">
	<h3>게시판 리스트</h3>
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
		<c:forEach items="${list }" var="vo">
			<tr class="dataRow">
				<td class="no">${vo.no }</td>
				<td>${vo.title }</td>
				<td>${vo.writer }</td>
				<td>
					<fmt:formatDate value="${vo.writeDate }" pattern="yyyy.MM.dd"/>
				</td>
				<td>${vo.hit }</td>
			</tr>
		</c:forEach>
	</tbody>
	
	</table>
	<a href="write.do"><button>글쓰기</button></a>
	<div>
		<pageObject:pageNav listURI="list.do" pageObject= "${pageObject }" ></pageObject:pageNav>
	</div>
</div>
</body>
</html>