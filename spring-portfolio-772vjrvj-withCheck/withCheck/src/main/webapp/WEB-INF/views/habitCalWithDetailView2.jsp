<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>habitCalWithDetailView2</title>

<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>

<style type="text/css">
	@keyframes click-wave {
	  0% {
	    height: 40px;
	    width: 40px;
	    opacity: 0.35;
	    position: relative;
	  }
	  
	  100% {
	    height: 200px;
	    width: 200px;
	    margin-left: -80px;
	    margin-top: -80px;
	    opacity: 0;
	  }
	}
	
	.option-input {
	  -webkit-appearance: none;
	  -moz-appearance: none;
	  -ms-appearance: none;
	  -o-appearance: none;
	  appearance: none;
	  position: relative;
	  top: 8px;
	  right: 0;
	  bottom: 0;
	  left: 37px;
	  height: 40px;
	  width: 40px;
	  transition: all 0.15s ease-out 0s;
	  background: white;
	  border: none;
	  color: #fff;
	  cursor: pointer;
	  display: inline-block;
	  margin-right: 0.5rem;
	  outline: none;
	  position: relative;
	  z-index: 1000;
	}
	.option-input:hover {
	  background: #9faab7;
	}
	.option-input:checked {
	  background: #000000;
	}
	.option-input:checked::before {
	  height: 40px;
	  width: 40px;
	  position: absolute;
	  content: '✔';
	  display: inline-block;
	  font-size: 26.66667px;
	  text-align: center;
	  line-height: 40px;
	}
	.option-input:checked::after {
	  -webkit-animation: click-wave 0.65s;
	  -moz-animation: click-wave 0.65s;
	  animation: click-wave 0.65s;
	  background: #000000;
	  content: '';
	  display: inline-block;
	  position: relative;
	  z-index: 100;
	}
		img{
		top: 28%;
		left:32%;
		text-align: center;
		width:700px;
		height: 700px;
		opacity: 0.4;
		z-index: -5;
		position: absolute;
		}
	
	   #calendar{
	      border: 1px solid #000000;
	      border-collapse: collapse;
	   }
	   #calendar th{
	      width:80px;
	      background-color: #000000;
	      text-align: center;
	      
	   }
	   
	   #calendar td{
	      width:100px;
	      height:100px;
	      text-align: left;
	      vertical-align: top;
	   }
	
	   #list{
	   width: 564px;
	   display: none;
	   text-align:left;
	   }
	
	   #container{
	   width: 800px;
	   margin: 0 auto 0 auto;
	   }
	   
	   
	   #calendartitle {
	      border: 1px solid #000000;
	      border-collapse: collapse;
	      height: 90px;
	      margin: auto;
	      
	   }
	   
	   table{
	      margin: auto;
	      border-collapse: collapse;
	      border-radius: 30px;
	   }
	   th{
	   		font-size: 17px;
	   }
	   td{
	   		font-size: 18px;
	   }	
</style>


<script type="text/javascript">
	
	$(function(){
	
	    $("#intoper").click(function(){
	        if($("#list").css("display") == "none"){
	            $("#list").slideDown();
	        }else{
	            $("#list").slideUp();
	        }
	       });   
	
	
	});
	
	   
	function myFunction2(){
		location.href="promise.do?id=${loginId}&pKey=${dto.pKey}&hostId=${dto.id}";
	}
	
	function myFunction3(){
		location.href="promise.do?id=${loginId}&pKey=${dto.pKey}";
	}	
	
	
</script>

