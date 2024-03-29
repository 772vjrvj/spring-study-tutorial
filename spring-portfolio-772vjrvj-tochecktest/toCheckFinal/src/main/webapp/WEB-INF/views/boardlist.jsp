<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%request.setCharacterEncoding("utf-8");  %>
<%response.setContentType("text/html; charset=utf-8");%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>boardlist</title>
<jsp:include page="head.jsp"/>
<script type="text/javascript"
	src="//bl.ocks.org/brattonc/raw/5e5ce9beee483220e2f6/e92e678341ca79fef669ec9bdbc7553845966222/liquidFillGauge.js"></script>
<script type="text/javascript"
	src="http://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript" src="//d3js.org/d3.v3.min.js"></script>


<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- 부가적인 테마 -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>



<script type="text/javascript">
var BG = {}; // BAR GRAPH window object

// FIXED
BG.fixed = function(percentage, duration,i) {
	var pixels = Math.floor(percentage * 2.5); // Percent as a whole number times 2.5 for 250 max pixels
	// Animate bar graph
	var count1 = 0,
   bar = $('.progress-fixed__bar'+i),
   interval1 = Math.floor(duration / pixels),
   incrementer1 = setInterval(function() {
		(count1 <= pixels) ? (bar.width(count1), count1++) : clearInterval(incrementer1);
	}, interval1);
	// Animate percent number
	var count2 = 0,
   percent = $('.progress-fixed__percent'+i),
   interval2 = Math.floor(duration / percentage),
   incrementer2 = setInterval(function() {
		(count2 <= percentage) ? (percent.text(count2 + "%"), count2++) : clearInterval(incrementer2);
	}, interval2);
};


//INITIATE FUNCTIONS
BG.init = function(per,i) {
	BG.fixed(per, 800,i);  // Percentage, duration
};

//TRIGGER INIT
$(function() {
	$(".bar").trigger("click");

});

</script>
<style type="text/css">
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

#container {
	width: 1500px;
	margin:0 auto;
	margin-top: 100px;
}

table {
	margin: auto;
	width: 1100px;
}
</style>

<style type="text/css">
a {
	text-decoration: none;
}

