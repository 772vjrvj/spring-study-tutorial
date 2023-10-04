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
		인원현황
		<br>
		<div class="row">
			<div class="cell">점검일</div><div class="cell">2019-04-14</div>
		</div>
				<div class="row">
			<div class="cell">점검자</div><div class="cell">홍길동</div>
		</div>
		<div class="row">
			<div class="cell">최종인계자</div><div class="cell">박종덕</div>
		</div>
		<br>
		점검현황
		<div class="row">
			<div class="cell">점검포인트</div><div class="cell">점검항목</div><div class="cell">점검시간</div>
			<div class="cell">야근자</div><div class="cell">비고</div>
		</div>
		<div class="row">
			<div class="cell">1.정문</div><div class="cell"><input type="checkbox">방범장치&nbsp;<input type="checkbox">울타리(환경정리)&nbsp;<input type="checkbox">출입문잠금&nbsp;</div><div class="cell">&nbsp;</div>
			<div class="cell">&nbsp;</div><div class="cell">&nbsp;</div>
		</div>
		<div class="row">
			<div class="cell">2.공장</div><div class="cell"><input type="checkbox">가스라인&nbsp;<input type="checkbox">가스히터&nbsp;<input type="checkbox">에어라인&nbsp;<input type="checkbox">정리정돈&nbsp;<input type="checkbox">조명&nbsp;<input type="checkbox">창문&nbsp;</div><div class="cell">&nbsp;</div>
			<div class="cell">&nbsp;</div><div class="cell">&nbsp;</div>
		</div>
		<div class="row">
			<div class="cell">3.현관</div><div class="cell"><input type="checkbox">1층화장실&nbsp;<input type="checkbox">신발장&nbsp;<input type="checkbox">우편물&nbsp;<input type="checkbox">조명</div>
			<div class="cell">&nbsp;</div><div class="cell">&nbsp;</div><div class="cell">&nbsp;</div>
		</div>
		<div class="row">
			<div class="cell">4.인포멀실</div><div class="cell"><input type="checkbox">잠금상태확인</div>
			<div class="cell">&nbsp;</div><div class="cell">&nbsp;</div><div class="cell">&nbsp;</div>
		</div>
		<div class="row">
			<div class="cell">5.대표이사실</div><div class="cell"><input type="checkbox">잠금상태확인</div>
			<div class="cell">&nbsp;</div><div class="cell">&nbsp;</div><div class="cell">&nbsp;</div>
		</div>
		<div class="row">
			<div class="cell">6.관리지원팀</div><div class="cell"><input type="checkbox">냉난방기&nbsp;<input type="checkbox">조명&nbsp;<input type="checkbox">창문&nbsp;<input type="checkbox">책상정리정돈&nbsp;<input type="checkbox">콘센트&nbsp;<input type="checkbox">PC&nbsp;</div>
			<div class="cell">&nbsp;</div><div class="cell">&nbsp;</div><div class="cell">&nbsp;</div>
		</div>
		<div class="row">
			<div class="cell">7.연구소</div><div class="cell"><input type="checkbox">냉난방기&nbsp;<input type="checkbox">조명&nbsp;<input type="checkbox">창문&nbsp;<input type="checkbox">책상정리정돈&nbsp;<input type="checkbox">콘센트&nbsp;<input type="checkbox">PC&nbsp;</div>
			<div class="cell">&nbsp;</div><div class="cell">&nbsp;</div><div class="cell">&nbsp;</div>
		</div>	
		<div class="row">
			<div class="cell">8.사무실</div><div class="cell"><input type="checkbox">2층화장실&nbsp;<input type="checkbox">냉난방기&nbsp;<input type="checkbox">조명&nbsp;<input type="checkbox">창문&nbsp;<input type="checkbox">책상정리정돈&nbsp;<input type="checkbox">콘센트&nbsp;<input type="checkbox">PC&nbsp;</div>
			<div class="cell">&nbsp;</div><div class="cell">&nbsp;</div><div class="cell">&nbsp;</div>
		</div>	
		<div class="row">
			<div class="cell">9.회의실</div><div class="cell"><input type="checkbox">냉난방기&nbsp;<input type="checkbox">문서보관실&nbsp;<input type="checkbox">조명&nbsp;<input type="checkbox">주방&nbsp;<input type="checkbox">창문&nbsp;</div>
			<div class="cell">&nbsp;</div><div class="cell">&nbsp;</div><div class="cell">&nbsp;</div>
		</div>		
		<div class="row">
			<div class="cell">10.보일러실</div><div class="cell"><input type="checkbox">가스라인&nbsp;<input type="checkbox">급수펌프&nbsp;<input type="checkbox">바닥누수&nbsp;<input type="checkbox">보일러&nbsp;<input type="checkbox">조명&nbsp;<input type="checkbox">환기구&nbsp;</div>
			<div class="cell">&nbsp;</div><div class="cell">&nbsp;</div><div class="cell">&nbsp;</div>
		</div>	
		<div class="row">
			<div class="cell">11.기숙사</div><div class="cell"><input type="checkbox">냉난방기&nbsp;<input type="checkbox">문서보관실&nbsp;<input type="checkbox">조명&nbsp;<input type="checkbox">주방&nbsp;<input type="checkbox">창문&nbsp;</div>
			<div class="cell">&nbsp;</div><div class="cell">&nbsp;</div><div class="cell">&nbsp;</div>
		</div>
		<br>
		지시사항
		<textarea rows="4" cols="50"></textarea>						
	</div>





	<div id="table">
		<br>
		<br>
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