<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>   
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="//ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/themes/smoothness/jquery-ui.css">
<script src="//code.jquery.com/jquery.min.js"></script>
<script src="//ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script>

<style>
	.ui-datepicker{ font-size: 12px; width: 180px; }

	.ui-widget-content .ui-state-default 
	{
	background: white; 
	border: 1px solid white;
	}
	
	
	.ui-datepicker-week-end:first-child{color:red;}
	.ui-widget-header {background: #0b69b1;     border: #0b69b1; color: white;}
	.ui-datepicker select.ui-datepicker-month{ width:30%; font-size: 10px; }
	.ui-datepicker select.ui-datepicker-year{ width:40%; font-size: 10px; }
		.ui-datepicker-current-day
	{
	    background: gray;
	}

	.ui-widget-content .ui-state-default:hover{
	background: #dbeefa;
	} 

/* .ui-datepicker-today:hover { */
/*     background: #999999; */
/* } */
/* .ui-datepicker-today a:hover {  */
/*     color: #212121;  */
/* } */


.ui-datepicker-today 
{
    background: blue;
}
	.ui-datepicker-calendar > tbody td.ui-datepicker-week-end:first-child a { color: red; } 
</style>


<script>
$(function() {
  $( "#datepicker1" ).datepicker({
   	 dateFormat: 'yy-mm-dd',
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
    
    
  });
});






</script>


</head>
<body>
<input type="text" id="datepicker1">

</div>








</body>
</html>