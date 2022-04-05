<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="pageObject"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<style type="text/css">
.dataRow:hover {
	background: #eee;
	cursor: pointer;
}
</style>

<script type="text/javascript">
	$(function() {
		$(".dataRow").click(
				function() {
					var id = $(this).find(".id").text();
					location = "view.do?no=" + no + "&inc=1"
							+ "&page=${pageObject.page}"
							+ "&perPageNum=${pageObject.perPageNum}"
							+ "&key=${pageObject.key}"
							+ "&word=${pageObject.word}";
				});

		$(".gradeModifyBtn").click(function() {
			
			var id = $(this).closest(".dataRow").find(".id").text();
			$('#formId').val(id);
			
			var gradeNo = $(this).closest(".dataRow").find(".gradeNo").text();
			$('.formGradeNo').val([gradeNo]);
		});
		
		
		$('#formGradeModifyBtn').prop('tagName');
		
		$('#formGradeModifyBtn').click(function(){
			$('#gradeModifyForm').submit();
		});

	})
</script>


</head>
<body>
	<div class="container">
		<h3>회원 리스트</h3>

		<form class="navbar-form">
			<div class="input-group">
				<div class="form-group navbar-left">
					<select name="key" class="form-control">
						<option value="all" ${(pageObject.key == "all")?"selected":"" }>전체</option>
						<option value="i" ${(pageObject.key == "i")?"selected":"" }>아이디</option>
						<option value="n" ${(pageObject.key == "n")?"selected":"" }>이름</option>
						<option value="g" ${(pageObject.key == "g")?"selected":"" }>성별</option>
						<option value="b" ${(pageObject.key == "b")?"selected":"" }>생년월일</option>
						<option value="t" ${(pageObject.key == "t")?"selected":"" }>연락처</option>
						<option value="s" ${(pageObject.key == "s")?"selected":"" }>상태</option>
						<option value="gno" ${(pageObject.key == "gno")?"selected":"" }>등급번호</option>
						<option value="gnm" ${(pageObject.key == "gnm")?"selected":"" }>등급이름</option>
					</select> <input type="text" class="form-control" placeholder="Search"
						name="word" value="${pageObject.word }">
				</div>

				<div class="input-group-btn">
					<button class="btn btn-default" type="submit">
						<i class="glyphicon glyphicon-search"></i>
					</button>
				</div>
			</div>
		</form>


		<table class="table">
			<thead>
				<tr>
					<th>아이디</th>
					<th>이름</th>
					<th>성별</th>
					<th>생년월일</th>
					<th>연락처</th>
					<th>상태</th>
					<th>등급번호</th>
					<th>등급이름</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${list }" var="vo">
					<tr class="dataRow">
						<td class="id">${vo.id }</td>
						<td>${vo.name }</td>
						<td>${vo.gender }</td>
						<td>${vo.birth }</td>
						<td>${vo.tel }</td>
						<td>${vo.status }</td>
						<td class="gradeNo">${vo.gradeNo }</td>
						<td>${vo.gradeName }<c:if test="${vo.id != login.id }">
								<button class="gradeModifyBtn" data-toggle="modal"
									data-target="#myModal">변경</button>
							</c:if>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<div>
			<pageObject:pageNav listURI="list.do" pageObject="${pageObject }"></pageObject:pageNav>
		</div>
	</div>
	<!-- Modal -->
	<div id="myModal" class="modal fade" role="dialog">
		<div class="modal-dialog">

			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title">등급 수정</h4>
				</div>
				<div class="modal-body">
					<p>
						<form action="gradeModify.do" method="post" id="gradeModifyForm">
							<div class="form-group">
								<label>아이디</label>
								<input name="id" id="formId" readonly="readonly" class="form-control">
							</div>
							<div>
								<div><label>등급</label></div>
								<label class="radio-inline">
									<input type="radio" name="gradeNo" value="1" class="formGradeNo">일반회원</label>
								<label class="radio-inline">
									<input type="radio" name="gradeNo" value="9" class="formGradeNo">관리자</label>
							</div>
						</form>
					</p>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" id="formGradeModifyBtn">변경</button>
					<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
				</div>
			</div>

		</div>
	</div>



</body>
</html>