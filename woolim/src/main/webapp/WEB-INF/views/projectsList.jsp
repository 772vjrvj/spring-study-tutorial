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
	.Button_Out{text-decoration:none; display: inline-block;border: #0b69b1;font-size: 12px; background-color: #1088e3;padding-top:4.5px; width: 45px;text-align: center; vertical-align:middle;  height:22px;color: white;}
	.location_info ul { margin: 20px 10px 25px 2px; padding: 0;display: block;list-style-type: disc;}
	.location_info ul li {display: inline-block; list-style: none; padding: 1px 1px 0 9px; background: url(resources/images/ico_nav_arr_right01.png) no-repeat left center;}
	.location_info ul li:first-child {background: none;padding: 0 2px 0 10px;}
	li { list-style: none;}
	li a {text-decoration: none;color: #4a4a4a;}
	.location_info ul li.on a {font-weight: bold;color: #058df5;}
	.location_info ul li a {font-size: 11px;color: #8d8d8d;}	
	

 a:link { color: black; text-decoration: none;}
 a:visited { color: black; text-decoration: none;}
 a:hover { color: black; text-decoration: none;}
a:active { color: black; text-decoration: none;}


	.Button_Over{text-decoration:none; display: inline-block;border: #0b69b1;font-size: 12px; background-color: #0b69b1;padding-top:4.5px; width: 45px;text-align: center; vertical-align:middle;  height:22px;color: white;}
	.Button_Out{text-decoration:none; display: inline-block;border: #0b69b1;font-size: 12px; background-color: #1088e3;padding-top:4.5px; width: 45px;text-align: center; vertical-align:middle;  height:22px;color: white;}
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
	
	<table>
		<col width="70px"/>
		<col width="250px"/>
		<col width="600px"/>
		<col width="150px"/>
		<col width="150px"/>
		<col width="150px"/>
		<tr>
			<td colspan="6" style="text-align: left; border: 1px solid white; border-bottom: black;" >
				<select id="select1" name="select1" style="font-size:12px;height: 24px;width: 73px; margin-bottom: 2px;border: 1px solid #c3c3c3;">
					<option value="0" selected="selected" >전체</option><option value="PROJECTCODE">프로젝트</option>
					<option value="SINGLEPRODUCT">단품</option><option value="PROJECTCONTRACT">수주전</option>
					<option value="PROJECTNAME">공사명</option><option value="CUSTOMER">고객</option>
					<option value="CLERK">담당자</option><option value="PROJECTSTATUS">상태</option>
				</select>
				&nbsp;&nbsp;
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
				<input id="input" name="input" type="text" style="height: 20px; width: 220px;border: 1px solid #c3c3c3;">
				<a href="javascript:page(1)" style="color: white;" class="button" onmouseover="this.className='Button_Over';" onmouseout="this.className='button';">검색</a>
			</td>
		</tr>
		<tr>
			<td class="th">번호</td><td class="th">P/J No.</th><td class="th">공사명</td>
			<td class="th">고객</td><td class="th">담당자</td><td class="th">상태</td>
		</tr>
		<c:choose>
			<c:when test="${empty list }">
				<tr id="tr1" class="tr1"  onmouseover="this.className='tr2';" onmouseout="this.className='tr1';">
					<td style="text-align: center; width: 100%;" colspan="6">프로젝트가 없습니다.</td>
				</tr>
			</c:when>		
			<c:otherwise>
				<c:forEach var="dto" items="${list}" >
					<tr id="tr1"  class="tr1"  onmouseover="this.className='tr2';" onmouseout="this.className='tr1';"
					 onclick="javascript:projectDetail(${dto.no})"	style="cursor:hand" >
						<td>${dto.no}</td><td>${dto.projectcode}</td>
						<td>
							<a style="text-decoration: none; " >
							${dto.projectname}
							</a>						
						</td>
						<td>${dto.customercompany}</td><td>${dto.controlperson}</td><td>${dto.projectstatus}</td>
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
	});
	
	function select(){
		
		$("#select1").val("${select1 != null?select1:'0'}");
		$("#select2").val("${select2 != null?select2:'0'}");
		$("#select3").val("${select3 != null?select3:'0'}");
		$("#input").val("${input != null?input:''}");
	}

	function page(idx){
		console.log(idx);
		
		
		var page = idx;
		location.href="${pageContext.request.contextPath}/projectsList?page="+page+"&perPageNum="+10
				+"&select1="+$("select[name=select1]").val()
				+"&select2="+$("select[name=select2]").val()
				+"&select3="+$("select[name=select3]").val()
				+"&input="+$("input[name=input]").val();
	}

	function projectDetail(no) {
		location.href="projectDetail?no="+no;
	}

</script>
</html>