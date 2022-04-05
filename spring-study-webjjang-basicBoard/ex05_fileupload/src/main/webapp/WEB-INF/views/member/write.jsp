<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 가입 폼</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="//code.jquery.com/ui/1.13.0/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/ui/1.13.0/jquery-ui.js"></script>

<script>
  $( function() {
    $( ".radio" ).checkboxradio();
    $(".datepicker").datepicker({
   	   // datepicker 클래스 이벤트 - 적정한 옵션을 넣어서 초기화 시켜 준다. 기본 datepicker()로 사용 가능
   	   changeMonth: true,
   	   changeYear: true,
   		yearRange: "-100:+0",
   	   dateFormat: "yy.mm.dd",
   	   dayNamesMin: [ "일", "월", "화", "수", "목", "금", "토" ],
   	   monthNamesShort: [ "1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월" ],
    });
  } );
  </script>

</head>
<body>
	<div class="container">
		<h3>회원 가입 폼</h3>

		<form action="write.do" method="post" enctype="multipart/form-data">
			<div class="form-group">
				<label for="id">아이디</label> <input type="text"
					class="form-control" id="id" name="id">
			</div>
			<div class="alert alert-warning">
				아이디는 4자 이상이여야 합니다.
			</div>
			<div class="form-group">
				<label for="pw">비밀번호</label> <input type="password"
					class="form-control" id="pw" name="pw">
			</div>
			<div class="form-group">
				<label for="pw2">비밀번호 확인</label> <input type="password"
					class="form-control" id="pw" name="pw2">
			</div>
			<div class="form-group">
				<label for="name">이름</label> <input type="text"
					class="form-control" id="name" name="name">
			</div>
			<div class="form-group widget">
				<label>성별</label>
				<label for="man">남자</label>
				<input type="radio" name="gender" id="man" value="남자" checked="checked"
					class="radio">
				<label for="woman">여자</label>
				<input type="radio" name="gender" id="woman" value="여자"
					class="radio">
			</div>
			<div class="form-group">
				<label for="birth">생년월일</label> <input type="text"
					class="form-control datepicker" id="birth" name="birth">
			</div>
			<div class="form-group">
				<label for="tel">연락처</label> <input type="text"
					class="form-control" id="tel" name="tel">
			</div>
			<div class="form-group">
				<label for="email">이메일</label> <input type="text"
					class="form-control" id="email" name="email">
			</div>
			<div class="form-group">
				<label for="imageFile">사진 (등록을 안하면 noImage 처리됨.)</label> <input type="file"
					class="form-control" id="imageFile" name="imageFile">
			</div>
			<button type="submit" class="btn btn-default">로그인</button>
		</form>

	</div>
</body>
</html>