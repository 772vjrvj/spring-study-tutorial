<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
	#table {display: table; width: 100% }
	.row {display: table-row; }
	.cell {display: table-cell; border: 1px solid #c0c0c0; text-align: center;}
	.cell1{display: table-cell; border: 1px solid #c0c0c0; text-align: left;}
	
</style>
</head>
<body>
<div id="container">
		<div id="table">
			<div class="row">
				<div class="cell">선택일</div><div class="cell">2019-04-12</div><div class="cell">작성자</div><div class="cell">홍길동</div>
				<div class="cell">출근시간</div><div class="cell">09:00</div><div class="cell">퇴근시간</div><div class="cell"> 18:00</div>
				&nbsp;&nbsp;&nbsp;<input type="button" value="+추가"/>
			</div>
			<br>
			<div class="row">
				<div class="cell">시간</div><div class="cell">장소</div><div class="cell">PROJECT<br>(진척도)</div><div class="cell">업무코드<br>(진척도)</div>
				<div class="cell">실행내용<br>(정상근무)</div><div class="cell">소요시간</div>
			</div>
			<div class="row">
				<div class="cell"> 06: 30~07:30</div><div class="cell">본사사무실</div><div class="cell">1904-9020<br>(10%) </div><div class="cell"><span>1080</span><span>자동제어 공통</span></div>
				<div class="cell">견적 및 입찰업무<br>(정상근무)</div><div class="cell">1</div>
			</div>
			<br>
			<h3>결제자 의견</h3>	
			<div class="row">
				<div class="cell"> 결재자</div><div class="cell">일자</div><div class="cell">결재의견 </div>
			</div>
			<div class="row">
				<div class="cell"> 결재자</div>
			</div>
			<br>
			<input type="button" value="의견저장"/>
			<textarea rows="5" cols="30"></textarea>
		</div>
			<br>
	<div id="table">		
		결제 2019.4.12
		<div class="row">
			<div class="cell">이름</div><div class="cell">작성일</div><div class="cell">결재</div>
		</div>
		<div class="row">
			<div class="cell">홍길동</div><div class="cell">04/12 </div><div class="cell">결재</div>
		</div>
				<div class="row">
			<div class="cell">홍길동</div><div class="cell">04/12 </div><div class="cell">결재</div>
		</div>
	</div>
</div>
</body>
</html>