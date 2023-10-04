<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style type="text/css">
	.th{border: 1px solid #c0c0c0; text-align: center; background-color: #f2f2f2; font-size: 13px; }
	td{border: 1px solid #c0c0c0; text-align: center;font-size: 13px;}
</style>
<title>Insert title here</title>
</head>
<body>
<div id="container">
		<table>
			<tr>
				<td class="th">선택일</td><td>2019-04-12</td><td class="th">작성자</td><td>홍길동</td>
				<td class="th">출근시간</td><td>09:00</td><td class="th">퇴근시간</td><td> 18:00</td>
				&nbsp;&nbsp;&nbsp;<input type="button" value="+추가"/>
			</tr>
			<br>
			<tr>
				<td class="th">시간</td><td class="th">장소</td><td class="th">PROJECT<br>(진척도)</td><td class="th">업무코드<br>(진척도)</td>
				<td class="th">실행내용<br>(정상근무)</td><td class="th">소요시간</td>
			</tr>
			<tr>
				<td> 06: 30~07:30</td><td>본사사무실</td><td>1904-9020<br>(10%) </td><td><span>1080</span><span>자동제어 공통</span></td>
				<td>견적 및 입찰업무<br>(정상근무)</td><td>1</td>
			</tr>
			<br>
			<h3>결제자 의견</h3>	
			<tr>
				<td class="th"> 결재자</td><td class="th">일자</td><td class="th">결재의견 </td>
			</tr>
			<tr>
				<td> 결재자</td>
			</tr>
			<br>
			<input type="button" value="의견저장"/>
			<textarea rows="5" cols="30"></textarea>
		</table>
			<br>
	<table>		
		결제 2019.4.12
		<tr>
			<td>이름</td><td>작성일</td><td>결재</td>
		</tr>

	</table>
</div>
</body>
</html>