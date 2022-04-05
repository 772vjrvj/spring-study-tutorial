<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	String id = request.getParameter("id");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<script type="text/javascript" src="/js/member.js"></script>
	
<script type="text/javascript">

$(function() {
	
	
	
	$("#chkBtn").click(function() {
		var id = $('#id').val();
		
		if(id){
			memberService.idCheck( 
				id,
				function(result){
					var val;
					
					console.log('result.chkId : ', result.chkId);
					
					if(result.chkId){
						val = "검색한 아이디 [" + "<span style='color:red'>" + result.chkId + "</span>" + "]는 중복된 아이디 입니다. 다시 검색해 주세요.";
						
						$('#result').html(val);

						
					}else{
						val = "검색한 아이디 [" + "<span style='color:red'>" + id + "</span>" + "]는 사용가능한  아이디 입니다.";
						val += "<button class='btn btn-default' id='useIdBtn'>아이디 사용하기</button>";
						$('#result').html(val);
						$('#result').on('click', '#useIdBtn' ,function(){
						$(opener.document).find('#id').val(id);
							console.log('id : ', $(opener.document).find('#id'));
							window.close();
						});
					}
				});
		
		}else{
			$('#result').html("아이디를 입력해 주세요. 그리고 체크 버튼을 클릭하세요.");
		}
	});
	

	
	
})


</script>
<title>아이디 중복체크</title>

</head>
<body>
	<div class="container">
		<h3>아이디 중복 체크</h3>
		<!-- hr -->
		<hr>
		<div class="form-group">
			<label>아이디 입력</label>
			<input name="id" id="id" class="form-control">
		</div>
		<button class="btn btn-default" id="chkBtn">체크</button>
		<hr>
		<div id="result">
		</div>
	</div>
</body>
</html>