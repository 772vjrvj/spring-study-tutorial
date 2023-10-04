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
	<select>
		<option>선택</option><option>2019</option><option>2018</option><option>2017</option>
		<option>2016</option><option>2015</option><option>2014</option><option>2013</option>
	</select>년
	<select>
		<option>선택</option><option>1</option><option>2</option><option>3</option>
		<option>4</option><option>5</option><option>6</option><option>7</option><option>8</option>
		<option>9</option><option>10</option><option>11</option><option>12</option>
	</select>월
	작성자:<input type="text"><input type="button" value="검색">&nbsp;&nbsp;<input type="button" value="엑셀저장">
	<div id="table">
		<div class="row">
			<div class="cell">번호</div><div class="cell">날짜</div><div class="cell">작성자</div><div class="cell">시간</div><div class="cell">장소</div>
			<div class="cell">PROJECT<br>(진척도)</div><div class="cell">업무코드<br>(진척도)</div><div class="cell">실행내용<br>(정상근무)</div><div class="cell">소요시간</div>
		</div>	
		<div class="row">
			<div class="cell">1</div><div class="cell">2019-4-12</div><div class="cell">홍길동</div><div class="cell"> 06: 30~07:30</div><div class="cell">본사사무실</div>
			<div class="cell">1904-2222<br>(진척도)</div><div class="cell">1080<br>자동제어 공통</div><div class="cell"> 견적 및 입찰업무 </div><div class="cell">1</div>
		</div>	

	</div>
	<div><a>◁</a><a>1</a><a>2</a><a>3</a><a>▷</a></div>
</div>
</body>
</html>