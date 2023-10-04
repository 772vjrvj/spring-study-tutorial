<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>   
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
body{
font-family: '돋움',Dotum,'굴림',Gulim,sans-serif;
    font-size: 12px;
}
	table {border-collapse: collapse; width: 98%; margin-left: 5px;margin-right: 5px;}
		.th1E{border: 1px solid #dcdcdc; text-align: center; font-size: 12px; }
	
	.th1{border: 1px solid #dcdcdc; text-align: center; background-color: #f9f9f9; font-size: 12px; height: 36px;}
	.td1-1{border: 1px solid #dcdcdc; text-align: left;font-size: 12px;height: 36px;}
	td{border: 1px solid #dcdcdc; text-align: left;font-size: 12px;height: 36px;}
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

function projectsList(){
	location.href="projectsList";
}

function projectsDelete(){
	location.href="projectsDelete?no="+${project.no};
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
	<form action="projectsUpdate" method="post">
<%-- 	<input type="hidden" name="no" value="${project.no}"> --%>
	<table>
		<col width="15%"/>
		<col width="15%"/>
		<col width="20%"/>
		<col width="15%"/>
		<col width="35%"/>
		<tr>
			<td style="text-align: right; border: white" colspan="5">
				<input type="button" class="button"  value="삭제" onmouseover="this.className='Button_Over';" onmouseout="this.className='button'; " onclick="projectsDelete()";>
<!-- 				<input type="submit" class="button"  value="저장/결재" onmouseover="this.className='Button_Over';" onmouseout="this.className='button';"> -->
				<input type="button" class="button" value="목록" onmouseover="this.className='Button_Over';" onmouseout="this.className='button';" onclick="projectsList();">
			</td>
		</tr>	
		<tr>
			<td style="border: none;">
			• 프로젝트 현황
			</td>
		</tr>
		<tr>
			<td class="th1">수주</td>
			<td class="td1-1" colspan="4">				
				&nbsp;${project.projectcontract eq Y?'수주전':'수주'}
			</td>
		</tr>
		<tr>
			<td class="th1">PJT NO.</td>
			<td class="td1-1" colspan="2">				
				&nbsp;${project.projectcode}
			</td>
			<td class="th1">담당자</td>
			<td class="td1-1" colspan="2">
			<c:choose>
				<c:when test="${ empty  project.controlperson}">
				-
				</c:when>
				<c:otherwise>
				&nbsp;${project.controlperson }
				</c:otherwise>
			</c:choose>
			/
			<c:choose>
				<c:when test="${ empty  project.electricperson}">
				-
				</c:when>
				<c:otherwise>
				&nbsp;${project.electricperson }
				</c:otherwise>
			</c:choose>				
			</td>
		</tr>
		<tr>
			<td class="th1">공사명</td>
			<td class="td1-1" colspan="2">				
				&nbsp;${project.projectname}
			</td>
			<td class="th1">고객</td>
			<td class="td1-1" colspan="2">				
				&nbsp;${project.customercompany}
			</td>
		</tr>
		<tr>
			<td class="th1">계약기간</td>
			<td class="td1-1" colspan="2">			
				
				&nbsp;${startDate} ~ ${endDate}
			</td>
			<td class="th1">고객담당자</td>
			<td class="td1-1" colspan="2">				
				&nbsp;${project.projectcode}
			</td>
		</tr>
		<tr>
			<td class="th1">계약금액</td>
			<td class="td1-1" colspan="4">&nbsp;			
			<fmt:formatNumber value="${project.controlmoney + project.electricmoney}" type="number" />원
			( 자동제어: 
			<fmt:formatNumber value="${project.controlmoney}" type="number"/>원
			/ 전기공사:
			<fmt:formatNumber value="${project.electricmoney}" type="number" />원
			 )
			</td>
		</tr>
		<tr>
			<td class="th1">공사내용</td>
			<td class="td1-1" colspan="4">				
				&nbsp;${project.projectcontents }
			</td>
		</tr>	
		<tr>
			<td style="border: none; ">
			&nbsp;
			</td>
		</tr>		
		<tr>
			<td style="border: none;">
			• 수금 계획
			</td>
		</tr>
		<tr>
			<td class="th1">구분</td>
			<td class="th1">비율(%)</td>
			<td class="th1">금액</td>
			<td class="th1">조건</td>
			<td class="th1">비고</td>
		</tr>
		<tr>
			<td class="th1E">선급금</td>
			<td class="th1E">
				<fmt:formatNumber value="${project.money1Percent}" type="number"/>%
			</td>				
			<td class="th1E">
				<fmt:formatNumber value="${project.money1Amount}" type="number"/>
			</td>
			<td class="th1-1">&nbsp;${project.money1Condition }</td>
			<td class="th1-1">&nbsp;${project.money1Remark }</td>
		</tr>	
		<tr>
			<td class="th1E">중도금</td>
			<td class="th1E">
				<fmt:formatNumber value="${project.money2Percent}" type="number"/>%
			</td>
			<td class="th1E">
				<fmt:formatNumber value="${project.money2Amount}" type="number"/>
			</td>
			<td class="th1-1">&nbsp;${project.money2Condition }</td>
			<td class="th1-1">&nbsp;${project.money2Remark }</td>
		</tr>
		<tr>
			<td class="th1E">잔금</td>
			<td class="th1E">
				<fmt:formatNumber value="${project.money3Percent}" type="number"/>%
			</td>
			<td class="th1E">
				<fmt:formatNumber value="${project.money3Amount}" type="number"/>
			</td>
			<td class="th1-1">&nbsp;${project.money3Condition }</td>
			<td class="th1-1">&nbsp;${project.money3Remark }</td>
		</tr>
		<tr>
			<td style="border: none; ">
			&nbsp;
			</td>
		</tr>		
		<tr>
			<td style="border: none;">
			• 수금 내역
			</td>
		</tr>
		<tr>
			<td class="th1">구분</td>
			<td class="th1">비율(%)</td>
			<td class="th1">금액</td>
			<td class="th1">일자</td>
			<td class="th1">미수금액</td>
		</tr>	
		<tr>
			<td class="th1E"  colspan="5">내용이 없습니다.</td>
		</tr>
		<tr>
			<td class="th1" colspan="2">합계</td>
			<td class="th1"></td>
			<td class="th1"></td>
			<td class="th1"></td>
		</tr>	
		<tr>
			<td style="border: none; ">
			&nbsp;
			</td>
		</tr>		
		<tr>
			<td style="border: none;">
			• 진행 일정
			</td>
		</tr>
		<tr>
			<td class="th1" colspan="2">구분</td>
			<td class="th1">시작</td>
			<td class="th1">완료</td>
			<td class="th1">확인</td>
		</tr>	
		<tr>
			<td class="th1E" colspan="5">내용이 없습니다.</td>
		</tr>
		<tr>
			<td style="border: none; ">
			&nbsp;
			</td>
		</tr>		
		<tr>
			<td style="border: none;">
			• 진행 현황
			</td>
		</tr>
		<tr>
			<td class="th1" colspan="2">서류명</td>
			<td class="th1">결재상태</td>
			<td class="th1">결재일자</td>
			<td class="th1">비고</td>
		</tr>
		<tr>
			<td class="th1E" colspan="5">내용이 없습니다.</td>
		</tr>	
		<tr>
			<td style="border: none; ">
			&nbsp;
			</td>
			<tr>
		</tr>	

		<tr>
			<td style="border: none; ">
			&nbsp;
			</td>
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