</head>
<body>
	<jsp:include page="style.jsp"/>
	<jsp:include page="head.jsp"/>
	
	<div id="container">
		<jsp:useBean id="Cal" class="com.hk.toCheckFinal.utils.cal"/>
		<jsp:useBean id="Util" class="com.hk.toCheckFinal.utils.Util"/>	
	   
		<table style="border-collapse: collapse; border: white">
			<col width="188px">
			<col width="188px">
			<col width="188px">
			
			<tr><th colspan="3" style="color:#245682; text-align: center; font-size: 20px;">${dto.title}</th></tr>
			<tr><td style="color: white">&nbsp;</td></tr>
		</table>   
		<table id="calendartitle" border="1" style="border: 3px solid #000000;">
			<col width="188px">
			<col width="188px">
			<col width="188px">
			
			<tr>
				<th style="background-color:#000000; color:white; text-align: center;">시작일</th>
	            <th style="background-color:#000000; color:white; text-align: center;">종료일</th>
	            <th style="background-color:#000000; color:white; text-align: center;">기간</th>
			</tr>
			<tr>
	            <td style="color:#245682; text-align: center;">${map.stYear}/  ${map.stMonth}/  ${map.stDate}</td>
	            <td style="color:#245682; text-align: center;">${map.edYear}/  ${map.edMonth}/  ${map.edDate}</td>
	            <td style="color:red; text-align: center;">${map.term}</td>
			</tr>
			<tr><td colspan="3" style="color:#245682; text-align: center;">${dto.content}</td></tr>
		</table>
	   
		<img alt="image" src="${dto.photo}" >
	   
		<table id="calendartitle" style="border-collapse: collapse; border: white; height: 30px;">
			<col width="188px">
			<col width="188px">
			<col width="188px">
			<tr>
				<td colspan="3" style="text-align: right;">
					<div style="font-size: 12px; vertical-align:text-top; color: #245682; font-weight: bolder; " id="withNumber">

						&nbsp;&nbsp;모집인원 : 
						<span style=" color: red;">${intoPer}</span>/${dto.recruit}
					</div>
					
	                <input class="btn btn-default btn-xs" type="button" id="intoper"  value="참가자" />
					
					<c:choose>
						<c:when test="${map.today > dto.edDate}">
                        	<input type="button" class="btn btn-default btn-xs" value="삭제" onclick="location.href='habitCalDeleteEndList.do?pKey=${dto.pKey}&id=${loginId}&which=completeList'"/>
						</c:when>
					</c:choose>
					
					<p id="list" >
						<c:forEach var="list" items="${list}" varStatus="status">
							<c:choose>
								<c:when test="${status.index eq 0}">
									<span style="color: red">▶</span>${list.id} &nbsp;
								</c:when>
								<c:otherwise>
									<span style="color: black">▶</span>${list.id} &nbsp;
								</c:otherwise>         
							</c:choose>
						</c:forEach>
					</p>
				</td>
			</tr>
		</table>
			
		<c:set var="st" value="0"/><c:set var="ed" value="0"/>
		<c:forEach var = "i" begin = "${map.stYear}" end = "${map.edYear}">   
			<table style="border-collapse: collapse; border: white">
				<tr><td style="color: white">&nbsp;</td></tr>
			</table>
			<table id="calendar" border="1">
				<tr><th style="color: white; text-align: center;">${i}</th></tr>
			</table>            
	         
			<c:choose>
				<c:when test="${map.stYear eq map.edYear}">
					<c:set var="st" value="${map.stMonth}"/><c:set var="ed" value="${map.edMonth}"/>
				</c:when>
				<c:otherwise>
		            <c:choose>
		                <c:when test="${i eq map.stYear}">
							<c:set var="st" value="${map.stMonth}"/><c:set var="ed" value="12"/>
		                </c:when>               
		                <c:when test="${i gt map.stYear and i lt map.edYear}">
							<c:set var="st" value="1"/><c:set var="ed" value="12"/>
		                </c:when>               
		                <c:when test="${i eq map.edYear}">
							<c:set var="st" value="1"/><c:set var="ed" value="${map.edMonth}"/>
		                </c:when>               
		            </c:choose>
				</c:otherwise>
			</c:choose>
	
			<c:forEach var = "j" begin = "${st}" end = "${ed}">
				<table id="calendar" border="1" style="text-align: center;">
					<caption style="font-weight:bolder; text-align: center; color:#245682;">${j} Month</caption>
					
					<tr style="color: white;">
						<th >일</th><th>월</th><th>화</th><th>수</th><th>목</th><th>금</th><th>토</th>
					</tr>						
					
					<c:forEach var = "k" begin = "1" end = "${Cal.dayOfWeek(i,j,1)-1}">
						<c:choose>
							<c:when test="${k eq 1}">
								<tr>
							</c:when>
						</c:choose>
						
						<td>&nbsp;</td>
					</c:forEach>
					
   					<c:forEach var = "n" begin = "1" end = "${Cal.lastDay(i,j,1)}">
      					<c:choose>
							<c:when test="${Util.fontColor(Cal.dayOfWeek(i,j,1), n) eq 'red'}">
								<tr>	
							</c:when>
						</c:choose>
						
      					<td>
         					<c:choose>
				                <c:when test="${(i==map.stYear&&j==map.stMonth&&n<map.stDate)||(i==map.edYear&&j==map.edMonth&&n>map.edDate)}">
					            	<p class="countview" style="color:${Util.fontColor(Cal.dayOfWeek(i,j,1), n)};">${n}</p>
				                </c:when>
								<c:otherwise>
									<p class="countview" style="color:${Util.fontColor(Cal.dayOfWeek(i,j,1), n)};">
										<input type="button" value="${n}" onclick="location.href='photoInChkView.do?thisDate=${Util.substring(i)}${Util.isTwoInt(j)}${Util.isTwoInt(n)}&pKey=${dto.pKey}&id=${dto.id}'" ${n>Util.substring6(map.today)? "disabled":""}/>
									</p>
									<input  class="option-input checkbox" type="checkbox" name="chk" 
									value='${Util.substring(i)}${Util.isTwoInt(j)}${Util.isTwoInt(n)}'
									${Util.checked(chkList, Util.substring(i),Util.isTwoInt(j),Util.isTwoInt(n))} onclick='return(false)'/>
								</c:otherwise>
         					</c:choose>
						</td>
						
			            <c:choose>
							<c:when test="${Util.fontColor(Cal.dayOfWeek(i,j,1), n) eq 'blue'}">
								</tr>	
							</c:when>
						</c:choose>
					</c:forEach>
					
					<c:forEach var = "m" begin = "1" end = "${Util.blank(Cal.dayOfWeek(i,j,1),Cal.lastDay(i,j,1))}">
						<td>&nbsp;</td>
						
						<c:choose>
							<c:when test="${m eq Util.blank(Cal.dayOfWeek(i,j,1),Cal.lastDay(i,j,1))}">
								</tr>	
							</c:when>
						</c:choose>
					</c:forEach>
	         	</table>
	      		<br>         
			</c:forEach>
		</c:forEach>
	</div>
</body>
</html>