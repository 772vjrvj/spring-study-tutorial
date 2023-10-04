<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>



<style type="text/css">
body{
font-family: '돋움',Dotum,'굴림',Gulim,sans-serif;
    font-size: 12px;
}
	table {border-collapse: collapse; width: 98%; margin-left: 5px;margin-right: 5px;}
	option{font-size: 13px; }
	.th{border: 1px solid #dcdcdc; text-align: center; background-color: #f9f9f9; font-size: 12px; height: 36px;}
	td{border: 1px solid #dcdcdc; text-align: center;font-size: 12px; height: 36px;}
	.button{font-weight:; text-decoration:none; display: inline-block;border: #0b69b1;font-size: 12px; background-color: #1088e3;padding-top:4.5px; width: 45px;text-align: center; vertical-align:middle; height:22px;color: white;}
	.Button_Over{text-decoration:none; display: inline-block;border: #0b69b1;font-size: 12px; background-color: #0b69b1;padding-top:4.5px; width: 45px;text-align: center; vertical-align:middle;  height:22px;color: white;}
	.button1{ cursor:pointer ;text-decoration:none; display: inline-block;border: 1px solid #c3c3c3;font-size: 12px; background-color: white;padding-top:4.5px;  width: 55px;text-align: center; vertical-align:middle; height:22px;color: black;}
	.Button_Over1{ cursor:pointer ;text-decoration:none; display: inline-block;border: 1px solid #c3c3c3;font-size: 12px; background-color: #f2f2f2;padding-top:4.5px;  width: 55px;text-align: center; vertical-align:middle;  height:22px;color: black;}


	.location_info ul { margin: 20px 10px 25px 2px; padding: 0;display: block;list-style-type: disc;}
	.location_info ul li {display: inline-block; list-style: none; padding: 1px 1px 0 9px; background: url(resources/images/ico_nav_arr_right01.png) no-repeat left center;}
	.location_info ul li:first-child {background: none;padding: 0 2px 0 10px;}
	li { list-style: none;}
	li a {text-decoration: none;color: #4a4a4a;}
	.location_info ul li.on a {font-weight: bold;color: #058df5;}
	.location_info ul li a {font-size: 11px;color: #8d8d8d;}	
	

	#tr1  a:link { color: black; text-decoration: none;}
	#tr1  a:visited { color: black; text-decoration: none;}
	#tr1  a:hover { color: black; text-decoration: none;}
	#tr1  a:active { color: black; text-decoration: none;}
	.tr1{background-color:whilte;}
	.tr2{background-color: #d8eaf8;}

	/* a:-webkit-any-link { */
	/*     color: -webkit-link; */
	/*     cursor: pointer; */
	/*     text-decoration: underline; */
	/* } */
	
	/* li { */
	/*     display: list-item; */
	/*     text-align: -webkit-match-parent; */
	/* } */

 .location_info{height: 30px}

</style>

</head>
<body>
<div id="container">
	<div class="location_info">
		<ul>
			<li>
				<a href="#"><img src="resources/images/ico_home01.png">&nbsp;</a>
			</li>
			<li>
				<a href="#">프로젝트/업무&nbsp;</a>
			</li>
			<li>
				<a href="#">업무관리&nbsp;</a>
			</li>
			<li class="on">
				<a href="#">업무목록&nbsp;</a>
			</li>
		</ul>
	</div>
	<table>
		<col width="50px"/>
		<col width="80px"/>
		<col width="70px"/>
		<col width="90px"/>
		<col width="150px"/>
		<col width="150px"/>
		<col width="150px"/>
		<col width="250px"/>
		<col width="30px"/>
		<tr>
			<td colspan="8" style="text-align: left; border: 1px solid white; border-bottom: black;" >
				<select id="select2" name="select2" style="font-size:12px;height: 24px; width: 73px;border: 1px solid #c3c3c3;">
					<option value="0" selected="selected">전체</option><option value="2019">2019</option><option value="2018">2018</option>
					<option value="2017">2017</option><option value="2016">2016</option>
					<option value="2015">2015</option><option value="2014">2014</option>
					<option value="2013">2013</option>
				</select>년
				&nbsp;&nbsp;
				<select id="select3" name="select3" style="font-size:12px;height: 24px;width: 73px;border: 1px solid #c3c3c3;">
					<option value="0" selected="selected">전체</option><option value="01">1</option><option value="02">2</option>
					<option value="03">3</option><option value="04">4</option><option value="05">5</option>
					<option value="06">6</option><option value="07">7</option><option value="08">8</option>
					<option value="09">9</option><option value="10">10</option><option value="11">11</option>
					<option value="12">12</option>
				</select>월
				&nbsp;&nbsp;
				작성자 :&nbsp;<input id="input" name="input" type="text" style="height: 20px; width: 120px;border: 1px solid #c3c3c3;">
				<a href="javascript:page(1)" style="color: white;" class="button" onmouseover="this.className='Button_Over';" onmouseout="this.className='button';">검색</a>
			</td>
			<td style="text-align: right; border: 1px solid white; border-bottom: black;">				
				<a class="button1" onmouseover="this.className='Button_Over1';" onmouseout="this.className='button1';">엑셀저장</a>
			</td>
		</tr>	
	</table>
	<table id="tableList">
		<col width="50px"/>
		<col width="80px"/>
		<col width="70px"/>
		<col width="90px"/>
		<col width="150px"/>
		<col width="150px"/>
		<col width="150px"/>
		<col width="250px"/>
		<col width="30px"/>
		<tr>
			<td class="th">번호</td><td class="th">날짜</th><td class="th">작성자</td>
			<td class="th">시간</td><td class="th">장소</td><td class="th">PROJECT<br />(진척도)</td>
			<td class="th">업무코드<br />(진척도)</td><td class="th">실행내용<br />(정상근무)</td><td class="th">소요<br />시간</td>
		</tr>
		<c:choose>
			<c:when test="${empty list }">
				<tr id="tr1" class="tr1"  onmouseover="this.className='tr2';" onmouseout="this.className='tr1';">
					<td style="text-align: center; width: 100%;" colspan="9">업무가 없습니다.</td>
				</tr>
			</c:when>		
			<c:otherwise>
				<c:forEach var="dto" items="${list}" >
					<tr id="tr1"  class="tr1"  onmouseover="this.className='tr2';" onmouseout="this.className='tr1';"
						onclick="javascript:workLogDetail('${dto.thisdate}','${dto.userid}')"	style="cursor:hand" >
						<td>${dto.no}</td>
						<td>${dto.thisdate}</td>
						<td>${dto.userid}</td>
						<td>${dto.workstarttime} ~ ${dto.workendtime}</td>
						<td>${dto.workplace}</td>
						<td>${dto.projectcode}</td>
						<td>${dto.workcode1}<br />${dto.workcode2}</td>	
						<td>${dto.workcontents}</td>
						<td>${dto.worktime}</td>
					</tr>
				</c:forEach>
			</c:otherwise>
		</c:choose>
	</table>	
	<br><br>
	<div style="text-align: center ; font-size: 13px; width: 100%" >
		<c:if test="${pageMaker.prev}">
			<a style="text-decoration: none;" href="javascript:page(${pageMaker.startPage-1})">◀</a>
		</c:if>
		<c:forEach  begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
			<c:choose>
				<c:when test="${cri.page eq idx}">
					<a style="color:blue; text-decoration: none;  font-weight:bold;  href="javascript:page(${idx})">${idx}</a>
				</c:when>
				<c:otherwise>
					<a style="color:black ;text-decoration: none;" href="javascript:page(${idx})">${idx}</a>					
				</c:otherwise>
			</c:choose>
		</c:forEach>
		<c:if test="${pageMaker.next}">
			<a style="text-decoration: none;" href="javascript:page(${pageMaker.endPage+1})">▶</a>
		</c:if>
	</div>
</div>
</body>
<script type="text/javascript">
	$(function (){
		select();
		excel();
	});
	
	 function excel(){
		$(".button1").on("click", function () {
	        var a = document.createElement('a');
	        var data_type = 'data:application/vnd.ms-excel';
	        var table_html = encodeURIComponent($("#tableList").html());
	        a.href = data_type + ', ' + table_html;
	        a.download = 'NewFile.xls';
	        
	        a.click();
	        e.preventDefault();
		});
	 }

	function select(){
		$("#select2").val("${select2 != null?select2:'0'}");
		$("#select3").val("${select3 != null?select3:'0'}");
		$("#input").val("${input != null?input:''}");
	}

	function page(idx){
		console.log(idx);

		var page = idx;
		location.href="${pageContext.request.contextPath}/businessLogList?page="+page+"&perPageNum="+10
				+"&select2="+$("select[name=select2]").val()
				+"&select3="+$("select[name=select3]").val()
				+"&input="+$("input[name=input]").val();
	}

	function workLogDetail(date,id) {
		location.href="businessLogDetail?date="+date+"&id="+id;
	}
	
</script>
</html>