<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>


  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  <script type="text/javascript">
	var isMag = true;
	
	 var msg = '${msg}';
	
	if(msg){
		alert(msg);
		isMsg = false;
	} 

</script>
<script type="text/javascript">
$(function(){
	$("#deleteBtn").click(function(){
		if(!confirm("정말 삭제하시겠습니까?")) return false;
	});
});
</script>
</head>
<body>
<div class="container">
	<h3>게시판 글보기</h3>
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
				<td>${vo.content }</td>
			</tr>
			<tr>
				<th>작성자</th>
				<td>${vo.writer }</td>
			</tr>
			<tr>
				<th>작성일</th>
				<td><fmt:formatDate value="${vo.writeDate }" pattern="yyyy.MM.dd"/></td>
			</tr>
			<tr>
				<th>조회수</th>
				<td>${vo.hit }</td>
			</tr>
		</tbody>
	</table>
	<a href="update.do?no=${vo.no }&page=${pageObject.page }&perPageNum=${pageObject.perPageNum}" class="btn btn-default">수정</a>
	<a href="delete.do?no=${vo.no }" class="btn btn-default" id="deleteBtn">삭제</a>
	<a href="list.do?page=${pageObject.page }&perPageNum=${pageObject.perPageNum}" class="btn btn-default">리스트</a>
</div>
</body>
</html>