<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="//ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/themes/smoothness/jquery-ui.css">
<script src="//code.jquery.com/jquery.min.js"></script>
<script src="//ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script>


<style type="text/css">
	body{
		font-family: '돋움',Dotum,'굴림',Gulim,sans-serif;
	    font-size: 12px;
	}
	.ui-datepicker{ font-size: 12px; width: 180px; background-color: white;}
	.ui-widget-content .ui-state-default {background: white; border: 1px solid white;}
	.ui-widget-header {background: #0b69b1;     border: #0b69b1; color: white;}
	.ui-datepicker select.ui-datepicker-month{ width:27%; font-size: 12px; }
	.ui-datepicker select.ui-datepicker-year{ width:44%; font-size: 12px; }
	.ui-datepicker-calendar > tbody td.ui-datepicker-week-end:first-child a { color: red; } 
	.ui-datepicker-current-day .ui-state-default{ background-color: #dbeefa;}
	.ui-widget-content .ui-state-default:hover{background-color: #dbeefa;} 
	.ui-datepicker-today .ui-state-default {background-color: #f2f2f2;}	
	
	
	
	#table1 {width: 98% ; border-collapse: collapse; margin-left: 5px;margin-right: 5px;}
	#table1  td{border: 1px solid #dcdcdc; text-align: center;font-size: 12px; height: 38px;}
	.th1{border: 1px solid #dcdcdc; text-align: center; background-color: #f9f9f9; font-size: 12px; }
	#textBox{width: 98%; height: 28px; border: 1px solid #dcdcdc;}
	#textBox2, #datepicker1, #datepicker2{height: 28px; border: 1px solid #dcdcdc;}
	

	input[type=checkbox]{
	 width: 18px; height: 18px; vertical-align: middle;
	}
	
	.button{text-decoration:none; display: inline-block;border: 1px solid #c3c3c3;font-size: 12px; background-color: white;width: 68px;text-align: center; vertical-align:middle; height:33px;color: black;}
	.Button_Over{text-decoration:none; display: inline-block;border: 1px solid #c3c3c3;font-size: 12px; background-color: #f2f2f2;width: 68px;text-align: center; vertical-align:middle;  height:33px;color: black;}
	.Button_Out{text-decoration:none; display: inline-block;border: 1px solid #c3c3c3;font-size: 12px; background-color: white; width: 68px;text-align: center; vertical-align:middle;  height:33px;color: black;}

	.location_info ul { margin: 20px 10px 25px 2px; padding: 0;display: block;list-style-type: disc;}	
	.location_info ul li {display: inline-block; list-style: none; padding: 1px 1px 0 9px; background: url(resources/images/ico_nav_arr_right01.png) no-repeat left center;}
	.location_info ul li:first-child {background: none;padding: 0 2px 0 10px;}
	li { list-style: none;}
	li a {text-decoration: none;color: #4a4a4a;}
	.location_info ul li.on a {font-weight: bold;color: #058df5;}
	.location_info ul li a {font-size: 11px;color: #8d8d8d;}	
	


</style>

<script type="text/javascript">

$(function(){

	var clareCalendar ={
		    //달력 나오게하는 방법 설정  -> button, text, both
			//showOn:"both",
		    //버튼에 나올 텍스트 설정
			//buttonText:"Cal",
		    //년도랑 월 설정하는 select 박스 표시 여부 설정
		  	 showMonthAfterYear: true ,
		    changeYear:true,
		    changeMonth:true,
		    //날짜 표시 형식설정
		    dateFormat:"yy-mm-dd",
		    //달력에 요일 표시
        	dayNamesMin: ['일','월', '화', '수', '목', '금', '토'], 
		    monthNamesShort: ['1','2','3','4','5','6','7','8','9','10','11','12'],
			monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월']
// 			yearSuffix: "년" 
	}
	
	$('#a1').click(function(){
		$("#datepicker1").focus();
	}); 
	$('#a2').click(function(){
		$("#datepicker2").focus();
	}); 
	
		$('#datepicker1').datepicker(clareCalendar);	

		$('#datepicker2').datepicker(clareCalendar);	

});

	function projectsList(){
		location.href="projectsList";
	}
	


</script>
</head>
<body>
<div id="container">
	<div class="location_info">
		<ul>
			<li>
				<a href="#"><img src="resources/images/ico_home01.png">&nbsp;</a>
			</li>
			<li>
				<a href="#">업무관리&nbsp;</a>
			</li>
			<li>
				<a href="#">프로젝트&nbsp;</a>
			</li>
			<li class="on">
				<a href="#">프로젝트목록&nbsp;</a>
			</li>
		</ul>
	</div>
	<form action="projectsInsert" method="post">
	<input  type="hidden"  name="projectstatus"  value="1"/>
		<table id="table1">
			<col width="20%"/>
			<col width="7%"/>
			<col width="23%"/>
			<col width="20%"/>
			<col width="30%"/>
			<tr>
				<td style="text-align: right; border: white" colspan="5">
					<input type="submit" class="button"  value="저장/결재" onmouseover="this.className='Button_Over';" onmouseout="this.className='button';">
					<input type="button" class="button" value="목록" onmouseover="this.className='Button_Over';" onmouseout="this.className='button';" onclick="projectsList();">
				</td>
			</tr>
			<tr>
				<td style="border: none; text-align: left;">
				• 프로젝트 현황
				</td>
			</tr>
			<tr>
				<td class="th1">수주</td>
				<td colspan="4" style="text-align: left">				
					<input type="checkbox" name="projectcontract">
				</td>
			</tr>
			<tr>
				<td class="th1">P/J No.</td><td colspan="4"><input id="textBox" type="text"  name="projectcode"></td>
			</tr>	
			<tr>
				<td class="th1">단품체크</td><td colspan="4" style="text-align: left"><input type="checkbox" name="singleproduct"></td>
			</tr>
			<tr>
				<td class="th1">공사명</td><td colspan="4"><input id="textBox" type="text" name="projectname"></td>
			</tr>
			<tr>
				<td class="th1">공사장소</td><td colspan="4"><input id="textBox" type="text" name="projectplace"></td>
			</tr>
			<tr>
				<td class="th1">공사기간</td>
				<td colspan="4" style="text-align: left; ">
					<span style="display:inline-block; width:0.5%;"></span>
					<input  type="text" id="datepicker1"  name="projectstartdate"  readonly="readonly" />
					<a id="a1">                                            
						<img  id="dateImg" alt="이미지 없음" width="17px"  src="resources/images/small-calendar.svg"  style="vertical-align:middle; cursor: pointer;">
					</a>
					&nbsp;~&nbsp;
					<input  type="text" id="datepicker2" name="projectenddate" readonly="readonly" />
					<a id="a2">
						<img id="dateImg" alt="이미지 없음" width="17px"  src="resources/images/small-calendar.svg" style=" vertical-align:middle; cursor: pointer;">
					</a>
				</td>
			</tr>
			<tr>
				<td class="th1">공사내용</td><td colspan="4"><input id="textBox" type="text" name="projectcontents"></td>
			</tr>
			<tr>
				<td class="th1">계약금액(VAT별도)</td><td colspan="4" style="text-align: left; ">&nbsp;자동제어: <input  id="textBox2"  style="text-align: right; " type="text" value="0" name="controlmoney">원 &nbsp;&nbsp;&nbsp;전기공사: <input  id="textBox2"  style="text-align: right;" type="text" value="0" name="electricmoney">원</td>
			</tr>
			<tr>
				<td class="th1">담당자</td>
				<td colspan="4" style="text-align: left; ">&nbsp;자동제어: 
					<select style="font-size:12px;height: 32px;height: 28px; border: 1px solid #dcdcdc;" name="controlperson" >
						<option value="선택">선택</option>
						<option value="김도용">김도용</option>		
					</select>
										전기공사: 
					<select style="font-size:12px;height: 32px;height: 28px; border: 1px solid #dcdcdc;" name="electricperson">
						<option value="선택">선택</option>
						<option value="김도용">김도용</option>			
					</select>
					<input  id="textBox2" type="text" name="noteperson">
				</td>
			</tr>
			<tr>
				<td class="th1">고객</td><td colspan="2"><input style="margin-left: 3px; width: 95%"  id="textBox" type="text" name="customercompany"></td>
				<td class="th1">고객 담당자</td><td><input style="margin-left: 3px; width: 95%"  id="textBox" type="text" name="customerperson"></td>
			</tr>
		</table>
		<table id="table1">
			<col width="20%"/>
			<col width="20%"/>
			<col width="20%"/>
			<col width="20%"/>
			<col width="20%"/>	
			<tr>
				<td style="border: none; text-align: left;">
				• 수금 계획
				</td>
			</tr>	
			<tr>
				<td class="th1">구분</td><td class="th1">지급율(%)</td><td class="th1">지급금액</td><td class="th1">지급조건</td><td class="th1">비고</td>
			</tr>
			<tr>
				<td>선도금</td><td><input style="margin-left: 3px; width: 94%" id="textBox" type="text" name="money1Percent"></td><td><input style="margin-left: 3px; width: 88%" id="textBox" type="text" name="money1Amount">원</td><td><input style="margin-left: 3px; width: 95%" id="textBox" type="text" name="money1Condition"></td><td><input style="margin-left: 3px; width: 90%" id="textBox" type="text" name="money1Remark"></td>
			</tr>
			<tr>
				<td>중도금</td><td><input style="margin-left: 3px; width: 94%" id="textBox" type="text" name="money2Percent"></td><td><input style="margin-left: 3px; width: 88%" id="textBox" type="text" name="money2Amount">원</td><td><input style="margin-left: 3px; width: 95%" id="textBox" type="text" name="money2Condition"></td><td><input style="margin-left: 3px; width: 90%" id="textBox" type="text" name="money2Remark"></td>
			</tr>
			<tr>
				<td>잔금</td><td><input style="margin-left: 3px; width: 94%" id="textBox" type="text" name="money3Percent"></td><td><input style="margin-left: 3px; width: 88%" id="textBox" type="text" name="money3Amount">원</td><td><input style="margin-left: 3px; width: 95%" id="textBox" type="text" name="money3Condition"></td><td><input style="margin-left: 3px; width: 90%" id="textBox" type="text" name="money3Remark"></td>
			</tr>
			<br>
			<tr>
				<td class="th1">절차선택</td>
				<td colspan="4" style="text-align: left ;" >
				<c:choose>
					<c:when test="${empty list }">
							&nbsp;산출물이 없습니다.
					</c:when>		
					<c:otherwise>
						<c:forEach var="dto" items="${list}" >
							<input type="checkbox" name="chk"  value="${dto.productcode}" checked="checked">&nbsp;${dto.productvalue}<br>
						</c:forEach>
					</c:otherwise>
				</c:choose>			
				</td>
			</tr>
			<tr>
				<td style="border: none; ">
				&nbsp;
				</td>
			</tr>
			<tr>
			<td style="border: none; ">
			&nbsp;
			</td>
			</tr>				
		</table>
	</form>
</div>
</body>
</html>