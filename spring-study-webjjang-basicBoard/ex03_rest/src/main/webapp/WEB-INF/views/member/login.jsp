<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 폼</title>
<meta name="viewport" content="width=device-width, initial-scale=1">

</head>
<body>
	<div class="container">
		<h3>로그인 폼</h3>

		<form action="login.do" method="post">
			<div class="form-group">
				<label for="id">아이디</label> <input type="text"
					class="form-control" id="id" name="id">
			</div>
			<div class="form-group">
				<label for="pw">비밀번호</label> <input type="password"
					class="form-control" id="pw" name="pw">
			</div>

			<button type="submit" class="btn btn-default">로그인</button>
		</form>

	</div>
</body>
</html>