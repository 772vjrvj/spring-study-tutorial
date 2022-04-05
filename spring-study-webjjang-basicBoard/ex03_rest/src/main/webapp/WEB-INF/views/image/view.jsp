<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="pageObject"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이미지 게시판 보기</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<style type="text/css">
.row {
	background: white;
	margin-bottom: 2px;
	padding: 5px 0px;
}
</style>

<script type="text/javascript">
$(function(){
	$("#deleteBtn").click(function(){
		//취소(!confirm)를 누르면 삭제를 취소시킨다.
		if(!confirm("정말 삭제하시겠습니까?")) return false;
	})
})
</script>

<body>
	<div class="container">
		<h3>이미지 게시판 보기</h3>
		<div class="well">
			<!-- 데이터 한개 당 한개의 줄을 만든다. -->
			<div class="row">
				<div class="col-md-3">번호</div>
				<div class="col-md-9">${vo.no }</div>
			</div>
			<div class="row">
				<div class="col-md-3">제목</div>
				<div class="col-md-9">${vo.title }</div>
			</div>
			<div class="row">
				<div class="col-md-3">
					이미지 <a href="${vo.fileName }" class="btn btn-danger" download>다운로드</a>
					<!-- 이미지 바꾸기 : form 태그가 있는 모달창을 사용해서 post방식으로 사용해 보자. a 태그는 get 방식 전달을 하므로 이미지 전달이 안된다. -->
					<!-- Trigger the modal with a button -->
					<button type="button" class="btn btn-info " data-toggle="modal" data-target="#myModal">바꾸기</button>
				</div>
				<div class="col-md-9">
					<img src="${vo.fileName}" class="img-thumbnail">
				</div>
			</div>
			<div class="row">
				<div class="col-md-3">내용</div>
				<div class="col-md-9">${vo.content }</div>
			</div>
			<div class="row">
				<div class="col-md-3">작성자</div>
				<div class="col-md-9">${vo.name }(${vo.id })</div>
			</div>
			<div class="row">
				<div class="col-md-3">작성일</div>
				<div class="col-md-9">
					<fmt:formatDate value="${vo.writeDate }" />
				</div>
			</div>
			<div class="row">
				<div class="col-md-12">
					<c:if test="${vo.id == loginId || gradeNo == 9}">
						<a href="update.do?no=${vo.no}&page=${pageObject.page}&perPageNum=${pageObject.perPageNum}"
						class="btn btn-default">정보수정</a> <a
						href="delete.do?no=${vo.no}&perPageNum=${pageObject.perPageNum}&deleteFileName=${vo.fileName}" 
						class="btn btn-default" id="deleteBtn">삭제</a>
					</c:if>
					<a href="list.do?no=${vo.no}&page=${pageObject.page}&perPageNum=${pageObject.perPageNum}"
						class="btn btn-default">리스트</a>
				</div>
			</div>
		</div>
	</div>
	
	<div class="text-center">
		<c:if test="${empty loginId }">		
			<!-- 로그인을 하지 않은 경우 - 좋아요와 상관이 없음 -->
			<img alt="좋아요_myLiked" src="/resources/image/좋아요_myLiked.png" data-toggle="tooltip" title="로그인하셔야 사용할 수 있습니다.">
		</c:if>
		<c:if test="${!empty loginId }">
			<c:if  test="${empty vo.myLiked }">
				<!-- myLiked가 비어 있으면 좋아요를 누를 수 있다. -->
				<a href="like.do?${request.queryString }">
					<img alt="좋아요" src="/resources/image/좋아요.png" data-toggle="tooltip" title="클릭하면 좋아요 처리가 됩니다.">
				</a>
			</c:if>
			<c:if  test="${!empty vo.myLiked }">
				<!-- myLiked가 비어 있지 않으면 ('LIKED'). 좋아요 취소를 누를 수 있다. -->
				<a href="likeCancel.do?${request.queryString }">
					<img alt="좋아요_취소" src="/resources/image/좋아요_취소.png" data-toggle="tooltip" title="클릭하면 좋아요 처리가 취소 됩니다.">
				</a>
				
			</c:if>
		</c:if>
	</div>
	<div class="text-center">
		전체 갯수 : ${vo.likeCnt }
	</div>

	<!-- Modal -->
	<div class="modal fade" id="myModal" role="dialog">
		<div class="modal-dialog">

			<form action="changeImage.do" method="post" enctype="multipart/form-data">
			<!-- 숨겨서 넘겨 줘야할 데이터 - 페이지, 한 페이지당 갯수, 삭제해야할 원래 파일 정보 -->
				<input type="hidden" name="page" value="${pageObject.page }">
				<input type="hidden" name="perPageNum" value="${pageObject.perPageNum }">
				<input type="hidden" name="deleteFileName" value="${vo.no }">
				
				<!-- Modal content-->
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<h4 class="modal-title">사진 바꾸기</h4>
					</div>
					<div class="modal-body">
						<div>
							<div class="form-group">
								<label for="no">번호</label> <input type="text" readonly="readonly" onclick="alert('번호는 변경할 수 없습니다.');"
									class="form-control" id="no" name="no" value="${vo.no }"
								>
							</div>
							<div class="form-group">
								<label for="imageFile">이미지파일</label> <input type="file" required="required" 
									class="form-control" id="imageFile" name="imageFile">
							</div>
						</div>
					</div>
					<div class="modal-footer">
						<button class="btn btn-default" >바꾸기</button>
						<button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
					</div>
				</div>
			</form>

		</div>
	</div>

</body>
</html>