/* 게이지 막대 컨테이너 */
figure {
	position: relative;
	width: 250px;
	margin: auto;
	height: 25px;
	border-radius: 8px;
	background: #cecece;
	background: -moz-linear-gradient(top, #cecece 0%, #ffffff 100%);
	background: -webkit-gradient(linear, left top, left bottom, color-stop(0%, #cecece),
		color-stop(100%, #ffffff));
	background: -webkit-linear-gradient(top, #cecece 0%, #ffffff 100%);
	background: -o-linear-gradient(top, #cecece 0%, #ffffff 100%);
	background: -ms-linear-gradient(top, #cecece 0%, #ffffff 100%);
	background: linear-gradient(to bottom, #cecece 0%, #ffffff 100%);
	filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#cecece',
		endColorstr='#ffffff', GradientType=0);
}

/* 게이지 모양 */
figure div:nth-child(1) {
	width: 250px;
	position: relative;
	height: 25px;
	border-radius: 6px;
}

/* 파란 게이지 막대 */
.progress-fixed div[class*=progress-fixed__bar] {
	background: #fd6c8b;
}
a:hover, a:visited, a:link{
      color:black;
      text-decoration:none;
   }
/* 퍼센트 글씨 */
figure div:nth-child(2) {
	position: absolute;
	top: 2px;
	right: 10px;
	font-size: 15px;
	font-weight: bold;
	font-family: sans-serif;
	color: #fff;
	text-shadow: 0 0 2px #000, 0 0 10px #000;
}

/*  ** 달성률 a태크  */
figure div:nth-child(3) {
	position: relative;
	font-size: 15px;
	color: black;
	font-weight: bold;
}
</style>
<script type="text/javascript">
</script>
</head>
<body>
	<div id="container">
		<table>
		<col width="180px">
		<col width="180px">
		<col width="180px">
		<col width="180px">
		<tr><td colspan="4"><h1>혼자 하기 목록</h1><button class="btn btn-default btn-xs" type="button" onclick="location.href='selectform.do?id=${id}&role=${role}'">이전페이지</button></td></tr>
<c:choose>
	<c:when test="${fn:length(list) eq 0 }">
       	진행중이 리스트가 없습니다.
	</c:when>
	<c:otherwise>
		<c:forEach var="dto" items="${list}" varStatus="status">
			<c:choose>
				<c:when test="${dto.endList eq 'Y'}">
				
				</c:when>
				<c:otherwise>
					<c:set var="per" value="0.0"/>
					<c:choose>
						<c:when test="${dto.chkss eq 0}">
						
						</c:when>
						<c:otherwise>
							<c:set var="per" value="${(dto.chkss/dto.term)*100}"/>
						
						</c:otherwise>
					</c:choose>	
					<c:choose>
						<c:when test="${(status.count)%4 eq 1}">
							<tr><td>
							<div class="progress-fixed">
							<div>${dto.id}</div>
							<div>기간: ${dto.chkss}/${dto.term}</div>
							<div>획득포인트: ${dto.term * 100}</div>
						  		<figure>
						    		<div class="progress-fixed__bar${status.count}"></div>
						    		<div class="progress-fixed__percent${status.count}"></div>
						    		<div class="pertitle"><a href="habitCalDetail.do?calString=a&pKey=${dto.pKey}&id=${dto.id}&paramview=1">${dto.title}</a></div>	
						  		</figure>
							</div>
							<input class="bar" type="hidden"  onclick="BG.init(${per},${status.count})"/>
							<br/>
							<br/>
							</td>
						</c:when>
						<c:when test="${(status.count)%4 eq 2||(status.count)%4 eq 3}">
							<td>
							<div class="progress-fixed">
							<div>${dto.id}</div>
							<div>기간: ${dto.chkss}/${dto.term}</div>
							<div>획득포인트: ${dto.term * 100}</div>
						  		<figure>
						    		<div class="progress-fixed__bar${status.count}"></div>
						    		<div class="progress-fixed__percent${status.count}"></div>
						    		<div class="pertitle"><a href="habitCalDetail.do?calString=a&pKey=${dto.pKey}&id=${dto.id}&paramview=1">${dto.title}</a></div>	
						  		</figure>
							</div>
							<input class="bar" type="hidden"  onclick="BG.init(${per},${status.count})"/>	
							<br/>
							<br/>				
							</td>						
						</c:when>
						<c:when test="${(status.count)%4 eq 0}">
							<td>
							<div class="progress-fixed">
							<div>${dto.id}</div>
							<div>기간: ${dto.chkss}/${dto.term}</div>
							<div>획득포인트: ${dto.term * 100}</div>
						  		<figure>
						    		<div class="progress-fixed__bar${status.count}"></div>
						    		<div class="progress-fixed__percent${status.count}"></div>
						    		<div class="pertitle"><a href="habitCalDetail.do?calString=a&pKey=${dto.pKey}&id=${dto.id}&paramview=1">${dto.title}</a></div>	
						  		</figure>
							</div>
							<input class="bar" type="hidden"  onclick="BG.init(${per},${status.count})"/>	
							<br/>
							<br/>
							</td><tr>						
						</c:when>
					
					</c:choose>							
				</c:otherwise>
			</c:choose>
		</c:forEach>
		<c:forEach var = "m" begin = "1" end = "${(4-(fn:length(list))%4)%4}">
			<c:choose>
			<c:when test="${m eq  (4-(fn:length(list))%4)%4}">
			<td>&nbsp;</td></tr>
			</c:when>
			<c:otherwise>
			<td>&nbsp;</td>
			</c:otherwise>				
			</c:choose>
		</c:forEach>	
	</c:otherwise>
</c:choose>
</table>
	</div>
</body>
</html>