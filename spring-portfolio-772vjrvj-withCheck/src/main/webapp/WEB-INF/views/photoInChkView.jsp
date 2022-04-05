<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%request.setCharacterEncoding("utf-8");  %>
<%response.setContentType("text/html; charset=utf-8");%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Certification</title>
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
<jsp:include page="head.jsp"/>
<jsp:include page="style.jsp"/>

<style type="text/css">
table {
	margin: 0 auto;
	width: 1100px;
	
}
th {
	color: white;
	text-align: center;
	height: 35px;
}

td {
	text-align: center;
	height: 35px;
}


h4 {
	text-align: center;
	color: black;
	font-weight: bolder;
}

h5 {
	text-align: center;
	color: #245682;
	font-weight: bold;
}

body {
	margin: 0 auto 0 auto;
}

#container {
	width: 1200px;
	margin: auto;
}

#photo{
	display:inline-block;
	width:300px;
	height:300px;
	
}

#image_section{
	width:200px;
	height:200px;
	border: solid 1px #a9a9a9;
}

#tit{
	margin-top: 40px;
	font-size: 24px;
	text-align: center;
}
</style>
</head>
<body>
	<div id="container">
		<div id="tit">
			<span style="font-size: 20px;">${dto.title}</span> - ${map.ToYear1}. ${map.ToMonth1}. ${map.ToDate1} (<span style="color: red">${diffdays}</span>/${dto.term})
				<br/>
			<input type="button"class="btn btn-default btn-xs"  value="전체달력" onclick="location.href='habitCalWithDetailView2.do?pKey=${dto.pKey}&id=${dto.id}'"/>
		</div>		
			
		<table style=" align-content: center;">
			<tr><td><br/><br/></td></tr>

			<c:forEach var="list" items="${list}" varStatus="status">
				<c:choose>
					<c:when test="${(status.count)%4 eq 1}">
						<tr>
					</c:when>
				</c:choose>	
				
				<td>
					<c:choose>
						<c:when test="${list.inChkPhoto2 eq null or list.inChkPhoto2 eq '' }">
							<img id="image_section" src="img/white.png"/>
						</c:when>
						
						<c:otherwise>
							<img id="image_section" src="resources/${list.inChkPhoto2}"/>
						</c:otherwise>
					</c:choose>
				
					<div>ID: ${list.id}</div>
						
					<input type="button" class="btn btn-default btn-xs"  value="내용보기"  onclick="location.href='photoInChkCrud.do?id=${list.id}&inChkDate=${list.inChkDate}&pKey=${list.pKey}&crud=content'"/>
				</td>
			</c:forEach>
		</table>
	</div>
</body>
</html>