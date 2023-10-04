<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>   
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
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
#subContainer{ width: 1250px;}

	.ui-datepicker{ font-size: 13px; width: 200px; background-color: white;}
	.ui-widget-content .ui-state-default {background: white; border: 1px solid white;}
	.ui-widget-header {background: #0b69b1;     border: #0b69b1; color: white;}
	.ui-datepicker select.ui-datepicker-month{ width:30%; font-size: 13px; }
	.ui-datepicker select.ui-datepicker-year{ width:50%; font-size: 13px; }
	.ui-datepicker-calendar > tbody td.ui-datepicker-week-end:first-child a { color: red; } 
	.ui-datepicker-current-day .ui-state-default{ background-color: #dbeefa;}
	.ui-widget-content .ui-state-default:hover{background-color: #dbeefa;} 
	.ui-datepicker-today .ui-state-default {background-color: #f2f2f2;}	
	.ui-datepicker .ui-state-default {font-size: 13px;}

	.location_info ul { margin: 20px 10px 25px 2px; padding: 0;display: block;list-style-type: disc;}	
	.location_info ul li {display: inline-block; list-style: none; padding: 1px 1px 0 9px; background: url(resources/images/ico_nav_arr_right01.png) no-repeat left center;}
	.location_info ul li:first-child {background: none;padding: 0 2px 0 10px;}
	li { list-style: none;}
	li a {text-decoration: none;color: #4a4a4a;}
	.location_info ul li.on a {font-weight: bold;color: #058df5;}
	.location_info ul li a {font-size: 11px;color: #8d8d8d;}	
	#floatLeft{float: left; margin-right: 10px; height: 300px;}

	table {border-collapse: collapse; margin-left: 5px;margin-right: 5px;}
	td{border: 1px solid #dcdcdc; text-align: center;font-size: 11px;height: 20px;}
 	#tr1 td{border: 1px solid #dcdcdc; text-align: center; background-color: #f9f9f9;} 
	#tr2 td{border: 1px solid #dcdcdc; text-align: center; height: 30px; background-color:#f9f9f9 } 
	#datepicker{margin-left: 20px;}
	#leftTable{margin-left: 21px; margin-top: 15px;}
	.button1{ cursor:pointer ;text-decoration:none; display: inline-block;border: 1px solid white;font-size: 12px; background-color: white;padding-top:5px;  width: 55px;text-align: center; vertical-align:middle; height:22px;color: black;}
	.Button_Over1{ cursor:pointer ;text-decoration:none; display: inline-block;border: 1px solid #f2f2f2;font-size: 12px; background-color: #f2f2f2;padding-top:5px;  width: 55px;text-align: center; vertical-align:middle;  height:22px;color: black;}
	#td1{background-color: #f9f9f9}
	#approval{text-decoration: none}
	
	#tr0 td{border: 1px solid white; border-bottom: #dcdcdc;"}
	
	.hover{color:blue}
	
</style>
<script type="text/javascript">
	$(document).ready(function(){
	  

			$('#datepicker').datepicker({
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
				monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
				//yearSuffix: "년" 
				onSelect: function (dateText, inst) {
					approvalList(dateText);
		        }

			});
	}); 

	function approvalList(date){
		$.ajax({
			url:'ajaxBusinessLogApprovalList',
			async : false,
			data : {date: date} ,
			type:'GET',
		    dataType: 'json',
		    contentType: 'application/json',
		    success: function(data) {
		    	approvalNameList(data);

		    },
		    error:function(xhr, status, message) {
		        alert(" status: "+status+" er:"+message);
		    }
		});		
	}
	

	function approvalNameList(data){
		$("#tbody1").empty();
		$("#tbody2").empty();
		$('<tr>')
		.append($('<td colspan="7">').html("내용이 없습니다."))
		.appendTo($('#tbody2'));
		
		if(data.workLog==null||data.workLog==undefined||data.workLog==""){
			$('<tr>')
			.append($('<td>').html(""))
			.append($('<td>').html(""))
			.append($('<td>').html(""))
			.appendTo($('#tbody1'));
			$('.td11').html("");
		}else{
			$.each(data.workLog,function(idx,item){
				var apv;
				var apvCol;
				if(item.confirm3Ok==="N"){
					apv="결재";
					apvCol="red";
				}else{
					apv="완료";
					apvCol="blue";
				}
				var id= "'" + item.userid + "'";
				var thisdate= "'" + item.thisdate + "'";
		
				$('<tr>')
				.append($('<td>').html('<a class="apva'+idx+ '" onclick="approvalDetailList('+thisdate+','+ id +')"  style="cursor:pointer;">'+item.userid+'</a>'))				
				.append($('<td>').html(item.worklogdate))
				.append($('<td class="apv'+idx+'">').html('<a onclick="approval(this'+','+ thisdate+','+ id +')"  style="cursor:pointer;">'+apv+'</a>'))
				.appendTo($('#tbody1'));
				
				$( ".apva"+idx ).hover(
				  function() {
				    $(this).css({
						  'color': 'blue',
						});
				  }, function() {
				    $(this).css({
						  'color': 'black',
						});
					  }
				);
				$(".apv"+idx).css("color",apvCol);
				$(".apv"+idx).css("color",apvCol);
			});
		}
	}

	
	function approvalDetailList(date,id){

		$.ajax({
			url:'ajaxBusinessLogDetailList',
			async : false,
			data : {date: date, id: id},
			type:'GET',
		    dataType: 'json',
		    contentType: 'application/json',
		    success: function(data) {
		    	approvalDetailList2(data);
		    },
		    error:function(xhr, status, message) {
		        alert(" status: "+status+" er:"+message);
		    }
		});	
		
		
	}	
	
	function approvalDetailList2(data){
		$("#tbody2").empty();
		var k = $('.td11').length;
		for (var i = 0; i < k; i++) {
			$('.td11').eq(i).html("");
		}
		$('.td11').eq(1).html("");

		if(data.workLog==null||data.workLog==undefined||data.workLog==""){
			$('<tr>')
			.append($('<td colspan="7">').html("내용이 없습니다."))
			.appendTo($('#tbody2'));			
		}else{
			$.each(data.workLog,function(idx,item){
				if(idx=='0'){
					$('.td11').eq(0).html(item.thisdate);
					$('.td11').eq(1).html(item.userid);
					$('.td11').eq(2).html(item.workstarttime);
					$('.td11').eq(3).html(item.workendtime);
				}else{

				}
				
				$('<tr>')
				.append($('<td>').html(item.workstarttime+" ~ "+item.workendtime))
				.append($('<td>').html(item.workplace))
				.append($('<td>').html(item.projectcode))
				.append($('<td>').html(item.workcode1))
				.append($('<td>').html(item.workcode2))
				.append($('<td>').html(item.workcontents))
				.append($('<td>').html(item.worktime))
				.appendTo($('#tbody2'));
				
			});
		}
	}
	
	
	
	
	function approval(self,date,id){

		var approval;
		if(self.text === "결재"){
			approval="N";
		}else{
			approval="Y";
		}
		$.ajax({
			url:'ajaxBusinessLogApproval',
			async : false,
			data : {date: date, id: id,approval:approval} ,
			type:'GET',
		    dataType: 'json',
		    contentType: 'application/json',
		    success: function(data) {
		    	var count=data["count"]
		    	var result=data["result"]
		    	var approval=data["approval"]
		    	
				if(approval==="N"){
					self.text = "결재";
					self.style.color = "red";
					
				}else{
					self.text = "완료";
					self.style.color = "blue";
				}
		    },
		    error:function(xhr, status, message) {
		        alert(" status: "+status+" er:"+message);
		    }
		});
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
				<a href="#">프로젝트/업무&nbsp;</a>
			</li>
			<li>
				<a href="#">업무관리&nbsp;</a>
			</li>
			<li class="on">
				<a href="#">업무일지&nbsp;</a>
			</li>
		</ul>
	</div>
	<div id="subContainer">

		<div id="floatLeft">
			<div id="datepicker"></div>
			<table id="leftTable">
				<col width="68px"/><col width="68px"/><col width="68px"/>
				<thead>
				<tr id="tr0">
					<td>결제</td><td colspan="2">${workLogOne.thisdate}</td>
				</tr>
				<tr id="tr1">
					<td>이름</td><td>작성일</td><td>결재</td>
				</tr>				
				</thead>
				<tbody id="tbody1">
				<c:choose>
					<c:when test="${empty workLogOne}">
						<tr>
							<td></td><td></td><td></td>
						</tr>
					</c:when>
					<c:otherwise>
						<tr>
							<td>${workLogOne.userid }</td><td>${workLogOne.worklogdate }</td>
							<td>
								<a  style="cursor: pointer; color: ${workLogOne.confirm3Ok eq 'N'?'red':'blue'}" id="approval" 
								onclick="approval(this,'${workLogOne.thisdate }','${workLogOne.userid}')"
								>${workLogOne.confirm3Ok eq 'N'?"결재":"완료"}</a>
							</td>
						</tr>
					</c:otherwise>
				</c:choose>	
				</tbody>
			</table>
		</div>
		<div id="floatRight">
				<table>
					<col width="60px"/><col width="90px"/>
					<col width="60px"/><col width="75px"/>
					<col width="60px"/><col width="70px"/>
					<col width="60px"/><col width="70px"/>
					<col width="20px" >
					<col width="60px"/>
					<tbody  id="tbodyTop">
						<tr id="tr">
							<td id="td1">선택일</td><td class="td11">${workLogOne.thisdate}</td><td  id="td1">작성자</td><td  class="td11">${workLogOne.userid }</td><td  id="td1">출근시간</td><td  class="td11">${workLogOne.workstarttime }</td><td  id="td1">퇴근시간</td><td  class="td11">${workLogOne.workendtime }</td>
							<td style="background-color: white; border: 1px solid white; border-right: #dcdcdc "></td>
							<td><a href="" class="button1" onmouseover="this.className='Button_Over1';" onmouseout="this.className='button1';">추가</a></td>
						</tr>
					</tbody>
				</table>
				<table style="margin-top: 5px;">
					<col width="130px"/><col width="120px"/>
					<col width="160px"/>
					<col width="60px"/><col width="100px"/>					
					<col width="370px"/><col width="40px"/>
					<thead>
					<tr id="tr2">
						<td>시간</td><td>장소</td><td>PROJECT</br>(진척도)</td><td colspan="2">업무코드</br>(진척도)</td><td>실행내용</br>(정상근무)</td><td>소요<br />시간</td>
					</tr>					
					</thead>
					<tbody id="tbody2">
					<c:choose>
						<c:when test="${empty workLog }">
							<tr>
								<td colspan="7">내용이 없습니다.</td>
							</tr>
						</c:when>
						<c:otherwise>
							<c:forEach var="dto"  items="${workLog}">
								<tr>
									<td>${dto.workstarttime } ~ ${dto.workendtime } </td><td>${dto.workplace }</td><td>${dto.projectcode }</td><td>${dto.workcode1 }</td><td>${dto.workcode2 }</td><td>${dto.workcontents }</td><td>${dto.worktime }</td>
								</tr>
							</c:forEach>
						</c:otherwise>
					</c:choose>	
					</tbody>
				</table>
				<br>
				<div style="padding: 8px; font-size: 12px;">• 결재자 의견</div>		
				<table>
					<col width="130px"/><col width="120px"/>
					<col width="730px"/>
					<thead>
					<tr id="tr2">
						<td>결재자</td><td>일자</td><td>결재의견</td>
					</tr>					
					</thead>
					<tbody>
					<tr>
						<td colspan="3">내용이 없습니다.</td>
					</tr>						
					</tbody>
				</table>						
		</div>
			<div id="clearBoth"></div>
		</div>
</div>
</body>
</html>