<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
 <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script src="https://kit.fontawesome.com/a076d05399.js" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">



<script type="text/javascript" src="/js/reply.js"></script>
<script type="text/javascript" src="/js/util.js"></script>
<style type="text/css">
	.dataRow:hover {
		background: #eee;
		cursor: pointer;
	}
</style>

<script type="text/javascript">
$(function(){
	$("#deleteBtn").click(function(){
		if(!confirm("정말 삭제하시겠습니까?")) return false;
	});
	
	var no='${vo.no }'
	//데이터를 가져와 태그를 넣어야 하는 곳
	var replyUL = $(".chat");
	
	function showList(){
		replyService.list({no : no},
			function(list){
			console.log(JSON.stringify(list));
				// 태그를 만든다.
				var str = "";
				console.log(list.length)
				if(list == null || list.length == 0)
					str += "<li class='list-group-item'>댓글이 존재하지 않습니다.</li>";
					//정해진곳 (chat)에 태그를 넣는다.
				else{
					for (var i = 0; i < list.length; i++) {
						str += "<li class='letf clearfix list-group-item dataRow' data-rno='" + list[i].rno + "'>";
						str +=		"<div>";
						str +=			"<div class='header'>";
						str +=				"<strong class='writer'>"+ list[i].writer +"</strong>"
						str +=				"<small class='pull-right text-muted'>" + diplayDateTime(list[i].writeDate) + "</small>";
						str += 			"</div>";
						str += 			"<p class='content'>" + list[i].content + "</p>";
						str += 		"</div>";
						str +=  "</li>";
					}
				}
				replyUL.html(str);
			});
	}
	
	$('#writeReplyBtn').click(function(){
		
		$('#myModal .modal-title').text('댓글 등록');
		
		$('#rnoDiv, #modalUpdateReplyBtn, #modalDeleteReplyBtn').hide();
		
		$('#modalWriteReplyBtn').show();
		
		$('#content').val("");
		$('#writer').val("");
		
		$('#myModal').modal("show");
		
	});
	
	//모달창 등록
	$("#modalWriteReplyBtn").click(function(){
		
		//데이터
		var content = $('#content').val();
		var writer = $('#writer').val();
		
		if(!content || !writer){
			alert('데이터가 비어 있으면 안됩니다.');
			return;
		}
		
		
		//서버데이터 전송
		replyService.write(
			{
				content: content,
				writer : writer, 
				no : no
			},
			function(result){
				alert("result : " + result);
				//등록후 호출
				showList();
				$('#myModal').modal("hide");
			}
		);
		
		
	});
	
	//이벤트 안일어남객체 function을 넣을 당시 없는 코드이기 떄문에
	//$('.dataRow').click(function(){
	//	alert('수정 / 삭제');
	//});
	
	//나중에 생긴 코드들은 이벤트의 전달을 해야 하는데 on()를 사용한다.
	$('.chat').on('click', '.dataRow', function(){
		$('#myModal .modal-title').text('댓글 - 수정 / 삭제');
		
		var rno = $(this).data('rno');
		var content = $(this).find('.content').text();
		var writer = $(this).find('.writer').text();
		$('#rno').val(rno);
		$('#content').val(content);
		$('#writer').val(writer);
		
		//등록 버튼은 안보이게
		$('#modalWriteReplyBtn').hide();
		
		$('#rnoDiv, #modalUpdateReplyBtn, #modalDeleteReplyBtn').show();
		
		
		$('#myModal').modal('show');
	});
	// 댓글 수정 삭제 모달 끝
	
	//모달 창안에 수정 버튼을 클릭해서 수정처리
	$('#modalUpdateReplyBtn').click(function(){

		var rno = $('#rno').val();
		var content = $('#content').val();
		var writer = $('#writer').val();
		
		var reply = {
			rno	: rno, 
			content : content, 
			writer : writer
		}
		
		//서버데이터 전송
		replyService.update(
			reply,
			function(result){
				alert("result : " + result);
				//등록후 호출
				showList();
				$('#myModal').modal("hide");
			}
		);
		
	});
	
	//모달 창안에 수정 버튼을 클릭해서 수정처리 끝

	
	//댓글 삭제
	$('#modalDeleteReplyBtn').click(function(){

		var rno = $('#rno').val();
		
		//서버데이터 전송
		replyService.deleteReply(
			rno,
			function(result){
				alert("result : " + result);
				//등록후 호출
				showList();
				$('#myModal').modal("hide");
			}
		);
		
	});
	
	
	

	showList();
	
});
</script>
</head>
<body>
<div class="container">
	<h3>게시판 글보기</h3>
	<table class="table">
		<tbody>
			<tr>
				<th>번호</th>
				<td>${vo.no }</td>
			</tr>
			<tr>
				<th>제목</th>
				<td>${vo.title }</td>
			</tr>
			<tr>
				<th>내용</th>
				<td>${vo.content }</td>
			</tr>
			<tr>
				<th>작성자</th>
				<td>${vo.writer }</td>
			</tr>
			<tr>
				<th>작성일</th>
				<td><fmt:formatDate value="${vo.writeDate }" pattern="yyyy.MM.dd"/></td>
			</tr>
			<tr>
				<th>조회수</th>
				<td>${vo.hit }</td>
			</tr>
		</tbody>
	</table>
	<a href="update.do?no=${vo.no }&page=${pageObject.page }&perPageNum=${pageObject.perPageNum}" class="btn btn-default">수정</a>
	<a href="delete.do?no=${vo.no }" class="btn btn-default" id="deleteBtn">삭제</a>
	<a href="list.do?page=${pageObject.page }&perPageNum=${pageObject.perPageNum}&key=${param.key}&word=${param.word}" 
	class="btn btn-default">리스트</a>
	
	<div class="row" style="margin-top: 15px;">
		<div class="col-lg-12">
			<div class="panel panel-default">
				<div class="panel-heading">
					<!--  -->
					<i class="fa fa-comments fa-fw"></i> Reply
					<button id="writeReplyBtn" class="btn btn-primary btn-xs pull-right">등록</button>
				</div>
					
				<div class="panel-body">
					<div><strong>* 댓글을 클릭하면 수정 / 삭제를 할 수 있습니다.</strong></div>
					<!-- 이곳이 댓글 리스트가 뿌려지는 곳이다. -->
					<ul class="chat list-group">
					</ul>
				</div>
			</div>
		</div>
	</div>
</div>

<!-- Modal -->
<div id="myModal" class="modal fade" role="dialog">
	<div class="modal-dialog">
	    <!-- Modal content-->
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal">&times;</button>
				<h4 class="modal-title">댓글 등록</h4>
			</div>
			<div class="modal-body">
				<div class="form-group" id="rnoDvi">
			    	<label for="writer">댓글 번호</label>
			    	<input type="text" class="form-control" id="rnoDiv" readonly="readonly">
			  	</div>
				<div class="form-group">
					<label for="content">내용</label>
					<textarea class="form-control" rows="5" id="content"></textarea>
				</div>
				<div class="form-group">
			    	<label for="writer">작성자</label>
			    	<input type="text" class="form-control" id="writer">
			  	</div>
			</div>
		    <div class="modal-footer">
		        <button type="button" class="btn btn-default" id="modalWriteReplyBtn">등록</button>
		        <button type="button" class="btn btn-default" id="modalUpdateReplyBtn">수정</button>
		        <button type="button" class="btn btn-default" id="modalDeleteReplyBtn">삭제</button>
		        <button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
		    </div>
	    </div>
	</div>
</div>

</body>
</html>