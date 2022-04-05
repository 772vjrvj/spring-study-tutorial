<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h3>그시글 삭제(리스트)</h3>
<form action="deleteArray.do" method="post">
	<c:forEach begin="1" end="10" varStatus="vs">
		<input name="no" type="checkbox" value="${vs.count}"> ${vs.count}<br>
	</c:forEach>
	<button>삭제</button>
</form>
</body>
</html>